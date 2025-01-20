@interface ToneSyncClient
+ (id)_syncPlistPaths;
+ (id)_toneSyncAnchorFilePath;
+ (id)_toneSyncMediaPath;
+ (id)_toneSyncPlistFolderPath;
- (BOOL)installAsset:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (ToneSyncClient)init;
- (id)_relativePathCorrespondingTo:(id)a3 relativeTo:(id)a4;
- (id)_toneMetadataFromSyncOperation:(id)a3 syncIdentifier:(id)a4 valid:(BOOL *)a5;
- (id)currentSyncAnchor;
- (id)enumeratePathsForBackupType:(int)a3 usingBlock:(id)a4;
- (id)installedAssetMetrics;
- (id)outstandingAssetTransfers;
- (id)supportedDataclasses;
- (void)_processSyncOperation:(id)a3;
- (void)_removeSyncPlists;
- (void)_writeSyncAnchor:(id)a3;
- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)assetTransferEndedWithSuccess:(BOOL)a3;
- (void)clearSyncData;
- (void)pathsToBackup:(id *)a3 pathsNotToBackup:(id *)a4;
- (void)syncEndedWithSuccess:(BOOL)a3;
@end

@implementation ToneSyncClient

- (ToneSyncClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)ToneSyncClient;
  v2 = [(ToneSyncClient *)&v8 init];
  if (v2)
  {
    v3 = (TLToneManager *)objc_alloc_init((Class)TLToneManager);
    toneManager = v2->_toneManager;
    v2->_toneManager = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uploadAssets = v2->_uploadAssets;
    v2->_uploadAssets = v5;
  }
  return v2;
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:@"Ringtone"];
}

- (id)currentSyncAnchor
{
  id v2 = objc_alloc((Class)NSDictionary);
  v3 = [(id)objc_opt_class() _toneSyncAnchorFilePath];
  id v4 = [v2 initWithContentsOfFile:v3];

  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    objc_super v8 = [v7 objectForKey:@"syncAnchor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    v10 = v9;

    if (v10)
    {
      v11 = v10;
      v12 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        v17 = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Returning sync anchor: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }
  if (v8) {
    v13 = v8;
  }
  else {
    v13 = @"0";
  }
  v14 = v13;

  return v14;
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  id v7 = a3;
  objc_super v8 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v32 = v9;
    __int16 v33 = 2114;
    id v34 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@, host anchor: %{public}@", buf, 0x16u);
  }
  toneManager = self->_toneManager;
  id v29 = 0;
  v11 = (char *)[(TLToneManager *)toneManager _removeOrphanedManifestEntriesReturningFilePathsForFoundOrphans:&v29];
  id v12 = v29;
  v13 = v12;
  if (v11 == (unsigned char *)&dword_0 + 1)
  {
    id v23 = v12;
    id v24 = v7;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v20 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v19;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Tone asset at path %{public}@ couldn't be found, so corresponding plist entry was removed.", buf, 0xCu);
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v16);
    }

    v21 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "At least one orphaned plist entry was removed. Requesting reset sync by resetting the sync anchor.", buf, 2u);
    }

    [(ToneSyncClient *)self _writeSyncAnchor:@"0"];
    [(TLToneManager *)self->_toneManager _registerDidRequestResetSyncPostAccidentalToneDeletion];
    v13 = v23;
    id v7 = v24;
  }
  [(NSMutableArray *)self->_uploadAssets removeAllObjects];
  [(ToneSyncClient *)self _removeSyncPlists];

  return 1;
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  id v34 = a4;
  v9 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    id v53 = v10;
    __int16 v54 = 1024;
    *(_DWORD *)v55 = a3;
    *(_WORD *)&v55[4] = 2114;
    *(void *)&v55[6] = v34;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@, sync type: %u, reconciled anchor: %{public}@", buf, 0x1Cu);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = [(id)objc_opt_class() _syncPlistPaths];
  id v37 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v37)
  {
    uint64_t v11 = *(void *)v47;
    uint64_t v35 = *(void *)v47;
    do
    {
      for (id i = 0; i != v37; id i = v32 + 1)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        v40 = (char *)i;
        uint64_t v13 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v14 = [(id)objc_opt_class() _toneSyncPlistFolderPath];
        id v15 = [v14 stringByAppendingPathComponent:v13];

        id v16 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v15];
        uint64_t v17 = [v16 objectForKey:@"operations"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v18 = v17;
        }
        else {
          v18 = 0;
        }
        id v19 = v18;

        v41 = v19;
        v39 = v16;
        if (v19)
        {
          v38 = v15;
          v20 = _ATLogCategorySyncBundle_Oversize();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v53 = v19;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Operations: %{public}@", buf, 0xCu);
          }

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v21 = v19;
          id v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v43;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v43 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = *(id *)(*((void *)&v42 + 1) + 8 * (void)j);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  long long v27 = v26;
                }
                else {
                  long long v27 = 0;
                }
                id v28 = v27;

                if (v28)
                {
                  [(ToneSyncClient *)self _processSyncOperation:v28];
                }
                else
                {
                  id v29 = _ATLogCategorySyncBundle();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    v30 = objc_opt_class();
                    *(_DWORD *)buf = 138543618;
                    id v53 = 0;
                    __int16 v54 = 2114;
                    *(void *)v55 = v30;
                    id v31 = v30;
                    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Invalid operation: %{public}@ (%{public}@)", buf, 0x16u);
                  }
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v23);
            uint64_t v11 = v35;
          }
          v32 = v40;
          id v15 = v38;
        }
        else
        {
          v21 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v53 = 0;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "No operations or invalid operation: %{public}@", buf, 0xCu);
          }
          v32 = v40;
        }
      }
      id v37 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v37);
  }

  [(ToneSyncClient *)self _writeSyncAnchor:v34];
  return 1;
}

