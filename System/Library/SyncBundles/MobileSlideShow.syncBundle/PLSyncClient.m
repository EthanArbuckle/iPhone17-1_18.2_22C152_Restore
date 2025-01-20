@interface PLSyncClient
+ (void)_logRestoreContext:(id)a3;
- (BOOL)isResync;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (NSMutableArray)outstandingAssets;
- (NSMutableArray)outstandingSyncJobs;
- (NSMutableDictionary)pathToRestoreKey;
- (NSMutableDictionary)restoreKeyToAssetGroup;
- (NSMutableDictionary)uuidToPLSAsset;
- (PLPhotoLibraryPathManager)pathManager;
- (PLSAlbum)masterAlbum;
- (PLSLibraryChangeSnapshot)libraryChangeSnapshot;
- (PLSyncClient)init;
- (double)_timeSinceLastSave;
- (id)_addAlbumNamed:(id)a3 uuid:(id)a4 kindValue:(int)a5 inLibrary:(id)a6;
- (id)_albumURIForAlbumUUID:(id)a3;
- (id)_allAssetDirectoryURLs;
- (id)_allAssetMetricBaseURLs;
- (id)_getAssetsToRestoreFromPaths:(id)a3;
- (id)_initializePhotoLibraryIfNecessary;
- (id)_metricsForLibraryAtURL:(id)a3 error:(id *)a4;
- (id)_neededRestoreAssets;
- (id)_onDeviceAlbumsByUUID;
- (id)_onDeviceAssetsByUUIDInLibrary:(id)a3;
- (id)_pathToRestoreContext;
- (id)_photoLibrary;
- (id)_photoLibraryWithExpectationExists:(BOOL)a3;
- (id)_readPhotosSyncMetadataFromPath:(id)a3 error:(id *)a4;
- (id)_restoreGroupKeyFromATAssetFilePath:(id)a3;
- (id)_restorePathsFromBackupList:(id)a3;
- (id)_restorePathsFromIncompleteAssetUUIDs:(id)a3 inLibrary:(id)a4;
- (id)currentSyncAnchor;
- (id)disabledAssetTypes;
- (id)installedAssetMetrics;
- (id)outstandingAssetTransfers;
- (id)supportedDataclasses;
- (int64_t)totalAssetsToRestore;
- (void)_addPaths:(id)a3 toRestoreContextFilesForKey:(id)a4;
- (void)_batchDeleteSyncedAssetsWithReason:(id)a3 subpredicate:(id)a4;
- (void)_cleanupAfterSyncOrRestore;
- (void)_clearEmptySyncAlbums;
- (void)_clearPendingCounts;
- (void)_clearSyncState;
- (void)_createAlbumUUIDToObjectIDMap:(id)a3;
- (void)_createRestoreContext;
- (void)_enqueueRemoteSyncCleanupJobBeforeDate:(id)a3 withFinishedBlock:(id)a4;
- (void)_enqueueSyncSaveJob:(id)a3;
- (void)_incrementPendingCountForContainerUUID:(id)a3;
- (void)_initializeOutstandingAssets;
- (void)_invalidateRestoreContext;
- (void)_loadRestoreContext;
- (void)_persistAssetAlbumOrderStructures;
- (void)_populateRestorePathGroupsAndUpdateValidatedRestorePaths:(id)a3;
- (void)_prioritizeAssets:(id)a3;
- (void)_pullOutMasterAlbumFromAlbumsAndEvents;
- (void)_reconcileAlbums:(id)a3;
- (void)_reconcileAssets:(id)a3;
- (void)_reconcileDeviceAlbumListSortingWithAlbums:(id)a3 iTunesAlbumOrder:(id)a4 inLibrary:(id)a5;
- (void)_reconcileMetadata;
- (void)_reorderAlbumListProxy:(id)a3 withAlbumsAtIndexes:(id)a4 inNewOrder:(id)a5;
- (void)_restoreAssetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)_saveOrderOnSyncedAlbum:(id)a3 inLibrary:(id)a4;
- (void)_saveOutstandingSyncJobs;
- (void)_setPendingAlbumCounts:(id)a3;
- (void)_sortATAssetsToRestore:(id)a3 withUUIDPathDict:(id)a4;
- (void)_startListeningToMemoryPressureEvents;
- (void)_stopListeningToMemoryPressureEvents;
- (void)_syncAssetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)_uninitializeLibrary;
- (void)_writeRestoreContext;
- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)assetTransferEndedWithSuccess:(BOOL)a3;
- (void)dealloc;
- (void)restoreEndedWithError:(id)a3;
- (void)setIsResync:(BOOL)a3;
- (void)setLibraryChangeSnapshot:(id)a3;
- (void)setMasterAlbum:(id)a3;
- (void)setOutstandingAssets:(id)a3;
- (void)setOutstandingSyncJobs:(id)a3;
- (void)setPathToRestoreKey:(id)a3;
- (void)setRestoreKeyToAssetGroup:(id)a3;
- (void)setUuidToPLSAsset:(id)a3;
- (void)syncEndedWithSuccess:(BOOL)a3;
@end

@implementation PLSyncClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryChangeSnapshot, 0);
  objc_storeStrong((id *)&self->_pathToRestoreKey, 0);
  objc_storeStrong((id *)&self->_restoreKeyToAssetGroup, 0);
  objc_storeStrong((id *)&self->_uuidToPLSAsset, 0);
  objc_storeStrong((id *)&self->_outstandingSyncJobs, 0);
  objc_storeStrong((id *)&self->_outstandingAssets, 0);
  objc_storeStrong((id *)&self->_masterAlbum, 0);
  objc_storeStrong((id *)&self->_assetUUIDtoSortToken, 0);
  objc_storeStrong((id *)&self->_albumUUIDToObjectIDMap, 0);
  objc_storeStrong((id *)&self->_restoreContext, 0);
  objc_storeStrong((id *)&self->_pathToRestoreContext, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_libraryGroup, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_albumsAndEvents, 0);

  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
}

- (int64_t)totalAssetsToRestore
{
  return self->_totalAssetsToRestore;
}

- (void)setIsResync:(BOOL)a3
{
  self->_isResync = a3;
}

- (BOOL)isResync
{
  return self->_isResync;
}

- (void)setLibraryChangeSnapshot:(id)a3
{
}

- (PLSLibraryChangeSnapshot)libraryChangeSnapshot
{
  return (PLSLibraryChangeSnapshot *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPathToRestoreKey:(id)a3
{
}

- (NSMutableDictionary)pathToRestoreKey
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRestoreKeyToAssetGroup:(id)a3
{
}

- (NSMutableDictionary)restoreKeyToAssetGroup
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUuidToPLSAsset:(id)a3
{
}

- (NSMutableDictionary)uuidToPLSAsset
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOutstandingSyncJobs:(id)a3
{
}

- (NSMutableArray)outstandingSyncJobs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOutstandingAssets:(id)a3
{
}

- (NSMutableArray)outstandingAssets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMasterAlbum:(id)a3
{
}

- (PLSAlbum)masterAlbum
{
  return (PLSAlbum *)objc_getProperty(self, a2, 128, 1);
}

- (id)_albumURIForAlbumUUID:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKey:](self->_albumUUIDToObjectIDMap, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_createAlbumUUIDToObjectIDMap:(id)a3
{
  id v4 = a3;
  [(PLSyncClient *)self _photoLibrary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_A194;
  v6[3] = &unk_24860;
  v6[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  [v5 withDispatchGroup:v4 performBlock:v6];
}

- (void)_restoreAssetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  id v48 = a3;
  id v46 = a5;
  v45 = [(PLSyncClient *)self _photoLibrary];
  v49 = [v48 path];
  v47 = [(PLSyncClient *)self _restoreGroupKeyFromATAssetFilePath:v49];
  v8 = [(PLSyncClient *)self restoreKeyToAssetGroup];
  v50 = [v8 objectForKey:v47];

  v9 = PLSyncGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v47;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v50;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Group %{public}@ -> %{public}@", buf, 0x16u);
  }

  if (a4)
  {
    v10 = [(PLSyncClient *)self outstandingAssets];
    [v10 removeObject:v48];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    buf[24] = 0;
    v11 = [v50 assetPairs];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_AD78;
    v57[3] = &unk_24B98;
    id v12 = v49;
    id v58 = v12;
    v59 = buf;
    [v11 enumerateObjectsUsingBlock:v57];

    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v13 = PLSyncGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 138543362;
        id v65 = v12;
        v14 = "File %{public}@ status is COMPLETE";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_30:
        _os_log_impl(&dword_0, v15, v16, v14, v64, 0xCu);
      }
    }
    else
    {
      v13 = PLSyncGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v64 = 138543362;
        id v65 = v50;
        v14 = "Failed to find file in group %{public}@ unable to mark status COMPLETE";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        goto LABEL_30;
      }
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  if (v46)
  {
    v17 = [v46 domain];
    if (![v17 isEqualToString:@"ATError"]
      || [v46 code] == (char *)&dword_4 + 3
      || [v46 code] == &dword_8
      || [v46 code] == (char *)&dword_C + 2
      || [v46 code] == &dword_10
      || [v46 code] == (char *)&dword_8 + 1
      || [v46 code] == (char *)&dword_10 + 2
      || [v46 code] == &dword_4
      || [v46 code] == (char *)&dword_10 + 3
      || [v46 code] == &dword_14
      || [v46 code] == (char *)&dword_18 + 1
      || [v46 code] == (char *)&dword_18 + 3
      || [v46 code] == &dword_18
      || [v46 code] == (char *)&dword_1C + 3
      || [v46 code] == &stru_20
      || [v46 code] == (char *)&stru_20.cmd + 1
      || [v46 code] == (char *)&stru_20.cmd + 2)
    {
    }
    else
    {
      BOOL v40 = [v46 code] == (char *)&stru_20.cmd + 3;

      if (!v40)
      {
        v41 = PLSyncGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v46;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "Unrecoverable error, will not attempt to restore ATAsset %{public}@ [%{public}@]", buf, 0x16u);
        }

        v42 = [(PLSyncClient *)self outstandingAssets];
        [v42 removeObject:v48];

        v43 = [v50 assetPairs];
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_AC8C;
        v60[3] = &unk_24B70;
        id v61 = v49;
        v62 = self;
        [v43 enumerateObjectsUsingBlock:v60];

LABEL_32:
        v19 = [v50 assetPairs];
        v51 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v19 count]);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        obj = v19;
        id v20 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (v20)
        {
          int v21 = 0;
          int v22 = 0;
          uint64_t v23 = *(void *)v54;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v54 != v23) {
                objc_enumerationMutation(obj);
              }
              v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              unsigned int v26 = [v25 status];
              if (v26 == 2)
              {
                v30 = [v25 path];
                [v51 addObject:v30];

                CFStringRef v29 = @"COMPLETE";
              }
              else
              {
                if (v26) {
                  int v27 = v21;
                }
                else {
                  int v27 = v21 + 1;
                }
                if (v26) {
                  CFStringRef v28 = 0;
                }
                else {
                  CFStringRef v28 = @"PENDING";
                }
                if (v26 == 1)
                {
                  CFStringRef v29 = @"FAILED";
                }
                else
                {
                  int v21 = v27;
                  CFStringRef v29 = v28;
                }
              }
              v31 = PLSyncGetLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = [v25 path];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&buf[4] = v22;
                *(_WORD *)&buf[8] = 2114;
                *(void *)&buf[10] = v32;
                *(_WORD *)&buf[18] = 2114;
                *(void *)&buf[20] = v29;
                _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "File[%d]: %{public}@ has status: %{public}@", buf, 0x1Cu);

                ++v22;
              }
            }
            id v20 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
          }
          while (v20);

          if (v21)
          {
            v33 = PLSyncGetLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v50;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v21;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Group %{public}@ is pending %d files...", buf, 0x12u);
            }

