@interface PLIndicatorFileCoordinator
+ (BOOL)systemLibraryAvailableIndicatorState;
+ (void)setSystemLibraryAvailableIndicatorState:(BOOL)a3;
- (BOOL)_canSetPauseMarkerWithUnpauseTime:(id)a3 onPauseData:(id)a4;
- (BOOL)clearPauseMarkerForReason:(signed __int16)a3;
- (BOOL)hasItemToDownload;
- (BOOL)isDisableICloudPhotos;
- (BOOL)isEnableICloudPhotos;
- (BOOL)isForceSoftResetSync;
- (BOOL)isICloudPhotosPaused;
- (BOOL)isRebuildingPersons;
- (BOOL)isRebuildingSocialGroups;
- (BOOL)isStreamsLibraryUpdatingExpired;
- (BOOL)isUserPause;
- (BOOL)isWipeCPLOnOpen;
- (BOOL)needsRecoveryAfterCrashOptionallyRemoveAllIndicatorFiles:(BOOL)a3;
- (PLIndicatorFileCoordinator)initWithPathManager:(id)a3;
- (PLIndicatorFileCoordinator)initWithResourceHoldingDirectoryPath:(id)a3;
- (id)_pauseDataOnPath:(id)a3;
- (id)_readPListWithFilename:(id)a3;
- (id)_rebuildingPersonsIndicatorFilePath;
- (id)_rebuildingSocialGroupsIndicatorFilePath;
- (id)unpauseTime;
- (signed)currentPauseReason;
- (void)_createPauseMarkerForReason:(signed __int16)a3 withUnpauseTime:(id)a4 withPath:(id)a5;
- (void)_setActivityIndicatorWithPath:(id)a3 flag:(BOOL)a4 crashRecovery:(id)a5;
- (void)_writeDict:(id)a3 withFilename:(id)a4;
- (void)clearWipeCPLOnOpen;
- (void)createPauseMarkerWithUnpauseTime:(id)a3 reason:(signed __int16)a4;
- (void)dealloc;
- (void)deleteCPLDownloadFinishedMarkerFilePath;
- (void)forceSoftResetSync;
- (void)getDownloadPhotoCount:(unint64_t *)a3 downloadVideoCount:(unint64_t *)a4;
- (void)logCloudServiceEnableEvent:(BOOL)a3 serviceName:(id)a4 reason:(id)a5;
- (void)setCreatingAssetIsBusy:(BOOL)a3;
- (void)setDownloadCountsForImages:(unint64_t)a3 videos:(unint64_t)a4;
- (void)setImageWriter:(id)a3 isBusy:(BOOL)a4 crashRecoverySupport:(id)a5;
- (void)setIsRebuildingPersons:(BOOL)a3;
- (void)setIsRebuildingSocialGroups:(BOOL)a3;
- (void)setStreamsLibraryUpdatingExpired:(BOOL)a3;
- (void)setTakingPhotoIsBusy:(BOOL)a3;
- (void)setWipeCPLOnOpen;
- (void)updateICloudPhotosMarkerForEnable:(BOOL)a3;
- (void)writeDisableICloudPhotosMarker;
- (void)writeEnableICloudPhotosMarker;
@end

@implementation PLIndicatorFileCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceHoldingDirectoryPath, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

- (void)logCloudServiceEnableEvent:(BOOL)a3 serviceName:(id)a4 reason:(id)a5
{
  BOOL v6 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(PLPhotoLibraryPathManager *)self->_pathManager cloudServiceEnableLogFileURL];
  id v28 = 0;
  v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10 options:0 error:&v28];
  id v12 = v28;
  if (!v11)
  {
    if (!PLIsErrorFileNotFound())
    {
      v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        BOOL v30 = v6;
        __int16 v31 = 2114;
        id v32 = v8;
        __int16 v33 = 2112;
        v34 = v10;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v12;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Couldn't read enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
      }
      id v15 = 0;
      v21 = 0;
      goto LABEL_28;
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v15) {
      goto LABEL_29;
    }