- (id)outstandingAssetTransfers
{
  id v25 = +[NSMutableArray array];
  [v25 addObjectsFromArray:self->_uploadAssets];
  id v29 = [(TLToneManager *)self->_toneManager _allSyncedTones];
  [v29 allKeys];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v32;
    uint64_t v28 = kToneSyncIdentifierKey;
    uint64_t v27 = kToneTitleKey;
    id v7 = &CPSharedResourcesDirectory_ptr;
    *(void *)&long long v4 = 138543362;
    long long v24 = v4;
    do
    {
      objc_super v8 = 0;
      id v26 = v5;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v8);
        v10 = [(TLToneManager *)self->_toneManager _iTunesRingtoneDirectory];
        uint64_t v11 = [v7[49] defaultManager];
        id v12 = [v10 stringByAppendingPathComponent:v9];
        unsigned __int8 v13 = [v11 fileExistsAtPath:v12];

        if ((v13 & 1) == 0)
        {
          id v14 = [v29 objectForKey:v9];
          id v15 = [v14 objectForKey:v28];
          id v16 = [v14 objectForKey:v27];
          if (v15)
          {
            uint64_t v17 = v6;
            v18 = self;
            id v19 = v7;
            v20 = [v15 stringValue];
            v21 = +[ATAsset downloadAssetWithIdentifier:v20 dataclass:@"Ringtone" prettyName:v16];

            if (v21) {
              [v25 addObject:v21];
            }
            id v7 = v19;
            self = v18;
            uint64_t v6 = v17;
            id v5 = v26;
          }
          else
          {
            v21 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              id v36 = v14;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "failed to get sync_id from ringtone metadata %{public}@", buf, 0xCu);
            }
          }
        }
        objc_super v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v5);
  }
  id v22 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v25;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "gathered assets to transfer: %{public}@", buf, 0xCu);
  }

  return v25;
}

- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543618;
    id v25 = v8;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "assetTransfer complete for. asset=%{public}@. error=%{public}@", (uint8_t *)&v24, 0x16u);
  }

  if (v6)
  {
    unsigned int v11 = [v8 isDownload];
    toneManager = self->_toneManager;
    if (v11)
    {
      unsigned __int8 v13 = [(TLToneManager *)self->_toneManager _allSyncedTones];
      id v14 = [v8 identifier];
      id v15 = [v13 objectForKey:v14];

      id v16 = self->_toneManager;
      uint64_t v17 = [v8 identifier];
      v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 longLongValue]);
      [(TLToneManager *)v16 _removeToneWithSyncIdentifier:v18];

      id v19 = self->_toneManager;
      v20 = [v8 path];
      v21 = [v20 lastPathComponent];
      [(TLToneManager *)v19 _importSyncedToneWithMetadata:v15 fileName:v21];
    }
    else
    {
      id v22 = [v8 path];
      id v23 = [v22 lastPathComponent];
      [(TLToneManager *)toneManager _transferPurchasedToITunes:v23];

      [(NSMutableArray *)self->_uploadAssets removeObject:v8];
    }
  }
}

- (void)assetTransferEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v6 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@, success: %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }
  if (v3) {
    [(ToneSyncClient *)self _removeSyncPlists];
  }
}

- (BOOL)installAsset:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  BOOL v6 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138543362;
    __int16 v10 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
  }
  return 1;
}

- (void)syncEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    int v7 = 138543618;
    int v8 = v6;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@, success: %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }
}

- (void)clearSyncData
{
  long long v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v10 = 138543362;
    BOOL v11 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);
  }
  [(ToneSyncClient *)self _removeSyncPlists];
  BOOL v6 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(id)objc_opt_class() _toneSyncAnchorFilePath];
    int v10 = 138543362;
    BOOL v11 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Removing sync anchor at %{public}@", (uint8_t *)&v10, 0xCu);
  }
  int v8 = +[NSFileManager defaultManager];
  __int16 v9 = [(id)objc_opt_class() _toneSyncAnchorFilePath];
  [v8 removeItemAtPath:v9 error:0];
}

