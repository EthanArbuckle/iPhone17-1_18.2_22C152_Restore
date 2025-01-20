@interface PLServerPhotoLibraryBundle
- (BOOL)bindAssetsdService:(id)a3 error:(id *)a4;
- (BOOL)calculateTotalSizeWithResult:(id)a3;
- (BOOL)shouldRelinquishToWriterOfSubitemAtURL:(id)a3;
- (NSOperationQueue)presentedItemOperationQueue;
- (PLServerPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4 backgroundJobService:(id)a5 libraryServicesDelegateClass:(Class)a6;
- (id)_newTouchCoalescer;
- (id)boundAssetsdServices;
- (id)invalidateClientsReason;
- (id)newAssetsdClient;
- (id)newBoundAssetsdServicesTable;
- (id)newChangePublisher;
- (id)newLibraryServicesManager;
- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6;
- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_touch;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4;
- (void)clearInvalidateClientsReason;
- (void)close;
- (void)invalidateClientConnectionsWithReason:(id)a3;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)relinquishPresentedItemToReader:(id)a3;
- (void)relinquishPresentedItemToWriter:(id)a3;
- (void)savePresentedItemChangesWithCompletionHandler:(id)a3;
- (void)setCloudPhotoLibraryEnabled:(BOOL)a3;
- (void)shutdownWithReason:(id)a3;
- (void)unbindAssetsdService:(id)a3;
@end

@implementation PLServerPhotoLibraryBundle

- (BOOL)bindAssetsdService:(id)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__84844;
  v13 = __Block_byref_object_dispose__84845;
  id v14 = 0;
  id v5 = a3;
  PLSafeRunWithUnfairLock();
  int v6 = *((unsigned __int8 *)v16 + 24);
  if (a4 && !*((unsigned char *)v16 + 24))
  {
    *a4 = (id) v10[5];
    int v6 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v7 = v6 != 0;

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __55__PLServerPhotoLibraryBundle_bindAssetsdService_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  if (v2[29])
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    v3 = *(void **)(a1[4] + 232);
    uint64_t v4 = *(void *)(a1[7] + 8);
    id v5 = v3;
    int v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    BOOL v7 = [v2 boundAssetsdServicesTable];
    [v7 addObject:a1[5]];
    int v6 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidateClientsReason, 0);
  objc_storeStrong((id *)&self->_lazyTouchCoalescer, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  v8 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(PLPhotoLibraryBundle *)self libraryURL];
    v10 = [v9 lastPathComponent];
    int v11 = 138412546;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Library: %@ accommodatePresentedSubitemDeletionAtURL: %@", (uint8_t *)&v11, 0x16u);
  }
  v7[2](v7, 0);
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PLPhotoLibraryBundle *)self libraryURL];
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Library: %@ moved, presentedItemDidMoveToURL: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PLPhotoLibraryBundle *)self libraryURL];
    int v7 = [v6 lastPathComponent];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Library: %@ accommodatePresentedItemDeletionWithCompletionHandler: called sending error", (uint8_t *)&v9, 0xCu);
  }
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41005 userInfo:0];
  v4[2](v4, v8);
}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PLPhotoLibraryBundle *)self libraryURL];
    int v7 = [v6 lastPathComponent];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Library: %@ savePresentedItemChangesWithCompletionHandler: called", (uint8_t *)&v8, 0xCu);
  }
  v4[2](v4, 0);
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PLPhotoLibraryBundle *)self libraryURL];
    int v7 = [v6 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Begin relinquishing library bundle %@ to writer", buf, 0xCu);
  }
  int v8 = [(PLPhotoLibraryBundle *)self bundleController];
  int v9 = [(PLPhotoLibraryBundle *)self libraryURL];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v18[0] = v9;
  v18[1] = @"Relinquishing photo library to writer";
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v17[1] = v10;
  v17[2] = v11;
  v18[2] = @"Another process is trying to modify the library bundle";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  __int16 v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41018 userInfo:v12];
  [v8 shutdownBundle:self reason:v13];
  id v14 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(PLPhotoLibraryBundle *)self libraryURL];
    v16 = [v15 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "shutdownBundle for %@ has completed. Relinquishing to writer.", buf, 0xCu);
  }
  v4[2](v4, 0);
}

