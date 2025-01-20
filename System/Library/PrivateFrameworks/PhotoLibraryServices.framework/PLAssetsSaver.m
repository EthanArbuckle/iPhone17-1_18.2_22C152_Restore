@interface PLAssetsSaver
+ (id)createWriteImageCompletionBlockWithImage:(id)a3 target:(id)a4 selector:(SEL)a5 contextInfo:(void *)a6;
+ (id)createWriteVideoCompletionBlockWithVideoPath:(id)a3 target:(id)a4 selector:(SEL)a5 contextInfo:(void *)a6;
+ (id)publicAssetsLibraryErrorFromPrivateDomain:(id)a3 withPrivateCode:(int64_t)a4;
+ (id)publicAssetsLibraryErrorFromPrivateError:(id)a3;
+ (id)sharedAssetsSaver;
- (NSMutableArray)_pendingSaveAssetJobs;
- (PLAssetsSaver)init;
- (id)_assetsdClientForJobDictionary:(id)a3;
- (id)_photoLibrary;
- (id)_saveIsolationQueue;
- (id)requestSynchronousImageForAssetOID:(id)a3 withFormat:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 outImageDataInfo:(id *)a9 outCPLDownloadContext:(id *)a10;
- (id)saveCameraImage:(id)a3 metadata:(id)a4 additionalProperties:(id)a5 diagnostics:(id)a6 previouslyPendingAsset:(id)a7 requestEnqueuedBlock:(id)a8;
- (id)validateAvalanches:(id)a3 inLibraryWithURL:(id)a4;
- (void)_queueJobDictionary:(id)a3 asset:(id)a4 requestEnqueuedBlock:(id)a5 completionBlock:(id)a6 imageSurface:(__IOSurface *)a7;
- (void)_queueJobDictionary:(id)a3 completionBlock:(id)a4;
- (void)_saveImage:(id)a3 imageData:(id)a4 properties:(id)a5 completionBlock:(id)a6;
- (void)_saveVideoAtPath:(id)a3 properties:(id)a4 completionBlock:(id)a5;
- (void)_setIsTakingPhoto:(BOOL)a3;
- (void)dealloc;
- (void)deletePhotoStreamData;
- (void)queuePhotoStreamJobDictionary:(id)a3;
- (void)requestAsynchronousImageForAssetOID:(id)a3 withFormat:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 completionBlock:(id)a9;
- (void)saveCameraImage:(id)a3 metadata:(id)a4 additionalProperties:(id)a5 requestEnqueuedBlock:(id)a6;
- (void)saveImageRef:(CGImage *)a3 orientation:(int64_t)a4 imageData:(id)a5 properties:(id)a6 completionBlock:(id)a7;
- (void)saveSyncedAssets:(id)a3 completionBlock:(id)a4;
- (void)set_pendingSaveAssetJobs:(id)a3;
@end

@implementation PLAssetsSaver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingSaveAssetJobs, 0);
  objc_storeStrong((id *)&self->_inProgressAvalancheFds, 0);
}

- (void)set_pendingSaveAssetJobs:(id)a3
{
}

- (NSMutableArray)_pendingSaveAssetJobs
{
  return self->__pendingSaveAssetJobs;
}

- (void)saveSyncedAssets:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:*MEMORY[0x1E4F8C9C0] forKey:*MEMORY[0x1E4F8C970]];
  if (v6) {
    [v8 setObject:v6 forKey:@"SyncClientJobsData"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PLAssetsSaver_saveSyncedAssets_completionBlock___block_invoke;
  v10[3] = &unk_1E58638F0;
  id v11 = v7;
  id v9 = v7;
  [(PLAssetsSaver *)self _queueJobDictionary:v8 completionBlock:v10];
}

uint64_t __50__PLAssetsSaver_saveSyncedAssets_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)validateAvalanches:(id)a3 inLibraryWithURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6011;
  v18 = __Block_byref_object_dispose__6012;
  id v19 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = dispatch_get_global_queue(0, 0);
  id v11 = v5;
  id v12 = v6;
  v13 = v7;
  pl_dispatch_async();

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __53__PLAssetsSaver_validateAvalanches_inLibraryWithURL___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:*MEMORY[0x1E4F8C988] forKey:*MEMORY[0x1E4F8C970]];
  [v2 setObject:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4F8C8A0]];
  [v2 setObject:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F8CAA0]];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v2 setObject:v3 forKey:*MEMORY[0x1E4F8CAB0]];
  }
  v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLAssetsSaver_validateAvalanches_inLibraryWithURL___block_invoke_2;
  v7[3] = &unk_1E58638C0;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v6;
  long long v8 = v6;
  [v4 _queueJobDictionary:v2 completionBlock:v7];
}

void __53__PLAssetsSaver_validateAvalanches_inLibraryWithURL___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7
    && ([v7 objectForKeyedSubscript:@"avalancheStackAssetMap"],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    id v12 = PLCameraConnectionKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412802;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "job: %@, URL: %@, error: %@", (uint8_t *)&v17, 0x20u);
    }

    v13 = [v7 objectForKeyedSubscript:@"avalancheStackAssetMap"];
    uint64_t v14 = [v13 allValues];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    v13 = PLCameraConnectionKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Error validating bursts: %@", (uint8_t *)&v17, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)deletePhotoStreamData
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:*MEMORY[0x1E4F8C9A8] forKey:*MEMORY[0x1E4F8C970]];
  [(PLAssetsSaver *)self queuePhotoStreamJobDictionary:v3];
}