LABEL_17:
    v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = [NSNumber numberWithBool:v6];
    [v18 setObject:v19 forKeyedSubscript:@"enabled"];

    [v18 setObject:v8 forKeyedSubscript:@"type"];
    [v18 setObject:v9 forKeyedSubscript:@"reason"];
    v20 = [MEMORY[0x1E4F1C9C8] date];
    [v18 setObject:v20 forKeyedSubscript:@"timestamp"];

    [v15 addObject:v18];
    id v26 = 0;
    v21 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v15 format:200 options:0 error:&v26];
    id v22 = v26;

    if (v21)
    {
      id v25 = v22;
      char v23 = [v21 writeToURL:v10 options:0 error:&v25];
      id v12 = v25;

      if (v23)
      {
LABEL_28:

        v11 = v21;
        goto LABEL_29;
      }
      v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        BOOL v30 = v6;
        __int16 v31 = 2114;
        id v32 = v8;
        __int16 v33 = 2112;
        v34 = v10;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v12;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Couldn't write enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
      }
      id v22 = v12;
    }
    else
    {
      v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        BOOL v30 = v6;
        __int16 v31 = 2114;
        id v32 = v8;
        __int16 v33 = 2112;
        v34 = v10;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v22;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Couldn't encode enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
      }
    }

    id v12 = v22;
    goto LABEL_28;
  }
  id v27 = 0;
  v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v27];
  id v14 = v27;

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [v13 mutableCopy];

      goto LABEL_14;
    }
    v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 67109890;
      BOOL v30 = v6;
      __int16 v31 = 2114;
      id v32 = v8;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2114;
      uint64_t v36 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Couldn't decode enable event log, enabled: %d, type: %{public}@ path: %@, error: unexpected type: %{public}@", buf, 0x26u);
    }
  }
  else
  {
    v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      BOOL v30 = v6;
      __int16 v31 = 2114;
      id v32 = v8;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Couldn't decode enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
    }
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
LABEL_14:
  if ((unint64_t)[v15 count] >= 0x64) {
    objc_msgSend(v15, "removeObjectsInRange:", 0, 50);
  }
  id v12 = v14;
  if (v15) {
    goto LABEL_17;
  }
LABEL_29:
}

- (BOOL)isRebuildingSocialGroups
{
  v2 = [(PLIndicatorFileCoordinator *)self _rebuildingSocialGroupsIndicatorFilePath];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)setIsRebuildingSocialGroups:(BOOL)a3
{
  id v3 = [(PLIndicatorFileCoordinator *)self _rebuildingSocialGroupsIndicatorFilePath];
  PLMakeIndicatorFileExistAtPath();
}

- (id)_rebuildingSocialGroupsIndicatorFilePath
{
  v2 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:6];
  id v3 = [v2 stringByAppendingPathComponent:@"rebuildingsocialgroups"];

  return v3;
}

- (BOOL)isRebuildingPersons
{
  v2 = [(PLIndicatorFileCoordinator *)self _rebuildingPersonsIndicatorFilePath];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)setIsRebuildingPersons:(BOOL)a3
{
  id v3 = [(PLIndicatorFileCoordinator *)self _rebuildingPersonsIndicatorFilePath];
  PLMakeIndicatorFileExistAtPath();
}

- (id)_rebuildingPersonsIndicatorFilePath
{
  v2 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:6];
  id v3 = [v2 stringByAppendingPathComponent:@"rebuildingpersons"];

  return v3;
}

- (BOOL)isStreamsLibraryUpdatingExpired
{
  v2 = [(PLPhotoLibraryPathManager *)self->_pathManager privateCacheDirectoryWithSubType:9];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)setStreamsLibraryUpdatingExpired:(BOOL)a3
{
  id v3 = [(PLPhotoLibraryPathManager *)self->_pathManager privateCacheDirectoryWithSubType:9];
  PLMakeIndicatorFileExistAtPath();
}

- (void)setDownloadCountsForImages:(unint64_t)a3 videos:(unint64_t)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PLIndicatorFileCoordinator.m" lineNumber:464 description:@"Must be run in assetsd"];
  }
  v12[0] = @"CountKeyImages";
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  v12[1] = @"CountKeyVideos";
  v13[0] = v8;
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  [(PLIndicatorFileCoordinator *)self _writeDict:v10 withFilename:@"DownloadCounts.plist"];
}

- (void)getDownloadPhotoCount:(unint64_t *)a3 downloadVideoCount:(unint64_t *)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLIndicatorFileCoordinator.m", 454, @"Invalid parameter not satisfying: %@", @"downloadPhotoCount" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PLIndicatorFileCoordinator.m", 455, @"Invalid parameter not satisfying: %@", @"downloadVideoCount" object file lineNumber description];

LABEL_3:
  id v12 = [(PLIndicatorFileCoordinator *)self _readPListWithFilename:@"DownloadCounts.plist"];
  id v8 = [v12 objectForKeyedSubscript:@"CountKeyImages"];
  *a3 = [v8 unsignedIntegerValue];

  id v9 = [v12 objectForKeyedSubscript:@"CountKeyVideos"];
  *a4 = [v9 unsignedIntegerValue];
}

