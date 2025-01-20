@interface PLCameraPreviewWellManager
+ (BOOL)_asset:(id)a3 sortsGreaterThanAssetInfo:(id)a4;
- (BOOL)shouldReconsiderCameraPreviewWellImageForUpdatedAsset:(id)a3 thumbnailWasGenerated:(BOOL)a4;
- (PLCameraPreviewWellManager)init;
- (void)_clearPreviewWellAndNotify;
- (void)_fetchPreviewWellAssetUsingContext:(id)a3 withAssetHandler:(id)a4;
- (void)_updateLinkAndNotifyForAssetInfo:(id)a3 avoidNotificationIfLinkIsAlreadySet:(BOOL)a4;
- (void)refreshPreviewWellImageWithContext:(id)a3 avoidNotificationIfLinkIsAlreadySet:(BOOL)a4;
@end

@implementation PLCameraPreviewWellManager

- (void).cxx_destruct
{
}

- (void)refreshPreviewWellImageWithContext:(id)a3 avoidNotificationIfLinkIsAlreadySet:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __101__PLCameraPreviewWellManager_refreshPreviewWellImageWithContext_avoidNotificationIfLinkIsAlreadySet___block_invoke;
  v4[3] = &unk_1E5864450;
  v4[4] = self;
  BOOL v5 = a4;
  [(PLCameraPreviewWellManager *)self _fetchPreviewWellAssetUsingContext:a3 withAssetHandler:v4];
}

void __101__PLCameraPreviewWellManager_refreshPreviewWellImageWithContext_avoidNotificationIfLinkIsAlreadySet___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    uint64_t v7 = [v5 uuid];
    if (v7
      && (v8 = (void *)v7,
          [v6 thumbnailIdentifier],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      v10 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Camera preview well updating...", buf, 2u);
      }

      [*(id *)(a1 + 32) _updateLinkAndNotifyForAssetInfo:v6 avoidNotificationIfLinkIsAlreadySet:*(unsigned __int8 *)(a1 + 40)];
    }
    else
    {
      v11 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Camera preview well clearing...", v12, 2u);
      }

      [*(id *)(a1 + 32) _clearPreviewWellAndNotify];
    }
  }
}

- (BOOL)shouldReconsiderCameraPreviewWellImageForUpdatedAsset:(id)a3 thumbnailWasGenerated:(BOOL)a4
{
  LODWORD(v4) = a4;
  id v5 = a3;
  v6 = [v5 photoLibrary];
  uint64_t v7 = [v6 pathManager];
  if (v7)
  {
  }
  else
  {
    char v8 = MEMORY[0x19F38C0C0]();

    if ((v8 & 1) == 0)
    {
      uint64_t v4 = PLThumbnailsGetLog();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Camera preview well skipping asset with missing path manager", buf, 2u);
      }

      LOBYTE(v4) = 0;
      goto LABEL_19;
    }
  }
  if (![v5 isInserted] || v4)
  {
    *(void *)buf = 0;
    v22 = buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v9 = v5;
    PLRunWithUnfairLock();
    if (v22[24])
    {
      if (!*((unsigned char *)v14 + 24) || (v4 & 1) != 0)
      {
LABEL_17:
        LOBYTE(v4) = 1;
        goto LABEL_18;
      }
    }
    else
    {
      if (!*((unsigned char *)v18 + 24)) {
        goto LABEL_17;
      }
      if (*((unsigned char *)v14 + 24))
      {
        v10 = _PLAllowedForCameraPreviewWellPredicate();
        char v11 = [v10 evaluateWithObject:v9] & (v4 ^ 1);

        if ((v11 & 1) == 0) {
          goto LABEL_17;
        }
      }
    }
    LOBYTE(v4) = 0;
LABEL_18:

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(buf, 8);
  }
LABEL_19:

  return v4;
}

void __106__PLCameraPreviewWellManager_shouldReconsiderCameraPreviewWellImageForUpdatedAsset_thumbnailWasGenerated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 16) != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [(id)objc_opt_class() _asset:*(void *)(a1 + 40) sortsGreaterThanAssetInfo:*(void *)(*(void *)(a1 + 32) + 16)];
    id v3 = [*(id *)(a1 + 40) uuid];
    v2 = [*(id *)(*(void *)(a1 + 32) + 16) uuid];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 isEqual:v2];
  }
}