- (void)saveImageRef:(CGImage *)a3 orientation:(int64_t)a4 imageData:(id)a5 properties:(id)a6 completionBlock:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = (id)DCIM_newPLImageWithCGImage();
  [(PLAssetsSaver *)self _saveImage:v13 imageData:v12 properties:v11 completionBlock:v10];
}

- (void)_saveVideoAtPath:(id)a3 properties:(id)a4 completionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLAssetsSaver.m", 673, @"Invalid parameter not satisfying: %@", @"videoPath" object file lineNumber description];
  }
  id v12 = (void *)[v11 copy];
  id v13 = [MEMORY[0x1E4F8B998] sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke;
  v18[3] = &unk_1E5863898;
  id v19 = v10;
  id v20 = v9;
  __int16 v21 = self;
  id v22 = v12;
  id v14 = v12;
  id v15 = v9;
  id v16 = v10;
  [v13 checkPhotosAccessAllowedWithScope:1 handler:v18];
}

void __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke(uint64_t a1)
{
  if (PLPhotosAccessAllowed())
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CB70]];
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = MEMORY[0x1E4F1CC28];
    }
    v35 = (void *)v4;
    objc_msgSend(v2, "setObject:forKey:");
    [v2 setObject:*MEMORY[0x1E4F8C9E8] forKey:*MEMORY[0x1E4F8C970]];
    uint64_t v5 = *(void *)(a1 + 40);
    if (!v5) {
      goto LABEL_13;
    }
    [v2 setObject:v5 forKey:*MEMORY[0x1E4F8CAE8]];
    long long v6 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C800]];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [*(id *)(a1 + 40) pathExtension];
      if (!v8)
      {
LABEL_12:

LABEL_13:
        id v11 = [NSNumber numberWithBool:1];
        [v2 setObject:v11 forKey:*MEMORY[0x1E4F8C858]];

        id v12 = [NSNumber numberWithBool:1];
        [v2 setObject:v12 forKey:*MEMORY[0x1E4F8CAC8]];

        id v13 = objc_alloc(MEMORY[0x1E4F8CC48]);
        id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 40)];
        id v15 = [*(id *)(a1 + 48) _photoLibrary];
        id v16 = [v15 libraryBundle];
        int v17 = [v16 timeZoneLookup];
        id v18 = (void *)[v13 initWithAVURL:v14 options:12 timeZoneLookup:v17];

        v34 = v18;
        id v19 = [v18 utcCreationDate];
        if (!v19)
        {
          id v19 = [MEMORY[0x1E4F1C9C8] date];
        }
        [v2 setObject:v19 forKey:*MEMORY[0x1E4F8C8F8]];
        id v20 = [NSNumber numberWithBool:0];
        [v2 setObject:v20 forKey:*MEMORY[0x1E4F8CAA0]];

        uint64_t v21 = *MEMORY[0x1E4F8C880];
        id v22 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C880]];
        if (v22) {
          [v2 setObject:v22 forKey:v21];
        }
        uint64_t v23 = *MEMORY[0x1E4F8C878];
        v24 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C878]];
        if (v24) {
          [v2 setObject:v24 forKey:v23];
        }
        v25 = [*(id *)(a1 + 32) objectForKey:@"ImportedBy"];
        if (v25) {
          [v2 setObject:v25 forKey:@"ImportedBy"];
        }
        uint64_t v26 = *MEMORY[0x1E4F8C918];
        v27 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C918]];
        if (v27) {
          [v2 setObject:v27 forKey:v26];
        }
        uint64_t v28 = *MEMORY[0x1E4F8CA10];
        v29 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CA10]];
        if (v29) {
          [v2 setObject:v29 forKey:v28];
        }
        uint64_t v30 = *MEMORY[0x1E4F8C8F0];
        v31 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C8F0]];
        if (v31) {
          [v2 setObject:v31 forKey:v30];
        }
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke_2;
        v37[3] = &unk_1E5863848;
        v32 = *(void **)(a1 + 56);
        v37[4] = *(void *)(a1 + 48);
        id v38 = v32;
        v33 = (void *)MEMORY[0x19F38D650](v37);
        [*(id *)(a1 + 48) _queueJobDictionary:v2 completionBlock:v33];

        id v10 = v35;
        goto LABEL_28;
      }
    }
    [v2 setObject:v8 forKey:*MEMORY[0x1E4F8C930]];

    goto LABEL_12;
  }
  id v2 = [(id)objc_opt_class() publicAssetsLibraryErrorFromPrivateDomain:*MEMORY[0x1E4F8C500] withPrivateCode:-3001];
  id v9 = *(void **)(a1 + 56);
  if (v9)
  {
    id v36 = v9;
    id v2 = v2;
    pl_dispatch_async();

    id v10 = v36;
LABEL_28:
  }
}

void __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [(id)objc_opt_class() publicAssetsLibraryErrorFromPrivateError:v8];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v7, v9);
  }
}

