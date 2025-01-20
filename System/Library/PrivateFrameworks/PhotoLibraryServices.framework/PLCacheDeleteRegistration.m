@interface PLCacheDeleteRegistration
+ (id)cacheDeleteUrgencySpecialCasePhotoLibrary;
+ (void)registerDefaultHandlers;
+ (void)registerSpecialCaseHandler;
- (PLCacheDeleteRegistration)init;
- (id)_getInternalQueue;
- (void)_processRemovedFiles:(id)a3 withCacheDeleteSupport:(id)a4 forLibraryURL:(id)a5;
- (void)_registerResourceDirectories;
- (void)_replaceCameraWatcherWith:(id)a3;
- (void)_setCacheDeleteSupport:(id)a3 forLibrary:(id)a4;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)registerCacheDeleteSupport:(id)a3 withLibraryServicesManager:(id)a4;
- (void)unregisterCacheDeleteSupport:(id)a3 withLibraryServicesManager:(id)a4;
@end

@implementation PLCacheDeleteRegistration

- (void)cameraWatcherDidChangeState:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(queue) = [v5 isCameraRunning];

  if ((queue & 1) == 0 && self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary)
  {
    v6 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Camera preview stopped, processing ccd purge notifications now", buf, 2u);
    }

    fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary = self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PLCacheDeleteRegistration_cameraWatcherDidChangeState___block_invoke;
    v9[3] = &unk_1E5868350;
    v9[4] = self;
    [(NSMutableDictionary *)fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary enumerateKeysAndObjectsUsingBlock:v9];
    v8 = self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary;
    self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationIDsByLibraryURL, 0);
  objc_storeStrong((id *)&self->_cacheDeleteSupportByLibraryURL, 0);
}

- (void)_setCacheDeleteSupport:(id)a3 forLibrary:(id)a4
{
}

- (id)_getInternalQueue
{
  return self->_queue;
}

- (void)_replaceCameraWatcherWith:(id)a3
{
  v4 = (PFCameraViewfinderSessionWatcher *)a3;
  [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher stopWatching];
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v4;
}

void __57__PLCacheDeleteRegistration_cameraWatcherDidChangeState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a3;
  id v6 = [v4 objectForKeyedSubscript:a2];
  [v6 markAsNotLocallyAvailableForResourcesWithFileIDsToPath:v5];
}

- (void)_processRemovedFiles:(id)a3 withCacheDeleteSupport:(id)a4 forLibraryURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__PLCacheDeleteRegistration__processRemovedFiles_withCacheDeleteSupport_forLibraryURL___block_invoke;
  v15[3] = &unk_1E5875BF8;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __87__PLCacheDeleteRegistration__processRemovedFiles_withCacheDeleteSupport_forLibraryURL___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Processing %ld events", buf, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    v26 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"rescan", v26);

        if (v10)
        {
          id v14 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Missing history events, rescanning whole file system", buf, 2u);
          }

          PLSimulateCrash();
          [*(id *)(*(void *)(a1 + 40) + 8) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_80];
          id v4 = v26;
          [v26 removeAllObjects];
          goto LABEL_21;
        }
        v11 = [v9 objectForKeyedSubscript:@"historyDone"];

        if (v11)
        {
          v15 = PLResourceCachingGetLog();
          id v4 = v26;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "No more purge events to handle", buf, 2u);
          }

          goto LABEL_21;
        }
        id v12 = [v9 objectForKeyedSubscript:@"path"];
        id v13 = [v9 objectForKeyedSubscript:@"fileID"];
        if ([*(id *)(a1 + 48) isFilePurgedForFileID:v13 purgedPath:v12]) {
          [v26 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v4 = v26;
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  if ([*(id *)(*(void *)(a1 + 40) + 32) isCameraRunning])
  {
    id v16 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Camera preview is running, delaying acting on purge notification till preview stops", buf, 2u);
    }

    v17 = *(void **)(*(void *)(a1 + 40) + 40);
    if (!v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v19 = *(void *)(a1 + 40);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      v17 = *(void **)(*(void *)(a1 + 40) + 40);
    }
    v21 = [v17 objectForKeyedSubscript:*(void *)(a1 + 56)];

    if (!v21)
    {
      v22 = [MEMORY[0x1E4F1CA60] dictionary];
      [*(id *)(*(void *)(a1 + 40) + 40) setObject:v22 forKeyedSubscript:*(void *)(a1 + 56)];
    }
    v23 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:*(void *)(a1 + 56)];
    unint64_t v24 = [v23 count];

    if (v24 >> 4 > 0x270)
    {
      v25 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = (uint64_t)v4;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "More than 10,000 ccd notifications already pending, ignoring these: %@", buf, 0xCu);
      }
    }
    else
    {
      v25 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:*(void *)(a1 + 56)];
      [v25 addEntriesFromDictionary:v4];
    }
  }
  else
  {
    [*(id *)(a1 + 48) markAsNotLocallyAvailableForResourcesWithFileIDsToPath:v4];
  }
}

