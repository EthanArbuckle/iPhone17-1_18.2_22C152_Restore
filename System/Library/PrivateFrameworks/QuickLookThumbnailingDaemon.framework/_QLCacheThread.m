@interface _QLCacheThread
+ (int64_t)defaultCacheSize;
- (BOOL)_shouldQuitCleanUpDatabaseModeForMode:(unint64_t)a3;
- (BOOL)_shouldQuitClosedModeForMode:(unint64_t)a3;
- (BOOL)_shouldQuitLowSpaceModeForMode:(unint64_t)a3;
- (BOOL)_shouldQuitPauseModeForMode:(unint64_t)a3;
- (BOOL)_shouldQuitResetingModeForMode:(unint64_t)a3;
- (BOOL)_shouldQuitWorkingModeForMode:(unint64_t)a3;
- (BOOL)addNoThumbnailIntoCache:(id)a3;
- (BOOL)addThumbnailIntoCache:(id)a3 bitmapFormat:(id)a4 bitmapData:(id)a5 metadata:(id)a6 flavor:(int)a7 contentRect:(CGRect)a8 badgeType:(unint64_t)a9 externalGeneratorDataHash:(unint64_t)a10;
- (BOOL)addThumbnailRequest:(id)a3;
- (BOOL)isCacheOpened;
- (BOOL)isIdle;
- (BOOL)itemIsMissingRemoteThumbnail:(id)a3;
- (BOOL)locked_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3;
- (BOOL)locked_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3;
- (BOOL)lowDiskSpace;
- (BOOL)serverThreadIsIdle;
- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3;
- (BOOL)shouldRemoveThumbnailsForDeletedFiles;
- (BOOL)waitingForCleanup;
- (NSLock)modeLock;
- (NSOperationQueue)diskCacheQueryOperationQueue;
- (NSString)modeDescription;
- (NSURL)diskCacheURL;
- (OS_dispatch_queue)lowDiskSpaceSourceQueue;
- (OS_dispatch_source)lowDiskSpaceSource;
- (QLCacheCleanUpDatabaseThread)cleanUpDatabaseThread;
- (QLDiskCache)diskCache;
- (QLDiskCacheQueryOperation)currentDiskCacheQueryOperation;
- (QLMemoryCache)memoryCache;
- (QLServerThread)serverThread;
- (_QLCacheThread)initWithServerThread:(id)a3 cacheSize:(int64_t)a4 location:(id)a5;
- (id)_allThumbnailsEnumerateWithEnumerator:(id)a3;
- (id)allThumbnailsForFPItemID:(id)a3;
- (id)allThumbnailsForFileIdentifier:(id)a3;
- (id)allThumbnailsForIno:(unint64_t)a3 fsid:(fsid)a4;
- (id)allThumbnailsInfo;
- (id)cacheInfo;
- (id)contentDescriptionForURL:(__CFURL *)a3;
- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3;
- (int64_t)purgeOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5;
- (int64_t)purgeableSpaceOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5;
- (unint64_t)currentMode;
- (unint64_t)hitCount;
- (unint64_t)hitToSaveCount;
- (unint64_t)missedCount;
- (unint64_t)thumbnailInMemoryToSaveCount;
- (void)_addThumbnailRequestIntoDiskCacheQueryQueue:(id)a3;
- (void)_cleanUpDatabaseDone;
- (void)_destroyDrainTimer;
- (void)_dispatchThumbnailRequestInServerThread:(id)a3;
- (void)_drainPendingBlocks;
- (void)_drainPendingBlocksNow;
- (void)_registerMachPortForLowDiskSpaceNotification;
- (void)_scheduleBlockDrain;
- (void)_scheduledDrainPendingBlocks;
- (void)_sendThumbnailData:(id)a3 forThumbnailRequest:(id)a4;
- (void)_setLowDiskSpace:(BOOL)a3;
- (void)_setMode:(unint64_t)a3;
- (void)_thumbnailHasBeenCancelled:(id)a3;
- (void)_unregisterMachPortForLowDiskSpaceNotification;
- (void)_unscheduleBlockDrain;
- (void)_updateLowDisk;
- (void)_updateMode;
- (void)_waitForEndOfDatabaseCleanup;
- (void)_willStartCleanUpDatabaseModeFromMode:(unint64_t)a3;
- (void)_willStartClosedModeFromMode:(unint64_t)a3;
- (void)_willStartResetingModeFromMode:(unint64_t)a3;
- (void)closeCache;
- (void)databaseCorruptionDetected;
- (void)enqueueWriting:(id)a3;
- (void)forceCommit;
- (void)forceCommitAndClose;
- (void)noteRemoteThumbnailMissingForItems:(id)a3;
- (void)noteRemoteThumbnailPresentForItems:(id)a3;
- (void)openCache;
- (void)prepareToExit;
- (void)reset;
- (void)serverIsIdle;
- (void)serverIsWorking;
- (void)setCleanUpDatabaseThread:(id)a3;
- (void)setCurrentDiskCacheQueryOperation:(id)a3;
- (void)setDiskCacheQueryOperationQueue:(id)a3;
- (void)setDiskCacheURL:(id)a3;
- (void)setHitCount:(unint64_t)a3;
- (void)setLowDiskSpaceSource:(id)a3;
- (void)setLowDiskSpaceSourceQueue:(id)a3;
- (void)setMissedCount:(unint64_t)a3;
- (void)setModeLock:(id)a3;
- (void)setServerThread:(id)a3;
- (void)setServerThreadIsIdle:(BOOL)a3;
- (void)setShouldRemoveThumbnailsForDeletedFiles:(BOOL)a3;
- (void)setWaitingForCleanup:(BOOL)a3;
- (void)startWriting;
- (void)stopWriting;
- (void)updateMode;
@end

@implementation _QLCacheThread

