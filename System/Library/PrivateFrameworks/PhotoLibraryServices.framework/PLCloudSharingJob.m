@interface PLCloudSharingJob
+ (id)highPriorityOperationQueue;
+ (id)lowPriorityOperationQueue;
+ (id)recoveredEventsWithPathManager:(id)a3;
+ (void)deleteAllRecoveryEventsWithPathManager:(id)a3;
- (BOOL)shouldArchiveXPCToDisk;
- (BOOL)shouldPrioritize;
- (PLCloudSharingJob)initWithAssetsdClient:(id)a3;
- (PLPhotoLibrary)transientPhotoLibrary;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (void)archiveXPCToDisk:(id)a3;
- (void)runAndWaitForMessageToBeSent;
- (void)runDaemonSide;
- (void)setShouldPrioritize:(BOOL)a3;
@end

@implementation PLCloudSharingJob

- (void).cxx_destruct
{
}

- (void)setShouldPrioritize:(BOOL)a3
{
  self->_shouldPrioritize = a3;
}

- (BOOL)shouldPrioritize
{
  return self->_shouldPrioritize;
}

- (void)runAndWaitForMessageToBeSent
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  [(PLDaemonJob *)self sendToAssetsd];
  double v4 = CFAbsoluteTimeGetCurrent();
  v5 = [(PLDaemonJob *)self assetsdClient];
  [v5 waitUntilConnectionSendsAllMessages];

  v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    double v8 = v4 - Current;
    __int16 v9 = 2048;
    double v10 = CFAbsoluteTimeGetCurrent() - v4;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "runAndWaitForMessageToBeSent sendToAssetsd time %f waitUntilConnectionSendsAllMessages time %f", (uint8_t *)&v7, 0x16u);
  }
}

- (void)runDaemonSide
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_archiveFilename)
  {
    v3 = [(PLDaemonJob *)self libraryServicesManager];
    double v4 = [v3 modelMigrator];
    v5 = [v4 pathManager];
    v6 = [v5 cloudSharingArchiveDirectory];

    int v7 = [v6 stringByAppendingPathComponent:self->_archiveFilename];
    double v8 = objc_opt_new();
    [v8 removeItemAtPath:v7 error:0];

    __int16 v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Deleted archive %@", buf, 0xCu);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)PLCloudSharingJob;
  [(PLDaemonJob *)&v10 runDaemonSide];
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLCloudSharingJob;
  int v7 = [(PLDaemonJob *)&v11 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    uint64_t v8 = PLStringFromXPCDictionary();
    __int16 v9 = (void *)v7[8];
    v7[8] = v8;

    *((unsigned char *)v7 + 72) = xpc_dictionary_get_BOOL(v6, "PLCloudSharingJob_shouldPrioritize");
  }
  +[PLPhotoSharingHelper initializeMSPlatform];

  return v7;
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 1;
}

- (void)archiveXPCToDisk:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F38D3B0]();
  unint64_t v6 = atomic_fetch_add(&archiveXPCToDisk__archiveCounter, 1uLL) + 1;
  double Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(NSString, "stringWithFormat:", @"%f.%lld.job", *(void *)&Current, v6);
  id v8 = objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v4, "PLCloudSharingJob_archiveFilename", (const char *)[v8 UTF8String]);
  xpc_dictionary_set_BOOL(v4, "PLCloudSharingJob_shouldPrioritize", self->_shouldPrioritize);
  __int16 v9 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v46 = 0;
  objc_super v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v46];
  id v11 = v46;
  v12 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  uint64_t v13 = [v12 cloudSharingArchiveDirectory];

  v14 = [v13 stringByAppendingPathComponent:v8];
  if (!v10) {
    goto LABEL_6;
  }
  if ([v10 writeToFile:v14 options:1073741825 error:0]) {
    goto LABEL_4;
  }
  v15 = objc_opt_new();
  id v45 = v11;
  [v15 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v45];
  id v16 = v45;
  v17 = v11;
  id v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v5;
  id v22 = v16;

  char v23 = [v10 writeToFile:v14 options:1073741825 error:0];
  id v24 = v22;
  v5 = v21;
  __int16 v9 = v20;
  self = v19;
  id v8 = v18;
  id v11 = v24;
  if (v23)
  {
LABEL_4:
    v25 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v43 = v11;
      id v26 = v8;
      v27 = self;
      v28 = v9;
      v29 = v5;
      v30 = objc_opt_class();
      id v42 = v30;
      CFAbsoluteTime v31 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218754;
      v48 = v27;
      id v8 = v26;
      id v11 = v43;
      __int16 v49 = 2112;
      v50 = v30;
      v5 = v29;
      __int16 v9 = v28;
      __int16 v51 = 2112;
      v52 = v14;
      __int16 v53 = 2048;
      double v54 = v31 - Current;
      v32 = "Archived <%p>%@ to %@ in %f";
      v33 = v25;
      os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
      uint32_t v35 = 42;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v33, v34, v32, buf, v35);
    }
  }
  else
  {
LABEL_6:
    v25 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v44 = v11;
      id v36 = v8;
      v37 = self;
      v38 = v9;
      v39 = v5;
      v40 = objc_opt_class();
      id v42 = v40;
      uint64_t v41 = [v10 length];
      *(_DWORD *)buf = 134219266;
      v48 = v37;
      id v8 = v36;
      id v11 = v44;
      __int16 v49 = 2112;
      v50 = v40;
      v5 = v39;
      __int16 v9 = v38;
      __int16 v51 = 2048;
      v52 = v38;
      __int16 v53 = 2048;
      double v54 = *(double *)&v41;
      __int16 v55 = 2112;
      v56 = v14;
      __int16 v57 = 2112;
      id v58 = v44;
      v32 = "ERROR: archiving <%p>%@ (plist %p data %lu) to %@: %@";
      v33 = v25;
      os_log_type_t v34 = OS_LOG_TYPE_ERROR;
      uint32_t v35 = 62;
      goto LABEL_8;
    }
  }
}

