@interface _ML3MultiUserMusicLibraryResourcesManager
- (MLMediaLibraryResourcesServiceProtocol)libraryResourcesServices;
- (NSString)cachedLibraryContainerPath;
- (NSString)cachedMusicContainerPath;
- (OS_dispatch_queue)serialQueue;
- (_ML3MultiUserMusicLibraryResourcesManager)initWithLibraryResourcesService:(id)a3;
- (id)libraryContainerPath;
- (id)musicAssetsContainerPath;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)setCachedLibraryContainerPath:(id)a3;
- (void)setCachedMusicContainerPath:(id)a3;
- (void)setLibraryResourcesServices:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation _ML3MultiUserMusicLibraryResourcesManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryResourcesServices, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_cachedMusicContainerPath, 0);

  objc_storeStrong((id *)&self->_cachedLibraryContainerPath, 0);
}

- (void)setLibraryResourcesServices:(id)a3
{
}

- (MLMediaLibraryResourcesServiceProtocol)libraryResourcesServices
{
  return self->_libraryResourcesServices;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(_ML3MultiUserMusicLibraryResourcesManager *)self cachedLibraryContainerPath];
    int v7 = 138543618;
    v8 = self;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - emergencyDisconnectWithCompletion: - Wiping cached media folder path: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(_ML3MultiUserMusicLibraryResourcesManager *)self setCachedLibraryContainerPath:0];
  v4[2](v4, 1, 0);
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void))a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - newPath=%{public}@ - No-Op", (uint8_t *)&v9, 0x16u);
  }

  [(_ML3MultiUserMusicLibraryResourcesManager *)self setCachedLibraryContainerPath:0];
  v7[2](v7, 1, 0);
}

- (void)setCachedLibraryContainerPath:(id)a3
{
  id v4 = a3;
  v5 = [(_ML3MultiUserMusicLibraryResourcesManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75___ML3MultiUserMusicLibraryResourcesManager_setCachedLibraryContainerPath___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSString)cachedLibraryContainerPath
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27364;
  __int16 v11 = __Block_byref_object_dispose__27365;
  id v12 = 0;
  v3 = [(_ML3MultiUserMusicLibraryResourcesManager *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___ML3MultiUserMusicLibraryResourcesManager_cachedLibraryContainerPath__block_invoke;
  v6[3] = &unk_1E5FB8360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setCachedMusicContainerPath:(id)a3
{
  id v4 = a3;
  v5 = [(_ML3MultiUserMusicLibraryResourcesManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73___ML3MultiUserMusicLibraryResourcesManager_setCachedMusicContainerPath___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSString)cachedMusicContainerPath
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27364;
  __int16 v11 = __Block_byref_object_dispose__27365;
  id v12 = 0;
  v3 = [(_ML3MultiUserMusicLibraryResourcesManager *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69___ML3MultiUserMusicLibraryResourcesManager_cachedMusicContainerPath__block_invoke;
  v6[3] = &unk_1E5FB8360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)musicAssetsContainerPath
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(_ML3MultiUserMusicLibraryResourcesManager *)self cachedMusicContainerPath];

  id v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - musicContainerPath - Using the cached path", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - musicContainerPath - Using the service to retrieve musicContainerPath", buf, 0xCu);
    }

    id v6 = [(_ML3MultiUserMusicLibraryResourcesManager *)self libraryResourcesServices];
    id v23 = 0;
    id v4 = [v6 musicContainerPathWithError:&v23];
    id v7 = v23;

    if (v7)
    {
      id v12 = _ML3LogCategoryMultiUser();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v27 = self;
        __int16 v28 = 2114;
        id v29 = v7;
        _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "%{public}@ - musicContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@", buf, 0x16u);
      }

      if (MSVDeviceOSIsInternalInstall())
      {
        uint64_t v13 = _ML3LogCategoryMultiUser();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v27 = self;
          __int16 v28 = 2114;
          id v29 = v7;
          _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_FAULT, "%{public}@ - musicContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@", buf, 0x16u);
        }
      }
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v15 = (void *)MEMORY[0x1E4F77950];
      uint64_t v16 = *MEMORY[0x1E4F778C0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __69___ML3MultiUserMusicLibraryResourcesManager_musicAssetsContainerPath__block_invoke;
      v22[3] = &unk_1E5FB8298;
      v17 = v14;
      v22[4] = v17;
      [v15 snapshotWithDomain:v16 type:@"Bug" subType:@"musicContainerPath" context:@"Failed Getting Path" triggerThresholdValues:0 events:0 completion:v22];
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3B8];
      v24 = @"error";
      id v25 = v7;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v21 = [v18 exceptionWithName:v19 reason:@"Unable to retrieve media library folder" userInfo:v20];

      objc_exception_throw(v21);
    }
    [(_ML3MultiUserMusicLibraryResourcesManager *)self setCachedMusicContainerPath:v4];
  }

  id v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(_ML3MultiUserMusicLibraryResourcesManager *)self cachedMusicContainerPath];
    *(_DWORD *)buf = 138543618;
    v27 = self;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - musicContainerPath - Retrieved path: %{public}@", buf, 0x16u);
  }
  v10 = [(_ML3MultiUserMusicLibraryResourcesManager *)self cachedMusicContainerPath];

  return v10;
}

- (id)libraryContainerPath
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27364;
  __int16 v11 = __Block_byref_object_dispose__27365;
  id v12 = 0;
  v3 = [(_ML3MultiUserMusicLibraryResourcesManager *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___ML3MultiUserMusicLibraryResourcesManager_libraryContainerPath__block_invoke;
  v6[3] = &unk_1E5FB8360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (_ML3MultiUserMusicLibraryResourcesManager)initWithLibraryResourcesService:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ML3MultiUserMusicLibraryResourcesManager;
  id v6 = [(_ML3BaseMusicLibraryResourcesManager *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryResourcesServices, a3);
    id v8 = +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy];
    [v8 addAccountChangeObserver:v7];

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.medialibraryd.multi-users-resources-serial-queue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

@end