- (BOOL)addThumbnailRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  v5 = _log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_QLCacheThread addThumbnailRequest:]();
  }

  [(NSLock *)self->_modeLock lock];
  v6 = _log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_QLCacheThread addThumbnailRequest:]();
  }

  if (self->_currentMode > 3 || self->_lowDiskSpace)
  {
    _log_3();
    v7 = (QLMemoryCacheQueryOperation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      unint64_t currentMode = self->_currentMode;
      if (currentMode > 5) {
        v9 = @"unknown mode";
      }
      else {
        v9 = off_1E6D0D3E8[currentMode];
      }
      int v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1DDC5E000, &v7->super.super, OS_LOG_TYPE_INFO, "database is not open (mode: %@), or low disk", (uint8_t *)&v14, 0xCu);
    }
    BOOL v10 = 0;
  }
  else
  {
    v13 = _log_3();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1DDC5E000, v13, OS_LOG_TYPE_INFO, "Trying memory cache for %@", (uint8_t *)&v14, 0xCu);
    }

    v7 = [[QLMemoryCacheQueryOperation alloc] initWithThumbnailRequest:v4 cacheThread:self];
    [(NSOperationQueue *)self->_memoryCacheQueryOperationQueue addOperation:v7];
    [(_QLCacheThread *)self _updateMode];
    BOOL v10 = 1;
  }

  [(NSLock *)self->_modeLock unlock];
  v11 = _log_3();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_QLCacheThread addThumbnailRequest:]();
  }

  return v10;
}

- (void)_updateMode
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "update mode", v2, v3, v4, v5, v6);
}

- (void)_setMode:(unint64_t)a3
{
  p_unint64_t currentMode = &self->_currentMode;
  if (self->_currentMode != a3)
  {
    uint8_t v6 = _log_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_QLCacheThread _setMode:].cold.4();
    }

    switch(*p_currentMode)
    {
      case 0uLL:
        if ([(_QLCacheThread *)self _shouldQuitWorkingModeForMode:a3]) {
          goto LABEL_10;
        }
        goto LABEL_19;
      case 1uLL:
        if (![(_QLCacheThread *)self _shouldQuitLowSpaceModeForMode:a3]) {
          goto LABEL_19;
        }
        goto LABEL_10;
      case 2uLL:
        if ([(_QLCacheThread *)self _shouldQuitCleanUpDatabaseModeForMode:a3])
        {
          goto LABEL_10;
        }
        goto LABEL_19;
      case 3uLL:
        if (![(_QLCacheThread *)self _shouldQuitPauseModeForMode:a3]) {
          goto LABEL_19;
        }
        goto LABEL_10;
      case 4uLL:
        if (![(_QLCacheThread *)self _shouldQuitClosedModeForMode:a3]) {
          goto LABEL_19;
        }
        goto LABEL_10;
      case 5uLL:
        if ([(_QLCacheThread *)self _shouldQuitResetingModeForMode:a3])
        {
LABEL_10:
          unint64_t v7 = *p_currentMode;
          *p_unint64_t currentMode = a3;
          v8 = _log_3();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            -[_QLCacheThread _setMode:]();
          }

          switch(*p_currentMode)
          {
            case 0uLL:
              [(_QLCacheThread *)self _willStartWorkingModeFromMode:v7];
              break;
            case 1uLL:
              [(_QLCacheThread *)self _willStartLowSpaceModeFromMode:v7];
              break;
            case 2uLL:
              [(_QLCacheThread *)self _willStartCleanUpDatabaseModeFromMode:v7];
              break;
            case 3uLL:
              [(_QLCacheThread *)self _willStartPauseModeFromMode:v7];
              break;
            case 4uLL:
              [(_QLCacheThread *)self _willStartClosedModeFromMode:v7];
              break;
            case 5uLL:
              [(_QLCacheThread *)self _willStartResetingModeFromMode:v7];
              if ([(QLDiskCache *)self->_diskCache isOpened]) {
                *p_unint64_t currentMode = v7;
              }
              break;
            default:
              break;
          }
        }
        else
        {
LABEL_19:
          v9 = _log_3();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            -[_QLCacheThread _setMode:]();
          }
        }
        BOOL v10 = _log_3();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[_QLCacheThread _setMode:]();
        }

        break;
      default:
        return;
    }
  }
}

- (BOOL)_shouldQuitWorkingModeForMode:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v5 = [(NSOperationQueue *)self->_diskCacheQueryOperationQueue operations];
    if ([v5 count])
    {
      BOOL v6 = 0;
    }
    else
    {
      unint64_t v7 = [(NSOperationQueue *)self->_memoryCacheQueryOperationQueue operations];
      BOOL v6 = [v7 count] == 0;
    }
    v8 = _log_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t currentMode = self->_currentMode;
      v13 = @"unknown mode";
      int v14 = @"unknown mode";
      if (currentMode <= 5) {
        int v14 = off_1E6D0D3E8[currentMode];
      }
      if (a3 == 2) {
        v13 = @"QLCacheModeCleanUpDatabase";
      }
      if (a3 == 3) {
        v13 = @"QLCacheModePause";
      }
      v15 = v13;
      if (v6) {
        uint64_t v16 = @"accepted";
      }
      else {
        uint64_t v16 = @"denied";
      }
      v17 = [(NSOperationQueue *)self->_diskCacheQueryOperationQueue operations];
      uint64_t v18 = [v17 count];
      v19 = [(NSOperationQueue *)self->_memoryCacheQueryOperationQueue operations];
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v23 = v16;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      __int16 v26 = 2048;
      uint64_t v27 = [v19 count];
      _os_log_debug_impl(&dword_1DDC5E000, v8, OS_LOG_TYPE_DEBUG, "changing from %@ to %@: %@ (_diskCacheQueryOperationQueue %lu, _memoryCacheQueryOperationQueue %lu)", buf, 0x34u);
    }
    if (!v6) {
      return 0;
    }
  }
  v9 = dispatch_queue_create("quicklookd.operationssafeguard", 0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v23) = 0;
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___QLCacheThread__shouldQuitWorkingModeForMode___block_invoke;
  block[3] = &unk_1E6D0C928;
  block[4] = buf;
  dispatch_after(v10, v9, block);
  [(NSOperationQueue *)self->_diskCacheQueryOperationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_memoryCacheQueryOperationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_diskCacheQueryOperationQueue waitUntilAllOperationsAreFinished];
  [(NSOperationQueue *)self->_memoryCacheQueryOperationQueue waitUntilAllOperationsAreFinished];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48___QLCacheThread__shouldQuitWorkingModeForMode___block_invoke_2;
  v20[3] = &unk_1E6D0C928;
  v20[4] = buf;
  dispatch_async(v9, v20);
  _Block_object_dispose(buf, 8);

  return 1;
}