- (BOOL)hasItemToDownload
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLIndicatorFileCoordinator.m" lineNumber:445 description:@"Must be run in assetsd"];
  }
  v4 = [(PLIndicatorFileCoordinator *)self _readPListWithFilename:@"DownloadCounts.plist"];
  v5 = [v4 objectForKeyedSubscript:@"CountKeyImages"];
  if ([v5 unsignedIntegerValue])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v4 objectForKeyedSubscript:@"CountKeyVideos"];
    BOOL v6 = [v7 unsignedIntegerValue] != 0;
  }
  return v6;
}

- (void)_writeDict:(id)a3 withFilename:(id)a4
{
  pathManager = self->_pathManager;
  id v6 = a4;
  id v7 = a3;
  id v11 = [(PLPhotoLibraryPathManager *)pathManager cplDataDirectoryCreateIfNeeded:1];
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = [v11 stringByAppendingPathComponent:v6];

  v10 = [v8 fileURLWithPath:v9 isDirectory:0];

  [v7 writeToURL:v10 atomically:1];
}

- (id)_readPListWithFilename:(id)a3
{
  pathManager = self->_pathManager;
  id v4 = a3;
  v5 = [(PLPhotoLibraryPathManager *)pathManager cplDataDirectoryCreateIfNeeded:0];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v6];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v6];

    id v7 = (void *)v10;
  }

  return v7;
}

- (void)clearWipeCPLOnOpen
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager wipeCPLOnOpenPath];
  PLMakeIndicatorFileExistAtPath();
}

- (void)setWipeCPLOnOpen
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager wipeCPLOnOpenPath];
  PLMakeIndicatorFileExistAtPath();
}

- (BOOL)isWipeCPLOnOpen
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager wipeCPLOnOpenPath];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)forceSoftResetSync
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager forceSoftResetSyncPath];
  PLMakeIndicatorFileExistAtPath();
}

- (BOOL)isForceSoftResetSync
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager forceSoftResetSyncPath];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (BOOL)isUserPause
{
  return [(PLIndicatorFileCoordinator *)self currentPauseReason] == 3;
}

- (signed)currentPauseReason
{
  if (![(PLIndicatorFileCoordinator *)self isICloudPhotosPaused]) {
    return 0;
  }
  char v3 = [(PLPhotoLibraryPathManager *)self->_pathManager pauseICloudPhotosFilePath];
  id v4 = [(PLIndicatorFileCoordinator *)self _pauseDataOnPath:v3];
  v5 = [v4 objectForKey:@"reason"];
  signed __int16 v6 = [v5 intValue];

  return v6;
}

- (id)unpauseTime
{
  if ([(PLIndicatorFileCoordinator *)self isICloudPhotosPaused])
  {
    char v3 = [(PLPhotoLibraryPathManager *)self->_pathManager pauseICloudPhotosFilePath];
    id v4 = [(PLIndicatorFileCoordinator *)self _pauseDataOnPath:v3];
    v5 = [v4 objectForKey:@"unpauseTime"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_pauseDataOnPath:(id)a3
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:a3];
}

- (void)createPauseMarkerWithUnpauseTime:(id)a3 reason:(signed __int16)a4
{
  uint64_t v4 = a4;
  pathManager = self->_pathManager;
  id v7 = a3;
  id v8 = [(PLPhotoLibraryPathManager *)pathManager pauseICloudPhotosFilePath];
  [(PLIndicatorFileCoordinator *)self _createPauseMarkerForReason:v4 withUnpauseTime:v7 withPath:v8];
}

- (void)_createPauseMarkerForReason:(signed __int16)a3 withUnpauseTime:(id)a4 withPath:(id)a5
{
  uint64_t v6 = a3;
  id v15 = a4;
  id v8 = a5;
  int v9 = [(PLIndicatorFileCoordinator *)self _pauseDataOnPath:v8];
  id v10 = (id)[v9 mutableCopy];

  if (v10)
  {
    if (![(PLIndicatorFileCoordinator *)self _canSetPauseMarkerWithUnpauseTime:v15 onPauseData:v10])goto LABEL_8; {
  }
    }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v10 setObject:v15 forKey:@"unpauseTime"];
  id v11 = [NSNumber numberWithShort:v6];
  [v10 setObject:v11 forKey:@"reason"];

  id v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:100 options:0 error:0];
  [v12 writeToFile:v8 options:1073741825 error:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v14 = &PhotoLibraryUserPauseNotification;
  if (v6 != 3) {
    id v14 = &PhotoLibraryPauseNotification;
  }
  CFNotificationCenterPostNotification(DarwinNotifyCenter, *v14, 0, 0, 0);

LABEL_8:
}