uint64_t __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_saveImage:(id)a3 imageData:(id)a4 properties:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)[a6 copy];
  id v14 = [MEMORY[0x1E4F8B998] sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke;
  v19[3] = &unk_1E5863870;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  uint64_t v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  [v14 checkPhotosAccessAllowedWithScope:1 handler:v19];
}

void __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke(uint64_t a1)
{
  if (PLPhotosAccessAllowed())
  {
    uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C810]];
    uint64_t v44 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C800]];
    v47 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C808]];
    uint64_t v38 = *MEMORY[0x1E4F8C880];
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    uint64_t v39 = *MEMORY[0x1E4F8C878];
    v40 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    uint64_t v4 = *MEMORY[0x1E4F8C918];
    uint64_t v5 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C918]];
    uint64_t v36 = *MEMORY[0x1E4F8CA10];
    v43 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    uint64_t v37 = *MEMORY[0x1E4F8C8E0];
    v46 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    uint64_t v6 = *MEMORY[0x1E4F8C8F0];
    v45 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C8F0]];
    uint64_t v35 = *MEMORY[0x1E4F8C8F8];
    v42 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    uint64_t v7 = *MEMORY[0x1E4F8CB70];
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CB70]];
    id v9 = [*(id *)(a1 + 32) objectForKey:@"ImportedBy"];
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = v10;
    if (!v8) {
      uint64_t v8 = MEMORY[0x1E4F1CC28];
    }
    [v10 setObject:v8 forKey:v7];
    if (!v9) {
      goto LABEL_14;
    }
    if ([v3 hasPrefix:@"com.apple."])
    {
      if ([v9 intValue] == 3)
      {
        id v12 = &unk_1EEBED2C0;
LABEL_12:

        id v9 = v12;
        goto LABEL_13;
      }
      if ([v9 intValue] == 6)
      {
        id v12 = &unk_1EEBED2D8;
        goto LABEL_12;
      }
    }
LABEL_13:
    [v11 setObject:v9 forKey:@"ImportedBy"];

LABEL_14:
    [v11 setObject:*MEMORY[0x1E4F8C9B8] forKey:*MEMORY[0x1E4F8C970]];
    uint64_t v16 = *(void *)(a1 + 40);
    v41 = (void *)v8;
    if (v16)
    {
      [v11 setObject:v16 forKey:*MEMORY[0x1E4F8C958]];
      id v17 = (void *)v5;
    }
    else
    {
      id v17 = (void *)v5;
      if (*(void *)(a1 + 48))
      {
        uint64_t v32 = v4;
        uint64_t v34 = v2;
        id v18 = (CGImage *)DCIM_CGImageRefFromPLImage();
        MEMORY[0x19F38B490](*(void *)(a1 + 48));
        uint64_t v19 = PLExifOrientationFromImageOrientation();
        id v20 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C860]];
        id v21 = v20;
        if (v20) {
          BOOL v22 = [v20 intValue] == 10;
        }
        else {
          BOOL v22 = 0;
        }
        uint64_t v23 = objc_msgSend(MEMORY[0x1E4F8CDF8], "typeWithIdentifier:", v34, v32);
        id v24 = imageDataFromImageRef(v18, v23, v19, v22);
        if (v24) {
          [v11 setObject:v24 forKey:*MEMORY[0x1E4F8C958]];
        }

        id v17 = (void *)v5;
        uint64_t v4 = v33;
        uint64_t v2 = v34;
      }
    }
    if (v2) {
      [v11 setObject:v2 forKey:*MEMORY[0x1E4F8CAB8]];
    }
    id v15 = (void *)v44;
    if (v44) {
      [v11 setObject:v44 forKey:*MEMORY[0x1E4F8C930]];
    }
    if (v47) {
      [v11 setObject:v47 forKey:*MEMORY[0x1E4F8C928]];
    }
    if (v17) {
      [v11 setObject:v17 forKey:v4];
    }
    if (v45) {
      [v11 setObject:v45 forKey:v6];
    }
    v25 = [NSNumber numberWithBool:0];
    [v11 setObject:v25 forKey:*MEMORY[0x1E4F8CAA0]];

    uint64_t v26 = *MEMORY[0x1E4F8CAA8];
    v27 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CAA8]];

    if (v27)
    {
      [v11 addEntriesFromDictionary:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E4F8BA10], "defaultSavedAssetTypeForPLAssetsSaver"));
      [v11 setObject:v28 forKey:v26];
    }
    v29 = [NSNumber numberWithBool:1];
    [v11 setObject:v29 forKey:*MEMORY[0x1E4F8C858]];

    if (v3) {
      [v11 setObject:v3 forKey:v38];
    }
    if (v40) {
      [v11 setObject:v40 forKey:v39];
    }
    if (v43) {
      [v11 setObject:v43 forKey:v36];
    }
    if (v46) {
      [v11 setObject:v46 forKey:v37];
    }
    id v13 = (id)v2;
    if (v42) {
      [v11 setObject:v42 forKey:v35];
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke_98;
    v49[3] = &unk_1E5863848;
    uint64_t v30 = *(void **)(a1 + 64);
    v49[4] = *(void *)(a1 + 56);
    id v50 = v30;
    v31 = (void *)MEMORY[0x19F38D650](v49);
    [*(id *)(a1 + 56) _queueJobDictionary:v11 completionBlock:v31];

    goto LABEL_47;
  }
  id v13 = [(id)objc_opt_class() publicAssetsLibraryErrorFromPrivateDomain:*MEMORY[0x1E4F8C500] withPrivateCode:-3001];
  id v14 = *(void **)(a1 + 64);
  if (v14)
  {
    id v48 = v14;
    id v13 = v13;
    pl_dispatch_async();

    id v15 = v48;
LABEL_47:
  }
}

