@interface PLLibraryBookmarkManager
+ (id)_securityScopedURLWithURL:(id)a3 sandboxExtension:(id)a4;
+ (id)resolveSecurityScopedBookmark:(id)a3 isStale:(BOOL *)a4 error:(id *)a5;
+ (id)sharedBookmarkManager;
- (PLLibraryBookmarkManager)init;
- (id)URLFromClientLibraryURL:(id)a3 sandboxExtension:(id)a4 error:(id *)a5;
- (id)_activeURLForClientLibraryURL:(id)a3;
- (id)allKnownLibraryURLs;
- (id)newSandboxExtensionDataForClient:(id *)a3 path:(id)a4 writable:(BOOL)a5;
- (id)sandboxExtensionsByPathForClient:(id)a3 pathManager:(id)a4 libraryAccessRole:(int64_t)a5;
- (void)_importLithiumAccessRights;
- (void)_loadFromDefaults;
- (void)_removeActiveURLForPathKey:(id)a3;
- (void)_removeSSBForPathKey:(id)a3;
- (void)_saveToDefaults;
- (void)_storeSecurityScopedURL:(id)a3 pathKey:(id)a4;
- (void)dealloc;
- (void)removeSSBForLibraryURL:(id)a3;
@end

@implementation PLLibraryBookmarkManager

void __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a3 BOOLValue];
  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    [v7 clientAuditToken];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  v9 = (void *)[v8 newSandboxExtensionDataForClient:&v14 path:v5 writable:v6];
  if (v9)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v9 forKeyedSubscript:v5];
  }
  else
  {
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (v6) {
        v11 = @"writable";
      }
      else {
        v11 = @"readonly";
      }
      uint64_t v12 = (int)objc_msgSend(*(id *)(a1 + 40), "clientProcessIdentifier", v14, v15);
      v13 = [*(id *)(a1 + 40) trustedCallerBundleID];
      *(_DWORD *)buf = 138544130;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2050;
      uint64_t v21 = v12;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "No %{public}@ sandbox extension for path %@ for client pid %{public}ld (%{public}@)", buf, 0x2Au);
    }
  }
}

- (id)newSandboxExtensionDataForClient:(id *)a3 path:(id)a4 writable:(BOOL)a5
{
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4 isDirectory:1];
  id v7 = [v6 path];
  [v7 fileSystemRepresentation];
  $115C4C562B26FF47E01F9F4EA65B5887 v11 = *a3;
  v8 = (const char *)sandbox_extension_issue_file_to_process();
  v9 = (void *)v8;
  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 1, *(_OWORD *)v11.var0, *(_OWORD *)&v11.var0[4]);
  }

  return v9;
}

- (id)URLFromClientLibraryURL:(id)a3 sandboxExtension:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3167;
  v25 = __Block_byref_object_dispose__3168;
  id v26 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PLLibraryBookmarkManager_URLFromClientLibraryURL_sandboxExtension_error___block_invoke;
  v15[3] = &unk_1E589F6D0;
  __int16 v18 = &v21;
  v15[4] = self;
  id v11 = v9;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  SEL v19 = a2;
  __int16 v20 = a5;
  PLSafeRunWithUnfairLock((os_unfair_lock_s *)&sLock, v15);
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)sandboxExtensionsByPathForClient:(id)a3 pathManager:(id)a4 libraryAccessRole:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3167;
  v25 = __Block_byref_object_dispose__3168;
  id v26 = 0;
  if (a5 == 2)
  {
    id v11 = [v9 clientOwnedDirectoryPathsForClientAccess:v8];
  }
  else if (a5 == 1)
  {
    id v11 = [v9 pathsForClientAccess:v8];
  }
  else if (a5)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke;
  v16[3] = &unk_1E589F720;
  __int16 v20 = &v21;
  id v12 = v11;
  id v17 = v12;
  __int16 v18 = self;
  id v13 = v8;
  id v19 = v13;
  PLSafeRunWithUnfairLock((os_unfair_lock_s *)&sLock, v16);
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke_2;
  v9[3] = &unk_1E589F6F8;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 56);
  id v10 = v7;
  uint64_t v11 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
}

