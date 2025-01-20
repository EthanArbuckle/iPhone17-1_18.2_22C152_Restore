@interface PXMediaTypeInfoManager
+ (NSURL)knowledgeBaseFallbackURL;
+ (PXMediaTypeInfoManager)sharedManager;
- (PXMediaTypeInfoManager)init;
- (id)_init;
- (void)_handleAssetDownloadProgressWithAsset:(id)a3 error:(id)a4;
- (void)_handleAssetQueryCallbackWithAsset:(id)a3 error:(id)a4 userInitiated:(BOOL)a5;
- (void)_handleInstallMobileAssetCallbackWithAsset:(id)a3 UTI:(id)a4 codecName:(id)a5 completionHandler:(id)a6;
- (void)_installMobileAssetAsUserInitiated:(BOOL)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)_prepareInformationForLookups;
- (void)_processPendingCallbacksWithAsset:(id)a3;
- (void)mediaTypeInfoURLForUTI:(id)a3 codecName:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)prepareInformationForLookups;
@end

@implementation PXMediaTypeInfoManager

void __54__PXMediaTypeInfoManager_prepareInformationForLookups__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _prepareInformationForLookups];
}

- (void)_prepareInformationForLookups
{
  if ([MEMORY[0x1E4F77F90] nonUserInitiatedDownloadsAllowed])
  {
    v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "PXMediaTypeInfoManager - Kick off speculative asset download.", v4, 2u);
    }

    [(PXMediaTypeInfoManager *)self _installMobileAssetAsUserInitiated:0 timeout:0 completionHandler:-1.0];
  }
}

- (void)_installMobileAssetAsUserInitiated:(BOOL)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    id v11 = _Block_copy(v9);
    if (a4 > 0.0)
    {
      if (!a3)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2, self, @"PXMediaTypeInfoManager.m", 167, @"Invalid parameter not satisfying: %@", @"userInitiated" object file lineNumber description];
      }
      location[0] = 0;
      location[1] = location;
      location[2] = (id)0x2020000000;
      char v31 = 1;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke;
      aBlock[3] = &unk_1E5DC1DA0;
      v29 = location;
      id v28 = v10;
      v12 = _Block_copy(aBlock);

      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      v14 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2;
      block[3] = &unk_1E5DD35B8;
      v26 = location;
      id v11 = v12;
      id v25 = v11;
      dispatch_after(v13, v14, block);

      _Block_object_dispose(location, 8);
    }
    serialQueue = self->_serialQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_310;
    v22[3] = &unk_1E5DD3280;
    v22[4] = self;
    id v23 = v11;
    id v16 = v11;
    dispatch_sync(serialQueue, v22);
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F77FA0]) initWithAssetType:@"com.apple.MobileAsset.MediaSupport"];
  objc_initWeak(location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2_312;
  v19[3] = &unk_1E5DC1DC8;
  objc_copyWeak(&v20, location);
  BOOL v21 = a3;
  [v17 startQuery:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak(location);
}

void __39__PXMediaTypeInfoManager_sharedManager__block_invoke()
{
  id v0 = [[PXMediaTypeInfoManager alloc] _init];
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;
}

- (void)prepareInformationForLookups
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PXMediaTypeInfoManager_prepareInformationForLookups__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_block_t v2 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, v4);
  v3 = dispatch_get_global_queue(9, 0);
  dispatch_async(v3, v2);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)PXMediaTypeInfoManager;
  dispatch_block_t v2 = [(PXMediaTypeInfoManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PXMediaTypeInfoManagerSerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingCompletionHandlers = v2->_pendingCompletionHandlers;
    v2->_pendingCompletionHandlers = v5;
  }
  return v2;
}

+ (PXMediaTypeInfoManager)sharedManager
{
  if (sharedManager_predicate != -1) {
    dispatch_once(&sharedManager_predicate, &__block_literal_global_173717);
  }
  dispatch_block_t v2 = (void *)sharedManager__sharedManager;
  return (PXMediaTypeInfoManager *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)mediaTypeInfoURLForUTI:(id)a3 codecName:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a6;
  if (!v13)
  {
    BOOL v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXMediaTypeInfoManager.m", 310, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  if (v11 | v12)
  {
    v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v31 = v11;
      __int16 v32 = 2112;
      unint64_t v33 = v12;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Look up URL for UTI: \"%@\", codec: \"%@\"", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v15 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_327;
    block[3] = &unk_1E5DCA988;
    objc_copyWeak(v26, (id *)buf);
    v26[1] = *(id *)&a5;
    id v23 = (id)v11;
    id v24 = (id)v12;
    id v25 = v13;
    id v16 = v13;
    dispatch_async(v15, block);

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = +[PXMediaTypeInfoManager knowledgeBaseFallbackURL];
    v18 = PLUIGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v31 = (unint64_t)v17;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - !UTI && !codecName - Returning fallback URL: \"%@\"", buf, 0xCu);
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke;
    v27[3] = &unk_1E5DD3280;
    id v28 = v17;
    id v29 = v13;
    id v19 = v17;
    id v20 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v27);
  }
}