- (BOOL)_shouldQuitPauseModeForMode:(unint64_t)a3
{
  return 1;
}

- (void)_willStartCleanUpDatabaseModeFromMode:(unint64_t)a3
{
  uint64_t v4 = _log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_QLCacheThread _willStartCleanUpDatabaseModeFromMode:]();
  }

  [(QLCacheCleanUpDatabaseThread *)self->_cleanUpDatabaseThread startCleanUp];
}

- (QLServerThread)serverThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  return (QLServerThread *)WeakRetained;
}

- (NSLock)modeLock
{
  return (NSLock *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)currentMode
{
  return self->_currentMode;
}

- (QLDiskCacheQueryOperation)currentDiskCacheQueryOperation
{
  return (QLDiskCacheQueryOperation *)objc_getProperty(self, a2, 32, 1);
}

- (void)updateMode
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "should update mode", v2, v3, v4, v5, v6);
}

- (QLMemoryCache)memoryCache
{
  return (QLMemoryCache *)objc_getProperty(self, a2, 48, 1);
}

- (void)_sendThumbnailData:(id)a3 forThumbnailRequest:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 request];
  int v9 = [v6 hasData];
  dispatch_time_t v10 = _log_3();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      [v8 size];
      uint64_t v13 = v12;
      [v8 size];
      uint64_t v15 = v14;
      [v8 maximumPixelSize];
      float v17 = v16;
      [v6 size];
      uint64_t v18 = &stru_1F39B7010;
      if (v17 == v19) {
        v20 = &stru_1F39B7010;
      }
      else {
        v20 = @"Low quality returned";
      }
      if ([v6 iconMode]) {
        v21 = @"Icon mode";
      }
      else {
        v21 = &stru_1F39B7010;
      }
      v22 = [v6 bitmapData];
      uint64_t v23 = [v6 badgeType];
      if (v23)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v6, "badgeType"));
        uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138413826;
      id v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = v13;
      __int16 v38 = 2048;
      uint64_t v39 = v15;
      __int16 v40 = 2112;
      v41 = v20;
      __int16 v42 = 2112;
      v43 = v21;
      __int16 v44 = 2048;
      v45 = v22;
      __int16 v46 = 2112;
      v47 = v18;
      _os_log_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_INFO, "cache : hit thumbnail for %@ @ %.1fx%.1f %@ %@ %p %@", buf, 0x48u);
      if (v23) {
    }
      }
    __int16 v24 = _log_3();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v7;
      _os_log_impl(&dword_1DDC5E000, v24, OS_LOG_TYPE_INFO, "completing thumbnail request %@ after cache hit", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
    [WeakRetained completeThumbnailRequest:v7 thumbnailData:v6 updatedMetadata:0];
  }
  else
  {
    if (v11)
    {
      [v8 size];
      uint64_t v27 = v26;
      [v8 size];
      *(_DWORD *)buf = 138412802;
      id v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = v27;
      __int16 v38 = 2048;
      uint64_t v39 = v28;
      _os_log_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_INFO, "cache : hit with no thumbnail for %@ @ %.1fx%.1f", buf, 0x20u);
    }

    v29 = (void *)MEMORY[0x1E4F3A6C8];
    v30 = [v7 request];
    id WeakRetained = [v29 errorWithCode:2 request:v30 additionalUserInfo:0];

    id v31 = objc_loadWeakRetained((id *)&self->_serverThread);
    [v31 failedToCompleteThumbnailRequest:v7 error:WeakRetained];
  }
  [(QLCacheCleanUpDatabaseThread *)self->_cleanUpDatabaseThread addHitWithThumbnailData:v6];
  id v32 = objc_loadWeakRetained((id *)&self->_serverThread);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke;
  v33[3] = &unk_1E6D0C648;
  v33[4] = self;
  [v32 perform:v33];
}

- (void)_cleanUpDatabaseDone
{
  uint64_t v3 = _log_3();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[_QLCacheThread(Private) _cleanUpDatabaseDone]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke;
  v5[3] = &unk_1E6D0C648;
  v5[4] = self;
  [WeakRetained perform:v5];
}

- (void)_addThumbnailRequestIntoDiskCacheQueryQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_QLCacheThread(Private) _addThumbnailRequestIntoDiskCacheQueryQueue:]();
  }

  id v6 = [v4 request];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71___QLCacheThread_Private___addThumbnailRequestIntoDiskCacheQueryQueue___block_invoke;
  v10[3] = &unk_1E6D0C7F0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [WeakRetained perform:v10];
}

- (unint64_t)thumbnailInMemoryToSaveCount
{
  return [(QLMemoryCache *)self->_memoryCache thumbnailToSaveCount];
}

- (void)setHitCount:(unint64_t)a3
{
  self->_hitCount = a3;
}

- (BOOL)lowDiskSpace
{
  return self->_lowDiskSpace;
}

- (unint64_t)hitToSaveCount
{
  return [(QLCacheCleanUpDatabaseThread *)self->_cleanUpDatabaseThread hitToSaveCount];
}

- (unint64_t)hitCount
{
  return self->_hitCount;
}

- (QLDiskCache)diskCache
{
  return (QLDiskCache *)objc_getProperty(self, a2, 40, 1);
}

- (QLCacheCleanUpDatabaseThread)cleanUpDatabaseThread
{
  return (QLCacheCleanUpDatabaseThread *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentDiskCacheQueryOperation:(id)a3
{
}

- (NSOperationQueue)diskCacheQueryOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)serverIsIdle
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "serverIsIdle", v2, v3, v4, v5, v6);
}

- (BOOL)waitingForCleanup
{
  return self->_waitingForCleanup;
}

- (void)stopWriting
{
  self->_writeTransaction = 0;
  MEMORY[0x1F41817F8]();
}

- (void)startWriting
{
  self->_writeTransaction = (OS_os_transaction *)os_transaction_create();
  MEMORY[0x1F41817F8]();
}