void __75__PLLibraryBookmarkManager_URLFromClientLibraryURL_sandboxExtension_error___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _activeURLForClientLibraryURL:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && !*(void *)(a1 + 48)
    && +[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:*(void *)(a1 + 40)])
  {
    uint64_t v5 = +[PLPhotoLibraryPathManager systemLibraryURL];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v9;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "No SSB on file for %@", buf, 0xCu);
    }

    id v10 = [(id)objc_opt_class() _securityScopedURLWithURL:*(void *)(a1 + 40) sandboxExtension:*(void *)(a1 + 48)];
    uint64_t v11 = v10;
    if (v10)
    {
      if ([v10 startAccessingSecurityScopedResource])
      {
        [v11 stopAccessingSecurityScopedResource];
      }
      else
      {
        id v17 = [v11 path];
        BOOL v18 = +[PLSandboxHelper processCanWriteSandboxForPath:v17];

        if (!v18)
        {
          uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v25 = *(void *)(a1 + 64);
          uint64_t v26 = *(void *)(a1 + 32);
          v27 = [v11 path];
          [v24 handleFailureInMethod:v25, v26, @"PLLibraryBookmarkManager.m", 145, @"Failed to start accessing security scoped resource and no access to %@", v27 object file lineNumber description];
        }
      }
      long long v15 = 0;
      id v16 = v11;
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = v12;
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
      }
      [v13 setObject:@"Client did not provide bookmarkData" forKeyedSubscript:*MEMORY[0x1E4F28588]];
      [v13 setObject:@"Double-click the photo library in Finder or Option+Launch Photos and select the photo library" forKeyedSubscript:*MEMORY[0x1E4F285A0]];
      long long v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:41017 userInfo:v13];

      if (v15 && *(void *)(a1 + 72)) {
        **(void **)(a1 + 72) = v15;
      }
      id v16 = *(void **)(a1 + 40);
    }
    id v19 = *(void **)(a1 + 32);
    id v20 = v16;
    uint64_t v21 = [v19 _activeURLForClientLibraryURL:v20];
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }
}

- (id)_activeURLForClientLibraryURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pathKeyForLibraryURL(v4);
  if (!v5)
  {
    id v6 = 0;
    goto LABEL_12;
  }
  id v6 = [(NSMutableDictionary *)self->_activeURLsByPathKey objectForKeyedSubscript:v5];
  if (v6) {
    goto LABEL_12;
  }
  if (!+[PLSandboxHelper fileURLHasSecurityScope:v4])
  {
    id v7 = [v4 path];
    uint64_t v8 = PLGetSandboxExtensionTokenWithFlags(v7, *MEMORY[0x1E4F14008], *MEMORY[0x1E4F14130], 0);
    uint64_t v9 = PLSandboxExtensionTokenAsData(v8);

    if (v9)
    {
      id v6 = [(id)objc_opt_class() _securityScopedURLWithURL:v4 sandboxExtension:v9];
    }
    else
    {
      id v6 = 0;
    }

    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v6 = v4;
  if (v6) {
LABEL_11:
  }
    [(PLLibraryBookmarkManager *)self _storeSecurityScopedURL:v6 pathKey:v5];
LABEL_12:

  return v6;
}

+ (id)sharedBookmarkManager
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"PLLibraryBookmarkManager.m", 54, @"Invalid parameter not satisfying: %@", @"PLIsReallyAssetsd()" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PLLibraryBookmarkManager_sharedBookmarkManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBookmarkManager_onceToken != -1) {
    dispatch_once(&sharedBookmarkManager_onceToken, block);
  }
  id v4 = (void *)sLibraryBookmarkManager;
  return v4;
}

- (void).cxx_destruct
{
}

- (void)_removeSSBForPathKey:(id)a3
{
  if (a3)
  {
    -[PLLibraryBookmarkManager _removeActiveURLForPathKey:](self, "_removeActiveURLForPathKey:");
    [(PLLibraryBookmarkManager *)self _saveToDefaults];
  }
}

