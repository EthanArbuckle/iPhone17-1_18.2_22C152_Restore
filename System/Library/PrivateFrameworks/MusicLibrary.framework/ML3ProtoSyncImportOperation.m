@interface ML3ProtoSyncImportOperation
- (BOOL)_performImportWithTransaction:(id)a3;
- (BOOL)_processAlbumArtistOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processAlbumOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processMediaItemOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processPlaylistOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processSyncError:(id)a3;
- (BOOL)_processSyncHeader:(id)a3;
- (BOOL)_processSyncOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processSyncPackage:(id)a3 withImportSession:(void *)a4;
- (ML3ProtoSyncImportOperation)initWithDatabaseImport:(id)a3;
- (unint64_t)importSource;
- (void)_unlinkUnavailableMediaItems;
- (void)cancel;
- (void)main;
@end

@implementation ML3ProtoSyncImportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_syncIdsToUnlink, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_unlinkUnavailableMediaItems
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v3 = +[ML3ContainmentPredicate predicateWithProperty:@"item_store.sync_id" values:self->_syncIdsToUnlink];
  v33[0] = v3;
  v4 = +[ML3ComparisonPredicate predicateWithProperty:@"(item.base_location_id > 0)" equalToInteger:1];
  v33[1] = v4;
  v5 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.is_protected" equalToInteger:2];
  v33[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v7 = +[ML3CompoundPredicate predicateMatchingPredicates:v6];

  v8 = [(ML3ImportOperation *)self import];
  v9 = [v8 library];
  v10 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:v9 predicate:v7 orderingTerms:MEMORY[0x1E4F1CBF0]];

  v11 = [MEMORY[0x1E4F1CA48] array];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke;
  v29[3] = &unk_1E5FB7EE0;
  id v12 = v11;
  id v30 = v12;
  [v10 enumeratePersistentIDsUsingBlock:v29];
  if ([v12 count])
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v12 count];
      *(_DWORD *)buf = 134217984;
      v32[0] = v14;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu unavailable tracks to unlink", buf, 0xCu);
    }

    v15 = [MEMORY[0x1E4F1CA80] set];
    v16 = [(ML3ImportOperation *)self import];
    v17 = [v16 library];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke_42;
    v27 = &unk_1E5FB61E0;
    id v18 = v15;
    id v28 = v18;
    +[ML3Track enumeratePathsToDeleteFromLibrary:v17 persistentIDs:v12 usingBlock:&v24];

    v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v32[0]) = 2;
      WORD2(v32[0]) = 2114;
      *(void *)((char *)v32 + 6) = v18;
      _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Deleting assets with protection type = %d that are no longer cloud available: %{public}@", buf, 0x12u);
    }

    ML3DeleteAssetsAtPaths(v18);
    v20 = [(ML3ImportOperation *)self import];
    v21 = [v20 library];
    BOOL v22 = +[ML3Track clearLocationFromLibrary:v21 persistentIDs:v12 usingConnection:self->_connection];

    if (!v22)
    {
      v23 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v32[0]) = 2;
        _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_DEFAULT, "Failed to clear location for unavailable tracks with asset protection type = %d", buf, 8u);
      }
    }
  }
}

void __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithLongLong:a2];
  [v3 addObject:v4];

  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    uint64_t v7 = a2;
    __int16 v8 = 1024;
    int v9 = 2;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Track with persistent_id:%lld, protection type: %d is local on device with no backing cloud asset", (uint8_t *)&v6, 0x12u);
  }
}