- (BOOL)_shouldQuitCleanUpDatabaseModeForMode:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      [(QLCacheCleanUpDatabaseThread *)self->_cleanUpDatabaseThread pause];
      break;
    case 1uLL:
    case 4uLL:
      [(QLCacheCleanUpDatabaseThread *)self->_cleanUpDatabaseThread stop];
      break;
    default:
      return 1;
  }
  return 1;
}

- (void)setServerThreadIsIdle:(BOOL)a3
{
  self->_serverThreadIsIdle = a3;
}

- (void)_drainPendingBlocksNow
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Draining pending blocks (forced)", v2, v3, v4, v5, v6);
}

- (void)_unscheduleBlockDrain
{
  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000000000);
    dispatch_source_set_timer(drainTimer, v3, 0x38D7EA4C68000uLL, 0);
  }
}

- (void)_drainPendingBlocks
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_drainPendingBlocks taking _modeLock", v2, v3, v4, v5, v6);
}

- (void)serverIsWorking
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "serverIsWorking", v2, v3, v4, v5, v6);
}

- (int64_t)purgeableSpaceOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v9 = [(_QLCacheThread *)self diskCache];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81___QLCacheThread_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke;
  v14[3] = &unk_1E6D0D2D8;
  float v16 = &v17;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  LOBYTE(v8) = [v9 doReading:v14];

  if (v8)
  {
    int64_t v11 = v18[3];
  }
  else
  {
    id v12 = _log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_QLCacheThread(CacheDelete) purgeableSpaceOnMountPoint:withUrgency:beforeDate:](v12);
    }

    int64_t v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (int64_t)purgeOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v9 = [(_QLCacheThread *)self diskCache];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72___QLCacheThread_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke;
  v14[3] = &unk_1E6D0D350;
  float v16 = &v17;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  LOBYTE(v8) = [v9 doWriting:v14];

  if (v8)
  {
    int64_t v11 = v18[3];
  }
  else
  {
    id v12 = _log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_QLCacheThread(CacheDelete) purgeOnMountPoint:withUrgency:beforeDate:](v12);
    }

    int64_t v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (int64_t)defaultCacheSize
{
  if (QLCacheInDebugMode_onceToken != -1) {
    dispatch_once(&QLCacheInDebugMode_onceToken, &__block_literal_global_7);
  }
  if (QLCacheInDebugMode__cacheIsInDebugMode) {
    return 52428800;
  }
  else {
    return 524288000;
  }
}

- (_QLCacheThread)initWithServerThread:(id)a3 cacheSize:(int64_t)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_QLCacheThread;
  id v10 = [(_QLCacheThread *)&v31 init];
  if (v10)
  {
    if (!v9)
    {
      v29 = 0;
      goto LABEL_6;
    }
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.quicklook.ThumbnailsAgent.QLCacheThread.writequeue", 0);
    writeQueue = v10->_writeQueue;
    v10->_writeQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("quicklookd.cachecoalescer", 0);
    writeCoalesceQueue = v10->_writeCoalesceQueue;
    v10->_writeCoalesceQueue = (OS_dispatch_queue *)v13;

    v10->_serverThreadIsIdle = 1;
    id v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    memoryCacheQueryOperationQueue = v10->_memoryCacheQueryOperationQueue;
    v10->_memoryCacheQueryOperationQueue = v15;

    [(NSOperationQueue *)v10->_memoryCacheQueryOperationQueue setMaxConcurrentOperationCount:1];
    uint64_t v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    diskCacheQueryOperationQueue = v10->_diskCacheQueryOperationQueue;
    v10->_diskCacheQueryOperationQueue = v17;

    [(NSOperationQueue *)v10->_diskCacheQueryOperationQueue setMaxConcurrentOperationCount:1];
    uint64_t v19 = [[QLDiskCache alloc] initWithPathLocation:v9 cacheSize:a4 cacheThread:v10];
    diskCache = v10->_diskCache;
    v10->_diskCache = v19;

    [(QLDiskCache *)v10->_diskCache setDelegate:v10];
    v21 = [[QLMemoryCache alloc] initWithCacheThread:v10];
    memoryCache = v10->_memoryCache;
    v10->_memoryCache = v21;

    uint64_t v23 = [[QLCacheCleanUpDatabaseThread alloc] initWithCacheThread:v10];
    cleanUpDatabaseThread = v10->_cleanUpDatabaseThread;
    v10->_cleanUpDatabaseThread = v23;

    v10->_unint64_t currentMode = 4;
    uint64_t v25 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    modeLock = v10->_modeLock;
    v10->_modeLock = v25;

    objc_storeWeak((id *)&v10->_serverThread, v8);
    uint64_t v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    diskCacheURL = v10->_diskCacheURL;
    v10->_diskCacheURL = (NSURL *)v27;
  }
  v29 = v10;
LABEL_6:

  return v29;
}

- (void)databaseCorruptionDetected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44___QLCacheThread_databaseCorruptionDetected__block_invoke;
  v4[3] = &unk_1E6D0C648;
  v4[4] = self;
  [WeakRetained perform:v4];
}

- (void)_scheduledDrainPendingBlocks
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Draining pending blocks (scheduled)", v2, v3, v4, v5, v6);
}

- (void)_scheduleBlockDrain
{
  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_time_t v3 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(drainTimer, v3, 0x38D7EA4C68000uLL, 0);
  }
  else
  {
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_writeCoalesceQueue);
    uint8_t v6 = self->_drainTimer;
    self->_drainTimer = v5;

    id v7 = self->_drainTimer;
    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v7, v8, 0x38D7EA4C68000uLL, 0);
    id v9 = self->_drainTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37___QLCacheThread__scheduleBlockDrain__block_invoke;
    handler[3] = &unk_1E6D0C648;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_drainTimer);
  }
}

- (void)_destroyDrainTimer
{
  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_source_cancel(drainTimer);
    uint64_t v4 = self->_drainTimer;
    self->_drainTimer = 0;
  }
}

- (void)enqueueWriting:(id)a3
{
  id v4 = a3;
  writeCoalesceQueue = self->_writeCoalesceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33___QLCacheThread_enqueueWriting___block_invoke;
  v7[3] = &unk_1E6D0CA98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(writeCoalesceQueue, v7);
}