LABEL_66:
            v18 = obj;
            goto LABEL_67;
          }
        }
        else
        {
        }
        if ([v51 count])
        {
          v34 = [v50 UUID];
          v35 = PLSyncGetLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v50;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Group %{public}@ is COMPLETE", buf, 0xCu);
          }

          v36 = PLSyncGetLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v37 = [v51 count];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v37;
            _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Sending updateRestoredAssetWithUUID:... to assetsd with %d paths", buf, 8u);
          }

          v38 = [v45 assetsdClient];
          v39 = [v38 syncClient];
          [v39 updateRestoredAssetWithUUID:v34 paths:v51 fixAddedDate:self->_fixAddedDates];

          [(PLSyncClient *)self _addPaths:v51 toRestoreContextFilesForKey:@"kPLSyncRestoreContextRestoredFilesKey"];
        }
        else
        {
          v34 = PLSyncGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v50;
            _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Group %{public}@ is FAILED", buf, 0xCu);
          }
        }

        [(PLSyncClient *)self _writeRestoreContext];
        goto LABEL_66;
      }
    }
  }
  v18 = PLSyncGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v49;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v46;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Potentially recoverable error when trying to restore %{public}@: %{public}@", buf, 0x16u);
  }
LABEL_67:
}

- (void)_saveOutstandingSyncJobs
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastSyncJobsSaveTime = v3;
  id v4 = [(PLSyncClient *)self outstandingSyncJobs];
  id v5 = [v4 count];

  if (v5)
  {
    v6 = [(PLSyncClient *)self outstandingSyncJobs];
    id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);

    v25 = (dispatch_group_t *)self;
    v8 = [(PLSyncClient *)self outstandingSyncJobs];
    id v9 = [v8 copy];

    v10 = PLSyncGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = [v9 count];
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "_saveOutstandingSyncJobs: preparing to send %d sync jobs via saveSyncedAssets", buf, 8u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          os_log_type_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v17 = PLSyncGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [v16 description];
            *(_DWORD *)buf = 138543362;
            v33 = v18;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Preparing %{public}@", buf, 0xCu);
          }
          v19 = [v16 serializedData];
          if (v19)
          {
            [v7 addObject:v19];
          }
          else
          {
            id v20 = PLSyncGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              int v21 = [v16 description];
              *(_DWORD *)buf = 138543362;
              v33 = v21;
              _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Failed to serialize %{public}@", buf, 0xCu);
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v13);
    }

    int v22 = [(dispatch_group_t *)v25 outstandingSyncJobs];
    [v22 removeAllObjects];

    dispatch_group_enter(v25[6]);
    uint64_t v23 = +[PLAssetsSaver sharedAssetsSaver];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_B190;
    v26[3] = &unk_24B48;
    v26[4] = v25;
    id v27 = v11;
    id v24 = v11;
    [v23 saveSyncedAssets:v7 completionBlock:v26];
  }
}

- (double)_timeSinceLastSave
{
  +[NSDate timeIntervalSinceReferenceDate];
  return v3 - self->_lastSyncJobsSaveTime;
}

- (void)_syncAssetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  v8 = a3;
  id v9 = a5;
  v10 = [(PLSyncClient *)self _photoLibrary];
  if (v9 && !a4)
  {
    id v12 = PLSyncGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v112 = (uint64_t)v9;
      __int16 v113 = 2114;
      v114 = v8;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Encountered unrecoverable error %{public}@ for asset %{public}@ during sync", buf, 0x16u);
    }

    id v13 = [(PLSyncClient *)self outstandingAssets];
    [v13 removeObject:v8];

    libraryGroup = self->_libraryGroup;
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472;
    v108[2] = sub_BEE0;
    v108[3] = &unk_24730;
    v109 = v10;
    [v109 withDispatchGroup:libraryGroup performTransaction:v108];
    v15 = v109;
    goto LABEL_25;
  }
  if (!a4)
  {
    v15 = PLSyncGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    unsigned int v37 = "Asset transfer was not successful!";
    goto LABEL_23;
  }
  os_log_type_t v16 = [(PLSyncClient *)self outstandingAssets];
  unsigned __int8 v17 = [v16 containsObject:v8];

  if ((v17 & 1) == 0)
  {
    v15 = PLSyncGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v112 = (uint64_t)v8;
    unsigned int v37 = "Got transfer notification of unknown asset: %@";
    goto LABEL_20;
  }
  if (([v8 isDownload] & 1) == 0)
  {
    v15 = PLSyncGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    unsigned int v37 = "Asset upload complete--erm...unsupported...how did this happen??";
LABEL_23:
    v38 = v15;
    uint32_t v39 = 2;
    goto LABEL_24;
  }
  v18 = [v8 path];

  if (!v18)
  {
    v15 = PLSyncGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v112 = (uint64_t)v8;
    unsigned int v37 = "Asset with no path: %@, ignoring.";
LABEL_20:
    v38 = v15;
    uint32_t v39 = 12;
LABEL_24:
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_25;
  }
  v89 = v11;
  uuidToPLSAsset = self->_uuidToPLSAsset;
  id v20 = [v8 identifier];
  int v21 = [(NSMutableDictionary *)uuidToPLSAsset objectForKey:v20];

  int v22 = [(PLSyncClient *)self pathManager];
  v15 = [v22 photoDirectoryWithType:1];

  uint64_t v23 = [v8 path];
  uint64_t v24 = [v15 stringByAppendingPathComponent:v23];

  id v25 = objc_alloc_init((Class)PLSyncSaveJob);
  v88 = (void *)v24;
  uint64_t v26 = v24;
  id v27 = v25;
  long long v28 = +[NSURL fileURLWithPath:v26 isDirectory:0];
  [v27 setOriginalAssetURL:v28];

  id v29 = [v21 hasVideoComplement];
  [v27 setHasVideoComplement:v29];
  v90 = v21;
  if (!v29) {
    goto LABEL_56;
  }
  v85 = +[NSFileManager defaultManager];
  long long v30 = +[ATAirlock sharedInstance];
  long long v31 = [v30 pathForDataclass:@"Photo"];
  uint64_t v32 = [v31 stringByAppendingPathComponent:@"IrisVideo"];

  v33 = (void *)v32;
  char v107 = 0;
  if (![v85 fileExistsAtPath:v32 isDirectory:&v107] || !v107)
  {
    v36 = PLSyncGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = v32;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Iris video directory does not exist at %@", buf, 0xCu);
    }
    int v21 = v90;
    goto LABEL_55;
  }
  id v106 = 0;
  v83 = (void *)v32;
  v34 = [v85 contentsOfDirectoryAtPath:v32 error:&v106];
  v81 = v106;
  v82 = v34;
  if (v81)
  {
    v35 = PLSyncGetLog();
    int v21 = v90;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v112 = (uint64_t)v83;
    __int16 v113 = 2112;
    v36 = v81;
    v114 = v81;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "Failed to list Iris video files under %@: Error: %@", buf, 0x16u);
    goto LABEL_54;
  }
  v80 = v27;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = v34;
  id v95 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
  if (!v95)
  {
LABEL_45:

LABEL_50:
    v35 = PLSyncGetLog();
    int v21 = v90;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v51 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = (uint64_t)v51;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "Did not find iris video file for %@", buf, 0xCu);
    }
    id v27 = v80;
    goto LABEL_53;
  }
  uint64_t v93 = *(void *)v103;