uint64_t __87__PLCacheDeleteRegistration__processRemovedFiles_withCacheDeleteSupport_forLibraryURL___block_invoke_78(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 rescanResourcesFromFileSystem];
}

- (void)_registerResourceDirectories
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  cacheDeleteSupportByLibraryURL = self->_cacheDeleteSupportByLibraryURL;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke;
  v16[3] = &unk_1E58682E0;
  id v5 = v3;
  id v17 = v5;
  [(NSMutableDictionary *)cacheDeleteSupportByLibraryURL enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v6 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Current resource directories %@", buf, 0xCu);
  }

  uint64_t v18 = @"CACHE_DELETE_PURGE_NOTIFICATION";
  id v19 = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_69;
  v15[3] = &unk_1E5868308;
  void v15[4] = self;
  id v8 = (void *)MEMORY[0x19F38D650](v15);
  int v9 = CacheDeleteRegister();
  id v10 = PLResourceCachingGetLog();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v12 = "Failed to register with CacheDelete for purge notifications";
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v13, v14, v12, buf, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v12 = "Registered for CacheDelete purge notifications";
    id v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
}

void __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a3 purgeableDirectories];
  id v4 = [v5 allObjects];
  [v3 addObjectsFromArray:v4];
}

uint64_t __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_69(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = a2;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "got notifications: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_70;
  v8[3] = &unk_1E58682E0;
  v8[4] = v5;
  return [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  id v8 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "enumerating directories for notification ID: %{public}@", buf, 0xCu);
  }

  int v9 = [v6 purgeableDirectories];
  uint64_t v10 = [v9 allObjects];
  id v13 = v5;
  id v11 = v5;
  id v12 = v6;
  CacheDeleteEnumerateRemovedFilesInDirectories();
}

uint64_t __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_71(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _processRemovedFiles:a2 withCacheDeleteSupport:*(void *)(a1 + 40) forLibraryURL:*(void *)(a1 + 48)];
}

- (void)unregisterCacheDeleteSupport:(id)a3 withLibraryServicesManager:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__PLCacheDeleteRegistration_unregisterCacheDeleteSupport_withLibraryServicesManager___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __85__PLCacheDeleteRegistration_unregisterCacheDeleteSupport_withLibraryServicesManager___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pathManager];
  id v3 = [v2 libraryURL];
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:0 forKeyedSubscript:v3];
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:0 forKeyedSubscript:v3];
    if ([*(id *)(*(void *)(a1 + 40) + 8) count]) {
      [*(id *)(a1 + 40) _registerResourceDirectories];
    }
    else {
      CacheDeleteRegister();
    }
  }
  else
  {
    id v4 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Missing libraryURL to unregister ", v5, 2u);
    }
  }
}

- (void)registerCacheDeleteSupport:(id)a3 withLibraryServicesManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PLCacheDeleteRegistration_registerCacheDeleteSupport_withLibraryServicesManager___block_invoke;
  block[3] = &unk_1E5873A50;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __83__PLCacheDeleteRegistration_registerCacheDeleteSupport_withLibraryServicesManager___block_invoke(id *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] pathManager];
  id v3 = [v2 libraryURL];
  if (v3)
  {
    id v4 = [v2 capabilities];
    char v5 = [v4 isCentralizedCacheDeleteCapable];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F8B8D8];
      id v7 = [v3 path];
      id v8 = [v6 mountPointForPath:v7];

      if (!v8)
      {
        id v17 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v30 = v3;
          uint64_t v18 = "Failed to get mount point for libraryURL %@";
LABEL_34:
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
        }