- (PLPhotoLibrary)transientPhotoLibrary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v3 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v3 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v3 setAutomaticallyPinToFirstFetch:0];
  id v4 = [(PLDaemonJob *)self libraryServicesManager];
  v5 = [v4 libraryBundle];
  id v10 = 0;
  id v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLCloudSharingJob transientPhotoLibrary]", v5, v3, &v10);
  id v7 = v10;

  if (!v6)
  {
    id v8 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error creating context: %@", buf, 0xCu);
    }
  }
  return (PLPhotoLibrary *)v6;
}

- (PLCloudSharingJob)initWithAssetsdClient:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharingJob;
  result = [(PLDaemonJob *)&v4 initWithAssetsdClient:a3];
  if (result) {
    result->_shouldPrioritize = 0;
  }
  return result;
}

+ (void)deleteAllRecoveryEventsWithPathManager:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Deleting all recovery events!", buf, 2u);
  }

  v5 = [v3 cloudSharingArchiveDirectory];
  id v6 = objc_opt_new();
  id v27 = 0;
  id v7 = [v6 contentsOfDirectoryAtPath:v5 error:&v27];
  id v8 = v27;
  if (v7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    __int16 v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v19 = v8;
      v20 = v7;
      id v21 = v3;
      id v12 = 0;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          id v22 = v12;
          char v16 = [v6 removeItemAtPath:v15 error:&v22];
          id v17 = v22;

          if (v16)
          {
            id v12 = v17;
          }
          else
          {
            id v18 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v15;
              __int16 v31 = 2112;
              id v32 = v17;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unable to delete recovery event file %@: %@", buf, 0x16u);
            }

            id v12 = 0;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);

      id v7 = v20;
      id v3 = v21;
      id v8 = v19;
    }
  }
  else
  {
    __int16 v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v5;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unable to find recovery events file under %@: %@", buf, 0x16u);
    }
  }
}

+ (id)recoveredEventsWithPathManager:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [MEMORY[0x1E4F1CA48] array];
  long long v26 = v3;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [v3 cloudSharingArchiveDirectory];
  __int16 v31 = objc_opt_new();
  v5 = [v31 contentsOfDirectoryAtPath:v4 error:0];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    uint64_t v33 = *MEMORY[0x1E4F8C338];
    v28 = v4;
    id v29 = v7;
    uint64_t v32 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v9;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x19F38D3B0]();
        if ([v12 hasSuffix:@".job"])
        {
          v14 = [v4 stringByAppendingPathComponent:v12];
          v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
          char v16 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v15];
          unsigned __int16 v34 = 0;
          [v16 getUInt16:&v34 forKey:v33];
          if (v34 > 2u) {
            goto LABEL_12;
          }
          [MEMORY[0x1E4F8B900] persistUInt16:(unsigned __int16)(v34 + 1) forKey:v33 fileURL:v15];
          id v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v14 options:1 error:0];
          if ([v17 length])
          {
            id v18 = v17;
            [v18 bytes];
            [v18 length];
            uint64_t v19 = xpc_create_from_plist();
            if (v19)
            {
              v20 = (void *)v19;
              [v27 addObject:v19];

              objc_super v4 = v28;
              id v7 = v29;
              uint64_t v9 = v30;
LABEL_16:

              uint64_t v10 = v32;
              goto LABEL_17;
            }
          }

          objc_super v4 = v28;
          id v7 = v29;
          uint64_t v9 = v30;
          if (v34 >= 3u)
          {
LABEL_12:
            id v21 = v7;
            id v22 = v4;
            long long v23 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v12;
              _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Deleting recovered event %@ because of too many recovery attempts", buf, 0xCu);
            }

            objc_super v4 = v22;
            id v7 = v21;
          }
          [v31 removeItemAtPath:v14 error:0];
          goto LABEL_16;
        }
LABEL_17:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v9);
  }

  long long v24 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v27;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "recoveredEvents %@", buf, 0xCu);
  }

  return v27;
}

+ (id)highPriorityOperationQueue
{
  pl_dispatch_once();
  v2 = (void *)highPriorityOperationQueue_serialOperationQueue;
  return v2;
}

uint64_t __47__PLCloudSharingJob_highPriorityOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)highPriorityOperationQueue_serialOperationQueue;
  highPriorityOperationQueue_serialOperationQueue = (uint64_t)v0;

  [(id)highPriorityOperationQueue_serialOperationQueue setMaxConcurrentOperationCount:1];
  v2 = (void *)highPriorityOperationQueue_serialOperationQueue;
  return [v2 setQualityOfService:25];
}

+ (id)lowPriorityOperationQueue
{
  pl_dispatch_once();
  v2 = (void *)lowPriorityOperationQueue_serialOperationQueue;
  return v2;
}

uint64_t __46__PLCloudSharingJob_lowPriorityOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)lowPriorityOperationQueue_serialOperationQueue;
  lowPriorityOperationQueue_serialOperationQueue = (uint64_t)v0;

  [(id)lowPriorityOperationQueue_serialOperationQueue setMaxConcurrentOperationCount:1];
  v2 = (void *)lowPriorityOperationQueue_serialOperationQueue;
  return [v2 setQualityOfService:9];
}

@end