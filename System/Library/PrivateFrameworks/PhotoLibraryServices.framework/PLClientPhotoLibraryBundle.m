@interface PLClientPhotoLibraryBundle
- (BOOL)calculateTotalSizeWithResult:(id)a3;
- (PLClientPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4;
- (id)clientSandboxExtensionCache;
- (id)newAssetsdClient;
- (id)newBoundAssetsdServicesTable;
- (id)newChangePublisher;
- (id)newLibraryServicesManager;
- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6;
- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_handleLibraryBecameUnavailable:(id)a3 reason:(id)a4;
- (void)_initClientSandboxExtensionCache;
- (void)_invalidateClientSandboxExtensionCache;
- (void)_setCloudPhotoLibraryEnabled:(BOOL)a3 sync:(BOOL)a4;
- (void)close;
- (void)setCloudPhotoLibraryEnabled:(BOOL)a3;
- (void)setCloudPhotoLibraryEnabledSync:(BOOL)a3;
- (void)setPhotoStreamEnabled:(BOOL)a3;
- (void)setSharedAlbumEnabled:(BOOL)a3;
@end

@implementation PLClientPhotoLibraryBundle

- (PLClientPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PLClientPhotoLibraryBundle;
  v4 = [(PLPhotoLibraryBundle *)&v7 initWithLibraryURL:a3 bundleController:a4];
  v5 = v4;
  if (v4) {
    [(PLClientPhotoLibraryBundle *)v4 _initClientSandboxExtensionCache];
  }
  return v5;
}

- (void)_initClientSandboxExtensionCache
{
  id v3 = objc_initWeak(&location, self);

  id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PLClientPhotoLibraryBundle__initClientSandboxExtensionCache__block_invoke;
  v7[3] = &unk_1E5874070;
  objc_copyWeak(&v8, &location);
  v5 = (PLLazyObject *)[v4 initWithBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  lazyClientSandboxExtensionCache = self->_lazyClientSandboxExtensionCache;
  self->_lazyClientSandboxExtensionCache = v5;
}

- (id)newLibraryServicesManager
{
  return 0;
}

- (id)newAssetsdClient
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F8B868]) initWithPhotoLibraryURL:self->super._libraryURL];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PLClientPhotoLibraryBundle_newAssetsdClient__block_invoke;
  v5[3] = &unk_1E5870498;
  objc_copyWeak(&v6, &location);
  [v3 addPhotoLibraryUnavailabilityHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)newChangePublisher
{
  id v3 = [PLClientChangePublisher alloc];
  id v4 = [(PLPhotoLibraryBundle *)self assetsdClient];
  v5 = [(PLClientChangePublisher *)v3 initWithAssetsdClient:v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)calculateTotalSizeWithResult:(id)a3
{
  v5 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  id v6 = [(PLPhotoLibraryBundle *)self assetsdClient];
  objc_super v7 = [v6 libraryManagementClient];

  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLPhotoLibraryBundle.m", 608, @"Invalid parameter not satisfying: %@", @"managementClient" object file lineNumber description];
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__84844;
  v16 = __Block_byref_object_dispose__84845;
  id v17 = 0;
  id v8 = [(PLPhotoLibraryBundle *)self libraryURL];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PLClientPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke;
  v11[3] = &unk_1E58704C0;
  v11[4] = &v12;
  v11[5] = &v30;
  v11[6] = &v26;
  v11[7] = &v22;
  v11[8] = &v18;
  [v7 filesystemSizeForLibraryURL:v8 result:v11];

  v5[2](v5, v31[3], v27[3], v23[3], v19[3], v13[5]);
  LOBYTE(v8) = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return (char)v8;
}

void __59__PLClientPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12 = a6;
  if (v12)
  {
    id v13 = v12;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a6);
    id v12 = v13;
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    *(void *)(*(void *)(a1[7] + 8) + 24) = a4;
    *(void *)(*(void *)(a1[8] + 8) + 24) = a5;
  }
}