- (BOOL)shouldRelinquishToWriterOfSubitemAtURL:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v4 URLByStandardizingPath];
  int v7 = [(PLPhotoLibraryBundle *)self pathManager];
  int v8 = [v7 pathsForExternalWriters];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v8;
  uint64_t v40 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (!v40)
  {
    int v30 = 0;
    goto LABEL_23;
  }
  v36 = self;
  id v37 = v4;
  uint64_t v39 = *(void *)v45;
  uint64_t v9 = *MEMORY[0x1E4F281F8];
  uint64_t v41 = *MEMORY[0x1E4F289D0];
  unint64_t v10 = 0x1E4F1C000uLL;
  uint64_t v11 = v6;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v45 != v39) {
      objc_enumerationMutation(obj);
    }
    uint64_t v42 = v12;
    uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * v12);
    id v14 = objc_msgSend(v11, "path", v36, v37);
    int v15 = [v14 hasPrefix:v13];

    if (v15) {
      break;
    }
LABEL_17:
    uint64_t v12 = v42 + 1;
    if (v42 + 1 == v40)
    {
      uint64_t v40 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (!v40)
      {
        id v6 = v11;
        int v30 = 0;
        goto LABEL_21;
      }
      goto LABEL_3;
    }
  }
  while (2)
  {
    v16 = [*(id *)(v10 + 2832) fileURLWithPath:v13 isDirectory:1];
    *(void *)buf = 0;
    id v43 = 0;
    int v17 = [v5 getRelationship:buf ofDirectoryAtURL:v16 toItemAtURL:v11 error:&v43];
    id v18 = v43;
    v19 = v18;
    if (!v17)
    {
      v20 = [v18 domain];
      if ([v20 isEqualToString:v9] && objc_msgSend(v19, "code") == 260)
      {
        uint64_t v21 = v9;
        v22 = v5;
        v23 = [v19 userInfo];
        v24 = [v23 objectForKeyedSubscript:v41];
        v25 = v11;
        int v26 = [v24 isEqual:v11];

        if (!v26)
        {
          id v5 = v22;
          uint64_t v9 = v21;
          unint64_t v10 = 0x1E4F1C000;
          uint64_t v11 = v25;
LABEL_13:

          v27 = [v11 path];
          char v28 = [v27 hasPrefix:v13];

          if ((v28 & 1) == 0) {
            goto LABEL_17;
          }
          continue;
        }
        uint64_t v11 = [v25 URLByDeletingLastPathComponent];
        v20 = v25;
        id v5 = v22;
        uint64_t v9 = v21;
        unint64_t v10 = 0x1E4F1C000;
      }

      goto LABEL_13;
    }
    break;
  }
  unint64_t v29 = *(void *)buf;

  if (v29 >= 2) {
    goto LABEL_17;
  }
  id v6 = v11;
  int v30 = 1;
LABEL_21:
  self = v36;
  id v4 = v37;
LABEL_23:

  v31 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = [(PLPhotoLibraryBundle *)self libraryURL];
    v33 = [v32 lastPathComponent];
    v34 = @" ";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v33;
    __int16 v49 = 2112;
    if (v30) {
      v34 = @" NOT ";
    }
    v50 = v34;
    __int16 v51 = 2112;
    id v52 = v4;
    _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Library: %@ should%@RelinquishToWriterOfSubitemAtURL: %@", buf, 0x20u);
  }
  return v30 ^ 1;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PLPhotoLibraryBundle *)self libraryURL];
    int v7 = [v6 lastPathComponent];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "NSFilePresenter: %@ relinquish to reader", (uint8_t *)&v8, 0xCu);
  }
  v4[2](v4, 0);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presentedItemOperationQueue;
}

- (void)setCloudPhotoLibraryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    PLCPLRecordEnableForCurrentAccount();
  }
  id v5 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
  [v5 setICloudPhotosEnabledInternal:v3];

  id v7 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
  id v6 = [v7 cplReadiness];
  [v6 processCloudPhotosLibraryStateChange:v3];
}