void __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke_98(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [(id)objc_opt_class() publicAssetsLibraryErrorFromPrivateError:v8];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v7, v9);
  }
}

uint64_t __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)saveCameraImage:(id)a3 metadata:(id)a4 additionalProperties:(id)a5 diagnostics:(id)a6 previouslyPendingAsset:(id)a7 requestEnqueuedBlock:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v44 = a8;
  v46 = v18;
  if (v18)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PLAssetsSaver.m", 359, @"diagnostics will always be nil, no clients pass in non-nil params currently, enforce until adopters drop call" object file lineNumber description];
  }
  SEL v42 = a2;
  v43 = self;
  context = (void *)MEMORY[0x19F38D3B0]();
  v47 = [v15 objectForKey:*MEMORY[0x1E4F8C818]];
  id v20 = [v15 objectForKey:*MEMORY[0x1E4F8C820]];
  id v21 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  BOOL v22 = [v21 objectForKey:*MEMORY[0x1E4F15538]];
  if (v22)
  {
    uint64_t v23 = [v19 managedObjectContext];

    if (v23)
    {
      [v19 setAvalancheUUID:v22];
      [v19 setAvalanchePickType:1];
      if (+[PLAvalanche shouldOnlyShowAvalanchePicks]) {
        [v19 setVisibilityState:2];
      }
    }
  }
  v45 = v19;
  id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  v25 = [NSNumber numberWithInt:0];
  [v24 setObject:v25 forKey:*MEMORY[0x1E4F8C8E8]];

  [v24 setObject:*MEMORY[0x1E4F8C9B8] forKey:*MEMORY[0x1E4F8C970]];
  if (v16)
  {
    uint64_t v26 = [NSNumber numberWithInteger:PLImageOrientationFromImageProperties()];
    [v24 setObject:v26 forKey:*MEMORY[0x1E4F8C960]];

    [v24 setObject:v16 forKey:*MEMORY[0x1E4F8C928]];
  }
  v27 = [MEMORY[0x1E4F1C9C8] date];
  [v24 setObject:v27 forKey:*MEMORY[0x1E4F8C908]];

  if (v17) {
    [v24 addEntriesFromDictionary:v17];
  }
  uint64_t v28 = v17;
  v29 = [NSNumber numberWithBool:0];
  [v24 setObject:v29 forKey:*MEMORY[0x1E4F8CAA0]];

  uint64_t v30 = *MEMORY[0x1E4F8CAA8];
  v31 = [v24 objectForKey:*MEMORY[0x1E4F8CAA8]];

  if (!v31)
  {
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E4F8BA10], "defaultSavedAssetTypeForPLAssetsSaver"));
    [v24 setObject:v32 forKey:v30];
  }
  uint64_t v33 = [NSNumber numberWithBool:1];
  [v24 setObject:v33 forKey:*MEMORY[0x1E4F8C858]];

  uint64_t v34 = [v15 objectForKey:*MEMORY[0x1E4F8C828]];
  uint64_t v35 = *MEMORY[0x1E4F8C830];
  uint64_t v36 = [v15 objectForKey:*MEMORY[0x1E4F8C830]];
  if (v36) {
    [v24 setObject:v36 forKey:v35];
  }

  uint64_t v37 = DCIM_CGImageRefFromPLImage();
  if (v37) {
    [v24 setObject:v37 forKey:*MEMORY[0x1E4F8CA98]];
  }
  if ([v20 length]) {
    [v24 setObject:v20 forKey:*MEMORY[0x1E4F8CA90]];
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __119__PLAssetsSaver_saveCameraImage_metadata_additionalProperties_diagnostics_previouslyPendingAsset_requestEnqueuedBlock___block_invoke;
  v48[3] = &__block_descriptor_40_e44_v32__0__NSDictionary_8__NSURL_16__NSError_24l;
  v48[4] = v42;
  uint64_t v38 = (void *)MEMORY[0x19F38D650](v48);
  [(PLAssetsSaver *)v43 _queueJobDictionary:v24 asset:0 requestEnqueuedBlock:v44 completionBlock:v38 imageSurface:v34];

  return 0;
}

void __119__PLAssetsSaver_saveCameraImage_metadata_additionalProperties_diagnostics_previouslyPendingAsset_requestEnqueuedBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8 || v9)
  {
    id v15 = PLCameraGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v17 = 138543618;
      id v18 = v16;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed: missing assetURL from reply (%{public}@)", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_7;
  }
  id v11 = [v7 objectForKey:*MEMORY[0x1E4F8C920]];
  char v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0)
  {
    id v13 = [v7 objectForKey:*MEMORY[0x1E4F8C8D0]];
    uint64_t v14 = [v13 BOOLValue];

    id v15 = +[PLLocationController sharedInstance];
    [v15 addLocationToMediaWithAssetURLWhenAvailable:v8 deviceOrientation:1 cameraWasRearFacing:v14];
LABEL_7:
  }
}