uint64_t __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_327(uint64_t a1)
{
  dispatch_block_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  double v4 = *(double *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5DC1DF0;
  objc_copyWeak(&v9, v2);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [WeakRetained _installMobileAssetAsUserInitiated:1 timeout:v5 completionHandler:v4];

  objc_destroyWeak(&v9);
}

void __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_2(void *a1, void *a2)
{
  dispatch_queue_t v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleInstallMobileAssetCallbackWithAsset:v4 UTI:a1[4] codecName:a1[5] completionHandler:a1[6]];
}

- (void)_handleInstallMobileAssetCallbackWithAsset:(id)a3 UTI:(id)a4 codecName:(id)a5 completionHandler:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if ([v11 state] != 1)
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2, self, @"PXMediaTypeInfoManager.m", 258, @"Invalid parameter not satisfying: %@", @"!asset || ([asset state] == ASAssetStateInstalled)" object file lineNumber description];
    }
    v49 = v13;
    v15 = [v11 localURL];
    id v16 = [v15 URLByAppendingPathComponent:@"mediaSupport"];
    v17 = [v16 URLByAppendingPathExtension:@"plist"];

    id v54 = 0;
    v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v17 options:2 error:&v54];
    id v19 = v54;
    id v20 = v12;
    if (!v18)
    {
      BOOL v21 = PLUIGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v19;
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: failed to load plist data with error: %@", buf, 0xCu);
      }
      unint64_t v33 = 0;
      v22 = v19;
LABEL_31:

      id v12 = v20;
      id v13 = v49;
      if (v33) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
    id v53 = 0;
    BOOL v21 = [MEMORY[0x1E4F28F98] propertyListWithData:v18 options:0 format:0 error:&v53];
    v22 = v53;

    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v21;
        id v24 = v20;
        id v47 = v49;
        id v25 = [v23 objectForKeyedSubscript:@"uniformTypeIdentifierURLs-Photos"];
        v48 = v24;
        v26 = [v25 objectForKeyedSubscript:v24];

        if (v26) {
          goto LABEL_44;
        }
        v27 = [v23 objectForKeyedSubscript:@"uniformTypeIdentifierURLs"];
        v26 = [v27 objectForKeyedSubscript:v48];

        if (v26) {
          goto LABEL_44;
        }
        id v28 = [v23 objectForKeyedSubscript:@"codecURLs-Photos"];
        v26 = [v28 objectForKeyedSubscript:v47];

        if (v26
          || ([v23 objectForKeyedSubscript:@"codecURLs"],
              id v29 = objc_claimAutoreleasedReturnValue(),
              [v29 objectForKeyedSubscript:v47],
              v26 = objc_claimAutoreleasedReturnValue(),
              v29,
              v26))
        {
LABEL_44:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v46 = v23;
            v30 = PLUIGetLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              unint64_t v31 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v56 = v31;
              __int16 v32 = v31;
              _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: value should be string but is: \"%@\"", buf, 0xCu);
            }
            v26 = 0;
            id v23 = v46;
          }
        }

        if (v26)
        {
          unint64_t v33 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
          uint64_t v34 = PLUIGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v33;
            _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Returning URL: \"%@\"", buf, 0xCu);
          }

          goto LABEL_30;
        }
      }
      else
      {
        v26 = PLUIGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v36 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v56 = v36;
          v37 = v36;
          _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: plist must be a dictionary but is: \"%@\"", buf, 0xCu);
        }
      }
    }
    else
    {
      v26 = PLUIGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v22;
        _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: failed to deserialize plist data with error: %@", buf, 0xCu);
      }
    }
    unint64_t v33 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v35 = PLUIGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v35, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - No asset available for lookup.", buf, 2u);
  }

LABEL_32:
  unint64_t v33 = +[PXMediaTypeInfoManager knowledgeBaseFallbackURL];
LABEL_33:
  v38 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v39 = [v38 stringForKey:@"PXMediaTypeInfoManagerMoreInfoURLString"];

  if (v39)
  {
    v40 = [MEMORY[0x1E4F1CB10] URLWithString:v39];
    v41 = PLUIGetLog();
    v42 = v41;
    if (v40)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v40;
        _os_log_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Using debug URL: \"%@\"", buf, 0xCu);
      }

      [MEMORY[0x1E4F1CB10] URLWithString:v39];
      unint64_t v33 = v42 = v33;
    }
    else if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v39;
      _os_log_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Failed to create debug URL from the provided string: \"%@\"", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PXMediaTypeInfoManager__handleInstallMobileAssetCallbackWithAsset_UTI_codecName_completionHandler___block_invoke;
  block[3] = &unk_1E5DD3280;
  v51 = v33;
  id v52 = v14;
  v43 = v33;
  id v44 = v14;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __101__PXMediaTypeInfoManager__handleInstallMobileAssetCallbackWithAsset_UTI_codecName_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 0;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    dispatch_block_t v2 = PLUIGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v3 = 0;
      _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Lookup timed out.", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