LABEL_35:

        goto LABEL_36;
      }
      id v9 = [*((id *)a1[5] + 1) objectForKeyedSubscript:v3];

      id v10 = PLResourceCachingGetLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (!v11) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 138412290;
        long long v30 = v3;
        id v12 = "Replacing cache delete support for libraryURL %@";
      }
      else
      {
        if (!v11) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 138412290;
        long long v30 = v3;
        id v12 = "Adding cache delete support for libraryURL %@";
      }
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_17:

      [*((id *)a1[5] + 1) setObject:a1[6] forKeyedSubscript:v3];
      if ([a1[4] wellKnownPhotoLibraryIdentifier] == 1)
      {
        id v17 = @"com.apple.assetsd.purgeNotification";
LABEL_21:
        [*((id *)a1[5] + 2) setObject:v17 forKeyedSubscript:v3];
        id v19 = [a1[6] purgeableDirectories];
        v20 = [v19 allObjects];

        id v21 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          long long v30 = v3;
          __int16 v31 = 2112;
          v32 = v8;
          __int16 v33 = 2112;
          uint64_t v34 = v20;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Listen for purge notifications on libraryURL %@ (mount point: %@) and resource directories %@", buf, 0x20u);
        }

        CacheDeleteInitPurgeMarker();
        [a1[5] _registerResourceDirectories];
        uint64_t v22 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Processing purging events at start up", buf, 2u);
        }

        id v26 = a1[6];
        id v27 = v3;
        CacheDeleteEnumerateRemovedFilesInDirectories();

        goto LABEL_35;
      }
      if ([a1[4] wellKnownPhotoLibraryIdentifier] == 3)
      {
        id v17 = objc_msgSend(@"com.apple.assetsd.purgeNotification", "stringByAppendingFormat:", @".%lu", objc_msgSend(a1[4], "wellKnownPhotoLibraryIdentifier"));
        if (v17) {
          goto LABEL_21;
        }
      }
      else
      {
        id v28 = 0;
        v23 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v3 createIfMissing:1 error:&v28];
        unint64_t v24 = v28;
        if (v23)
        {
          v25 = [v23 uuid];
          id v17 = [@"com.apple.assetsd.purgeNotification" stringByAppendingFormat:@".%@", v25];
        }
        else
        {
          v25 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            long long v30 = v3;
            __int16 v31 = 2112;
            v32 = v24;
            _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Unable to get library identifier for cache delete purge notification ID: %@, error: %@", buf, 0x16u);
          }
          id v17 = 0;
        }

        if (v17) {
          goto LABEL_21;
        }
      }
      id v17 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v30 = v3;
        uint64_t v18 = "Couldn't derive purgeNotificationID for libraryURL %@";
        goto LABEL_34;
      }
      goto LABEL_35;
    }
    id v8 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v30 = v3;
      id v13 = "%@ does not support CCD";
      id v14 = v8;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    id v8 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v13 = "Missing libraryURL to listen for purge notifications";
      id v14 = v8;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 2;
LABEL_11:
      _os_log_impl(&dword_19B3C7000, v14, v15, v13, buf, v16);
    }
  }
LABEL_36:
}

uint64_t __83__PLCacheDeleteRegistration_registerCacheDeleteSupport_withLibraryServicesManager___block_invoke_56(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _processRemovedFiles:a2 withCacheDeleteSupport:*(void *)(a1 + 40) forLibraryURL:*(void *)(a1 + 48)];
}

- (PLCacheDeleteRegistration)init
{
  v13.receiver = self;
  v13.super_class = (Class)PLCacheDeleteRegistration;
  v2 = [(PLCacheDeleteRegistration *)&v13 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cacheDeleteSupportByLibraryURL = v2->_cacheDeleteSupportByLibraryURL;
    v2->_cacheDeleteSupportByLibraryURL = v3;

    char v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notificationIDsByLibraryURL = v2->_notificationIDsByLibraryURL;
    v2->_notificationIDsByLibraryURL = v5;

    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.cacheDelete", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F8CBE8]) initWithDispatchQueue:v2->_queue delegate:v2];
    cameraWatcher = v2->_cameraWatcher;
    v2->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v10;

    [(PFCameraViewfinderSessionWatcher *)v2->_cameraWatcher startWatching];
  }
  return v2;
}

