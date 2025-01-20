@interface ML3MultiUserMusicLibraryResourcesManager
@end

@implementation ML3MultiUserMusicLibraryResourcesManager

void __75___ML3MultiUserMusicLibraryResourcesManager_setCachedLibraryContainerPath___block_invoke(uint64_t a1)
{
}

uint64_t __71___ML3MultiUserMusicLibraryResourcesManager_cachedLibraryContainerPath__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x1F41817F8]();
}

void __73___ML3MultiUserMusicLibraryResourcesManager_setCachedMusicContainerPath___block_invoke(uint64_t a1)
{
}

uint64_t __69___ML3MultiUserMusicLibraryResourcesManager_cachedMusicContainerPath__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x1F41817F8]();
}

intptr_t __69___ML3MultiUserMusicLibraryResourcesManager_musicAssetsContainerPath__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65___ML3MultiUserMusicLibraryResourcesManager_libraryContainerPath__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v5;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - libraryContainerPath - Using the cached path", buf, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v6;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - libraryContainerPath - Using the service to retrieve libraryContainerPath", buf, 0xCu);
    }

    v7 = [*(id *)(a1 + 32) libraryResourcesServices];
    id v32 = 0;
    uint64_t v8 = [v7 libraryContainerPathWithError:&v32];
    id v9 = v32;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v8;

    if (v9 || (v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) == 0)
    {
      v18 = _ML3LogCategoryMultiUser();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v19;
        __int16 v37 = 2114;
        id v38 = v9;
        __int16 v39 = 2114;
        uint64_t v40 = v20;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ - libraryContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@, libraryContainerPath=%{public}@", buf, 0x20u);
      }

      if (MSVDeviceOSIsInternalInstall())
      {
        v21 = _ML3LogCategoryMultiUser();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v22;
          __int16 v37 = 2114;
          id v38 = v9;
          _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_FAULT, "%{public}@ - libraryContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@", buf, 0x16u);
        }
      }
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      v24 = (void *)MEMORY[0x1E4F77950];
      uint64_t v25 = *MEMORY[0x1E4F778C0];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __65___ML3MultiUserMusicLibraryResourcesManager_libraryContainerPath__block_invoke_9;
      v31[3] = &unk_1E5FB8298;
      v26 = v23;
      v31[4] = v26;
      [v24 snapshotWithDomain:v25 type:@"Bug" subType:@"LibraryContainerPath" context:@"Failed Getting Path" triggerThresholdValues:0 events:0 completion:v31];
      dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      v33 = @"error";
      id v34 = v9;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v30 = [v27 exceptionWithName:v28 reason:@"Unable to retrieve media library folder" userInfo:v29];

      objc_exception_throw(v30);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = v12;
    v3 = *(NSObject **)(v13 + 16);
    *(void *)(v13 + 16) = v14;
  }

  v15 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v16;
    __int16 v37 = 2114;
    id v38 = v17;
    _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - libraryContainerPath - Retrieved path: %{public}@", buf, 0x16u);
  }
}

intptr_t __65___ML3MultiUserMusicLibraryResourcesManager_libraryContainerPath__block_invoke_9(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end