- (id)installedAssetMetrics
{
  id v3 = [(TLToneManager *)self->_toneManager _installedTonesSize];
  long long v4 = [(TLToneManager *)self->_toneManager _installedTones];
  id v5 = [v4 count];

  v10[0] = @"_Count";
  BOOL v6 = +[NSNumber numberWithLongLong:v5];
  v10[1] = @"_PhysicalSize";
  v11[0] = v6;
  int v7 = +[NSNumber numberWithLongLong:v3];
  v11[1] = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)enumeratePathsForBackupType:(int)a3 usingBlock:(id)a4
{
  id v6 = a4;
  if (a3 > 3) {
    id v36 = 0;
  }
  else {
    id v36 = *(&off_82A0 + a3);
  }
  int v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v36;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Asked to enumerate paths for backup type: \"%{public}@\".", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v53 = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_4370;
  v43[3] = &unk_8258;
  v43[4] = self;
  id v45 = v6;
  long long v46 = buf;
  id v35 = v45;
  id v44 = v36;
  int v8 = objc_retainBlock(v43);
  __int16 v9 = [(TLToneManager *)self->_toneManager _installedTones];
  int v10 = [(TLToneManager *)self->_toneManager _rootDirectory];
  v38 = [v10 stringByAppendingString:@"/"];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v40;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
      unsigned int v15 = [v14 isPurchased];
      uint64_t v16 = *(void *)&buf[8];
      if (v15 && !*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        uint64_t v17 = [v14 syncIdentifier];
        v18 = [v17 stringValue];
        id v19 = +[NSString stringWithFormat:@"%@.plist", v18, v35];

        v20 = [(TLToneManager *)self->_toneManager _deviceITunesRingtoneDirectory];
        v21 = [v20 stringByAppendingPathComponent:v19];

        id v22 = [(ToneSyncClient *)self _relativePathCorrespondingTo:v21 relativeTo:v38];

        if (v22) {
          ((void (*)(void *, void *, void))v8[2])(v8, v22, 0);
        }

        uint64_t v16 = *(void *)&buf[8];
        if (!*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          id v23 = [v14 artworkFile];
          if (v23)
          {
            int v24 = [(TLToneManager *)self->_toneManager _deviceITunesRingtoneDirectory];
            id v25 = [v24 stringByAppendingPathComponent:v23];

            __int16 v26 = [(ToneSyncClient *)self _relativePathCorrespondingTo:v25 relativeTo:v38];

            if (v26) {
              ((void (*)(void *, void *, void))v8[2])(v8, v26, 0);
            }
          }
          uint64_t v16 = *(void *)&buf[8];
        }
      }
      if (*(unsigned char *)(v16 + 24)) {
        break;
      }
      id v27 = [v14 filePath];
      uint64_t v28 = [(ToneSyncClient *)self _relativePathCorrespondingTo:v27 relativeTo:v38];

      if (v28) {
        ((void (*)(void *, void *, void))v8[2])(v8, v28, 0);
      }

      if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v11) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v29 = [(TLToneManager *)self->_toneManager _deviceITunesRingtoneInformationPlist];
    v30 = [(ToneSyncClient *)self _relativePathCorrespondingTo:v29 relativeTo:v38];

    if (v30) {
      ((void (*)(void *, void *, void))v8[2])(v8, v30, 0);
    }

    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      long long v31 = [(TLToneManager *)self->_toneManager _iTunesRingtoneInformationPlist];
      long long v32 = [(ToneSyncClient *)self _relativePathCorrespondingTo:v31 relativeTo:v38];

      if (v32) {
        ((void (*)(void *, void *, void))v8[2])(v8, v32, 0);
      }

      if (!*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        long long v33 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v47 = 138543618;
          long long v48 = self;
          __int16 v49 = 2114;
          v50 = v36;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully completed enumeration of paths for backup of type \"%{public}@\".", v47, 0x16u);
        }
      }
    }
  }

  _Block_object_dispose(buf, 8);
  return 0;
}

- (void)pathsToBackup:(id *)a3 pathsNotToBackup:(id *)a4
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_4800;
  id v22 = sub_4810;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned int v15 = sub_4800;
  uint64_t v16 = sub_4810;
  id v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_4818;
  v11[3] = &unk_8280;
  v11[4] = &v12;
  v11[5] = &v18;
  id v6 = [(ToneSyncClient *)self enumeratePathsForBackupType:0 usingBlock:v11];
  int v7 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v19[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "backing up files: %{public}@", buf, 0xCu);
  }

  if ([(id)v13[5] count])
  {
    __int16 v9 = _ATLogCategorySyncBundle_Oversize();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v13[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Excluding files from backup: %{public}@", buf, 0xCu);
    }
  }
  *a3 = (id) v19[5];
  *a4 = (id) v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

+ (id)_toneSyncPlistFolderPath
{
  id v2 = (void *)CPSharedResourcesDirectory();

  return [v2 stringByAppendingPathComponent:@"Media/iTunes_Control/Ringtones/Sync"];
}

+ (id)_toneSyncAnchorFilePath
{
  id v2 = (void *)CPSharedResourcesDirectory();

  return [v2 stringByAppendingPathComponent:@"Media/iTunes_Control/Ringtones/SyncAnchor.plist"];
}

+ (id)_toneSyncMediaPath
{
  id v2 = (void *)CPSharedResourcesDirectory();

  return [v2 stringByAppendingPathComponent:@"Media"];
}

- (id)_relativePathCorrespondingTo:(id)a3 relativeTo:(id)a4
{
  id v5 = a3;
  id v6 = (char *)[v5 rangeOfString:a4];
  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v5 substringFromIndex:&v6[v7]];
  }

  return v8;
}