- (BOOL)_canSetPauseMarkerWithUnpauseTime:(id)a3 onPauseData:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [a4 objectForKey:@"unpauseTime"];
    id v7 = v6;
    if (v6) {
      BOOL v8 = [v6 compare:v5] == -1;
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)clearPauseMarkerForReason:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLPhotoLibraryPathManager *)self->_pathManager pauseICloudPhotosFilePath];
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    if (v3 == 3 || ![(PLIndicatorFileCoordinator *)self isUserPause])
    {
      id v11 = 0;
      [v6 removeItemAtPath:v5 error:&v11];
      id v8 = v11;
      BOOL v7 = v8 == 0;
      if (v8)
      {
        int v9 = PLBackendGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v8;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to remove pauseMarker file %@", buf, 0xCu);
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)updateICloudPhotosMarkerForEnable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(PLIndicatorFileCoordinator *)self isForceSoftResetSync])
  {
    id v5 = [(PLPhotoLibraryPathManager *)self->_pathManager forceSoftResetSyncPath];
    PLMakeIndicatorFileExistAtPath();
  }
  if ([(PLIndicatorFileCoordinator *)self isEnableICloudPhotos])
  {
    uint64_t v6 = [(PLPhotoLibraryPathManager *)self->_pathManager enableICloudPhotosFilePath];
    PLMakeIndicatorFileExistAtPath();
  }
  if ([(PLIndicatorFileCoordinator *)self isDisableICloudPhotos])
  {
    BOOL v7 = [(PLPhotoLibraryPathManager *)self->_pathManager disableICloudPhotosFilePath];
    PLMakeIndicatorFileExistAtPath();
  }
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [(PLPhotoLibraryPathManager *)self->_pathManager cplEnableMarkerFilePath];
  int v10 = [v8 fileExistsAtPath:v9];
  char v11 = v10;
  if (v3)
  {
    id v12 = PLBackendGetLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v9;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%@ already exist", buf, 0xCu);
      }
      goto LABEL_25;
    }
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v9;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "writing %@", buf, 0xCu);
    }

    id v12 = [MEMORY[0x1E4F1C9C8] date];
    v16 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v16 setDateFormat:@"yyyy-MM-dd HH.mm.ss.SSS"];
    uint64_t v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v16 setLocale:v17];

    v18 = [v16 stringFromDate:v12];
    id v23 = 0;
    char v19 = [v18 writeToFile:v9 atomically:1 encoding:4 error:&v23];
    v20 = v23;

    if ((v19 & 1) == 0)
    {
      v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v20;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "failed to write %@: %@", buf, 0x16u);
      }
    }
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  if (v10)
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v9;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "removing %@", buf, 0xCu);
    }

    id v22 = 0;
    char v15 = [v8 removeItemAtPath:v9 error:&v22];
    id v12 = v22;
    if (v15) {
      goto LABEL_25;
    }
    v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "failed to remove %@: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
LABEL_26:
}

- (void)writeEnableICloudPhotosMarker
{
  BOOL v3 = [(PLPhotoLibraryPathManager *)self->_pathManager enableICloudPhotosFilePath];
  PLMakeIndicatorFileExistAtPath();
  if ([(PLIndicatorFileCoordinator *)self isDisableICloudPhotos])
  {
    uint64_t v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Found disable marker when enabling iCPL", v5, 2u);
    }
  }
  [(PLIndicatorFileCoordinator *)self deleteCPLDownloadFinishedMarkerFilePath];
}

- (void)writeDisableICloudPhotosMarker
{
  BOOL v3 = [(PLPhotoLibraryPathManager *)self->_pathManager disableICloudPhotosFilePath];
  PLMakeIndicatorFileExistAtPath();
  if ([(PLIndicatorFileCoordinator *)self isEnableICloudPhotos])
  {
    uint64_t v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Removing stale enable marker as we are disabling iCPL", v6, 2u);
    }

    id v5 = [(PLPhotoLibraryPathManager *)self->_pathManager enableICloudPhotosFilePath];
    PLMakeIndicatorFileExistAtPath();
  }
}