LABEL_33:
  uint64_t v40 = 0;
  while (1)
  {
    if (*(void *)v103 != v93) {
      objc_enumerationMutation(obj);
    }
    v41 = *(void **)(*((void *)&v102 + 1) + 8 * v40);
    v42 = objc_msgSend(v41, "stringByDeletingPathExtension", v80);
    v43 = [v8 identifier];
    unsigned int v44 = [v42 isEqualToString:v43];

    if (!v44) {
      goto LABEL_43;
    }
    v45 = [v41 pathExtension];
    id v46 = +[PFUniformTypeUtilities typeWithFilenameExtension:v45];

    if (v46) {
      break;
    }
LABEL_42:

LABEL_43:
    if (v95 == (id)++v40)
    {
      id v95 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
      if (v95) {
        goto LABEL_33;
      }
      goto LABEL_45;
    }
  }
  if (([v46 conformsToType:UTTypeMovie] & 1) == 0)
  {
    v47 = PLSyncGetLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = (uint64_t)v41;
      _os_log_impl(&dword_0, v47, OS_LOG_TYPE_ERROR, "Found unexpected Iris video file %@ that is not a video", buf, 0xCu);
    }

    goto LABEL_42;
  }
  id v48 = [v83 stringByAppendingPathComponent:v41];
  v35 = +[NSURL fileURLWithPath:v48 isDirectory:0];

  if (!v35) {
    goto LABEL_50;
  }
  v49 = PLSyncGetLog();
  int v21 = v90;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v50 = [v8 identifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v112 = (uint64_t)v50;
    __int16 v113 = 2112;
    v114 = v35;
    _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEBUG, "Found iris video file for %@ at %@", buf, 0x16u);
  }
  id v27 = v80;
  [v80 setVideoComplementURL:v35];
LABEL_53:
  v36 = v81;
LABEL_54:

  v33 = v83;
LABEL_55:

LABEL_56:
  objc_msgSend(v27, "setIsVideo:", objc_msgSend(v21, "isVideo", v80));
  v52 = [v8 identifier];
  [v27 setUuid:v52];

  id v53 = objc_alloc((Class)CLLocation);
  long long v54 = [v21 latitude];
  [v54 doubleValue];
  double v56 = v55;
  v57 = [v21 longitude];
  [v57 doubleValue];
  v59 = v27;
  id v60 = [v53 initWithLatitude:v56 longitude:v58];

  v96 = v60;
  [v60 coordinate];
  if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:")) {
    [v59 setLocation:v60];
  }
  id v61 = [v90 facesInfo];
  [v59 setFacesInfo:v61];

  v62 = [v90 exposureDate];
  [v62 doubleValue];
  uint64_t v64 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v63 - kCFAbsoluteTimeIntervalSince1904];

  v94 = (void *)v64;
  [v59 setCreationDate:v64];
  id v65 = [v90 modificationDate];
  [v65 doubleValue];
  v66 = v59;
  uint64_t v68 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v67 - kCFAbsoluteTimeIntervalSince1904];

  id obja = (id)v68;
  [v59 setModificationDate:v68];
  assetUUIDtoSortToken = self->_assetUUIDtoSortToken;
  v70 = [v8 identifier];
  uint64_t v71 = [(NSMutableDictionary *)assetUUIDtoSortToken objectForKey:v70];

  v87 = (void *)v71;
  [v59 setSortToken:v71];
  uint64_t v72 = [v90 originalFileName];
  if (v72) {
    [v59 setOriginalFileName:v72];
  }
  v86 = (void *)v72;
  v73 = +[NSMutableSet set];
  albumsAndEvents = self->_albumsAndEvents;
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_BF28;
  v97[3] = &unk_24B20;
  v84 = v8;
  v98 = v84;
  id v99 = v90;
  v100 = self;
  id v75 = v73;
  id v101 = v75;
  id v76 = v90;
  [(NSMutableDictionary *)albumsAndEvents enumerateKeysAndObjectsUsingBlock:v97];
  [v66 setAlbumURIs:v75];
  if (v66)
  {
    v77 = PLSyncGetLog();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = (uint64_t)v66;
      _os_log_impl(&dword_0, v77, OS_LOG_TYPE_DEBUG, "Adding asset %@", buf, 0xCu);
    }

    [(PLSyncClient *)self _enqueueSyncSaveJob:v66];
  }
  [(PLSyncClient *)self _timeSinceLastSave];
  if (v78 >= 3.0) {
    [(PLSyncClient *)self _saveOutstandingSyncJobs];
  }
  v79 = [(PLSyncClient *)self outstandingAssets];
  [v79 removeObject:v84];

  id v11 = v89;
LABEL_25:
}

- (id)_neededRestoreAssets
{
  double v3 = PLSyncGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Finding _neededRestoreAssets", buf, 2u);
  }

  *(void *)buf = 0;
  v18 = buf;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_C2CC;
  int v21 = sub_C2DC;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  id v4 = dispatch_group_create();
  [(PLSyncClient *)self _photoLibrary];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_C2E4;
  v11[3] = &unk_24AF8;
  v11[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v5;
  id v13 = v15;
  uint64_t v14 = buf;
  [v5 withDispatchGroup:v4 performBlock:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_CF8C;
  v9[3] = &unk_24860;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  [v6 withDispatchGroup:v4 performTransaction:v9];
  if (v4) {
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v7 = *((id *)v18 + 5);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(buf, 8);

  return v7;
}

- (void)_addPaths:(id)a3 toRestoreContextFilesForKey:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  PLSafeRunWithUnfairLock();
}

- (void)_writeRestoreContext
{
}

- (void)_loadRestoreContext
{
}

- (void)_invalidateRestoreContext
{
}

- (void)_createRestoreContext
{
}

- (id)_pathToRestoreContext
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_pathToRestoreContext)
  {
    double v3 = [(PLSyncClient *)v2 pathManager];
    uint64_t v4 = [v3 cloudRestoreContextPath];
    pathToRestoreContext = v2->_pathToRestoreContext;
    v2->_pathToRestoreContext = (NSString *)v4;

    id v6 = [(NSString *)v2->_pathToRestoreContext stringByDeletingLastPathComponent];
    id v12 = 0;
    unsigned __int8 v7 = +[PLFileUtilities createDirectoryAtPath:v6 error:&v12];
    id v8 = v12;
    if ((v7 & 1) == 0)
    {
      id v9 = PLSyncGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = v6;
        __int16 v15 = 2114;
        id v16 = v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }
  objc_sync_exit(v2);

  id v10 = v2->_pathToRestoreContext;

  return v10;
}

- (id)_restorePathsFromBackupList:(id)a3
{
  id v4 = a3;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  long long v54 = sub_C2CC;
  double v55 = sub_C2DC;
  id v56 = 0;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = sub_C2CC;
  v49 = sub_C2DC;
  id v50 = 0;
  v38 = _NSConcreteStackBlock;
  uint64_t v39 = 3221225472;
  uint64_t v40 = sub_E298;
  v41 = &unk_24AA8;
  v42 = self;
  v43 = &v51;
  unsigned int v44 = &v45;
  PLSafeRunWithUnfairLock();
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(PLSyncClient *)self pathManager];
  long long v28 = [v5 photoDirectoryWithType:4];

  id v6 = [(PLSyncClient *)self pathManager];
  uint64_t v26 = [v6 photoDirectoryWithType:9];

  id v25 = [v28 length];
  unsigned __int8 v7 = [(PLSyncClient *)self pathManager];
  id v27 = [v7 photoDirectoryWithType:29];

  id v24 = [v27 length];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v34 objects:v57 count:16];
  if (v8)
  {
    uint64_t v33 = *(void *)v35;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)v9) path];
        if (([(id)v52[5] containsObject:v10] & 1) == 0
          && ([(id)v46[5] containsObject:v10] & 1) == 0)
        {
          id v11 = [v10 rangeOfString:v28];
          uint64_t v13 = v12;
          id v14 = [v10 rangeOfString:v27];
          uint64_t v16 = v15;
          id v17 = [v10 rangeOfString:v26];
          id v31 = objc_msgSend(v10, "rangeOfString:options:range:", @".", 4, (char *)objc_msgSend(v10, "length") - 5, 4);
          id v29 = objc_msgSend(v10, "rangeOfString:options:range:", @".plist", 4, (char *)objc_msgSend(v10, "length") - 6, 6);
          id v18 = [v10 rangeOfString:@".MISC"];
          id v30 = v17;
          BOOL v19 = 0;
          if (!v11 && v13) {
            BOOL v19 = [v10 length] > v25;
          }
          BOOL v20 = 0;
          if (!v14 && v16) {
            BOOL v20 = [v10 length] > v24;
          }
          if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (v19 && v31 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
LABEL_17:
              [v23 addObject:v10];
              goto LABEL_18;
            }
            if (v30 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (v20 && v31 != (id)0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_17;
              }
            }
            else if (v31 != (id)0x7FFFFFFFFFFFFFFFLL || v29 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              goto LABEL_17;
            }
          }
        }
LABEL_18:

        id v9 = (char *)v9 + 1;
      }
      while (v8 != v9);
      id v21 = [obj countByEnumeratingWithState:&v34 objects:v57 count:16];
      id v8 = v21;
    }
    while (v21);
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v23;
}

- (id)_restorePathsFromIncompleteAssetUUIDs:(id)a3 inLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_E40C;
  v12[3] = &unk_24A80;
  id v13 = v5;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)_prioritizeAssets:(id)a3
{
}