+ (id)cacheDeleteUrgencySpecialCasePhotoLibrary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v3 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:1];
  id v4 = [v2 openBundleAtLibraryURL:v3];

  char v5 = [v4 libraryServicesManager];
  id v14 = 0;
  int v6 = [v5 activate:&v14];
  id v7 = v14;
  id v8 = v7;
  if (v6
    && (v7,
        id v13 = 0,
        int v9 = [v5 awaitLibraryState:7 error:&v13],
        id v8 = v13,
        v9))
  {
    uint64_t v10 = [v5 databaseContext];
    BOOL v11 = (void *)[v10 newShortLivedLibraryWithName:"CacheDelete UrgencySpecialCase"];
  }
  else
  {
    uint64_t v10 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to photo library for CacheDelete: %@", buf, 0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

+ (void)registerSpecialCaseHandler
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke;
  v13[3] = &__block_descriptor_40_e45_____CFDictionary__20__0i8____CFDictionary__12l;
  v13[4] = a1;
  id v3 = (void *)MEMORY[0x19F38D650](v13, a2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke_41;
  v12[3] = &__block_descriptor_40_e45_____CFDictionary__20__0i8____CFDictionary__12l;
  v12[4] = a1;
  id v4 = (void *)MEMORY[0x19F38D650](v12);
  int v5 = CacheDeleteRegister();
  int v6 = PLResourceCachingGetLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v11 = 0;
      id v8 = "Failed to register with CacheDelete for purge UrgencySpecialCase";
      int v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v9, v10, v8, v11, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v11 = 0;
    id v8 = "Registered with CacheDelete for purge UrgencySpecialCase";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
}

uint64_t __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = PLResourceCachingGetLog();
  id v7 = v6;
  if (a2 != 4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Called by CacheDelete to purge but NOT UrgencySpecialCase...", buf, 2u);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    *(_DWORD *)buf = 138543362;
    unint64_t v26 = (unint64_t)v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Called by CacheDelete to purge UrgencySpecialCase... amount: %{public}@", buf, 0xCu);
  }
  id v7 = [*(id *)(a1 + 32) cacheDeleteUrgencySpecialCasePhotoLibrary];
  if (!infoVolumeMatchesLibrary(v5, v7))
  {
    uint64_t v18 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "CacheDelete purge volume does not match the photo library", buf, 2u);
    }

LABEL_16:
    unint64_t v13 = 0;
    goto LABEL_17;
  }
  int v9 = [v7 thumbnailManager];
  os_log_type_t v10 = [v7 managedObjectContext];
  uint64_t v11 = [v9 removeAllThumbnailsInContextForUrgentCacheDeleteRequest:v10 dryRun:0 count:0];

  id v12 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "purged for CacheDelete UrgencySpecialCase: %lld in thumbnails", buf, 0xCu);
  }

  unint64_t v13 = v11 & ~(v11 >> 63);
  id v14 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  unint64_t v15 = [v14 unsignedLongLongValue];

  if (v15 > v13)
  {
    unint64_t v16 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:v15 - v13 shouldFreeSpace:1 shouldKeepRecentlyViewedAssets:0 fromPhotoLibrary:v7];
    uint64_t v17 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = v16;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "purged for CacheDelete UrgencySpecialCase: %llu in shared streams", buf, 0xCu);
    }

    v13 += v16;
  }
LABEL_17:

  id v19 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v23[1] = @"CACHE_DELETE_AMOUNT";
  v24[0] = v19;
  v20 = [NSNumber numberWithLongLong:v13];
  v24[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v21;
}

uint64_t __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke_41(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 != 4)
  {
    int v6 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Called by CacheDelete to find purgeable but NOT UrgencySpecialCase", buf, 2u);
    }
    goto LABEL_13;
  }
  int v6 = [*(id *)(a1 + 32) cacheDeleteUrgencySpecialCasePhotoLibrary];
  if (!infoVolumeMatchesLibrary(v5, v6))
  {
    unint64_t v13 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "CacheDelete purgeable volume does not match the photo library", buf, 2u);
    }

LABEL_13:
    unint64_t v12 = 0;
    goto LABEL_14;
  }
  id v7 = [v6 thumbnailManager];
  uint64_t v8 = [v7 removeAllThumbnailsInContextForUrgentCacheDeleteRequest:0 dryRun:1 count:0];

  int v9 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Called by CacheDelete to find purgeable for UrgencySpecialCase: %lld in thumbnails", buf, 0xCu);
  }

  unint64_t v10 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:0 shouldFreeSpace:0 shouldKeepRecentlyViewedAssets:0 fromPhotoLibrary:v6];
  uint64_t v11 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = v10;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Called by CacheDelete to find purgeable for UrgencySpecialCase: %llu in shared streams", buf, 0xCu);
  }

  unint64_t v12 = v10 + v8;
LABEL_14:

  id v14 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v18[1] = @"CACHE_DELETE_AMOUNT";
  v19[0] = v14;
  unint64_t v15 = [NSNumber numberWithLongLong:v12];
  v19[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v16;
}

+ (void)registerDefaultHandlers
{
  v2 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "CacheDelete registerDefaultHandler", v3, 2u);
  }

  CacheDeleteRegister();
}

@end