- (void)saveCameraImage:(id)a3 metadata:(id)a4 additionalProperties:(id)a5 requestEnqueuedBlock:(id)a6
{
  id v6 = [(PLAssetsSaver *)self saveCameraImage:a3 metadata:a4 additionalProperties:a5 diagnostics:0 previouslyPendingAsset:0 requestEnqueuedBlock:a6];
}

- (void)_queueJobDictionary:(id)a3 completionBlock:(id)a4
{
}

- (id)_assetsdClientForJobDictionary:(id)a3
{
  uint64_t v3 = [a3 objectForKey:*MEMORY[0x1E4F8CAB0]];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F8B868]) initWithPhotoLibraryURL:v3];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    uint64_t v4 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:v5];
  }
  return v4;
}

- (void)_queueJobDictionary:(id)a3 asset:(id)a4 requestEnqueuedBlock:(id)a5 completionBlock:(id)a6 imageSurface:(__IOSurface *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v31 = a5;
  id v13 = a6;
  if (PLIsAssetsd())
  {
    uint64_t v14 = [NSString stringWithFormat:@"Calling PLAssetsSaver from assetsd directly with job dictionary: %@", v12];
    PLSimulateCrash();
  }
  id v15 = [v12 objectForKey:@"callStack"];
  if (v15)
  {
    id v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v17;
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "##### %@ %@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CAD0] setWithObject:@"callStack"];
    PLJobLogDictionary();
  }
  __int16 v19 = PLBackendGetLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  uint64_t v21 = (void *)MEMORY[0x1E4F8C970];
  if (v20)
  {
    BOOL v22 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v22;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Sending assets saver job: %{public}@", buf, 0xCu);
  }
  if ((PLIsAssetsd() & 1) == 0) {
    PLIssueSandboxExtensionsForJobDictionary(v12);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke;
  v33[3] = &unk_1E5863780;
  v33[4] = self;
  id v34 = v13;
  id v23 = v13;
  id v24 = (void *)MEMORY[0x19F38D650](v33);
  if (a7)
  {
    CFRetain(a7);
    v25 = [v12 objectForKey:*v21];
    int v26 = [v25 isEqualToString:*MEMORY[0x1E4F8C9B8]];

    if (v26) {
      [(PLAssetsSaver *)self _setIsTakingPhoto:1];
    }
  }
  v27 = [(PLAssetsSaver *)self _saveIsolationQueue];
  uint64_t v32 = v12;
  id v28 = v31;
  id v29 = v24;
  id v30 = v12;
  pl_dispatch_async();
}

void __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 40))
  {
    if (a2)
    {
      id v9 = [v7 objectForKey:*MEMORY[0x1E4F8C870]];
      uint64_t v10 = [v7 objectForKey:@"Error"];
    }
    else
    {
      uint64_t v10 = [(id)objc_opt_class() publicAssetsLibraryErrorFromPrivateError:v8];
      id v9 = 0;
    }

    id v13 = *(id *)(a1 + 40);
    id v12 = v7;
    id v8 = v10;
    id v11 = v9;
    pl_dispatch_async();
  }
}

void __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C830]];
    if (v2)
    {
      uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8B928]), "initWithIOSurface:length:", *(void *)(a1 + 64), objc_msgSend(v2, "unsignedIntegerValue"));
      uint64_t v4 = *MEMORY[0x1E4F8C958];
      [*(id *)(a1 + 32) setObject:v3 forKey:*MEMORY[0x1E4F8C958]];
    }
    else
    {
      uint64_t v4 = *MEMORY[0x1E4F8C958];
    }
    id v6 = [MEMORY[0x1E4F8B850] sharedDCIMWriter];
    char v5 = [v6 saveImageJobToDisk:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) removeObjectForKey:v4];
    [*(id *)(a1 + 32) removeObjectForKey:*MEMORY[0x1E4F8CA98]];
  }
  else
  {
    char v5 = 1;
  }
  id v7 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C928]];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  id v9 = [v8 objectForKey:*MEMORY[0x1E4F15538]];
  if (v9
    && ([*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8CAA0]],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 BOOLValue],
        v10,
        (v11 & 1) == 0))
  {
    BOOL v22 = [*(id *)(a1 + 40) _pendingSaveAssetJobs];
    [v22 addObject:*(void *)(a1 + 32)];
  }
  else
  {
    int v12 = PLIsAssetsd();
    id v13 = *(void **)(a1 + 40);
    if (v12)
    {
      uint64_t v14 = [v13 _photoLibrary];
      id v15 = [v14 libraryServicesManager];
      id v16 = [v15 imageWriter];

      if (!v16)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"PLAssetsSaver.m", 287, @"Invalid parameter not satisfying: %@", @"imageWriter" object file lineNumber description];
      }
      uint64_t v17 = *(void *)(a1 + 32);
      if (v5) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = *(void *)(a1 + 64);
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_4;
      v29[3] = &unk_1E5871F60;
      id v30 = *(id *)(a1 + 48);
      [v16 saveAssetJob:v17 imageSurface:v18 previewImageSurface:0 completionHandler:v29];
    }
    else
    {
      id v16 = [v13 _assetsdClientForJobDictionary:*(void *)(a1 + 32)];
      __int16 v19 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8CB70]];
      int v20 = [v19 BOOLValue];

      if (v20) {
        [v16 resourceWriteOnlyClient];
      }
      else {
      uint64_t v21 = [v16 resourceClient];
      }
      id v23 = v21;
      if (v5) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = *(void *)(a1 + 64);
      }
      [v21 saveAssetWithJobDictionary:*(void *)(a1 + 32) imageSurface:v24 previewImageSurface:0 completionHandler:*(void *)(a1 + 48)];
    }
  }
  v25 = *(const void **)(a1 + 64);
  if (v25) {
    CFRelease(v25);
  }
  int v26 = *(void **)(a1 + 56);
  if (v26)
  {
    id v28 = v26;
    pl_dispatch_async();
  }
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 40) _setIsTakingPhoto:0];
  }
}