- (BOOL)addNoThumbnailIntoCache:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 request];
  id v6 = _log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 fileIdentifier];
    [v5 size];
    uint64_t v9 = v8;
    [v5 size];
    int v18 = 138412802;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = v10;
    _os_log_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_INFO, "adding no thumbnail for %@ @ %.1f %.1f", (uint8_t *)&v18, 0x20u);
  }
  dispatch_queue_t v11 = [QLCacheThumbnailData alloc];
  [v5 maximumPixelSize];
  int v13 = v12;
  uint64_t v14 = [v4 badgeType];

  LODWORD(v15) = v13;
  float v16 = [(QLCacheThumbnailData *)v11 initWithCacheId:0 thumbnailRequest:v5 size:v14 badgeType:v15];
  [(QLMemoryCache *)self->_memoryCache addThumbnailData:v16];

  return 1;
}

- (BOOL)addThumbnailIntoCache:(id)a3 bitmapFormat:(id)a4 bitmapData:(id)a5 metadata:(id)a6 flavor:(int)a7 contentRect:(CGRect)a8 badgeType:(unint64_t)a9 externalGeneratorDataHash:(unint64_t)a10
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  __int16 v20 = _log_3();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = [v16 fileIdentifier];
    [v16 size];
    uint64_t v23 = v22;
    [v16 size];
    *(_DWORD *)buf = 138413314;
    __int16 v36 = v21;
    __int16 v37 = 2048;
    uint64_t v38 = v23;
    __int16 v39 = 2048;
    uint64_t v40 = v24;
    __int16 v41 = 2048;
    uint64_t v42 = [v17 width];
    __int16 v43 = 2048;
    uint64_t v44 = [v17 height];
    _os_log_impl(&dword_1DDC5E000, v20, OS_LOG_TYPE_INFO, "adding thumbnail for %@ @ {%.1f, %.1f} (actual size %zd %zd)", buf, 0x34u);
  }
  uint64_t v25 = [(QLDiskCache *)self->_diskCache reserveBufferForData:v18];
  if (!v25)
  {
    if (![v18 length])
    {
      uint64_t v25 = 0;
      if (v19) {
        goto LABEL_7;
      }
      goto LABEL_11;
    }
    [(QLDiskCache *)self->_diskCache freeDiskSpaceForNewThumbnails];
    uint64_t v25 = [(QLDiskCache *)self->_diskCache reserveBufferForData:v18];
  }
  if (v19)
  {
LABEL_7:
    uint64_t v26 = [(QLDiskCache *)self->_diskCache reserveBufferForData:v19];
    uint64_t v27 = (void *)v26;
    if (v25 && v26) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v27 = 0;
  if (v25)
  {
LABEL_9:
    uint64_t v28 = [QLCacheThumbnailData alloc];
    [v16 maximumPixelSize];
    LODWORD(v34) = a7;
    v29 = -[QLCacheThumbnailData initWithUnsavedDataForThumbnailRequest:size:bitmapFormat:bitmapData:reservationInfo:metadata:reservationInfo:flavor:contentRect:badgeType:](v28, "initWithUnsavedDataForThumbnailRequest:size:bitmapFormat:bitmapData:reservationInfo:metadata:reservationInfo:flavor:contentRect:badgeType:", v16, v17, v18, v25, v19, v27, v34, a9);
    BOOL v30 = [(QLMemoryCache *)self->_memoryCache addThumbnailData:v29];

    goto LABEL_18;
  }
LABEL_12:
  objc_super v31 = _log_3();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = [v16 fileIdentifier];
    *(_DWORD *)buf = 138412290;
    __int16 v36 = v32;
    _os_log_impl(&dword_1DDC5E000, v31, OS_LOG_TYPE_INFO, "addThumbnailIntoCache: failed, discarding buffers for %@", buf, 0xCu);
  }
  if (v25) {
    [(QLDiskCache *)self->_diskCache discardReservedBuffer:v25];
  }
  if (!v27)
  {
    BOOL v30 = 0;
    goto LABEL_19;
  }
  [(QLDiskCache *)self->_diskCache discardReservedBuffer:v27];
  BOOL v30 = 0;
LABEL_18:

LABEL_19:
  return v30;
}

- (void)_updateLowDisk
{
  dispatch_time_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];
  id v4 = +[QLDiskStore diskStoreForURL:v3];

  -[_QLCacheThread _setLowDiskSpace:](self, "_setLowDiskSpace:", (unint64_t)[v4 availableDiskSpace] < 0xC800001);
}

- (void)_registerMachPortForLowDiskSpaceNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke;
  v4[3] = &unk_1E6D0C648;
  v4[4] = self;
  [WeakRetained perform:v4];
}

- (void)_unregisterMachPortForLowDiskSpaceNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64___QLCacheThread__unregisterMachPortForLowDiskSpaceNotification__block_invoke;
  v4[3] = &unk_1E6D0C648;
  v4[4] = self;
  [WeakRetained perform:v4];
}

- (void)reset
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-reset taking _modeLock", v2, v3, v4, v5, v6);
}

- (void)openCache
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-openCache taking _modeLock", v2, v3, v4, v5, v6);
}

- (void)closeCache
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-closeCache taking _modeLock", v2, v3, v4, v5, v6);
}

- (BOOL)isCacheOpened
{
  return (self->_currentMode > 5) | (0xDu >> self->_currentMode) & 1;
}

- (void)forceCommitAndClose
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Force cache commit", v2, v3, v4, v5, v6);
}

- (void)forceCommit
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Starting database clean-up", v2, v3, v4, v5, v6);
}