- (void)deleteCPLDownloadFinishedMarkerFilePath
{
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v3 = [(PLPhotoLibraryPathManager *)self->_pathManager cplDownloadFinishedMarkerFilePath];
  if ([v4 fileExistsAtPath:v3]) {
    PLMakeIndicatorFileExistAtPath();
  }
}

- (BOOL)isICloudPhotosPaused
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager pauseICloudPhotosFilePath];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (BOOL)isDisableICloudPhotos
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager disableICloudPhotosFilePath];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (BOOL)isEnableICloudPhotos
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager enableICloudPhotosFilePath];
  char v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (BOOL)needsRecoveryAfterCrashOptionallyRemoveAllIndicatorFiles:(BOOL)a3
{
  BOOL v3 = a3;
  v27[3] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F8B840] takingVideoIndicatorFilePath];
  v27[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F8B840] takingPhotoIndicatorFilePath];
  v27[1] = v6;
  BOOL v7 = [(PLPhotoLibraryPathManager *)self->_pathManager privateDirectoryWithSubType:1];
  v27[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        int v16 = open((const char *)[v15 fileSystemRepresentation], 36);
        if ((v16 & 0x80000000) == 0)
        {
          int v17 = v16;
          v18 = PLAssetImportGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v15;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Photo library needs recovery after crash because of indicator file %@", buf, 0xCu);
          }

          if (!v3)
          {
            close(v17);
            char v12 = 1;
            goto LABEL_16;
          }
          unlink((const char *)[v15 fileSystemRepresentation]);
          close(v17);
          char v12 = 1;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v12 = 0;
  }
LABEL_16:

  return v12 & 1;
}

- (void)setImageWriter:(id)a3 isBusy:(BOOL)a4 crashRecoverySupport:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PLIndicatorFileCoordinator.m" lineNumber:152 description:@"only called by assetsd"];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLIndicatorFileCoordinator.m", 153, @"Invalid parameter not satisfying: %@", @"imageWriter" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = [(PLPhotoLibraryPathManager *)self->_pathManager privateDirectoryWithSubType:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PLIndicatorFileCoordinator_setImageWriter_isBusy_crashRecoverySupport___block_invoke;
  v16[3] = &unk_1E5875E18;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  [(PLIndicatorFileCoordinator *)self _setActivityIndicatorWithPath:v11 flag:v6 crashRecovery:v16];
}

uint64_t __73__PLIndicatorFileCoordinator_setImageWriter_isBusy_crashRecoverySupport___block_invoke(uint64_t a1)
{
  id v2 = PLAssetImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Initiating crash recovery if needed", v4, 2u);
  }

  return [*(id *)(a1 + 32) recoverFromCrashIfNeededWithImageWriter:*(void *)(a1 + 40)];
}

- (void)setCreatingAssetIsBusy:(BOOL)a3
{
  BOOL v3 = a3;
  resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
  if (resourceHoldingDirectoryPath)
  {
    uint64_t v6 = [(NSString *)resourceHoldingDirectoryPath stringByAppendingPathComponent:@"creatingasset"];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(PLIndicatorFileCoordinator *)self _setActivityIndicatorWithPath:v6 flag:v3 crashRecovery:&__block_literal_global_41673];
}

- (void)setTakingPhotoIsBusy:(BOOL)a3
{
  BOOL v3 = a3;
  if (PLIsAssetsd())
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLIndicatorFileCoordinator.m" lineNumber:129 description:@"only called by processes that is not assetsd"];
  }
  uint64_t v6 = [MEMORY[0x1E4F8B840] takingPhotoIndicatorFilePath];
  id v7 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PLIndicatorFileCoordinator_setTakingPhotoIsBusy___block_invoke;
  v10[3] = &unk_1E5875CE0;
  id v11 = v7;
  id v8 = v7;
  [(PLIndicatorFileCoordinator *)self _setActivityIndicatorWithPath:v6 flag:v3 crashRecovery:v10];
}

void __51__PLIndicatorFileCoordinator_setTakingPhotoIsBusy___block_invoke(uint64_t a1)
{
  id v2 = PLAssetImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Sending crash recovery request to assetsd", v5, 2u);
  }

  BOOL v3 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:*(void *)(a1 + 32)];
  id v4 = [v3 libraryClient];
  [v4 recoverFromCrashIfNeeded];
}

- (void)_setActivityIndicatorWithPath:(id)a3 flag:(BOOL)a4 crashRecovery:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  PLSafeRunWithUnfairLock();
}