void __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_4(uint64_t a1, int a2, void *a3, int a4, void *a5)
{
  id v12 = a3;
  id v9 = a5;
  uint64_t v10 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, id, void))(v10 + 16))(v10, 1, v12, 0);
  }
  else if (a4)
  {
    char v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:42002 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v11);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, 0, 0, v9);
  }
}

uint64_t __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)queuePhotoStreamJobDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKey:@"callStack"];
  if (v6)
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      BOOL v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "##### %@ %@", buf, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"callStack"];
    PLJobLogDictionary();
  }
  uint64_t v10 = PLBackendGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
    *(_DWORD *)buf = 138543362;
    BOOL v22 = v11;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Sending assets saver photo stream job: %{public}@", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__PLAssetsSaver_queuePhotoStreamJobDictionary___block_invoke;
  v19[3] = &unk_1E5863750;
  id v12 = v5;
  id v20 = v12;
  id v13 = (void *)MEMORY[0x19F38D650](v19);
  uint64_t v14 = [(PLAssetsSaver *)self _saveIsolationQueue];
  uint64_t v17 = v12;
  uint64_t v18 = v13;
  id v15 = v13;
  id v16 = v12;
  pl_dispatch_async();
}

void __47__PLAssetsSaver_queuePhotoStreamJobDictionary___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Error processing assets saver photo stream job: %{public}@ -- %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __47__PLAssetsSaver_queuePhotoStreamJobDictionary___block_invoke_56(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  id v4 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:v2];

  uint64_t v3 = [v4 resourceClient];
  [v3 saveAssetWithJobDictionary:*(void *)(a1 + 32) imageSurface:0 previewImageSurface:0 completionHandler:*(void *)(a1 + 40)];
}

- (id)_saveIsolationQueue
{
  pl_dispatch_once();
  uint64_t v2 = (void *)_saveIsolationQueue_saveIsolation;
  return v2;
}

void __36__PLAssetsSaver__saveIsolationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PLAssetsSaver.saveImageJobIsolation", 0);
  v1 = (void *)_saveIsolationQueue_saveIsolation;
  _saveIsolationQueue_saveIsolation = (uint64_t)v0;
}

- (void)_setIsTakingPhoto:(BOOL)a3
{
}

void __35__PLAssetsSaver__setIsTakingPhoto___block_invoke_2(uint64_t a1)
{
  int v1 = _setIsTakingPhoto__takingPhotoCount;
  if (*(unsigned char *)(a1 + 40))
  {
    ++_setIsTakingPhoto__takingPhotoCount;
    if (v1) {
      return;
    }
    uint64_t v2 = [*(id *)(a1 + 32) _photoLibrary];
    uint64_t v3 = [v2 libraryBundle];
    id v8 = [v3 indicatorFileCoordinator];

    id v4 = v8;
    uint64_t v5 = 1;
  }
  else
  {
    --_setIsTakingPhoto__takingPhotoCount;
    if (v1 != 1) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) _photoLibrary];
    id v7 = [v6 libraryBundle];
    id v8 = [v7 indicatorFileCoordinator];

    id v4 = v8;
    uint64_t v5 = 0;
  }
  [v4 setTakingPhotoIsBusy:v5];
}

void __35__PLAssetsSaver__setIsTakingPhoto___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PLAssetsSaver.takingPhotoIndicatorIsolation", 0);
  int v1 = (void *)_setIsTakingPhoto__takingPhotoIndicatorIsolation;
  _setIsTakingPhoto__takingPhotoIndicatorIsolation = (uint64_t)v0;
}

- (void)requestAsynchronousImageForAssetOID:(id)a3 withFormat:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 completionBlock:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v13 = *(void *)&a4;
  id v16 = a9;
  id v17 = a3;
  uint64_t v18 = [(PLAssetsSaver *)self _photoLibrary];
  __int16 v19 = [v18 assetsdClient];
  id v20 = [v19 resourceClient];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __147__PLAssetsSaver_requestAsynchronousImageForAssetOID_withFormat_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionBlock___block_invoke;
  v22[3] = &unk_1E5863728;
  id v23 = v16;
  id v21 = v16;
  [v20 imageDataForAsset:v17 format:v13 allowPlaceholder:v12 wantURLOnly:v11 networkAccessAllowed:v10 trackCPLDownload:v9 completionHandler:v22];
}