- (BOOL)calculateTotalSizeWithResult:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v4 = [(PLPhotoLibraryBundle *)self pathManager];
  id v5 = [v4 pathsForLibraryFilesystemSizeCalculation];

  id v6 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "calculateTotalSizeWithResult for paths %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x19F38D3B0]();
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __59__PLServerPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke;
        v15[3] = &unk_1E5870560;
        v15[4] = &buf;
        v15[5] = &v28;
        v15[6] = &v24;
        v15[7] = &v20;
        [MEMORY[0x1E4F8B908] calculateTotalSizeOfFilesAtPath:v10 calculatePurgeable:1 allocatedSize:0 result:v15];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v32 count:16];
    }
    while (v7);
  }

  (*((void (**)(id, void, uint64_t, uint64_t, uint64_t, void))v13 + 2))(v13, *(void *)(*((void *)&buf + 1) + 24), v29[3], v25[3], v21[3], 0);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);

  return 1;
}

void *__59__PLServerPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(result[4] + 8) + 24) += a2;
  *(void *)(*(void *)(result[5] + 8) + 24) += a3;
  *(void *)(*(void *)(result[6] + 8) + 24) += a4;
  *(void *)(*(void *)(result[7] + 8) + 24) += a5;
  return result;
}

- (void)unbindAssetsdService:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLSafeRunWithUnfairLock();
}

void __51__PLServerPhotoLibraryBundle_unbindAssetsdService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) boundAssetsdServicesTable];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)boundAssetsdServices
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__84844;
  uint64_t v8 = __Block_byref_object_dispose__84845;
  id v9 = 0;
  PLSafeRunWithUnfairLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __50__PLServerPhotoLibraryBundle_boundAssetsdServices__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) boundAssetsdServicesTable];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)shutdownWithReason:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413058;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2048;
    uint64_t v31 = self;
    __int16 v32 = 2080;
    v33 = "-[PLServerPhotoLibraryBundle shutdownWithReason:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ %p %s %@", buf, 0x2Au);
  }

  uint64_t v6 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(PLPhotoLibraryBundle *)self libraryURL];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = [v4 code];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v29 = (uint64_t)v8;
    __int16 v30 = 2048;
    uint64_t v31 = (PLServerPhotoLibraryBundle *)v9;
    __int16 v32 = 2112;
    v33 = (const char *)v4;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Shutting down bundle %@ with reason code %td, full reason %@", buf, 0x20u);
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __49__PLServerPhotoLibraryBundle_shutdownWithReason___block_invoke;
  v25 = &unk_1E5875E18;
  uint64_t v26 = self;
  id v10 = v4;
  id v27 = v10;
  PLSafeRunWithUnfairLock();
  [(PLServerPhotoLibraryBundle *)self invalidateClientConnectionsWithReason:v10];
  uint64_t v11 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
  uint64_t v12 = [v11 preRunningProgress];

  uint64_t v13 = [v12 totalUnitCount];
  if (v13 != [v12 completedUnitCount])
  {
    id v14 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v29 = (uint64_t)v12;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Cancelling libraryServicesManager.preRunningProgress %@", buf, 0xCu);
    }

    [v12 cancel];
  }
  int v15 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
  long long v16 = [v15 postRunningProgress];

  long long v17 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v29 = (uint64_t)v16;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling libraryServicesManager.postRunningProgress %@", buf, 0xCu);
  }

  [v16 cancel];
  v21.receiver = self;
  v21.super_class = (Class)PLServerPhotoLibraryBundle;
  [(PLPhotoLibraryBundle *)&v21 shutdownWithReason:v10];
  long long v18 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [(PLPhotoLibraryBundle *)self libraryURL];
    uint64_t v20 = [v19 lastPathComponent];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v29 = (uint64_t)v20;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Finished shutting down bundle %@", buf, 0xCu);
  }
}

void __49__PLServerPhotoLibraryBundle_shutdownWithReason___block_invoke(uint64_t a1)
{
}

- (id)invalidateClientsReason
{
  uint64_t v2 = PLSafeResultWithUnfairLock();
  return v2;
}

id __53__PLServerPhotoLibraryBundle_invalidateClientsReason__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 232);
}

- (void)clearInvalidateClientsReason
{
}

void __58__PLServerPhotoLibraryBundle_clearInvalidateClientsReason__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) libraryURL];
    id v4 = [v3 lastPathComponent];
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Allowing future bind requests for bundle %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = 0;
}