- (void)_sortATAssetsToRestore:(id)a3 withUUIDPathDict:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  [(PLSyncClient *)self restoreKeyToAssetGroup];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_E970;
  v43[3] = &unk_249F0;
  id v25 = self;
  v43[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v44 = v7;
  uint64_t v26 = v6;
  [v6 enumerateKeysAndObjectsUsingBlock:v43];
  id v8 = PLSyncGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Populated restore group mapping:", buf, 2u);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v7;
  id v29 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v40;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v9;
        id v10 = *(void **)(*((void *)&v39 + 1) + 8 * v9);
        id v11 = [obj objectForKeyedSubscript:v10];
        uint64_t v12 = PLSyncGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v11 date];
          id v14 = [v11 UUID];
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = v10;
          __int16 v48 = 2114;
          v49 = v13;
          __int16 v50 = 2114;
          uint64_t v51 = v14;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Group %{public}@: [%{public}@, %{public}@]", buf, 0x20u);
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v31 = v11;
        uint64_t v15 = [v11 assetPairs];
        id v16 = [v15 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v36;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(v15);
              }
              BOOL v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              id v21 = PLSyncGetLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                id v22 = [v20 path];
                unsigned int v23 = [v20 status];
                *(_DWORD *)buf = 138543618;
                uint64_t v47 = v22;
                __int16 v48 = 1024;
                LODWORD(v49) = v23;
                _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "      %{public}@ [%d]", buf, 0x12u);
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v17);
        }

        uint64_t v9 = v32 + 1;
      }
      while ((id)(v32 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v29);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_EAC4;
  v33[3] = &unk_24A18;
  v33[4] = v25;
  id v34 = obj;
  id v24 = obj;
  [v27 sortUsingComparator:v33];
}

- (void)_populateRestorePathGroupsAndUpdateValidatedRestorePaths:(id)a3
{
  id v4 = a3;
  uint64_t v28 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  id v6 = [(PLSyncClient *)self restoreKeyToAssetGroup];

  if (v6)
  {
    id v7 = PLSyncGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(PLSyncClient *)self restoreKeyToAssetGroup];
      unsigned int v9 = [v8 count];
      id v10 = [(PLSyncClient *)self restoreKeyToAssetGroup];
      *(_DWORD *)buf = 67109378;
      LODWORD(v33[0]) = v9;
      WORD2(v33[0]) = 2114;
      *(void *)((char *)v33 + 6) = v10;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Replacing existing restore group mapping [%d]: %{public}@", buf, 0x12u);
    }
  }
  id v11 = [(PLSyncClient *)self pathToRestoreKey];

  if (v11)
  {
    uint64_t v12 = PLSyncGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(PLSyncClient *)self restoreKeyToAssetGroup];
      unsigned int v14 = [v13 count];
      uint64_t v15 = [(PLSyncClient *)self pathToRestoreKey];
      *(_DWORD *)buf = 67109378;
      LODWORD(v33[0]) = v14;
      WORD2(v33[0]) = 2114;
      *(void *)((char *)v33 + 6) = v15;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Replacing existing path to restore keys [%d]: %{public}@", buf, 0x12u);
    }
  }
  id v16 = [v4 count];
  if ((uint64_t)v16 - 1 >= 0)
  {
    uint64_t v17 = (uint64_t)v16;
    uint64_t v18 = PLPhotoStreamDataDirectoryName;
    do
    {
      BOOL v19 = [v4 objectAtIndex:--v17];
      if ([v19 rangeOfString:v18] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v4 removeObjectAtIndex:v17];
        BOOL v20 = PLSyncGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v33[0] = v19;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Skipping restore of unexpected photo streams path from restore %{public}@", buf, 0xCu);
        }
      }
    }
    while (v17 > 0);
  }
  id v21 = objc_alloc_init((Class)NSMutableArray);
  id v22 = [(PLSyncClient *)self pathManager];
  unsigned int v23 = [v22 pathsGroupedByAssetBasePathFromFilePaths:v4 populateInvalidAdjustmentPaths:v21];

  if ([v21 count])
  {
    id v24 = PLSyncGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      unsigned int v25 = [v21 count];
      *(_DWORD *)buf = 67109378;
      LODWORD(v33[0]) = v25;
      WORD2(v33[0]) = 2114;
      *(void *)((char *)v33 + 6) = v21;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_FAULT, "Skipping restore of invalid adjustment resource file paths [%d]: %{public}@", buf, 0x12u);
    }

    [v4 removeObjectsInArray:v21];
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_F050;
  v29[3] = &unk_249C8;
  id v30 = v5;
  id v31 = v28;
  id v26 = v28;
  id v27 = v5;
  [v23 enumerateKeysAndObjectsUsingBlock:v29];
  [(PLSyncClient *)self setPathToRestoreKey:v26];
  [(PLSyncClient *)self setRestoreKeyToAssetGroup:v27];
}

- (id)_restoreGroupKeyFromATAssetFilePath:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSyncClient *)self pathToRestoreKey];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = PLSyncGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "No restore key found for asset restore path %{public}@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = [v4 stringByDeletingPathExtension];
  }

  return v6;
}

- (id)_getAssetsToRestoreFromPaths:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = +[ATAsset downloadAssetWithIdentifier:v10, @"Photo", v10, (void)v13 dataclass prettyName];
        [v11 setIsRestore:1];
        [v11 setPath:v10];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned int v11 = [v8 isRestore];
  uint64_t v12 = PLSyncGetLog();
  long long v13 = v12;
  if (!v11)
  {
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138543362;
        id v23 = v8;
        uint64_t v18 = "assetTransfer: successfully synced asset %{public}@";
        BOOL v19 = v13;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        uint32_t v21 = 12;
LABEL_14:
        _os_log_impl(&dword_0, v19, v20, v18, (uint8_t *)&v22, v21);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138543618;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v9;
      uint64_t v18 = "assetTransfer: failed to sync asset %{public}@ error: %{public}@";
      BOOL v19 = v13;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 22;
      goto LABEL_14;
    }

    [(PLSyncClient *)self _syncAssetTransfer:v8 succeeded:v6 withError:v9];
    goto LABEL_16;
  }
  if (v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      id v23 = v8;
      long long v14 = "assetTransfer: successfully restored asset %{public}@";
      long long v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 12;
LABEL_10:
      _os_log_impl(&dword_0, v15, v16, v14, (uint8_t *)&v22, v17);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v22 = 138543618;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    long long v14 = "assetTransfer: failed to restore asset %{public}@ error: %{public}@";
    long long v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 22;
    goto LABEL_10;
  }

  [(PLSyncClient *)self _restoreAssetTransfer:v8 succeeded:v6 withError:v9];
LABEL_16:
}

- (void)restoreEndedWithError:(id)a3
{
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_F964;
  id v26 = &unk_24860;
  id v27 = self;
  id v4 = a3;
  id v28 = v4;
  PLSafeRunWithUnfairLock();
  [(PLSyncClient *)v27 _writeRestoreContext];
  id v5 = [(PLSyncClient *)v27 outstandingAssets];
  if (v4 || (int64_t totalAssetsToRestore = self->_totalAssetsToRestore, totalAssetsToRestore >= 1))
  {
    id v18 = v4;
    id v7 = PLSyncGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v31 = (const __CFString *)[v5 count];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%lu outstanding assets", buf, 0xCu);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint32_t v17 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          CFStringRef v13 = *(const __CFString **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = PLSyncGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v31 = v13;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "  %{public}@", buf, 0xCu);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v10);
    }

    int64_t totalAssetsToRestore = self->_totalAssetsToRestore;
    id v5 = v17;
    id v4 = v18;
  }
  if (!totalAssetsToRestore)
  {
    long long v15 = PLSyncGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)self + 121)) {
        CFStringRef v16 = @"sync";
      }
      else {
        CFStringRef v16 = @"restore";
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v31 = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "No assets to restore, %{public}@ ended", buf, 0xCu);
    }

    [(PLSyncClient *)self _cleanupAfterSyncOrRestore];
  }
}

- (void)assetTransferEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = PLSyncGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"All ATAssets processed";
    }
    int v11 = 138543362;
    CFStringRef v12 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "assetTransferEndedWithSuccess: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  if (v3)
  {
    id v7 = objc_alloc_init((Class)PLSyncSaveJob);
    [v7 setIsSyncComplete:1];
    id v8 = [(PLSyncClient *)self pathManager];
    id v9 = [v8 iTunesPhotosSyncMetadataFilePath];
    id v10 = +[NSURL fileURLWithPath:v9 isDirectory:0];
    [v7 setOriginalAssetURL:v10];

    [(PLSyncClient *)self _enqueueSyncSaveJob:v7];
  }
  [(PLSyncClient *)self _cleanupAfterSyncOrRestore];
}

- (void)_cleanupAfterSyncOrRestore
{
  BOOL v3 = PLSyncGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)self + 121)) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_cleanupAfterSyncOrRestore: _syncRequested=%{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v5 = [(PLSyncClient *)self _photoLibrary];
  if ((*((unsigned char *)self + 121) & 1) == 0)
  {
    CFStringRef v6 = [(PLSyncClient *)self outstandingAssets];
    BOOL v7 = [v6 count] == 0;

    if (v7)
    {
      id v8 = PLSyncGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_cleanupAfterSyncOrRestore: finalizing restore", (uint8_t *)&buf, 2u);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      PLSafeRunWithUnfairLock();
      id v9 = objc_msgSend(v5, "assetsdClient", _NSConcreteStackBlock, 3221225472, sub_FFDC, &unk_249A0, self, &buf);
      id v10 = [v9 syncClient];
      [v10 finalizeOTARestoreRecreatingAlbums:*(unsigned __int8 *)(*((void *)&buf + 1) + 24)];

      _Block_object_dispose(&buf, 8);
    }
  }
  if (*((unsigned char *)self + 121))
  {
    int v11 = [(PLSyncClient *)self outstandingAssets];
    BOOL v12 = [v11 count] == 0;

    if (v12)
    {
      CFStringRef v13 = PLSyncGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "_cleanupAfterSyncOrRestore: preparing to send remote sync cleanup job", (uint8_t *)&buf, 2u);
      }

      libraryGroup = self->_libraryGroup;
      if (libraryGroup) {
        dispatch_group_wait(libraryGroup, 0xFFFFFFFFFFFFFFFFLL);
      }
      [(PLSyncClient *)self _enqueueRemoteSyncCleanupJobBeforeDate:0 withFinishedBlock:0];
    }
  }
  [(PLSyncClient *)self _saveOutstandingSyncJobs];
  long long v15 = [(PLSyncClient *)self outstandingAssets];
  BOOL v16 = [v15 count] == 0;

  uint32_t v17 = PLSyncGetLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "_cleanupAfterSyncOrRestore: no outstanding assets, preparing to clear sync state", (uint8_t *)&buf, 2u);
    }

    [(PLSyncClient *)self _clearPendingCounts];
    if (*((unsigned char *)self + 121)) {
      [(PLSyncClient *)self _clearEmptySyncAlbums];
    }
    [(PLSyncClient *)self _stopListeningToMemoryPressureEvents];
    [(PLSyncClient *)self _uninitializeLibrary];
    [(PLSyncClient *)self _clearSyncState];
  }
  else
  {
    if (v18)
    {
      unsigned int v19 = [(NSMutableArray *)self->_outstandingAssets count];
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v19;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "_cleanupAfterSyncOrRestore: deferred clearing sync state, %d outstanding assets", (uint8_t *)&buf, 8u);
    }
  }
}