uint64_t __147__PLAssetsSaver_requestAsynchronousImageForAssetOID_withFormat_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestSynchronousImageForAssetOID:(id)a3 withFormat:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 outImageDataInfo:(id *)a9 outCPLDownloadContext:(id *)a10
{
  BOOL v30 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  context = (void *)MEMORY[0x19F38D3B0]();
  id v16 = [(PLAssetsSaver *)self _photoLibrary];
  id v17 = [v16 assetsdClient];
  uint64_t v18 = [v17 resourceClient];

  id v35 = 0;
  __int16 v19 = &v34;
  if (a9) {
    id v34 = 0;
  }
  else {
    __int16 v19 = 0;
  }
  id v20 = &v33;
  if (a10) {
    id v33 = 0;
  }
  else {
    id v20 = 0;
  }
  id v32 = 0;
  id v21 = v15;
  char v22 = [v18 imageDataForAsset:v15 format:v13 allowPlaceholder:v12 wantURLOnly:v11 networkAccessAllowed:v10 trackCPLDownload:v30 outImageData:&v35 outImageDataInfo:v19 outCPLDownloadContext:v20 error:&v32];
  id v23 = v35;
  if (a9)
  {
    id v24 = v34;
    if (a10)
    {
LABEL_9:
      id v25 = v33;
      goto LABEL_12;
    }
  }
  else
  {
    id v24 = 0;
    if (a10) {
      goto LABEL_9;
    }
  }
  id v25 = 0;
LABEL_12:
  id v26 = v32;
  if ((v22 & 1) == 0)
  {
    v27 = PLBackendGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v26;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Error requesting image data for asset: %@", buf, 0xCu);
    }
  }
  if (a9) {
    *a9 = v24;
  }
  if (a10) {
    *a10 = v25;
  }
  id v28 = v23;

  return v28;
}

- (id)_photoLibrary
{
  return +[PLPhotoLibrary cameraPhotoLibrary];
}

- (void)dealloc
{
  if ((PLAssetsSaver *)__SharedAssetsSaver == self)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PLAssetsSaver.m" lineNumber:111 description:@"sharedAssetsSaver should never be dealloc'd"];
  }
  v5.receiver = self;
  v5.super_class = (Class)PLAssetsSaver;
  [(PLAssetsSaver *)&v5 dealloc];
}

- (PLAssetsSaver)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLAssetsSaver;
  uint64_t v2 = [(PLAssetsSaver *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pendingSaveAssetJobs = v2->__pendingSaveAssetJobs;
    v2->__pendingSaveAssetJobs = (NSMutableArray *)v3;

    objc_super v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inProgressAvalancheFds = v2->_inProgressAvalancheFds;
    v2->_inProgressAvalancheFds = v5;
  }
  return v2;
}

+ (id)publicAssetsLibraryErrorFromPrivateError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  uint64_t v5 = [v3 code];
  if ([v4 isEqualToString:*MEMORY[0x1E4F8C500]])
  {
    if (v5 > 12)
    {
      if (v5 == 13)
      {
LABEL_13:
        id v6 = PLServicesLocalizedFrameworkString();
        id v7 = PLServicesLocalizedFrameworkString();
        objc_super v8 = PLServicesLocalizedFrameworkString();
        uint64_t v5 = -3302;
        goto LABEL_16;
      }
      if (v5 == 14)
      {
LABEL_11:
        id v6 = PLServicesLocalizedFrameworkString();
        id v7 = 0;
        objc_super v8 = 0;
        uint64_t v5 = -3305;
        goto LABEL_16;
      }
    }
    else
    {
      if (v5 == -3001)
      {
LABEL_12:
        id v6 = PLServicesLocalizedFrameworkString();
        objc_super v8 = PLServicesLocalizedFrameworkString();
        id v7 = 0;
        uint64_t v5 = -3310;
        goto LABEL_16;
      }
      if (v5 == 12)
      {
LABEL_5:
        id v6 = PLServicesLocalizedFrameworkString();
        id v7 = 0;
        objc_super v8 = 0;
        uint64_t v5 = -3304;
        goto LABEL_16;
      }
    }
    goto LABEL_15;
  }
  if (![v4 isEqualToString:@"ALAssetsLibraryErrorDomain"])
  {
LABEL_15:
    id v6 = PLServicesLocalizedFrameworkString();
    id v7 = 0;
    objc_super v8 = 0;
    uint64_t v5 = -1;
    goto LABEL_16;
  }
  id v7 = 0;
  id v6 = 0;
  objc_super v8 = 0;
  switch(v5)
  {
    case -3315:
      id v6 = PLServicesLocalizedFrameworkString();
      id v7 = 0;
      objc_super v8 = 0;
      uint64_t v5 = -3315;
      break;
    case -3314:
    case -3313:
    case -3312:
    case -3309:
    case -3308:
    case -3307:
    case -3306:
    case -3303:
      break;
    case -3311:
      id v6 = PLServicesLocalizedFrameworkString();
      id v7 = PLServicesLocalizedFrameworkString();
      objc_super v8 = 0;
      uint64_t v5 = -3311;
      break;
    case -3310:
      goto LABEL_12;
    case -3305:
      goto LABEL_11;
    case -3304:
      goto LABEL_5;
    case -3302:
      goto LABEL_13;
    case -3301:
      id v6 = PLServicesLocalizedFrameworkString();
      id v7 = PLServicesLocalizedFrameworkString();
      objc_super v8 = PLServicesLocalizedFrameworkString();
      uint64_t v5 = -3301;
      break;
    case -3300:
      id v6 = PLServicesLocalizedFrameworkString();
      id v7 = PLServicesLocalizedFrameworkString();
      objc_super v8 = 0;
      uint64_t v5 = -3300;
      break;
    default:
      if (v5 == -1) {
        goto LABEL_15;
      }
      break;
  }