void __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_310(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  [v1 addObject:v2];
}

void __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2_312(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = [a2 firstObject];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAssetQueryCallbackWithAsset:v7 error:v5 userInitiated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleAssetQueryCallbackWithAsset:(id)a3 error:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [v8 state];
    if (v10 == 1)
    {
      v18 = PLUIGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Asset installed.", (uint8_t *)&buf, 2u);
      }

      [(PXMediaTypeInfoManager *)self _processPendingCallbacksWithAsset:v8];
    }
    else if (!v10)
    {
      int v11 = [MEMORY[0x1E4F77F90] nonUserInitiatedDownloadsAllowed];
      id v12 = PLUIGetLog();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Asset not present, will download.", (uint8_t *)&buf, 2u);
        }

        [v8 setUserInitiatedDownload:v5];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v8);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __81__PXMediaTypeInfoManager__handleAssetQueryCallbackWithAsset_error_userInitiated___block_invoke;
        v21[3] = &unk_1E5DC1D78;
        objc_copyWeak(&v22, &location);
        objc_copyWeak(&v23, &from);
        [v8 setProgressHandler:v21];
        if (v5)
        {
          uint64_t v14 = *MEMORY[0x1E4F77F50];
          uint64_t v26 = *MEMORY[0x1E4F77F48];
          uint64_t v27 = v14;
          *(void *)&long long buf = MEMORY[0x1E4F1CC38];
          *((void *)&buf + 1) = MEMORY[0x1E4F1CC38];
          uint64_t v15 = *MEMORY[0x1E4F77F68];
          uint64_t v28 = *MEMORY[0x1E4F77F58];
          uint64_t v29 = v15;
          uint64_t v32 = MEMORY[0x1E4F1CC38];
          uint64_t v33 = MEMORY[0x1E4F1CC38];
          uint64_t v30 = *MEMORY[0x1E4F77F78];
          uint64_t v34 = *MEMORY[0x1E4F77F88];
          uint64_t v16 = 5;
        }
        else
        {
          uint64_t v19 = *MEMORY[0x1E4F77F58];
          uint64_t v26 = *MEMORY[0x1E4F77F50];
          uint64_t v27 = v19;
          *(void *)&long long buf = MEMORY[0x1E4F1CC38];
          *((void *)&buf + 1) = MEMORY[0x1E4F1CC38];
          uint64_t v28 = *MEMORY[0x1E4F77F68];
          uint64_t v32 = MEMORY[0x1E4F1CC38];
          uint64_t v16 = 3;
        }
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v26 count:v16];
        [v8 beginDownloadWithOptions:v20];

        objc_destroyWeak(&v23);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      else
      {
        if (v13)
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Asset not present, not allowed to download.", (uint8_t *)&buf, 2u);
        }

        [(PXMediaTypeInfoManager *)self _processPendingCallbacksWithAsset:0];
      }
    }
  }
  else
  {
    v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Query returned no asset! Error: %@", (uint8_t *)&buf, 0xCu);
    }

    [(PXMediaTypeInfoManager *)self _processPendingCallbacksWithAsset:0];
  }
}

void __81__PXMediaTypeInfoManager__handleAssetQueryCallbackWithAsset_error_userInitiated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAssetDownloadProgressWithAsset:v6 error:v5];
}

- (void)_handleAssetDownloadProgressWithAsset:(id)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Download returned error: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = self;
    id v10 = 0;
LABEL_5:
    [(PXMediaTypeInfoManager *)v9 _processPendingCallbacksWithAsset:v10];
    goto LABEL_6;
  }
  if (v6 && [v6 state] == 1)
  {
    int v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Did download asset.", (uint8_t *)&v12, 2u);
    }

    id v9 = self;
    id v10 = v6;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_processPendingCallbacksWithAsset:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__173696;
  v12[4] = __Block_byref_object_dispose__173697;
  id v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke;
  block[3] = &unk_1E5DD0588;
  void block[4] = self;
  block[5] = v12;
  dispatch_sync(serialQueue, block);
  id v6 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_2;
  v8[3] = &unk_1E5DD0588;
  id v9 = v4;
  id v10 = v12;
  id v7 = v4;
  dispatch_async(v6, v8);

  _Block_object_dispose(v12, 8);
}

uint64_t __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v5 removeAllObjects];
}

void __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_3;
  v2[3] = &unk_1E5DC1D50;
  id v3 = *(id *)(a1 + 32);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (PXMediaTypeInfoManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMediaTypeInfoManager.m", 32, @"%s is not available as initializer", "-[PXMediaTypeInfoManager init]");

  abort();
}

+ (NSURL)knowledgeBaseFallbackURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT206892"];
}

@end