void __79__PLIndicatorFileCoordinator__setActivityIndicatorWithPath_flag_crashRecovery___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
  if (!*(unsigned char *)(a1 + 56))
  {
    if ((v2 & 0x80000000) == 0)
    {
      unlink((const char *)[*(id *)(a1 + 40) fileSystemRepresentation]);
      close(*(_DWORD *)(*(void *)(a1 + 32) + 16));
      *(_DWORD *)(*(void *)(a1 + 32) + 16) = -1;
      return;
    }
    BOOL v3 = PLAssetImportGetLog();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    id v10 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    id v5 = "%@ activity indicator already cleared";
    goto LABEL_13;
  }
  if ((v2 & 0x80000000) == 0)
  {
    BOOL v3 = PLAssetImportGetLog();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      return;
    }
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    id v5 = "%@ activity indicator already set";
LABEL_13:
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
    goto LABEL_14;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = open((const char *)[*(id *)(a1 + 40) fileSystemRepresentation], 2721, 438);
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 16) & 0x80000000) == 0)
  {
    char value = -1;
    int v6 = setxattr((const char *)[*(id *)(a1 + 40) UTF8String], "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
    if ((v6 & 0x80000000) == 0) {
      return;
    }
    int v7 = v6;
    BOOL v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v8 = [MEMORY[0x1E4F8B908] redactedDescriptionForPath:*(void *)(a1 + 40)];
      id v9 = strerror(v7);
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      __int16 v25 = 2082;
      __int16 v26 = v9;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Failed to set extended attributes on path: %@ with error: %{public}s", buf, 0x16u);
    }
    goto LABEL_14;
  }
  id v11 = PLAssetImportGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = *(void **)(a1 + 40);
    id v13 = __error();
    uint64_t v14 = strerror(*v13);
    int v15 = *__error();
    *(_DWORD *)buf = 138412802;
    v24 = v12;
    __int16 v25 = 2080;
    __int16 v26 = v14;
    __int16 v27 = 1024;
    int v28 = v15;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%@ activity indicator couldn't be set: %s (%d). Recovering...", buf, 0x1Cu);
  }

  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 16) & 0x80000000) != 0)
  {
    int v17 = 1;
    do
    {
      id v18 = PLAssetImportGetLog();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      if (v17 >= 121)
      {
        if (v19)
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = 120;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to create activity indicator file after %d attempts.  Giving up.", buf, 8u);
        }

        id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Too many failed attempts to create activity indicator file" userInfo:0];
        objc_exception_throw(v21);
      }
      if (v19)
      {
        long long v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        __int16 v25 = 1024;
        LODWORD(v26) = v17;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Will retry creating activity indicator after delay %@ [%d]", buf, 0x12u);
        ++v17;
      }

      sleep(1u);
      *(_DWORD *)(*(void *)(a1 + 32) + 16) = open((const char *)[*(id *)(a1 + 40) fileSystemRepresentation], 2721, 438);
    }
    while ((*(_DWORD *)(*(void *)(a1 + 32) + 16) & 0x80000000) != 0);
  }
}

- (void)dealloc
{
  int activityIndicatorFid = self->_activityIndicatorFid;
  if (activityIndicatorFid != -1)
  {
    close(activityIndicatorFid);
    self->_int activityIndicatorFid = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PLIndicatorFileCoordinator;
  [(PLIndicatorFileCoordinator *)&v4 dealloc];
}

- (PLIndicatorFileCoordinator)initWithResourceHoldingDirectoryPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLIndicatorFileCoordinator;
  int v6 = [(PLIndicatorFileCoordinator *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    *(void *)&v6->_int activityIndicatorFid = 0xFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_resourceHoldingDirectoryPath, a3);
  }

  return v7;
}

- (PLIndicatorFileCoordinator)initWithPathManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLIndicatorFileCoordinator;
  int v6 = [(PLIndicatorFileCoordinator *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathManager, a3);
    *(void *)&v7->_int activityIndicatorFid = 0xFFFFFFFFLL;
  }

  return v7;
}

+ (BOOL)systemLibraryAvailableIndicatorState
{
  int v2 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  BOOL v3 = [v2 privateCacheDirectoryWithSubType:8];

  LOBYTE(v2) = PLDoesIndicatorFileExistAtPath();
  return (char)v2;
}

+ (void)setSystemLibraryAvailableIndicatorState:(BOOL)a3
{
  BOOL v3 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v4 = [v3 privateCacheDirectoryWithSubType:8];

  PLMakeIndicatorFileExistAtPath();
}

@end