- (void)_clearEmptySyncAlbums
{
  BOOL v3 = PLSyncGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_clearEmptySyncAlbums", buf, 2u);
  }

  CFStringRef v4 = [(PLSyncClient *)self _photoLibrary];
  libraryGroup = self->_libraryGroup;
  if (libraryGroup)
  {
    dispatch_group_wait(libraryGroup, 0xFFFFFFFFFFFFFFFFLL);
    CFStringRef v6 = self->_libraryGroup;
  }
  else
  {
    CFStringRef v6 = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10148;
  v8[3] = &unk_24730;
  id v9 = v4;
  id v7 = v4;
  [v7 withDispatchGroup:v6 performTransaction:v8];
}

- (void)_clearPendingCounts
{
  BOOL v3 = [(PLSyncClient *)self _photoLibrary];
  libraryGroup = self->_libraryGroup;
  if (libraryGroup)
  {
    dispatch_group_wait(libraryGroup, 0xFFFFFFFFFFFFFFFFLL);
    id v5 = self->_libraryGroup;
  }
  else
  {
    id v5 = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10488;
  v7[3] = &unk_24860;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v6 withDispatchGroup:v5 performTransaction:v7];
}

- (void)_initializeOutstandingAssets
{
  BOOL v3 = [(PLSyncClient *)self _initializePhotoLibraryIfNecessary];

  if (!v3) {
    PLAbortWithReason();
  }
  id v5 = [(PLSyncClient *)self _neededRestoreAssets];
  self->_int64_t totalAssetsToRestore = (int64_t)[v5 count];
  id v4 = [v5 mutableCopy];
  [(PLSyncClient *)self setOutstandingAssets:v4];
}

- (id)outstandingAssetTransfers
{
  BOOL v3 = [(PLSyncClient *)self outstandingAssets];
  if (!v3)
  {
    id v4 = +[ATDeviceSettings sharedInstance];
    unsigned int v5 = [v4 activeRestoreType];

    id v6 = PLSyncGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 3) {
        CFStringRef v7 = @"Error";
      }
      else {
        CFStringRef v7 = *(&off_24C00 + v5);
      }
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)uint64_t v24 = v5;
      *(_WORD *)&v24[4] = 2114;
      *(void *)&v24[6] = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Populating outstandingAssets for restoreType %d (%{public}@)", buf, 0x12u);
    }

    if (v5 > 1)
    {
      BOOL v3 = 0;
    }
    else
    {
      [(PLSyncClient *)self _initializeOutstandingAssets];
      BOOL v3 = [(PLSyncClient *)self outstandingAssets];
    }
  }
  [(PLSyncClient *)self _startListeningToMemoryPressureEvents];
  id v8 = PLSyncGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v3 count];
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)uint64_t v24 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "outstandingAssetTransfers %d", buf, 8u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        BOOL v16 = PLSyncGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)uint64_t v24 = v15;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "  %{public}@", buf, 0xCu);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v10;
}

- (void)syncEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = PLSyncGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "syncEndedWithSuccess %d", (uint8_t *)v6, 8u);
  }

  [(PLSyncClient *)self _stopListeningToMemoryPressureEvents];
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  id v9 = a4;
  *((unsigned char *)self + 121) |= 1u;
  if (+[NSThread isMainThread])
  {
    id v10 = PLSyncGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_FAULT, "AirTraffic plugins should only be run on a non-main-thread queue!", buf, 2u);
    }
  }
  id v11 = PLSyncGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 3) {
      CFStringRef v12 = @"unknown";
    }
    else {
      CFStringRef v12 = *(&off_24BE0 + a3);
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v90 = (uint64_t)v12;
    __int16 v91 = 2114;
    id v92 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Reconcile Sync: (type=%{public}@) anchor: %{public}@", buf, 0x16u);
  }

  id v13 = [(PLSyncClient *)self _initializePhotoLibraryIfNecessary];
  long long v14 = [(PLSyncClient *)self pathManager];
  uint64_t v15 = [v14 iTunesPhotosSyncMetadataFilePath];

  BOOL v16 = +[NSFileManager defaultManager];
  v80 = (void *)v15;
  if ([v16 fileExistsAtPath:v15])
  {
    id v86 = 0;
    uint32_t v17 = [(PLSyncClient *)self _readPhotosSyncMetadataFromPath:v15 error:&v86];
    id v18 = v86;
  }
  else
  {
    NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
    CFStringRef v88 = @"Missing iTunes photo sync metadata";
    long long v19 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    id v18 = +[NSError errorWithDomain:NSCocoaErrorDomain code:260 userInfo:v19];

    uint32_t v17 = 0;
  }
  long long v20 = [(PLSyncClient *)self pathManager];
  uint64_t v21 = [v20 syncInfoPath];

  if ([v16 fileExistsAtPath:v21])
  {
    id v85 = 0;
    unsigned __int8 v22 = [v16 removeItemAtPath:v21 error:&v85];
    id v23 = v85;
    if ((v22 & 1) == 0)
    {
      uint64_t v24 = v17;
      id v25 = v9;
      id v26 = PLSyncGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v90 = v21;
        __int16 v91 = 2114;
        id v92 = v23;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "Failed to remove syncUserAgentInfoFile at path %{public}@ err: %{public}@", buf, 0x16u);
      }

      id v9 = v25;
      uint32_t v17 = v24;
    }
  }
  v81 = (void *)v21;
  if (v17)
  {
    id v79 = v9;
    id v27 = +[NSMutableDictionary dictionary];
    id v28 = [v17 objectForKeyedSubscript:@"iTunesUserAgent"];
    if (v28) {
      [v27 setObject:v28 forKey:@"userAgent"];
    }
    id v29 = +[PLSTransportDecoder decoder];
    id v84 = v18;
    id v30 = [v29 decodeSnapshotFromPropertyList:v17 error:&v84];
    id v78 = v84;

    CFStringRef v31 = [v30 libraryKind];
    if (v31) {
      [v27 setObject:v31 forKey:@"libraryKind"];
    }
    if (v30)
    {
      v77 = v29;
      id v75 = v17;
      if (![v27 count]) {
        goto LABEL_44;
      }
      id v83 = 0;
      uint64_t v32 = +[NSPropertyListSerialization dataWithPropertyList:v27 format:100 options:0 error:&v83];
      id v33 = v83;
      id v34 = v33;
      if (v32)
      {
        id v82 = v33;
        unsigned int v35 = [v32 writeToFile:v81 options:1073741825 error:&v82];
        id v36 = v82;

        if (v35)
        {
          +[PLFileUtilities changeFileOwnerToMobileAtPath:v81 error:0];
LABEL_43:
          id v29 = v77;

LABEL_44:
          [(PLSyncClient *)self _initializeOutstandingAssets];
          long long v39 = [(PLSyncClient *)self pathManager];
          uint64_t v40 = [v39 iTunesPhotosSyncCurrentLibraryUUIDPath];

          long long v41 = [(PLSyncClient *)self pathManager];
          long long v42 = [v41 iTunesPhotosLastSyncMetadataFilePath];
          uint64_t v43 = +[NSURL fileURLWithPath:v42];

          id v76 = (void *)v43;
          id v44 = [v29 decodeSnapshotFromFile:v43 error:0];
          unsigned __int8 v73 = [v30 isEqualToSnapshot:v44];
          uint64_t v45 = [v44 libraryUUID];
          if (!v45) {
            goto LABEL_46;
          }
          id v46 = (void *)v45;
          uint64_t v47 = [v30 libraryUUID];
          __int16 v48 = [v44 libraryUUID];
          unsigned int v49 = [v47 isEqual:v48];

          if (!v49)
          {
            uint64_t v51 = 1;
          }
          else
          {
LABEL_46:
            __int16 v50 = [v44 libraryUUID];

            if (v50)
            {
              uint64_t v51 = 0;
            }
            else
            {
              v52 = +[NSDictionary dictionaryWithContentsOfFile:v40];
              uint64_t v53 = [v52 objectForKey:@"libraryUUID"];

              if (v53
                && ([v30 libraryUUID],
                    long long v54 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v55 = [v54 isEqual:v53],
                    v54,
                    (v55 & 1) != 0))
              {
                uint64_t v51 = 0;
              }
              else
              {
                id v56 = PLSyncGetLog();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  v57 = [v30 libraryUUID];
                  *(_DWORD *)long long buf = 138543618;
                  uint64_t v90 = (uint64_t)v53;
                  __int16 v91 = 2114;
                  id v92 = v57;
                  _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Forcing resync based on CurrentLibraryUUID.plist: previous %{public}@, snapshot %{public}@", buf, 0x16u);
                }
                uint64_t v51 = 1;
              }
            }
          }
          double v58 = [v30 libraryUUID];
          v59 = +[NSDictionary dictionaryWithObject:v58 forKey:@"libraryUUID"];

          id v60 = +[NSPropertyListSerialization dataWithPropertyList:v59 format:100 options:0 error:0];
          [v60 writeToFile:v40 options:1073741825 error:0];
          v74 = (void *)v40;
          +[PLFileUtilities changeFileOwnerToMobileAtPath:v40 error:0];
          if (v73)
          {
            id v61 = PLSyncGetLog();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "NULL PHOTO SYNC DETECTED - NO RECONCILING NEEDED", buf, 2u);
            }
          }
          else
          {
            v62 = +[NSFileManager defaultManager];
            double v63 = [v76 path];
            [v62 removeItemAtPath:v63 error:0];

            uint64_t v64 = [v30 albumsAndEventsByUUID];
            id v65 = (NSMutableDictionary *)[v64 mutableCopy];
            albumsAndEvents = self->_albumsAndEvents;
            self->_albumsAndEvents = v65;

            [(PLSyncClient *)self _pullOutMasterAlbumFromAlbumsAndEvents];
            double v67 = [v30 assetsByUUID];
            [(PLSyncClient *)self setUuidToPLSAsset:v67];

            [(PLSyncClient *)self setLibraryChangeSnapshot:v30];
            [(PLSyncClient *)self setIsResync:v51];
            [(PLSyncClient *)self _reconcileMetadata];
            id v61 = PLSyncGetLog();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              if (v51) {
                CFStringRef v68 = @"resync";
              }
              else {
                CFStringRef v68 = @"sync";
              }
              v69 = [(PLSyncClient *)self outstandingAssets];
              unsigned int v70 = [v69 count];
              *(_DWORD *)long long buf = 138543618;
              uint64_t v90 = (uint64_t)v68;
              __int16 v91 = 1024;
              LODWORD(v92) = v70;
              _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "Done reconciling (%{public}@)! %d outstanding assets", buf, 0x12u);
            }
          }
          uint32_t v17 = v75;
          id v29 = v77;

          +[NSDate timeIntervalSinceReferenceDate];
          self->_lastSyncJobsSaveTime = v71;

          BOOL v37 = 1;
          id v18 = v78;
          id v9 = v79;
          goto LABEL_65;
        }
      }
      else
      {
        id v36 = v33;
      }
      long long v38 = PLSyncGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v90 = (uint64_t)v27;
        __int16 v91 = 2114;
        id v92 = v36;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, "Failed to update user agent info %{public}@: %{public}@", buf, 0x16u);
      }

      goto LABEL_43;
    }

    id v18 = v78;
    id v9 = v79;
    if (!a3) {
      goto LABEL_36;
    }
  }
  else
  {
    id v29 = 0;
    if (!a3)
    {
LABEL_36:
      id v30 = PLSyncGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "No-op sync", buf, 2u);
      }
      BOOL v37 = 1;
      goto LABEL_65;
    }
  }
  if (a6) {
    *a6 = v18;
  }
  id v30 = PLSyncGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v90 = (uint64_t)v18;
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "snapshot decode failed: %{public}@", buf, 0xCu);
  }
  BOOL v37 = 0;