+ (id)_syncPlistPaths
{
  id v3 = +[NSMutableArray array];
  long long v4 = +[NSFileManager defaultManager];
  id v5 = [a1 _toneSyncPlistFolderPath];
  id v19 = 0;
  id v6 = [v4 contentsOfDirectoryAtPath:v5 error:&v19];
  id v7 = v19;

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (id i = 0; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPrefix:", @"Sync_", (void)v15)
            && [v13 hasSuffix:@".plist"])
          {
            [v3 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  objc_msgSend(v3, "sortUsingSelector:", "compare:", (void)v15);

  return v3;
}

- (void)_processSyncOperation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"operation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if ([v7 isEqualToString:@"insert_track"])
    {
      id v8 = [v4 objectForKey:@"pid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      if (v10)
      {
        char v32 = 0;
        uint64_t v11 = [(TLToneManager *)self->_toneManager _toneForSyncIdentifier:v10];

        if (!v11)
        {
          uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v10 longLongValue]);
          uint64_t v13 = [(ToneSyncClient *)self _toneMetadataFromSyncOperation:v4 syncIdentifier:v10 valid:&v32];
          if (v32)
          {
            [(TLToneManager *)self->_toneManager _importSyncedToneWithMetadata:v13 fileName:v12];
          }
          else
          {
            uint64_t v14 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Did not receive valid tone metadata", buf, 2u);
            }
          }
        }
      }
    }
    if ([v7 isEqualToString:@"delete_track"])
    {
      long long v15 = [v4 objectForKey:@"pid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v16 = v15;
      }
      else {
        long long v16 = 0;
      }
      id v17 = v16;

      if (v17) {
        [(TLToneManager *)self->_toneManager _removeToneWithSyncIdentifier:v17];
      }
    }
    if ([v7 isEqualToString:@"upload_track"])
    {
      long long v18 = [v4 objectForKey:@"pid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }
      id v20 = v19;

      if (v20)
      {
        v21 = [(TLToneManager *)self->_toneManager _toneForSyncIdentifier:v20];
        id v22 = v21;
        if (v21)
        {
          id v23 = [v21 filePath];
          int v24 = [(id)objc_opt_class() _toneSyncMediaPath];
          uint64_t v25 = [(ToneSyncClient *)self _relativePathCorrespondingTo:v23 relativeTo:v24];

          if (v25)
          {
            __int16 v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v20 longLongValue]);
            id v27 = [v22 name];
            uint64_t v28 = +[ATAsset uploadAssetWithIdentifier:v26 dataclass:@"Ringtone" sourcePath:v25 prettyName:v27];

            if (v28) {
              [(NSMutableArray *)self->_uploadAssets addObject:v28];
            }
          }
          else
          {
            __int16 v26 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v34 = 0;
              _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "Did not upload tone because path was incorrect: %{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v25 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v31 = [v20 longLongValue];
            *(_DWORD *)buf = 134217984;
            id v34 = v31;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Could not find tone for syncIdentifier: %lld", buf, 0xCu);
          }
        }
      }
      else
      {
        id v22 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v29 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v34 = 0;
          __int16 v35 = 2114;
          id v36 = v29;
          id v30 = v29;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Invalid syncIdentifier: %{public}@ (%{public}@)", buf, 0x16u);
        }
      }
    }
  }
}