void __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && [v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)_processAlbumOperation:(id)a3 withImportSession:(void *)a4
{
  id v6 = a3;
  if (self->_syncSessionStarted) {
    goto LABEL_4;
  }
  if (ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0))
  {
    self->_syncSessionStarted = 1;
LABEL_4:
    uint64_t v7 = [v6 album];
    __int16 v8 = [v6 multiverseId];
    if ([v6 operationType] == 2) {
      operator new();
    }

    BOOL v9 = 1;
    goto LABEL_12;
  }
  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "failed to begin import session", buf, 2u);
  }

  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "failed to process album artist sync operation", buf, 2u);
  }

  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_processAlbumArtistOperation:(id)a3 withImportSession:(void *)a4
{
  id v6 = a3;
  if (self->_syncSessionStarted) {
    goto LABEL_4;
  }
  if (ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0))
  {
    self->_syncSessionStarted = 1;
LABEL_4:
    uint64_t v7 = [v6 artist];
    __int16 v8 = [v6 multiverseId];
    int v9 = [v6 operationType];
    switch(v9)
    {
      case 1:
        operator new();
      case 2:
        operator new();
      case 3:
        operator new();
    }

    BOOL v10 = 1;
    goto LABEL_16;
  }
  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "failed to begin import session", buf, 2u);
  }

  id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "failed to process album artist sync operation", buf, 2u);
  }

  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (BOOL)_processPlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  id v6 = a3;
  if (self->_syncSessionStarted) {
    goto LABEL_4;
  }
  if (ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0))
  {
    self->_syncSessionStarted = 1;
LABEL_4:
    uint64_t v7 = [v6 multiverseId];
    __int16 v8 = [v6 playlist];
    int v9 = [v6 operationType];
    if (v9 == 1) {
      operator new();
    }
    if (v9 == 3) {
      operator new();
    }

    BOOL v10 = 1;
    goto LABEL_14;
  }
  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "failed to begin import session", buf, 2u);
  }

  id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "failed to process playlist sync operation", buf, 2u);
  }

  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)_processMediaItemOperation:(id)a3 withImportSession:(void *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_syncSessionStarted) {
    goto LABEL_4;
  }
  if (ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0))
  {
    self->_syncSessionStarted = 1;
LABEL_4:
    uint64_t v7 = [v6 multiverseId];
    __int16 v8 = [v6 mediaItem];
    int v9 = [v6 operationType];
    switch(v9)
    {
      case 1:
        operator new();
      case 2:
        operator new();
      case 3:
        operator new();
    }

    BOOL v11 = 1;
    goto LABEL_16;
  }
  BOOL v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "failed to begin import session", v14, 2u);
  }

  id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "failed to process media sync operation", v14, 2u);
  }

  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)_processSyncOperation:(id)a3 withImportSession:(void *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 multiverseId];
  int v8 = [v7 mediaObjectType];
  switch(v8)
  {
    case 1:
      BOOL v9 = [(ML3ProtoSyncImportOperation *)self _processAlbumOperation:v6 withImportSession:a4];
      goto LABEL_9;
    case 6:
      BOOL v9 = [(ML3ProtoSyncImportOperation *)self _processMediaItemOperation:v6 withImportSession:a4];
      goto LABEL_9;
    case 7:
      BOOL v9 = [(ML3ProtoSyncImportOperation *)self _processPlaylistOperation:v6 withImportSession:a4];
      goto LABEL_9;
    case 8:
      BOOL v9 = [(ML3ProtoSyncImportOperation *)self _processAlbumArtistOperation:v6 withImportSession:a4];
LABEL_9:
      BOOL v11 = v9;
      break;
    default:
      BOOL v10 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 67109120;
        v13[1] = v8;
        _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "unknown object type %d", (uint8_t *)v13, 8u);
      }

      BOOL v11 = 1;
      break;
  }

  return v11;
}

- (BOOL)_processSyncError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = [v3 errorCode];
    id v6 = [v3 errorDescription];
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2114;
    BOOL v10 = v6;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "received sync error package. err=%d, desc=%{public}@", (uint8_t *)v8, 0x12u);
  }
  return 0;
}

- (BOOL)_processSyncHeader:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_totalSyncPackageCount = [v4 totalPackages];
  int v5 = [v4 syncType];
  self->_syncType = v5;
  if (v5 == 1 && !self->_isServerImport)
  {
    id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "preparing for a reset sync", (uint8_t *)&v13, 2u);
    }

    uint64_t v7 = [(ML3ImportOperation *)self import];
    int v8 = [v7 library];
    __int16 v9 = +[ML3Entity unrestrictedQueryWithLibrary:v8 predicate:0 orderingTerms:0];

    BOOL v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v9 countOfEntities];
      int v13 = 134217984;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Removing %ld playlists for a reset sync", (uint8_t *)&v13, 0xCu);
    }

    [v9 deleteAllEntitiesFromLibraryWithDeletionType:2];
  }

  return 1;
}

- (BOOL)_processSyncPackage:(id)a3 withImportSession:(void *)a4
{
  id v6 = a3;
  int v7 = [v6 type];
  switch(v7)
  {
    case 2:
      __int16 v9 = [v6 header];
      BOOL v10 = [(ML3ProtoSyncImportOperation *)self _processSyncHeader:v9];
      goto LABEL_7;
    case 3:
      __int16 v9 = [v6 error];
      BOOL v10 = [(ML3ProtoSyncImportOperation *)self _processSyncError:v9];
      goto LABEL_7;
    case 4:
      __int16 v9 = [v6 syncOperation];
      BOOL v10 = [(ML3ProtoSyncImportOperation *)self _processSyncOperation:v9 withImportSession:a4];
LABEL_7:
      BOOL v11 = v10;

      goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_9:
  if (self->_totalSyncPackageCount)
  {
    unsigned int v12 = self->_syncPackageNum + 1;
    self->_syncPackageNum = v12;
    *(float *)&double v8 = (float)v12 / (float)self->_totalSyncPackageCount;
    [(ML3ImportOperation *)self setProgress:v8];
  }

  return v11;
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v4 = [v17 connection];
  connection = self->_connection;
  self->_connection = v4;

  id v6 = [(ML3ImportOperation *)self import];
  self->_isServerImport = [v6 isServerImport];

  int v7 = [MEMORY[0x1E4F1CA80] set];
  syncIdsToUnlink = self->_syncIdsToUnlink;
  self->_syncIdsToUnlink = v7;

  if (!self->_isServerImport)
  {
    __int16 v9 = [(ML3ImportOperation *)self import];
    BOOL v10 = [v9 syncLibraryID];

    BOOL v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "setting sync library id to %{public}@", buf, 0xCu);
    }

    unsigned int v12 = [(ML3ImportOperation *)self import];
    int v13 = [v12 library];
    [v13 setSyncLibraryID:v10];
  }
  MSVDeviceOSIsInternalInstall();
  [(ML3ImportOperation *)self import];
  uint64_t v14 = [(id)objc_claimAutoreleasedReturnValue() library];
  uint64_t v15 = [v17 connection];
  ML3ImportSession::ML3ImportSession((ML3ImportSession *)buf, v14, v15, 1, 1);
}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 337) || *(unsigned char *)(v2 + 336))
  {
    id v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(unsigned __int8 *)(v4 + 337);
      int v6 = *(unsigned __int8 *)(v4 + 336);
      int v8 = 138543874;
      uint64_t v9 = v4;
      __int16 v10 = 1024;
      int v11 = v5;
      __int16 v12 = 1024;
      int v13 = v6;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Not suspending read source _importFinished %d, _isReadSourceCancelled %d", (uint8_t *)&v8, 0x18u);
    }
  }
  else
  {
    *(void *)(v2 + 328) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    int v7 = *(NSObject **)(*(void *)(a1 + 32) + 360);
    dispatch_suspend(v7);
  }
}