- (BOOL)isIdle
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (self->_currentMode < 5) & (0x1Au >> self->_currentMode);
  uint64_t v4 = _log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unint64_t currentMode = self->_currentMode;
    if (currentMode > 5) {
      id v7 = @"unknown mode";
    }
    else {
      id v7 = off_1E6D0D3E8[currentMode];
    }
    uint64_t v8 = [(NSOperationQueue *)self->_diskCacheQueryOperationQueue operations];
    uint64_t v9 = [v8 count];
    uint64_t v10 = [(NSOperationQueue *)self->_memoryCacheQueryOperationQueue operations];
    uint64_t v11 = [v10 count];
    unint64_t v12 = [(QLMemoryCache *)self->_memoryCache thumbnailToSaveCount];
    unint64_t v13 = [(_QLCacheThread *)self hitToSaveCount];
    uint64_t v14 = @"is not idle";
    int v15 = 138413570;
    id v16 = v7;
    __int16 v17 = 2048;
    if (v3) {
      uint64_t v14 = @"is idle";
    }
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    unint64_t v22 = v12;
    __int16 v23 = 2048;
    unint64_t v24 = v13;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    _os_log_debug_impl(&dword_1DDC5E000, v4, OS_LOG_TYPE_DEBUG, "current mode %@, disk cache queries: %lu, memory cache queries: %lu, thumbnail left to write: %lu, hit count left to save: %lu, result %@", (uint8_t *)&v15, 0x3Eu);
  }
  return v3;
}

- (void)prepareToExit
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "prepareToExit", v2, v3, v4, v5, v6);
}

- (id)contentDescriptionForURL:(__CFURL *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v17 = 0;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F3A668]) initWithFileURL:a3 error:&v17];
  id v8 = v17;
  if (v7)
  {
    uint64_t v9 = [(QLDiskCache *)self->_diskCache enumeratorForAllThumbnailsWithFileIdentifier:v7];
    uint64_t v10 = [v9 nextThumbnailData];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      while (![v11 iconMode])
      {
        unint64_t v12 = v5;
        if ([v5 length]) {
          goto LABEL_8;
        }
LABEL_9:
        [v11 size];
        objc_msgSend(v12, "appendFormat:", @"%.1f", v13);
        uint64_t v14 = [v9 nextThumbnailData];

        uint64_t v11 = (void *)v14;
        if (!v14) {
          goto LABEL_10;
        }
      }
      unint64_t v12 = v6;
      if (![v6 length]) {
        goto LABEL_9;
      }
LABEL_8:
      [v12 appendString:@", "];
      goto LABEL_9;
    }
LABEL_10:
    int v15 = [NSString stringWithFormat:@"thumbnail sizes: %@ - icon sizes: %@", v5, v6];
  }
  else
  {
    uint64_t v9 = _log_3();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_QLCacheThread contentDescriptionForURL:]();
    }
    int v15 = 0;
  }

  return v15;
}

- (NSString)modeDescription
{
  switch(self->_currentMode)
  {
    case 0uLL:
      result = (NSString *)@"working";
      break;
    case 1uLL:
      result = (NSString *)@"low disk space";
      break;
    case 2uLL:
      result = (NSString *)@"clean up";
      break;
    case 3uLL:
      result = (NSString *)@"pause";
      break;
    case 4uLL:
      if (self->_lowDiskSpace) {
        result = (NSString *)@"closed (low disk space)";
      }
      else {
        result = (NSString *)@"closed";
      }
      break;
    case 5uLL:
      result = (NSString *)@"reseting";
      break;
    default:
      result = (NSString *)@"unknown";
      break;
  }
  return result;
}

- (BOOL)_shouldQuitLowSpaceModeForMode:(unint64_t)a3
{
  BOOL v3 = a3 == 4 || !self->_lowDiskSpace;
  BOOL v4 = v3;
  if (!v3)
  {
    id v5 = _log_3();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_QLCacheThread _shouldQuitLowSpaceModeForMode:]();
    }
  }
  return v4;
}

- (BOOL)_shouldQuitClosedModeForMode:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (a3 != 5)
    {
      id v8 = _log_3();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_QLCacheThread _shouldQuitClosedModeForMode:].cold.4();
      }

      return 0;
    }
    return 1;
  }
  [(_QLCacheThread *)self _registerMachPortForLowDiskSpaceNotification];
  BOOL v4 = _log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_QLCacheThread _shouldQuitClosedModeForMode:]((uint64_t)self, v4);
  }

  if ([(QLDiskCache *)self->_diskCache open]) {
    return 1;
  }
  id v5 = _log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_QLCacheThread _shouldQuitClosedModeForMode:]();
  }

  id v6 = _log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[_QLCacheThread _shouldQuitClosedModeForMode:]();
  }

  [(_QLCacheThread *)self _unregisterMachPortForLowDiskSpaceNotification];
  return 0;
}

- (BOOL)_shouldQuitResetingModeForMode:(unint64_t)a3
{
  return 1;
}

- (void)_willStartClosedModeFromMode:(unint64_t)a3
{
  self->_missedCount = 0;
  self->_hitCount = 0;
  if (a3 != 5)
  {
    BOOL v4 = _log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[_QLCacheThread _willStartClosedModeFromMode:]();
    }

    writeCoalesceQueue = self->_writeCoalesceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47___QLCacheThread__willStartClosedModeFromMode___block_invoke;
    block[3] = &unk_1E6D0C648;
    block[4] = self;
    dispatch_async(writeCoalesceQueue, block);
    [(QLDiskCache *)self->_diskCache close];
    if ([(QLDiskCache *)self->_diskCache isOpened])
    {
      id v6 = _log_3();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[_QLCacheThread _willStartClosedModeFromMode:]();
      }
    }
    else
    {
      [(_QLCacheThread *)self _unregisterMachPortForLowDiskSpaceNotification];
    }
  }
}

- (void)_willStartResetingModeFromMode:(unint64_t)a3
{
  BOOL v4 = _log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1DDC5E000, v4, OS_LOG_TYPE_INFO, "reset database", v5, 2u);
  }

  [(QLMemoryCache *)self->_memoryCache reset];
  [(QLDiskCache *)self->_diskCache reset];
}

- (void)_waitForEndOfDatabaseCleanup
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_DEBUG, "Loop waiting for clean-up end", buf, 2u);
}