LABEL_65:

  return v37;
}

- (id)_readPhotosSyncMetadataFromPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = PLSyncGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "Loading photos sync metadata from %{public}@", buf, 0xCu);
  }

  CFStringRef v7 = +[NSURL fileURLWithPath:v5];
  id v8 = +[NSInputStream inputStreamWithURL:v7];
  [v8 open];
  id v12 = 0;
  id v9 = +[NSPropertyListSerialization propertyListWithStream:v8 options:0 format:0 error:&v12];
  id v10 = v12;
  [v8 close];
  if (a4 && !v9) {
    *a4 = v10;
  }

  return v9;
}

- (void)_pullOutMasterAlbumFromAlbumsAndEvents
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_C2CC;
  id v11 = sub_C2DC;
  id v12 = 0;
  albumsAndEvents = self->_albumsAndEvents;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_11794;
  v6[3] = &unk_24978;
  v6[4] = &v7;
  [(NSMutableDictionary *)albumsAndEvents enumerateKeysAndObjectsUsingBlock:v6];
  if (v8[5])
  {
    -[PLSyncClient setMasterAlbum:](self, "setMasterAlbum:");
    id v4 = self->_albumsAndEvents;
    id v5 = [(id)v8[5] uuid];
    [(NSMutableDictionary *)v4 removeObjectForKey:v5];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_reconcileMetadata
{
  BOOL v3 = PLSyncGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Entering reconcileMetadata", buf, 2u);
  }

  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  [(PLSyncClient *)self _reconcileAlbums:v4];
  [(PLSyncClient *)self _reconcileAssets:v4];
  dispatch_group_leave(v4);
  [(PLSyncClient *)self _setPendingAlbumCounts:v4];
  [(PLSyncClient *)self _createAlbumUUIDToObjectIDMap:v4];
  id v5 = PLSyncGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Waiting for reconcile to finish", v8, 2u);
  }

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = PLSyncGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Leaving reconcileMetadata!", v7, 2u);
  }
}

- (void)_setPendingAlbumCounts:(id)a3
{
  id v4 = a3;
  if (self->_pendingAssetsPerContainer
    || (Mutable = CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0),
        (self->_pendingAssetsPerContainer = Mutable) != 0))
  {
    [(PLSyncClient *)self _photoLibrary];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_11A78;
    v7[3] = &unk_24860;
    v7[4] = self;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v8;
    [v6 withDispatchGroup:v4 performTransaction:v7];
  }
}

- (void)_incrementPendingCountForContainerUUID:(id)a3
{
  id key = a3;
  int v4 = CFDictionaryContainsKey(self->_pendingAssetsPerContainer, key);
  pendingAssetsPerContainer = self->_pendingAssetsPerContainer;
  if (v4)
  {
    id v6 = (char *)CFDictionaryGetValue(pendingAssetsPerContainer, key) + 1;
    pendingAssetsPerContainer = self->_pendingAssetsPerContainer;
    uint64_t v7 = key;
  }
  else
  {
    uint64_t v7 = key;
    id v6 = (char *)&dword_0 + 1;
  }
  CFDictionarySetValue(pendingAssetsPerContainer, v7, v6);
}

- (void)_persistAssetAlbumOrderStructures
{
  int v4 = [(PLSyncClient *)self pathManager];
  id v5 = [v4 pathToAssetAlbumOrderStructure];

  id v6 = +[NSFileManager defaultManager];
  [v6 removeItemAtPath:v5 error:0];
  uint64_t v7 = +[NSMutableDictionary dictionary];
  albumsAndEvents = self->_albumsAndEvents;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1236C;
  v18[3] = &unk_24810;
  id v9 = v7;
  id v19 = v9;
  [(NSMutableDictionary *)albumsAndEvents enumerateKeysAndObjectsUsingBlock:v18];
  id v17 = 0;
  id v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:100 options:0 error:&v17];
  id v11 = v17;
  id v12 = v11;
  if (v10)
  {
    id v16 = v11;
    unsigned __int8 v13 = [v10 writeToFile:v5 options:1073741825 error:&v16];
    id v14 = v16;

    if (v13)
    {
      +[PLFileUtilities changeFileOwnerToMobileAtPath:v5 error:0];
      goto LABEL_8;
    }
  }
  else
  {
    id v14 = v11;
  }
  uint64_t v15 = PLSyncGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v21 = v5;
    __int16 v22 = 2114;
    id v23 = v14;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to write assetOrdersByAlbumUUID to path %{public}@ %{public}@", buf, 0x16u);
  }

LABEL_8:
  +[PLManagedAlbum clearAssetOrderByAbumUUIDs];
}

- (void)_saveOrderOnSyncedAlbum:(id)a3 inLibrary:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_125D0;
  v6[3] = &unk_24730;
  id v7 = a3;
  id v5 = v7;
  [a4 performTransactionAndWait:v6];
}

- (void)_reconcileDeviceAlbumListSortingWithAlbums:(id)a3 iTunesAlbumOrder:(id)a4 inLibrary:(id)a5
{
  id v7 = a5;
  id v29 = a4;
  id v28 = a3;
  id v33 = +[PLManagedAlbumList albumListInPhotoLibrary:v7];
  id v25 = [v33 albums];
  id v8 = +[NSMutableIndexSet indexSet];
  id v9 = +[NSMutableArray array];
  uint64_t v32 = +[PLManagedAlbumList eventListInPhotoLibrary:v7];
  id v10 = [v32 albums];
  id v11 = +[NSMutableIndexSet indexSet];
  id v12 = +[NSMutableArray array];
  CFStringRef v31 = +[PLManagedAlbumList facesAlbumListInPhotoLibrary:v7];
  unsigned __int8 v13 = [v31 albums];
  id v14 = +[NSMutableIndexSet indexSet];
  +[NSMutableArray array];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_12AC8;
  v38[3] = &unk_24950;
  id v39 = v25;
  id v40 = v9;
  id v41 = v8;
  id v42 = v10;
  id v43 = v12;
  id v44 = v11;
  id v45 = v13;
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  id v47 = v14;
  id v27 = v14;
  id v15 = v46;
  id v23 = v13;
  id v21 = v11;
  id v16 = v12;
  id v22 = v10;
  id v24 = v8;
  id v17 = v9;
  id v26 = v25;
  [v28 enumerateKeysAndObjectsUsingBlock:v38];

  +[NSMutableDictionary dictionary];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_12D10;
  v36[3] = &unk_248D8;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = v18;
  [v29 enumerateObjectsUsingBlock:v36];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_12DA4;
  v34[3] = &unk_24928;
  id v35 = v18;
  id v19 = v18;
  long long v20 = objc_retainBlock(v34);
  [v17 sortUsingComparator:v20];
  [(PLSyncClient *)self _reorderAlbumListProxy:v26 withAlbumsAtIndexes:v24 inNewOrder:v17];
  [v16 sortUsingComparator:v20];
  [(PLSyncClient *)self _reorderAlbumListProxy:v22 withAlbumsAtIndexes:v21 inNewOrder:v16];
  [(PLSyncClient *)self _saveOrderOnSyncedAlbum:v16 inLibrary:v7];
  [v15 sortUsingComparator:v20];
  [(PLSyncClient *)self _reorderAlbumListProxy:v23 withAlbumsAtIndexes:v27 inNewOrder:v15];
  [(PLSyncClient *)self _saveOrderOnSyncedAlbum:v15 inLibrary:v7];
}