LABEL_16:
  BOOL v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v6 length]) {
    [v9 setObject:v6 forKey:*MEMORY[0x1E4F28568]];
  }
  if ([v7 length]) {
    [v9 setObject:v7 forKey:*MEMORY[0x1E4F28588]];
  }
  if ([v8 length]) {
    [v9 setObject:v8 forKey:*MEMORY[0x1E4F285A0]];
  }
  if (v3) {
    [v9 setObject:v3 forKey:*MEMORY[0x1E4F28A50]];
  }
  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ALAssetsLibraryErrorDomain" code:v5 userInfo:v9];

  return v10;
}

+ (id)publicAssetsLibraryErrorFromPrivateDomain:(id)a3 withPrivateCode:(int64_t)a4
{
  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:a3 code:a4 userInfo:0];
  id v6 = [a1 publicAssetsLibraryErrorFromPrivateError:v5];

  return v6;
}

+ (id)createWriteVideoCompletionBlockWithVideoPath:(id)a3 target:(id)a4 selector:(SEL)a5 contextInfo:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = 0;
  if (v11 && a5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3C8];
      id v17 = NSString;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = NSStringFromSelector(a5);
      id v20 = [v17 stringWithFormat:@"%@<%p> does not respond to selector %@", v18, v11, v19];
      id v21 = [v15 exceptionWithName:v16 reason:v20 userInfo:0];

      objc_exception_throw(v21);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__PLAssetsSaver_createWriteVideoCompletionBlockWithVideoPath_target_selector_contextInfo___block_invoke;
    v22[3] = &unk_1E5863818;
    id v24 = a1;
    id v23 = v11;
    SEL v25 = a5;
    id v26 = a6;
    uint64_t v13 = (void *)MEMORY[0x19F38D650](v22);
    BOOL v12 = (void *)[v13 copy];
  }
  return v12;
}

void __90__PLAssetsSaver_createWriteVideoCompletionBlockWithVideoPath_target_selector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = a3;
    a3 = [(id)objc_opt_class() publicAssetsLibraryErrorFromPrivateError:v6];
  }
  id v7 = (void *)MEMORY[0x1E4F1CA18];
  objc_super v8 = objc_msgSend(*(id *)(a1 + 32), "methodSignatureForSelector:", *(void *)(a1 + 48), a3, v5);
  BOOL v9 = [v7 invocationWithMethodSignature:v8];

  [v9 setSelector:*(void *)(a1 + 48)];
  [v9 setTarget:*(void *)(a1 + 32)];
  [v9 setArgument:&v11 atIndex:2];
  [v9 setArgument:&v10 atIndex:3];
  [v9 setArgument:a1 + 56 atIndex:4];
  [v9 invoke];
}

+ (id)createWriteImageCompletionBlockWithImage:(id)a3 target:(id)a4 selector:(SEL)a5 contextInfo:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = 0;
  if (v11 && a5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3C8];
      id v17 = NSString;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = NSStringFromSelector(a5);
      id v20 = [v17 stringWithFormat:@"%@<%p> does not respond to selector %@", v18, v11, v19];
      id v21 = [v15 exceptionWithName:v16 reason:v20 userInfo:0];

      objc_exception_throw(v21);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__PLAssetsSaver_createWriteImageCompletionBlockWithImage_target_selector_contextInfo___block_invoke;
    v22[3] = &unk_1E58637F0;
    id v25 = a1;
    id v23 = v10;
    id v24 = v11;
    SEL v26 = a5;
    v27 = a6;
    uint64_t v13 = (void *)MEMORY[0x19F38D650](v22);
    BOOL v12 = (void *)[v13 copy];
  }
  return v12;
}

void __86__PLAssetsSaver_createWriteImageCompletionBlockWithImage_target_selector_contextInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 48), "publicAssetsLibraryErrorFromPrivateError:");
  }
  else
  {
    id v4 = 0;
  }
  id v5 = (void *)MEMORY[0x1E4F1CA18];
  id v6 = objc_msgSend(*(id *)(a1 + 40), "methodSignatureForSelector:", *(void *)(a1 + 56), v4, *(void *)(a1 + 32));
  id v7 = [v5 invocationWithMethodSignature:v6];

  [v7 setSelector:*(void *)(a1 + 56)];
  [v7 setTarget:*(void *)(a1 + 40)];
  [v7 setArgument:&v9 atIndex:2];
  [v7 setArgument:&v8 atIndex:3];
  [v7 setArgument:a1 + 64 atIndex:4];
  [v7 invoke];
}

+ (id)sharedAssetsSaver
{
  pl_dispatch_once();
  uint64_t v2 = (void *)__SharedAssetsSaver;
  return v2;
}

void __34__PLAssetsSaver_sharedAssetsSaver__block_invoke()
{
  dispatch_queue_t v0 = objc_alloc_init(PLAssetsSaver);
  int v1 = (void *)__SharedAssetsSaver;
  __SharedAssetsSaver = (uint64_t)v0;
}

@end