- (void)setPhotoStreamEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLPhotoLibraryBundle *)self indicatorFileCoordinator];
  [v4 logCloudServiceEnableEvent:v3 serviceName:@"MPS" reason:0];

  +[PLPhotoLibrary setPhotoStreamEnabled:v3];
}

- (void)setSharedAlbumEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PLPhotoLibraryBundle *)self indicatorFileCoordinator];
  [v5 logCloudServiceEnableEvent:v3 serviceName:@"SharedAlbum" reason:0];

  id v6 = [(PLPhotoLibraryBundle *)self pathManager];
  +[PLCloudSharingEnablingJob enableCloudSharing:v3 withPathManager:v6];
}

- (void)_setCloudPhotoLibraryEnabled:(BOOL)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v11 = [(PLPhotoLibraryBundle *)self indicatorFileCoordinator];
  [v11 logCloudServiceEnableEvent:v5 serviceName:@"CPL" reason:0];
  objc_super v7 = [(PLPhotoLibraryBundle *)self assetsdClient];
  id v8 = [v7 cloudInternalClient];

  if (v5)
  {
    [v11 writeEnableICloudPhotosMarker];
    v9 = v8;
    uint64_t v10 = 1;
    if (!v4)
    {
      [v8 setCloudPhotoLibraryEnabledState:1];
      goto LABEL_6;
    }
  }
  else
  {
    [v11 writeDisableICloudPhotosMarker];
    v9 = v8;
    uint64_t v10 = 0;
  }
  [v9 setCloudPhotoLibraryEnabledStateSync:v10];
LABEL_6:
}

- (void)setCloudPhotoLibraryEnabledSync:(BOOL)a3
{
}

- (void)setCloudPhotoLibraryEnabled:(BOOL)a3
{
}

- (void)_invalidateClientSandboxExtensionCache
{
}

- (id)clientSandboxExtensionCache
{
  return (id)[(PLLazyObject *)self->_lazyClientSandboxExtensionCache objectValue];
}

PLClientSandboxExtensionCache *__62__PLClientPhotoLibraryBundle__initClientSandboxExtensionCache__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = [[PLClientSandboxExtensionCache alloc] initWithCacheLimit:200];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)close
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    uint64_t v10 = self;
    __int16 v11 = 2080;
    id v12 = "-[PLClientPhotoLibraryBundle close]";
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLClientPhotoLibraryBundle;
  [(PLPhotoLibraryBundle *)&v6 close];
  BOOL v4 = [(PLPhotoLibraryBundle *)self pathManager];
  BOOL v5 = PLLibraryIDFromPathManager();
  PLUnregisterDataStoresForLibraryID(v5);
}

- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [a4 assetsdClient];
  uint64_t v14 = [v13 libraryClient];

  v15 = [(PLPhotoLibraryBundle *)self libraryURL];
  v16 = [v14 transferPersonsWithUuids:v12 fromLibraryURL:v15 transferOptions:v11 completionHandler:v10];

  return v16;
}

- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [a4 assetsdClient];
  uint64_t v14 = [v13 libraryClient];

  v15 = [(PLPhotoLibraryBundle *)self libraryURL];
  v16 = [v14 transferAssetsWithUuids:v12 fromLibraryURL:v15 transferOptions:v11 completionHandler:v10];

  return v16;
}

- (id)newBoundAssetsdServicesTable
{
  return 0;
}

void __46__PLClientPhotoLibraryBundle_newAssetsdClient__block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleLibraryBecameUnavailable:v6 reason:v5];
}

- (void)_handleLibraryBecameUnavailable:(id)a3 reason:(id)a4
{
  id v10 = a3;
  id v5 = (void *)MEMORY[0x1E4F8B908];
  id v6 = [(PLPhotoLibraryBundle *)self libraryURL];
  objc_super v7 = [v6 path];
  uint64_t v8 = [v10 path];
  LODWORD(v5) = [v5 filePath:v7 isEqualToFilePath:v8];

  if (v5)
  {
    __int16 v9 = [(PLPhotoLibraryBundle *)self bundleController];
    [v9 removeBundleForRebuildAtLibraryURL:v10];
  }
}

@end