- (PLCameraPreviewWellManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCameraPreviewWellManager;
  result = [(PLCameraPreviewWellManager *)&v3 init];
  if (result) {
    result->_linkUpdateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)_updateLinkAndNotifyForAssetInfo:(id)a3 avoidNotificationIfLinkIsAlreadySet:(BOOL)a4
{
  id v4 = a3;
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]())
  {
    id v5 = v4;
    PLRunWithUnfairLock();
  }
}

void __99__PLCameraPreviewWellManager__updateLinkAndNotifyForAssetInfo_avoidNotificationIfLinkIsAlreadySet___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLPrimaryResourceDataStore currentDeviceMasterThumbRecipeID];
  id v3 = [MEMORY[0x1E4F8B848] cameraPreviewWellImageFileURL];
  id v4 = (const std::__fs::filesystem::path *)[v3 fileSystemRepresentation];

  id v5 = [MEMORY[0x1E4F8B840] photoDataMiscDirectory];
  id v6 = [v5 stringByAppendingPathComponent:@"PreviewWellImage_temp.jpg"];
  uint64_t v7 = (const std::__fs::filesystem::path *)[v6 fileSystemRepresentation];

  char v8 = (void *)MEMORY[0x1E4F8B9F0];
  id v9 = [*(id *)(a1 + 32) thumbnailIdentifier];
  v10 = [*(id *)(a1 + 32) pathManager];
  id v11 = [v8 thumbnailPathForThumbIdentifier:v9 withPathManager:v10 recipeID:v2 forDelete:0];
  v12 = (const char *)[v11 fileSystemRepresentation];

  if (readlink((const char *)v4, (char *)__s1, 0x400uLL) >= 1
    && (size_t v13 = strlen(v12), !strncmp((const char *)__s1, v12, v13)))
  {
    uint64_t v23 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      char v24 = [*(id *)(a1 + 32) uuid];
      int v32 = 138412290;
      v33 = v24;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Camera preview well link already points to specified asset (%@)", (uint8_t *)&v32, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 32));
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_19;
    }
    v25 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = [*(id *)(a1 + 32) uuid];
      __s1[0].st_dev = 138412290;
      *(void *)&__s1[0].st_mode = v26;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "Camera preview well skipping notification because already points to correct asset. (%@)", (uint8_t *)__s1, 0xCu);
    }
  }
  else
  {
    memset(__s1, 0, 144);
    if (!lstat((const char *)v7, __s1)) {
      unlink((const char *)v7);
    }
    if (symlink(v12, (const char *)v7) == -1)
    {
      char v20 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = __error();
        v22 = strerror(*v21);
        int v32 = 136315138;
        v33 = v22;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to create camera preview well temp symlink with error: %s", (uint8_t *)&v32, 0xCu);
      }
    }
    else
    {
      v14 = [*(id *)(a1 + 32) uuid];

      if (v14)
      {
        char v16 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v7 isDirectory:0 relativeToURL:0];
        uint64_t v17 = (void *)MEMORY[0x1E4F8B900];
        v18 = [*(id *)(a1 + 32) uuid];
        [v17 persistString:v18 forKey:@"com.apple.assetsd.thumbnailCameraPreviewImageAssetID" fileURL:v16];
      }
      rename(v7, v4, v15);
      if (v19 != -1)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 32));
LABEL_19:
        v27 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v28 = [*(id *)(a1 + 32) uuid];
          __s1[0].st_dev = 138412290;
          *(void *)&__s1[0].st_mode = v28;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "Posting camera preview well image change notification for asset uuid (%@)", (uint8_t *)__s1, 0xCu);
        }
        notify_post("cameraPreviewImageWellChanged");
        return;
      }
      v29 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = __error();
        v31 = strerror(*v30);
        int v32 = 136315138;
        v33 = v31;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Camera preview well failed to rename temp link to final link with error: %s", (uint8_t *)&v32, 0xCu);
      }

      unlink((const char *)v7);
    }
  }
}