- (void)invalidateClientConnectionsWithReason:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __68__PLServerPhotoLibraryBundle_invalidateClientConnectionsWithReason___block_invoke;
  objc_super v21 = &unk_1E5875E18;
  uint64_t v22 = self;
  id v5 = v4;
  id v23 = v5;
  PLSafeRunWithUnfairLock();
  uint64_t v6 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(PLPhotoLibraryBundle *)self libraryURL];
    uint64_t v8 = [v7 lastPathComponent];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v26 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating all client connections to bundle %@", buf, 0xCu);
  }
  uint64_t v9 = [(PLServerPhotoLibraryBundle *)self boundAssetsdServices];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) invalidateConnectionWithReason:v5];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v11);
  }
  PLSafeRunWithUnfairLock();
}

void __68__PLServerPhotoLibraryBundle_invalidateClientConnectionsWithReason___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) libraryURL];
    id v4 = [v3 lastPathComponent];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Disallowing future bind requests for bundle %@", (uint8_t *)&v5, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), *(id *)(a1 + 40));
}

void __68__PLServerPhotoLibraryBundle_invalidateClientConnectionsWithReason___block_invoke_280(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) libraryURL];
    id v4 = [v3 lastPathComponent];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Removing all bound assetsd services from bundle %@", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [*(id *)(a1 + 32) boundAssetsdServicesTable];
  [v5 removeAllObjects];
}

- (void)_touch
{
  uint64_t v2 = [(PLPhotoLibraryBundle *)self pathManager];
  id v3 = [v2 photoDirectoryWithType:1];
  id v4 = (const char *)[v3 fileSystemRepresentation];

  if (v4)
  {
    utimes(v4, 0);
  }
}

- (void)close
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412802;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2048;
    objc_super v21 = self;
    __int16 v22 = 2080;
    id v23 = "-[PLServerPhotoLibraryBundle close]";
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s", buf, 0x20u);
  }

  id v4 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
  id v17 = 0;
  char v5 = [v4 finalize:&v17];
  int v6 = (PLServerPhotoLibraryBundle *)v17;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v19 = (uint64_t)v8;
      __int16 v20 = 2112;
      objc_super v21 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to finalize library services manager %@: %@", buf, 0x16u);
    }
    uint64_t v9 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
    [v9 deactivateWithInvalidationError:v6];
  }
  uint64_t v10 = [(PLPhotoLibraryBundle *)self pathManager];
  uint64_t v11 = PLLibraryIDFromPathManager();
  PLUnregisterDataStoresForLibraryID(v11);

  uint64_t v12 = (void *)MEMORY[0x1E4F8B9F8];
  uint64_t v13 = [(PLPhotoLibraryBundle *)self pathManager];
  [v12 invalidateIsSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:v13];

  v16.receiver = self;
  v16.super_class = (Class)PLServerPhotoLibraryBundle;
  [(PLPhotoLibraryBundle *)&v16 close];
  lazyTouchCoalescer = self->_lazyTouchCoalescer;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__PLServerPhotoLibraryBundle_close__block_invoke;
  v15[3] = &unk_1E5870510;
  v15[4] = self;
  [(PLLazyObject *)lazyTouchCoalescer invalidateWithHandler:v15];
}

uint64_t __35__PLServerPhotoLibraryBundle_close__block_invoke(uint64_t a1, void *a2)
{
  [a2 reset];
  id v3 = *(void **)(a1 + 32);
  return [v3 _touch];
}

- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = self;
  id v13 = a5;
  id v14 = a4;
  long long v15 = [[PLInterLibraryTransfer alloc] initWithSourceBundle:v12 destinationBundle:v14 options:v13];

  objc_super v16 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v10, "count"));
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __74__PLServerPhotoLibraryBundle_transferPersons_toBundle_options_completion___block_invoke;
  v44[3] = &unk_1E58710F0;
  id v17 = v10;
  id v45 = v17;
  id v18 = v16;
  id v46 = v18;
  uint64_t v19 = v15;
  long long v47 = v19;
  id v20 = v11;
  id v48 = v20;
  objc_super v21 = (void *)MEMORY[0x19F38D650](v44);
  __int16 v22 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    v50 = v12;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Waiting for running state on source bundle %@", buf, 0xCu);
  }

  id v23 = [(PLPhotoLibraryBundle *)v12 libraryServicesManager];
  id v43 = 0;
  char v24 = [v23 awaitLibraryState:7 error:&v43];
  id v25 = v43;

  if (v24)
  {
    uint64_t v26 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v50 = v12;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "Waiting for running state on dest bundle %@", buf, 0xCu);
    }

    uint64_t v27 = [(PLPhotoLibraryBundle *)v12 libraryServicesManager];
    id v42 = v25;
    char v28 = [v27 awaitLibraryState:7 error:&v42];
    id v29 = v42;

    if (v28)
    {
      dispatch_block_t block = v21;
      __int16 v30 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_INFO, "Enqueueing transfer operation", buf, 2u);
      }

      uint64_t v31 = NSString;
      __int16 v32 = [v17 anyObject];
      v33 = [v31 stringWithFormat:@"InterLibraryTransfer %@ (%tu)", v32, objc_msgSend(v17, "count")];

      id v34 = v33;
      id v35 = (const char *)[v34 UTF8String];
      qos_class_t v36 = qos_class_self();
      id v37 = dispatch_queue_attr_make_with_qos_class(0, v36, 0);
      v38 = dispatch_queue_create(v35, v37);

      dispatch_async(v38, block);
      id v39 = v18;

      objc_super v21 = block;
    }
    else
    {
      (*((void (**)(id, id))v20 + 2))(v20, v29);
      id v39 = 0;
    }
  }
  else
  {
    (*((void (**)(id, id))v20 + 2))(v20, v25);
    id v39 = 0;
    id v29 = v25;
  }

  return v39;
}

void __74__PLServerPhotoLibraryBundle_transferPersons_toBundle_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([*(id *)(a1 + 40) isCancelled])
        {
          id v11 = PLInterLibraryTransferGetLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Person transfer operation cancelled", buf, 2u);
          }

          uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v13 = *MEMORY[0x1E4F8C500];
          uint64_t v22 = *MEMORY[0x1E4F28228];
          id v23 = @"Person transfer operation cancelled";
          id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          uint64_t v15 = [v12 errorWithDomain:v13 code:41031 userInfo:v14];

          id v5 = (id)v15;
          goto LABEL_15;
        }

        uint64_t v9 = *(void **)(a1 + 48);
        id v16 = 0;
        int v10 = [v9 transferPersonWithUuid:v8 error:&v16];
        id v5 = v16;
        if (!v10) {
          goto LABEL_15;
        }
        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }
LABEL_15:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = self;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [[PLInterLibraryTransfer alloc] initWithSourceBundle:v12 destinationBundle:v14 options:v13];

  id v16 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v10, "count"));
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __73__PLServerPhotoLibraryBundle_transferAssets_toBundle_options_completion___block_invoke;
  v44[3] = &unk_1E58710F0;
  id v17 = v10;
  id v45 = v17;
  id v18 = v16;
  id v46 = v18;
  long long v19 = v15;
  long long v47 = v19;
  id v20 = v11;
  id v48 = v20;
  long long v21 = (void *)MEMORY[0x19F38D650](v44);
  uint64_t v22 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    v50 = v12;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Waiting for running state on source bundle %@", buf, 0xCu);
  }

  id v23 = [(PLPhotoLibraryBundle *)v12 libraryServicesManager];
  id v43 = 0;
  char v24 = [v23 awaitLibraryState:7 error:&v43];
  id v25 = v43;

  if (v24)
  {
    uint64_t v26 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v50 = v12;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "Waiting for running state on dest bundle %@", buf, 0xCu);
    }

    uint64_t v27 = [(PLPhotoLibraryBundle *)v12 libraryServicesManager];
    id v42 = v25;
    char v28 = [v27 awaitLibraryState:7 error:&v42];
    id v29 = v42;

    if (v28)
    {
      dispatch_block_t block = v21;
      __int16 v30 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_INFO, "Enqueueing transfer operation", buf, 2u);
      }

      uint64_t v31 = NSString;
      __int16 v32 = [v17 anyObject];
      v33 = [v31 stringWithFormat:@"InterLibraryTransfer %@ (%tu)", v32, objc_msgSend(v17, "count")];

      id v34 = v33;
      id v35 = (const char *)[v34 UTF8String];
      qos_class_t v36 = qos_class_self();
      id v37 = dispatch_queue_attr_make_with_qos_class(0, v36, 0);
      v38 = dispatch_queue_create(v35, v37);

      dispatch_async(v38, block);
      id v39 = v18;

      long long v21 = block;
    }
    else
    {
      (*((void (**)(id, id))v20 + 2))(v20, v29);
      id v39 = 0;
    }
  }
  else
  {
    (*((void (**)(id, id))v20 + 2))(v20, v25);
    id v39 = 0;
    id v29 = v25;
  }

  return v39;
}