- (id)cacheInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  diskCache = self->_diskCache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27___QLCacheThread_cacheInfo__block_invoke;
  v5[3] = &unk_1E6D0CAC0;
  v5[4] = self;
  void v5[5] = &v6;
  [(QLDiskCache *)diskCache doReading:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)allThumbnailsInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  diskCache = self->_diskCache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35___QLCacheThread_allThumbnailsInfo__block_invoke;
  v5[3] = &unk_1E6D0CAC0;
  v5[4] = self;
  void v5[5] = &v6;
  [(QLDiskCache *)diskCache doReading:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_allThumbnailsEnumerateWithEnumerator:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v36 = (id)objc_opt_new();
  uint64_t v3 = [v35 nextFileInfo];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    while (1)
    {
      id v5 = [v4 fileIdentifier];
      uint64_t v6 = [v5 fileIdentifier];

      id v7 = [v4 fileIdentifier];
      uint64_t v8 = [v7 version];

      if (v8)
      {
        uint64_t v9 = [v4 fileIdentifier];
        uint64_t v10 = [v9 version];
        id v11 = [v10 description];
      }
      else
      {
        id v11 = @"cannot read the version";
      }
      id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
      float v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "cacheId"));
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "thumbnailCount"));
      int v15 = NSNumber;
      [v4 minSize];
      id v16 = objc_msgSend(v15, "numberWithFloat:");
      id v17 = NSNumber;
      [v4 maxSize];
      uint64_t v18 = objc_msgSend(v17, "numberWithFloat:");
      __int16 v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "totalDataLength"));
      uint64_t v20 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"cacheid", v11, @"versiondescription", v14, @"thumbnailcount", v16, @"minsize", v18, @"maxsize", v19, @"datalength", 0);

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v31 = [v6 itemID];
        id v32 = [v31 providerDomainID];
        [v20 setObject:v32 forKeyedSubscript:@"fpid"];

        uint64_t v26 = [v6 itemID];
        uint64_t v27 = [v26 identifier];
        uint64_t v28 = v20;
        v29 = v27;
        BOOL v30 = @"itemid";
        goto LABEL_10;
      }
LABEL_11:
      [v36 addObject:v20];

      uint64_t v33 = [v35 nextFileInfo];

      BOOL v4 = (void *)v33;
      if (!v33) {
        goto LABEL_12;
      }
    }
    unint64_t v21 = [v6 fsid];
    unint64_t v22 = HIDWORD(v21);
    uint64_t v23 = [v6 fileId];
    unint64_t v24 = [NSNumber numberWithInt:v21];
    v37[0] = v24;
    __int16 v25 = [NSNumber numberWithInt:v22];
    v37[1] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];

    [v20 setObject:v26 forKeyedSubscript:@"fsid"];
    uint64_t v27 = [NSNumber numberWithUnsignedLongLong:v23];
    uint64_t v28 = v20;
    v29 = v27;
    BOOL v30 = @"ino";
LABEL_10:
    [v28 setObject:v29 forKeyedSubscript:v30];

    goto LABEL_11;
  }
LABEL_12:

  return v36;
}

- (id)allThumbnailsForIno:(unint64_t)a3 fsid:(fsid)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F3A668]) initWithFileId:a3 fsid:a4];
  if (v5)
  {
    uint64_t v6 = [(_QLCacheThread *)self allThumbnailsForFileIdentifier:v5];
  }
  else
  {
    id v7 = _log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_QLCacheThread allThumbnailsForIno:fsid:]();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)allThumbnailsForFPItemID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F3A678]) initWithItemID:v4];
  if (v5)
  {
    uint64_t v6 = [(_QLCacheThread *)self allThumbnailsForFileIdentifier:v5];
  }
  else
  {
    id v7 = _log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_QLCacheThread allThumbnailsForFPItemID:]();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)allThumbnailsForFileIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  float v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__5;
  id v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  diskCache = self->_diskCache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___QLCacheThread_allThumbnailsForFileIdentifier___block_invoke;
  v9[3] = &unk_1E6D0D2D8;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(QLDiskCache *)diskCache doReading:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)locked_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(_QLCacheThread *)self diskCache];
  char v6 = [v5 removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:v4];

  [(QLMemoryCache *)self->_memoryCache removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:v4];
  return v6;
}

- (BOOL)locked_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(_QLCacheThread *)self diskCache];
  char v6 = [v5 removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:v4];

  [(QLMemoryCache *)self->_memoryCache removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:v4];
  return v6;
}

- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  diskCache = self->_diskCache;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60___QLCacheThread_setLastHitDateOfAllCachedThumbnailsToDate___block_invoke;
  v8[3] = &unk_1E6D0D350;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(QLDiskCache *)diskCache doWriting:v8];
  LOBYTE(diskCache) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)diskCache;
}

- (void)noteRemoteThumbnailMissingForItems:(id)a3
{
  id v4 = a3;
  diskCache = self->_diskCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___QLCacheThread_noteRemoteThumbnailMissingForItems___block_invoke;
  v7[3] = &unk_1E6D0D3A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(QLDiskCache *)diskCache doWriting:v7];
}

- (void)noteRemoteThumbnailPresentForItems:(id)a3
{
  id v4 = a3;
  diskCache = self->_diskCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___QLCacheThread_noteRemoteThumbnailPresentForItems___block_invoke;
  v7[3] = &unk_1E6D0D3A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(QLDiskCache *)diskCache doWriting:v7];
}

- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__5;
  id v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  diskCache = self->_diskCache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67___QLCacheThread_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke;
  v9[3] = &unk_1E6D0D2D8;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(QLDiskCache *)diskCache doReading:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)itemIsMissingRemoteThumbnail:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  diskCache = self->_diskCache;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___QLCacheThread_itemIsMissingRemoteThumbnail___block_invoke;
  v8[3] = &unk_1E6D0D2D8;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(QLDiskCache *)diskCache doReading:v8];
  LOBYTE(diskCache) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)diskCache;
}

- (BOOL)shouldRemoveThumbnailsForDeletedFiles
{
  return [(QLCacheCleanUpDatabaseThread *)self->_cleanUpDatabaseThread shouldRemoveThumbnailsForDeletedFiles];
}

- (void)setShouldRemoveThumbnailsForDeletedFiles:(BOOL)a3
{
}

- (unint64_t)missedCount
{
  return self->_missedCount;
}

- (void)setMissedCount:(unint64_t)a3
{
  self->_missedCount = a3;
}

- (void)setServerThread:(id)a3
{
}

- (NSURL)diskCacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDiskCacheURL:(id)a3
{
}