- (void)_reorderAlbumListProxy:(id)a3 withAlbumsAtIndexes:(id)a4 inNewOrder:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = [v8 count];
    if (v10 == [v9 count])
    {
      +[NSMutableDictionary dictionary];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_13154;
      v25[3] = &unk_248D8;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = v11;
      [v7 enumerateObjectsUsingBlock:v25];
      *(void *)long long buf = 0;
      id v28 = buf;
      uint64_t v29 = 0x2020000000;
      char v30 = 0;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v24[3] = 0;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_131FC;
      v19[3] = &unk_24900;
      id v20 = v9;
      id v22 = v24;
      id v12 = v11;
      id v21 = v12;
      id v23 = buf;
      [v8 enumerateIndexesUsingBlock:v19];
      if (v28[24])
      {
        id v14 = _NSConcreteStackBlock;
        uint64_t v15 = 3221225472;
        id v16 = sub_13300;
        id v17 = &unk_24928;
        id v18 = v12;
        unsigned __int8 v13 = objc_retainBlock(&v14);
        objc_msgSend(v7, "sortUsingComparator:", v13, v14, v15, v16, v17);
      }
      _Block_object_dispose(v24, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v12 = PLSyncGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = [v8 count];
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = [v9 count];
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "ERROR in _reorderAlbumListProxy, different count for existingAlbumIndexes %d and newAlbumOrderArray %d", buf, 0xEu);
      }
    }
  }
}

- (id)_onDeviceAlbumsByUUID
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  int v4 = +[NSNumber numberWithInt:1550];
  id v5 = +[NSNumber numberWithInt:1551];
  id v6 = +[NSNumber numberWithInt:15];
  id v7 = +[NSPredicate predicateWithFormat:@"(kind == %@) || (kind == %@) || (kind == %@)", v4, v5, v6];

  id v8 = [(PLSyncClient *)self _photoLibrary];
  id v9 = +[PLGenericAlbum albumsMatchingPredicate:v7 expectedResultCount:0 inLibrary:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_13524;
  v12[3] = &unk_248D8;
  id v10 = v3;
  id v13 = v10;
  [v9 enumerateObjectsUsingBlock:v12];

  return v10;
}

- (void)_reconcileAlbums:(id)a3
{
  [(PLSyncClient *)self _photoLibrary];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1361C;
  v5[3] = &unk_24860;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [v4 performBlockAndWait:v5];
}

- (void)_reconcileAssets:(id)a3
{
  id v4 = [(PLSAlbum *)self->_masterAlbum assetUUIDs];
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  assetUUIDtoSortToken = self->_assetUUIDtoSortToken;
  self->_assetUUIDtoSortToken = v5;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(PLSAlbum *)self->_masterAlbum assetUUIDs];
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v27;
    double v11 = -1.0;
    do
    {
      id v12 = 0;
      double v13 = v11;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        id v14 = [(NSMutableDictionary *)self->_uuidToPLSAsset objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * (void)v12)];
        uint64_t v15 = [v14 exposureDate];
        [v15 doubleValue];
        id v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v16 - kCFAbsoluteTimeIntervalSince1904];

        [v17 timeIntervalSinceReferenceDate];
        double v11 = v18;
        if (vabdd_f64(v13, v18) < 2.22044605e-16) {
          ++v9;
        }
        else {
          unint64_t v9 = 0;
        }
        id v19 = self->_assetUUIDtoSortToken;
        id v20 = +[NSNumber numberWithDouble:v18 + (double)v9 / 100000.0];
        id v21 = [v14 uuid];
        [(NSMutableDictionary *)v19 setObject:v20 forKey:v21];

        id v12 = (char *)v12 + 1;
        double v13 = v11;
      }
      while (v8 != v12);
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  [(PLSyncClient *)self _photoLibrary];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_14630;
  v24[3] = &unk_24860;
  void v24[4] = self;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v25;
  [v22 performBlockAndWait:v24];
}

- (id)_onDeviceAssetsByUUIDInLibrary:(id)a3
{
  id v3 = a3;
  id v4 = +[PLManagedAsset entityName];
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:v4];

  id v6 = +[PLValidatedSavedAssetType predicateForIncludeMask:useIndex:](PLValidatedSavedAssetType, "predicateForIncludeMask:useIndex:", +[PLValidatedSavedAssetType maskForFinderSyncedAsset], 1);
  [v5 setPredicate:v6];
  [v5 setRelationshipKeyPathsForPrefetching:&off_25C60];
  id v7 = [v3 managedObjectContext];

  id v15 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v15];
  id v9 = v15;

  if (v8)
  {
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_15E44;
    v13[3] = &unk_247E8;
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v10;
    [v8 enumerateObjectsUsingBlock:v13];
    double v11 = v14;
  }
  else
  {
    double v11 = PLSyncGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v17 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Error Reconciling Photos: Cannot fetch on device photos %{public}@", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_batchDeleteSyncedAssetsWithReason:(id)a3 subpredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[PLValidatedSavedAssetType predicateForIncludeMask:useIndex:](PLValidatedSavedAssetType, "predicateForIncludeMask:useIndex:", +[PLValidatedSavedAssetType maskForFinderSyncedAsset], 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  uint64_t v10 = v8;
  if (v6)
  {
    v21[0] = v8;
    v21[1] = v6;
    double v11 = +[NSArray arrayWithObjects:v21 count:2];
    uint64_t v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];
  }
  id v12 = [(PLSyncClient *)self _photoLibrary];
  id v18 = 0;
  unsigned __int8 v13 = [v12 batchDeleteAssetsWithPredicate:v10 reason:v7 error:&v18];

  id v14 = v18;
  if ((v13 & 1) == 0)
  {
    id v15 = PLSyncGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v20 = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Deleting synced assets error: %{public}@", buf, 0xCu);
    }

    double v16 = [(PLSyncClient *)self _photoLibrary];
    id v17 = [v16 managedObjectContext];
    [v17 setDelayedDeletions:0];
  }
}

- (id)_addAlbumNamed:(id)a3 uuid:(id)a4 kindValue:(int)a5 inLibrary:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v7 == 1551)
  {
    id v12 = +[PLGenericAlbum insertNewSyncedEventIntoLibrary:v11];
  }
  else
  {
    if (v7 == 15) {
      +[PLGenericAlbum insertNewLegacyFaceAlbumIntoLibrary:v11];
    }
    else {
    id v12 = +[PLGenericAlbum insertNewAlbumIntoLibrary:v11];
    }
  }
  unsigned __int8 v13 = v12;
  [v12 setTitle:v9];
  [v13 setUuid:v10];
  [v13 setKindValue:v7];
  [v13 setPendingItemsType:2];
  [v13 setPendingItemsCount:0];

  return v13;
}

- (void)_enqueueRemoteSyncCleanupJobBeforeDate:(id)a3 withFinishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)PLSyncSaveJob);
  [v8 setCleanupSyncState:1];
  [v8 setCleanupBeforeDate:v6];
  [v8 setFinishedBlock:v7];

  id v9 = PLSyncGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "_enqueueRemoteSyncCleanupJob (cleanup sync state before: %{public}@)", (uint8_t *)&v10, 0xCu);
  }

  [(PLSyncClient *)self _enqueueSyncSaveJob:v8];
}

- (void)_enqueueSyncSaveJob:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSyncClient *)self outstandingSyncJobs];

  if (!v5)
  {
    id v6 = +[NSMutableArray array];
    [(PLSyncClient *)self setOutstandingSyncJobs:v6];
  }
  id v7 = [(PLSyncClient *)self outstandingSyncJobs];
  [v7 addObject:v4];
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (+[NSThread isMainThread])
  {
    id v9 = PLSyncGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_FAULT, "AirTraffic plugins should only be run on a non-main-thread queue!", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  long long v28 = buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  int v10 = PLSyncGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CFStringRef v31 = 138543362;
    id v32 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "prepareForSyncWithHostAnchor: %{public}@", v31, 0xCu);
  }

  if (+[PLPhotoLibrary systemPhotoLibraryIsObtainable])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v12 = [(PLSyncClient *)self _initializePhotoLibraryIfNecessary];
    [(PLSyncClient *)self _startListeningToMemoryPressureEvents];
    v28[24] = 1;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    id v14 = +[NSDate dateWithTimeIntervalSinceNow:-1.0];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_167C4;
    v23[3] = &unk_247C0;
    id v15 = v7;
    id v24 = v15;
    long long v26 = buf;
    double v16 = v13;
    id v25 = v16;
    [(PLSyncClient *)self _enqueueRemoteSyncCleanupJobBeforeDate:v14 withFinishedBlock:v23];

    [(PLSyncClient *)self _saveOutstandingSyncJobs];
    dispatch_time_t v17 = dispatch_time(0, 28800000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      id v18 = PLSyncGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CFStringRef v31 = 138543618;
        id v32 = v15;
        __int16 v33 = 1024;
        LODWORD(v34) = 28800;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "prepareForSyncWithHostAnchor: %{public}@ - timed out after waiting %d seconds for sync cleanup in assetsd", v31, 0x12u);
      }

      v28[24] = 0;
    }
    double v19 = CFAbsoluteTimeGetCurrent();
    id v20 = PLSyncGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CFStringRef v31 = 138543618;
      id v32 = v15;
      __int16 v33 = 2048;
      double v34 = v19 - Current;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEBUG, "prepareForSyncWithHostAnchor: %{public}@ - finished in %4.4f seconds", v31, 0x16u);
    }
  }
  else
  {
    double v16 = PLSyncGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFStringRef v31 = 138543362;
      id v32 = v7;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "prepareForSyncWithHostAnchor: %{public}@ - called before photo library is available", v31, 0xCu);
    }
  }

  BOOL v21 = v28[24] != 0;
  _Block_object_dispose(buf, 8);

  return v21;
}