void __73__PLServerPhotoLibraryBundle_transferAssets_toBundle_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([*(id *)(a1 + 40) isCancelled])
        {
          id v11 = PLInterLibraryTransferGetLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Asset transfer operation cancelled", buf, 2u);
          }

          uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v13 = *MEMORY[0x1E4F8C500];
          uint64_t v22 = *MEMORY[0x1E4F28228];
          id v23 = @"Asset transfer operation cancelled";
          id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          uint64_t v15 = [v12 errorWithDomain:v13 code:41031 userInfo:v14];

          id v5 = (id)v15;
          goto LABEL_15;
        }

        uint64_t v9 = *(void **)(a1 + 48);
        id v16 = 0;
        int v10 = [v9 transferAssetWithUuid:v8 error:&v16];
        id v5 = v16;
        if (!v10) {
          goto LABEL_15;
        }
        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }
LABEL_15:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_newTouchCoalescer
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x1E4F8A220];
  dispatch_queue_t v4 = dispatch_queue_create("bundle-root-touch", 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PLServerPhotoLibraryBundle__newTouchCoalescer__block_invoke;
  v7[3] = &unk_1E58704E8;
  objc_copyWeak(&v8, &location);
  id v5 = [v3 setCoalescerWithLabel:@"com.apple.photos.bundlerootupdate" target:self queue:v4 action:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

void __48__PLServerPhotoLibraryBundle__newTouchCoalescer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v7 = [v5 activityToken];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _touch];

  [v7 endActivity];
  [v5 delayNextInvocationByTimeInterval:15.0];
}

- (id)newBoundAssetsdServicesTable
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newLibraryServicesManager
{
  uint64_t v3 = [PLLibraryServicesManager alloc];
  backgroundJobService = self->_backgroundJobService;
  id v5 = [(PLPhotoLibraryBundle *)self bundleController];
  uint64_t v6 = [v5 cacheDeleteRegistration];
  id v7 = [(PLLibraryServicesManager *)v3 initWithLibraryBundle:self backgroundJobService:backgroundJobService cacheDeleteRegistration:v6 delegateClass:self->_libraryServicesDelegateClass];

  return v7;
}

- (id)newChangePublisher
{
  return objc_alloc_init(PLServerChangePublisher);
}

- (id)newAssetsdClient
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"PLAssetsdClient must not be used by assetsd" userInfo:0];
  objc_exception_throw(v2);
}

- (PLServerPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4 backgroundJobService:(id)a5 libraryServicesDelegateClass:(Class)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PLServerPhotoLibraryBundle;
  uint64_t v13 = [(PLPhotoLibraryBundle *)&v26 initWithLibraryURL:v10 bundleController:v11];
  id v14 = v13;
  if (v13)
  {
    v13->_libraryServicesDelegateClass = a6;
    objc_storeStrong((id *)&v13->_backgroundJobService, a5);
    uint64_t v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    presentedItemOperationQueue = v14->_presentedItemOperationQueue;
    v14->_presentedItemOperationQueue = v15;

    id v17 = objc_initWeak(&location, v14);
    id v18 = objc_alloc(MEMORY[0x1E4F8B948]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __116__PLServerPhotoLibraryBundle_initWithLibraryURL_bundleController_backgroundJobService_libraryServicesDelegateClass___block_invoke;
    v23[3] = &unk_1E5874070;
    objc_copyWeak(&v24, &location);
    uint64_t v19 = [v18 initWithBlock:v23];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    lazyTouchCoalescer = v14->_lazyTouchCoalescer;
    v14->_lazyTouchCoalescer = (PLLazyObject *)v19;

    long long v21 = v14;
  }

  return v14;
}

id __116__PLServerPhotoLibraryBundle_initWithLibraryURL_bundleController_backgroundJobService_libraryServicesDelegateClass___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained _newTouchCoalescer];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end