- (id)_toneMetadataFromSyncOperation:(id)a3 syncIdentifier:(id)a4 valid:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = [v7 objectForKey:@"ringtone_info"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  v55 = v12;
  if (v12)
  {
    uint64_t v13 = [v12 objectForKey:@"guid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;

    BOOL v54 = v15 != 0;
    if (v15) {
      [v9 setObject:v15 forKey:kToneGloballyUniqueIdentifierKey];
    }
    long long v16 = [v12 objectForKey:@"is_purchased"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    if (v18) {
      [v9 setObject:v18 forKey:kTonePurchasedKey];
    }
  }
  else
  {
    BOOL v54 = 0;
  }
  id v19 = [v7 objectForKey:@"item"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;

  if (v21)
  {
    id v22 = [v21 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;

    if (v24) {
      [v9 setObject:v24 forKey:kToneTitleKey];
    }
    id v53 = v8;
    uint64_t v25 = [v21 objectForKey:@"album"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v26 = v25;
    }
    else {
      __int16 v26 = 0;
    }
    id v27 = v26;

    if (v27) {
      [v9 setObject:v27 forKey:kToneAlbumKey];
    }
    uint64_t v28 = objc_msgSend(v21, "objectForKey:", @"artist", a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }
    id v30 = v29;

    if (v30) {
      [v9 setObject:v30 forKey:kToneArtistKey];
    }
    id v31 = [v21 objectForKey:@"genre"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v32 = v31;
    }
    else {
      char v32 = 0;
    }
    id v33 = v32;

    if (v33) {
      [v9 setObject:v33 forKey:kToneGenreKey];
    }
    id v34 = [v21 objectForKey:@"total_time_ms"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v35 = v34;
    }
    else {
      __int16 v35 = 0;
    }
    id v36 = v35;

    if (v36) {
      [v9 setObject:v36 forKey:kToneDurationKey];
    }
    id v37 = [v21 objectForKey:@"is_tone"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v38 = v37;
    }
    else {
      v38 = 0;
    }
    id v39 = v38;

    unsigned int v40 = [v39 BOOLValue];
    if (v40) {
      [v9 setObject:kToneMediaKindAlertTone forKey:kToneMediaKindKey];
    }

    a5 = v52;
    id v8 = v53;
  }
  [v9 setObject:v8 forKey:kToneSyncIdentifierKey];
  long long v41 = [v7 objectForKey:@"store_info"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v42 = v41;
  }
  else {
    long long v42 = 0;
  }
  id v43 = v42;

  if (v43)
  {
    id v44 = [v43 objectForKey:@"store_item_id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v45 = v44;
    }
    else {
      id v45 = 0;
    }
    id v46 = v45;

    if (v46) {
      [v9 setObject:v46 forKey:kToneStoreItemIdentifierKey];
    }
    long long v47 = [v43 objectForKey:@"storefront_id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v48 = v47;
    }
    else {
      long long v48 = 0;
    }
    id v49 = v48;

    v50 = [v49 stringValue];

    if (v50) {
      [v9 setObject:v50 forKey:kToneStoreFrontIdentifierKey];
    }
  }
  if (a5) {
    *a5 = v54;
  }

  return v9;
}

- (void)_removeSyncPlists
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [(id)objc_opt_class() _syncPlistPaths];
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (id i = 0; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [(id)objc_opt_class() _toneSyncPlistFolderPath];
        id v9 = [v8 stringByAppendingPathComponent:v7];

        id v10 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v21 = v9;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Removing sync plist at %{public}@", buf, 0xCu);
        }

        uint64_t v11 = +[NSFileManager defaultManager];
        id v15 = 0;
        unsigned __int8 v12 = [v11 removeItemAtPath:v9 error:&v15];
        id v13 = v15;

        if ((v12 & 1) == 0)
        {
          uint64_t v14 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v21 = v9;
            __int16 v22 = 2114;
            id v23 = v13;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Unable to remove sync plist at %{public}@: %{public}@", buf, 0x16u);
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v4);
  }
}

- (void)_writeSyncAnchor:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    CFStringRef v9 = @"syncAnchor";
    id v10 = v3;
    id v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v5 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Writing sync anchor: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [(id)objc_opt_class() _toneSyncAnchorFilePath];
    [v4 writeToFile:v6 atomically:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadAssets, 0);

  objc_storeStrong((id *)&self->_toneManager, 0);
}

@end