- (id)installedAssetMetrics
{
  v2 = PLSyncGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "Getting Installed Asset Metrics", buf, 2u);
  }

  pl_dispatch_once();
  *(void *)long long buf = 0;
  id v6 = buf;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_C2CC;
  id v9 = sub_C2DC;
  id v10 = 0;
  pl_dispatch_sync();
  id v3 = *((id *)v6 + 5);
  _Block_object_dispose(buf, 8);

  return v3;
}

- (id)_metricsForLibraryAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[PLAssetsdClient sharedSystemLibraryAssetsdClient];
  uint64_t v7 = [v6 libraryInternalClient];
  id v12 = 0;
  id v8 = [v7 metricsForLibraryAtURL:v5 error:&v12];
  id v9 = v12;
  id v10 = PLSyncGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v14 = v5;
    __int16 v15 = 2112;
    double v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "metrics: %@ %@ %@", buf, 0x20u);
  }

  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (id)currentSyncAnchor
{
  return @"1";
}

- (id)disabledAssetTypes
{
  if (PLIsCloudPhotoLibraryEnabledForCurrentUser())
  {
    v2 = +[NSSet setWithObject:@"Photo"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObjects:@"Photo", 0];
}

- (void)dealloc
{
  [(PLSyncClient *)self _uninitializeLibrary];
  [(PLSyncClient *)self _clearSyncState];
  v3.receiver = self;
  v3.super_class = (Class)PLSyncClient;
  [(PLSyncClient *)&v3 dealloc];
}

- (void)_clearSyncState
{
  objc_super v3 = PLSyncGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Clearing sync state", v14, 2u);
  }

  [(PLSyncClient *)self _stopListeningToMemoryPressureEvents];
  albumsAndEvents = self->_albumsAndEvents;
  self->_albumsAndEvents = 0;

  uuidToPLSAsset = self->_uuidToPLSAsset;
  self->_uuidToPLSAsset = 0;

  libraryChangeSnapshot = self->_libraryChangeSnapshot;
  self->_libraryChangeSnapshot = 0;

  outstandingAssets = self->_outstandingAssets;
  self->_outstandingAssets = 0;

  albumUUIDToObjectIDMap = self->_albumUUIDToObjectIDMap;
  self->_albumUUIDToObjectIDMap = 0;

  masterAlbum = self->_masterAlbum;
  self->_masterAlbum = 0;

  assetUUIDtoSortToken = self->_assetUUIDtoSortToken;
  self->_assetUUIDtoSortToken = 0;

  restoreKeyToAssetGroup = self->_restoreKeyToAssetGroup;
  self->_restoreKeyToAssetGroup = 0;

  pathToRestoreKey = self->_pathToRestoreKey;
  self->_pathToRestoreKey = 0;

  [(PLSyncClient *)self _invalidateRestoreContext];
  *((unsigned char *)self + 121) &= ~1u;
  pendingAssetsPerContainer = self->_pendingAssetsPerContainer;
  if (pendingAssetsPerContainer)
  {
    CFRelease(pendingAssetsPerContainer);
    self->_pendingAssetsPerContainer = 0;
  }
  [(PLSyncClient *)self setOutstandingSyncJobs:0];
}

- (id)_photoLibrary
{
  return [(PLSyncClient *)self _photoLibraryWithExpectationExists:1];
}

- (id)_initializePhotoLibraryIfNecessary
{
  return [(PLSyncClient *)self _photoLibraryWithExpectationExists:0];
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)_uninitializeLibrary
{
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_175EC;
  uint64_t v7 = &unk_24730;
  id v8 = self;
  PLSafeRunWithUnfairLock();
  v2 = PLSyncGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Done uninitializing library.", v3, 2u);
  }
}

- (id)_photoLibraryWithExpectationExists:(BOOL)a3
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_C2CC;
  id v9 = sub_C2DC;
  id v10 = 0;
  PLSafeRunWithUnfairLock();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (PLSyncClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLSyncClient;
  result = [(PLSyncClient *)&v3 init];
  if (result)
  {
    result->_photoLibraryLock._os_unfair_lock_opaque = 0;
    result->_pathManagerLock._os_unfair_lock_opaque = 0;
    result->_restoreContextLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (void)_logRestoreContext:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v35[0] = @"kPLSyncRestoreContextRestoredFilesKey";
    v35[1] = @"kPLSyncRestoreContextRestoredFilesKey";
    v35[2] = @"kPLSyncRestoreContextUnrecoverableFilesKey";
    id v4 = +[NSArray arrayWithObjects:v35 count:3];
    uint64_t v5 = [v3 allKeys];
    id v6 = [v5 sortedArrayUsingSelector:"compare:"];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (!v7) {
      goto LABEL_19;
    }
    id v9 = v7;
    uint64_t v10 = *(void *)v27;
    *(void *)&long long v8 = 138543618;
    long long v24 = v8;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v12 = *(const __CFString **)(*((void *)&v26 + 1) + 8 * i);
        if (-[NSObject containsObject:](v4, "containsObject:", v12, v24))
        {
          id v13 = v3;
          id v14 = [v3 objectForKeyedSubscript:v12];
          char v15 = objc_opt_respondsToSelector();
          double v16 = PLSyncGetLog();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          if (v15)
          {
            if (v17)
            {
              unsigned int v18 = [v14 count];
              *(_DWORD *)long long buf = v24;
              CFStringRef v31 = v12;
              __int16 v32 = 1024;
              LODWORD(v33) = v18;
              double v19 = v16;
              id v20 = "_restoreContext[%{public}@] = %d paths";
              uint32_t v21 = 18;
              goto LABEL_15;
            }
          }
          else if (v17)
          {
            *(_DWORD *)long long buf = v24;
            CFStringRef v31 = v12;
            __int16 v32 = 2114;
            __int16 v33 = v14;
            double v19 = v16;
            id v20 = "_restoreContext[%{public}@] = %{public}@";
            uint32_t v21 = 22;
LABEL_15:
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
          }

          id v3 = v13;
          goto LABEL_17;
        }
        id v14 = PLSyncGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [v3 objectForKeyedSubscript:v12];
          *(_DWORD *)long long buf = v24;
          CFStringRef v31 = v12;
          __int16 v32 = 2114;
          __int16 v33 = v22;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "_restoreContext[%{public}@] = %{public}@", buf, 0x16u);
        }
LABEL_17:
      }
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (!v9)
      {
LABEL_19:

        goto LABEL_24;
      }
    }
  }
  id v4 = PLSyncGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v23 = @"empty";
    if (!v3) {
      CFStringRef v23 = @"nil";
    }
    *(_DWORD *)long long buf = 138543362;
    CFStringRef v31 = v23;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_restoreContext is %{public}@", buf, 0xCu);
  }
LABEL_24:
}

- (void)_stopListeningToMemoryPressureEvents
{
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    dispatch_source_cancel(memoryPressureSource);
    id v4 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0;
  }
}

- (void)_startListeningToMemoryPressureEvents
{
  if (!self->_memoryPressureSource)
  {
    id v3 = [(PLSyncClient *)self _photoLibrary];
    objc_initWeak(&location, v3);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_17F90;
    v8[3] = &unk_24BC0;
    objc_copyWeak(&v9, &location);
    id v4 = objc_retainBlock(v8);
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 2uLL, v5);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v6;

    pl_dispatch_source_set_event_handler();
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (id)_allAssetMetricBaseURLs
{
  id v3 = +[NSMutableArray array];
  id v4 = [(PLSyncClient *)self pathManager];
  uint64_t v5 = [v4 photoDirectoryWithType:4];
  id v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  [v3 addObject:v6];

  id v7 = [(PLSyncClient *)self pathManager];
  long long v8 = [v7 photoDirectoryWithType:14];

  id v9 = +[NSURL fileURLWithPath:v8 isDirectory:1];
  [v3 addObject:v9];

  uint64_t v10 = [(PLSyncClient *)self pathManager];
  id v11 = [v10 photoDirectoryWithType:33];
  CFStringRef v12 = +[NSURL fileURLWithPath:v11 isDirectory:1];
  [v3 addObject:v12];

  return v3;
}

- (id)_allAssetDirectoryURLs
{
  id v3 = +[NSMutableArray array];
  id v4 = [(PLSyncClient *)self pathManager];
  uint64_t v5 = [v4 photoDirectoryWithType:4];
  id v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  [v3 addObject:v6];

  CFStringRef v23 = self;
  id v7 = [(PLSyncClient *)self pathManager];
  long long v8 = [v7 photoDirectoryWithType:14];

  id v9 = +[NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:0 error:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = +[NSFileManager defaultManager];
  id v11 = [v10 contentsOfDirectoryAtPath:v8 error:0];

  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v9, "numberOfMatchesInString:options:range:", v16, 0, 0, objc_msgSend(v16, "length")) == (char *)&dword_0 + 1)
        {
          BOOL v17 = [v8 stringByAppendingPathComponent:v16];
          unsigned int v18 = +[NSURL fileURLWithPath:v17 isDirectory:1];
          [v3 addObject:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  double v19 = [(PLSyncClient *)v23 pathManager];
  id v20 = [v19 iTunesSyncedAssetsDirectory];
  uint32_t v21 = +[NSURL fileURLWithPath:v20 isDirectory:1];
  [v3 addObject:v21];

  return v3;
}

@end