- (void)_removeActiveURLForPathKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = [(NSMutableDictionary *)self->_activeURLsByPathKey objectForKeyedSubscript:v4];
    if (v5)
    {
      [(NSMutableDictionary *)self->_activeURLsByPathKey removeObjectForKey:v6];
      [v5 stopAccessingSecurityScopedResource];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)_storeSecurityScopedURL:(id)a3 pathKey:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  uint64_t v8 = v12;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLLibraryBookmarkManager.m", 490, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    uint64_t v8 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PLLibraryBookmarkManager.m", 491, @"Invalid parameter not satisfying: %@", @"pathKey" object file lineNumber description];

  uint64_t v8 = v12;
LABEL_3:
  if ([v8 startAccessingSecurityScopedResource])
  {
    [(NSMutableDictionary *)self->_activeURLsByPathKey setObject:v12 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLLibraryBookmarkManager.m", 495, @"Invalid parameter not satisfying: %@", @"started" object file lineNumber description];
  }
}

- (void)_saveToDefaults
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PLLibraryBookmarkManager.m", 375, @"Invalid parameter not satisfying: %@", @"PLIsReallyAssetsd()" object file lineNumber description];
  }
}

- (void)_loadFromDefaults
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PLLibraryBookmarkManager.m", 365, @"Invalid parameter not satisfying: %@", @"PLIsReallyAssetsd()" object file lineNumber description];
  }
}

- (void)_importLithiumAccessRights
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PLLibraryBookmarkManager.m", 298, @"Invalid parameter not satisfying: %@", @"PLIsReallyAssetsd()" object file lineNumber description];
  }
}

- (id)allKnownLibraryURLs
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  return v2;
}

- (void)removeSSBForLibraryURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PLLibraryBookmarkManager_removeSSBForLibraryURL___block_invoke;
  v6[3] = &unk_1E58A1EF8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  PLSafeRunWithUnfairLock((os_unfair_lock_s *)&sLock, v6);
}

void __51__PLLibraryBookmarkManager_removeSSBForLibraryURL___block_invoke(uint64_t a1)
{
  pathKeyForLibraryURL(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) _removeSSBForPathKey:v2];
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_activeURLsByPathKey enumerateKeysAndObjectsUsingBlock:&__block_literal_global_3190];
  v3.receiver = self;
  v3.super_class = (Class)PLLibraryBookmarkManager;
  [(PLLibraryBookmarkManager *)&v3 dealloc];
}

uint64_t __35__PLLibraryBookmarkManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 stopAccessingSecurityScopedResource];
}

- (PLLibraryBookmarkManager)init
{
  if (sLibraryBookmarkManager)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLLibraryBookmarkManager.m", 94, @"Invalid parameter not satisfying: %@", @"sLibraryBookmarkManager == nil" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)PLLibraryBookmarkManager;
  objc_super v3 = [(PLLibraryBookmarkManager *)&v9 init];
  if (v3)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeURLsByPathKey = v3->_activeURLsByPathKey;
    v3->_activeURLsByPathKey = v4;

    [(PLLibraryBookmarkManager *)v3 _loadFromDefaults];
  }
  return v3;
}

+ (id)_securityScopedURLWithURL:(id)a3 sandboxExtension:(id)a4
{
  if (a4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = a4;
    id v7 = [a3 path];
    uint64_t v8 = [v5 fileURLWithPath:v7 isDirectory:1];

    MEMORY[0x19F38EE60](v8, v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

+ (id)resolveSecurityScopedBookmark:(id)a3 isStale:(BOOL *)a4 error:(id *)a5
{
  BOOL v12 = 0;
  id v11 = 0;
  id v7 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:a3 options:256 relativeToURL:0 bookmarkDataIsStale:&v12 error:&v11];
  id v8 = v11;
  objc_super v9 = v8;
  if (a5 && !v7) {
    *a5 = v8;
  }
  if (a4) {
    *a4 = v12;
  }

  return v7;
}

uint64_t __49__PLLibraryBookmarkManager_sharedBookmarkManager__block_invoke(uint64_t a1)
{
  sLibraryBookmarkManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

@end