intptr_t __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_13(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_14(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 328) = 1;
  uint64_t v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming read source bytesRead %ld parsingLen %d", (uint8_t *)&v6, 0x1Cu);
  }

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 360));
}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_15(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 328) = 1;
  uint64_t v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming read source bytesRead %ld parsingLen %d", (uint8_t *)&v6, 0x1Cu);
  }

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 360));
}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_19(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 337) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 328))
  {
    uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming read source", (uint8_t *)&v7, 0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 328) = 1;
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 360));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 360) && !*(unsigned char *)(v2 + 336))
  {
    int v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling read source", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 336) = 1;
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 360));
  }
}

- (void)cancel
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isReadSourceCancelled = self->_isReadSourceCancelled;
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = isReadSourceCancelled;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "[ML3ProtoSyncImportOperation] cancelling import operation %{public}@ _isReadSourceCancelled %d", buf, 0x12u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ML3ProtoSyncImportOperation;
  [(ML3ProtoSyncImportOperation *)&v7 cancel];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ML3ProtoSyncImportOperation_cancel__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __37__ML3ProtoSyncImportOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 360);
  if (v3)
  {
    if (!*(unsigned char *)(v2 + 336))
    {
      dispatch_source_cancel(v3);
      *(unsigned char *)(*(void *)(a1 + 32) + 336) = 1;
    }
  }
}

- (void)main
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v3 = [(ML3ImportOperation *)self import];
  uint64_t v4 = [v3 library];
  uint64_t v5 = [v4 currentRevision];

  uint64_t v25 = v5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v21 = v23[3];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  if (([(ML3ProtoSyncImportOperation *)self isCancelled] & 1) == 0)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35__ML3ProtoSyncImportOperation_main__block_invoke;
    v17[3] = &unk_1E5FB4D98;
    v17[4] = self;
    v17[5] = &v22;
    v17[6] = &v26;
    v17[7] = &v18;
    [(ML3ImportOperation *)self _writerTransactionWithBlock:v17];
  }
  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(ML3ProtoSyncImportOperation *)self isCancelled];
    int v10 = *((unsigned __int8 *)v27 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 67109632;
    int v33 = v9;
    __int16 v34 = 1024;
    int v35 = v10;
    __int16 v36 = 2048;
    double v37 = v11 - v7;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "[ML3ProtoSyncImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  v30[0] = @"revisionBeforeImport";
  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v23[3]];
  v30[1] = @"revisionAfterImport";
  v31[0] = v12;
  int v13 = [NSNumber numberWithUnsignedLongLong:v19[3]];
  v31[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  uint64_t v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:0];
  [(ML3ImportOperation *)self setReturnData:v15];

  if (*((unsigned char *)v27 + 24)) {
    uint64_t v16 = [(ML3ProtoSyncImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v16 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v16];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

BOOL __35__ML3ProtoSyncImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "failed to start store import transaction. error=%{public}@", (uint8_t *)&v14, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    [*(id *)(a1 + 32) setError:v6];
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) import];
    int v9 = [v8 library];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 currentRevision];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _performImportWithTransaction:v5];
    int v10 = [*(id *)(a1 + 32) import];
    double v11 = [v10 library];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v11 currentRevision];
  }
  BOOL v12 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;

  return v12;
}

- (ML3ProtoSyncImportOperation)initWithDatabaseImport:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3ProtoSyncImportOperation;
  id v5 = [(ML3ImportOperation *)&v11 initWithDatabaseImport:v4];
  id v6 = v5;
  if (v5)
  {
    readSource = v5->_readSource;
    v5->_readSource = 0;

    v6->_importFinished = 0;
    v6->_BOOL isReadSourceCancelled = 0;
    v6->_readSourceState = 0;
    v6->_pairedDeviceCanProcessStandAloneCollections = [v4 pairedDeviceCanProcessStandaloneCollections];
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.amp.MediaLibrary.ML3ProtoSyncImportOperation.accessQueue", 0);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (unint64_t)importSource
{
  return 7;
}

@end