- (void)_clearPreviewWellAndNotify
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F8B848] cameraPreviewWellImageFileURL];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  char v4 = [v3 removeItemAtURL:v2 error:&v12];
  id v5 = v12;

  if ((v4 & 1) == 0)
  {
    id v6 = [v5 userInfo];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F28A50]];

    char v8 = [v7 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v9 = [v7 code];

      if (v9 == 2)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
    }
    v10 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "failed to remove camera preview image: %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:
  id v11 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Posting camera preview image change notification for clearing preview", buf, 2u);
  }

  notify_post("cameraPreviewImageWellChanged");
}

- (void)_fetchPreviewWellAssetUsingContext:(id)a3 withAssetHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, uint64_t))a4;
  v42 = _PLCameraPreviewWellAssetFetchRequest();
  uint64_t v7 = objc_msgSend(v5, "executeFetchRequest:error:");
  id v8 = 0;
  if (v7)
  {
    uint64_t v9 = [v7 firstObject];
    v10 = v9;
    if (v9)
    {
      [v9 objectForKeyedSubscript:@"uuid"];
      id v11 = v39 = v8;
      id v12 = [v10 objectForKeyedSubscript:@"directory"];
      size_t v13 = [v10 objectForKeyedSubscript:@"filename"];
      id v14 = [v10 objectForKeyedSubscript:@"bundleScope"];
      v40 = v7;
      unsigned __int16 v15 = [v14 shortValue];
      [v5 pathManager];
      char v16 = v41 = v5;
      uint64_t v17 = +[PLThumbnailManager thumbnailIdentifierWithAssetUUID:v11 directory:v12 filename:v13 bundleScope:v15 pathManager:v16];

      v37 = [PLCameraPreviewWellAssetInfo alloc];
      uint64_t v35 = [v10 objectForKeyedSubscript:@"uuid"];
      v38 = [v10 objectForKeyedSubscript:@"sortToken"];
      [v38 doubleValue];
      double v19 = v18;
      v33 = [v10 objectForKeyedSubscript:@"addedDate"];
      v36 = [v10 objectForKeyedSubscript:@"hidden"];
      unsigned int v32 = [v36 BOOLValue];
      v34 = [v10 objectForKeyedSubscript:@"visibilityState"];
      __int16 v30 = [v34 longValue];
      v31 = [v10 objectForKeyedSubscript:@"trashedState"];
      LOWORD(v14) = [v31 longValue];
      char v20 = [v10 objectForKeyedSubscript:@"avalanchePickType"];
      uint64_t v21 = [v20 longValue];
      v22 = [v10 objectForKeyedSubscript:@"savedAssetType"];
      __int16 v23 = [v22 longValue];
      char v24 = [v41 pathManager];
      uint64_t v29 = v17;
      v25 = (void *)v17;
      LOWORD(v28) = v23;
      uint64_t v7 = v40;
      uint64_t v26 = [(PLCameraPreviewWellAssetInfo *)v37 initWithUUID:v35 sortToken:v33 addedDate:v32 hidden:v30 visibilityState:(__int16)v14 trashedState:v21 avalanchePickType:v19 savedAssetType:v28 thumbnailIdentifier:v29 pathManager:v24];

      id v5 = v41;
      id v8 = v39;
    }
    else
    {
      uint64_t v26 = 0;
    }

    v6[2](v6, 1, v26);
    id v6 = (void (**)(id, uint64_t, uint64_t))v26;
  }
  else
  {
    v27 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v8;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Error fetching assets for camera preview well metadata: %@", buf, 0xCu);
    }

    v6[2](v6, 0, 0);
  }
}

+ (BOOL)_asset:(id)a3 sortsGreaterThanAssetInfo:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLCameraPreviewWellManager.m", 368, @"Invalid parameter not satisfying: %@", @"assetToTest" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    char v15 = 1;
    goto LABEL_9;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  v10 = _PLAllowedForCameraPreviewWellPredicate();
  if ([v10 evaluateWithObject:v9])
  {
    v18[0] = v9;
    v18[1] = v7;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v12 = _PLAllowedForCameraPreviewSortDescriptors();
    size_t v13 = [v11 sortedArrayUsingDescriptors:v12];

    id v14 = [v13 firstObject];
    char v15 = [v14 isEqual:v7];
  }
  else
  {
    char v15 = 0;
  }

LABEL_9:
  return v15;
}

@end