- (OS_dispatch_source)lowDiskSpaceSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLowDiskSpaceSource:(id)a3
{
}

- (OS_dispatch_queue)lowDiskSpaceSourceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLowDiskSpaceSourceQueue:(id)a3
{
}

- (void)setModeLock:(id)a3
{
}

- (void)setDiskCacheQueryOperationQueue:(id)a3
{
}

- (BOOL)serverThreadIsIdle
{
  return self->_serverThreadIsIdle;
}

- (void)setWaitingForCleanup:(BOOL)a3
{
  self->_waitingForCleanup = a3;
}

- (void)setCleanUpDatabaseThread:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_destroyWeak((id *)&self->_serverThread);
  objc_storeStrong((id *)&self->_writeTransaction, 0);
  objc_storeStrong((id *)&self->_drainTimer, 0);
  for (uint64_t i = 0; i != -10; --i)
    objc_storeStrong(&self->_cleanupBlocks[i + 9], 0);
  for (uint64_t j = 208; j != 128; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_writeCoalesceQueue, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_lowDiskSpaceSourceQueue, 0);
  objc_storeStrong((id *)&self->_lowDiskSpaceSource, 0);
  objc_storeStrong((id *)&self->_modeLock, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_currentDiskCacheQueryOperation, 0);
  objc_storeStrong((id *)&self->_memoryCacheQueryOperationQueue, 0);
  objc_storeStrong((id *)&self->_diskCacheQueryOperationQueue, 0);
  objc_storeStrong((id *)&self->_cleanUpDatabaseThread, 0);
}

- (void)_setLowDiskSpace:(BOOL)a3
{
  if (self->_lowDiskSpace != a3)
  {
    BOOL v3 = a3;
    [(_QLCacheThread *)self willChangeValueForKey:@"lowDiskSpace"];
    [(NSLock *)self->_modeLock lock];
    self->_lowDiskSpace = v3;
    id v5 = _log_3();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "QLCacheThread is now running on low disk space mode.", buf, 2u);
      }

      uint64_t v7 = 1;
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "QLCacheThread is not longer running on low disk space.", v8, 2u);
      }

      if (self->_currentMode > 3)
      {
        uint64_t v7 = 4;
      }
      else
      {
        [(_QLCacheThread *)self _setMode:3];
        if (!self->_serverThreadIsIdle)
        {
LABEL_13:
          [(NSLock *)self->_modeLock unlock];
          [(_QLCacheThread *)self didChangeValueForKey:@"lowDiskSpace"];
          return;
        }
        uint64_t v7 = 2;
      }
    }
    [(_QLCacheThread *)self _setMode:v7];
    goto LABEL_13;
  }
}

- (void)_dispatchThumbnailRequestInServerThread:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke;
  v7[3] = &unk_1E6D0C750;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [WeakRetained perform:v7];
}

- (void)_thumbnailHasBeenCancelled:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 request];
    [v6 size];
    uint64_t v8 = v7;
    id v9 = [v4 request];
    [v9 size];
    *(_DWORD *)buf = 138412802;
    id v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "cache : thumbnail for %@ has been cancelled @ %.1fx%.1f", buf, 0x20u);
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F3A6C8];
  uint64_t v12 = [v4 request];
  uint64_t v13 = [v11 errorWithCode:5 request:v12 additionalUserInfo:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  [WeakRetained failedToCompleteThumbnailRequest:v4 error:v13];

  id v15 = objc_loadWeakRetained((id *)&self->_serverThread);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54___QLCacheThread_Private___thumbnailHasBeenCancelled___block_invoke;
  v16[3] = &unk_1E6D0C648;
  v16[4] = self;
  [v15 perform:v16];
}

- (void)addThumbnailRequest:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "addThumbnailRequest relinquishing _modeLock", v2, v3, v4, v5, v6);
}

- (void)addThumbnailRequest:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "addThumbnailRequest has _modeLock", v2, v3, v4, v5, v6);
}

- (void)addThumbnailRequest:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "addThumbnailRequest waiting for _modeLock", v2, v3, v4, v5, v6);
}

- (void)contentDescriptionForURL:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_1();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1DDC5E000, v1, OS_LOG_TYPE_ERROR, "Could not identify file at URL %@: %@", v2, 0x16u);
}

- (void)_shouldQuitLowSpaceModeForMode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Still low disk space, so we will stay in that mode", v2, v3, v4, v5, v6);
}

- (void)_shouldQuitClosedModeForMode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Problem to open the cache, unregistering for low disk space notification", v2, v3, v4, v5, v6);
}

- (void)_shouldQuitClosedModeForMode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Problem to open the cache, so we disabled it", v2, v3, v4, v5, v6);
}

- (void)_shouldQuitClosedModeForMode:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 48) thumbnailToSaveCount];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_DEBUG, "opening databases (thumbnails in memory %lu)", v3, 0xCu);
}

- (void)_shouldQuitClosedModeForMode:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_ERROR, "Can not switch from closed mode to %@", v1, 0xCu);
}

- (void)_willStartClosedModeFromMode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Can't close the cache right now", v2, v3, v4, v5, v6);
}

- (void)_willStartClosedModeFromMode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "close database", v2, v3, v4, v5, v6);
}

- (void)_willStartCleanUpDatabaseModeFromMode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "start Writing thumbnails", v2, v3, v4, v5, v6);
}

- (void)_setMode:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "current mode %@", v2, v3, v4, v5, v6);
}

- (void)_setMode:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "changing to %@", v2, v3, v4, v5, v6);
}

- (void)_setMode:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "change mode denied", v2, v3, v4, v5, v6);
}

- (void)_setMode:.cold.4()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1DDC5E000, v1, OS_LOG_TYPE_DEBUG, "try to change mode from %@ to %@", v2, 0x16u);
}

- (void)allThumbnailsForIno:fsid:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 1024;
  int v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  _os_log_error_impl(&dword_1DDC5E000, v1, OS_LOG_TYPE_ERROR, "Could not identify file at ino %llu fsid %d: %@", v2, 0x1Cu);
}

- (void)allThumbnailsForFPItemID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_ERROR, "Could not identify file with file provider item %@ : %@", v1, 0x16u);
}

@end