@interface NTKGreenfieldB640Manager
- (NSUUID)addedFaceID;
- (NTKGreenfieldB640Manager)init;
- (NTKGreenfieldB640WatchFacesManagerDelegate)delegate;
- (id)_analyticsExitScreenNameForCurrentState;
- (id)_analyticsModelForAddFaceEventsForWatchFace:(id)a3;
- (unint64_t)bandVariantForPairedDevice;
- (void)_cancelLibraryTimeoutTimer;
- (void)_decodeWatchFacesUrls:(id)a3;
- (void)_handleB640WatchFaceManagerDidFinishWithError:(id)a3 watchFaceModels:(id)a4;
- (void)_handleProductKitUrl:(id)a3;
- (void)_libraryTimeoutTimerFired;
- (void)_moveToDecodeStateCompletedIfPossible;
- (void)_setLibraryState:(unint64_t)a3;
- (void)_startLibraryTimeoutTimer;
- (void)_updateComplicationForDecodedRecipe:(id)a3 installedItemIds:(id)a4 installedBundleIds:(id)a5;
- (void)decodeUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4;
- (void)faceCollectionDidLoad:(id)a3;
- (void)handleAddToMyFacesAction;
- (void)handleDidExitGreenfieldB640Flow;
- (void)handleWatchFaceSelectedActionWithSelectedIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NTKGreenfieldB640Manager

- (NTKGreenfieldB640Manager)init
{
  v14.receiver = self;
  v14.super_class = (Class)NTKGreenfieldB640Manager;
  v2 = [(NTKGreenfieldB640Manager *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanotimekit.NTKGreenfieldB640WatchFacesManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = +[NTKCompanionFaceCollectionsManager sharedInstance];
    v6 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v7 = [v5 sharedFaceCollectionForDevice:v6 forCollectionIdentifier:@"LibraryFaces"];
    library = v2->_library;
    v2->_library = (NTKPersistentFaceCollection *)v7;

    v2->_state = 0;
    [(NTKFaceCollection *)v2->_library addObserver:v2];
    if ([(NTKPersistentFaceCollection *)v2->_library hasLoaded])
    {
      v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "B640 manager init - face library is loaded.", v13, 2u);
      }

      [(NTKGreenfieldB640Manager *)v2 _setLibraryState:2];
    }
    else
    {
      [(NTKGreenfieldB640Manager *)v2 _startLibraryTimeoutTimer];
    }
    uint64_t v10 = objc_opt_new();
    productKitCatalog = v2->_productKitCatalog;
    v2->_productKitCatalog = (ProductKitCatalog *)v10;
  }
  return v2;
}

- (void)decodeUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, a4);
  id v7 = a4;
  id v11 = a3;
  v8 = [v11 lastPathComponent];
  scannedCodeIdentifier = self->_scannedCodeIdentifier;
  self->_scannedCodeIdentifier = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didStartDecodingWatchFaces:self];

  [(NTKGreenfieldB640Manager *)self _handleProductKitUrl:v11];
}

- (void)_handleProductKitUrl:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_state = 1;
  v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "B640 __handleProductKitUrl: %@", buf, 0xCu);
  }

  v6 = [v4 absoluteString];
  id v7 = [v6 componentsSeparatedByString:@"="];
  v8 = [v7 lastObject];

  v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  if (([MEMORY[0x1E4F93C38] isProductKitURL:v9] & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 14;
LABEL_8:
    v15 = objc_msgSend(v13, "greenfield_addWatchFaceErrorWithCode:", v14);
    [(NTKGreenfieldB640Manager *)self _handleB640WatchFaceManagerDidFinishWithError:v15 watchFaceModels:0];

    goto LABEL_9;
  }
  uint64_t v10 = [MEMORY[0x1E4F19A30] currentDevice];
  id v11 = [v10 nrDevice];

  if (!v11)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 3;
    goto LABEL_8;
  }
  serialQueue = self->_serialQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke;
  v16[3] = &unk_1E62C09C0;
  v16[4] = self;
  id v17 = v9;
  dispatch_async(serialQueue, v16);

LABEL_9:
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__34;
  v40[4] = __Block_byref_object_dispose__34;
  id v41 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 128);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_16;
  v31[3] = &unk_1E62C6320;
  id v32 = *(id *)(a1 + 40);
  v34 = v40;
  v35 = &v36;
  id v4 = v2;
  v33 = v4;
  [v3 updateCatalogWithCompletionHandler:v31];
  dispatch_time_t v5 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v4, v5);
  if (*((unsigned char *)v37 + 24))
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(*(id *)(a1 + 32), "bandVariantForPairedDevice"));
    id v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v6;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "B640 device identifier is:%@", buf, 0xCu);
    }

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 128);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_27;
    v26[3] = &unk_1E62C6370;
    id v11 = v9;
    uint64_t v12 = *(void *)(a1 + 32);
    id v27 = v11;
    uint64_t v28 = v12;
    v13 = v8;
    v29 = v13;
    [v10 watchBandImageForFeatureWithURL:v11 featureString:@"band" variant:v6 completionHandler:v26];
    dispatch_time_t v14 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v13, v14);
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v16 = *(void **)(a1 + 40);
    id v17 = *(void **)(*(void *)(a1 + 32) + 128);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_29;
    v22[3] = &unk_1E62C5398;
    id v18 = v16;
    uint64_t v19 = *(void *)(a1 + 32);
    id v23 = v18;
    uint64_t v24 = v19;
    uint64_t v20 = v15;
    v25 = v20;
    [v17 watchBandFilesForFeatureWithURL:v18 featureString:@"watchfaces" completionHandler:v22];
    dispatch_time_t v21 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v20, v21);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_21;
    block[3] = &unk_1E62C3040;
    block[4] = *(void *)(a1 + 32);
    block[5] = v40;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v5 = [*(id *)(a1 + 32) absoluteString];
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "B640 _failed update asset catalog with bandURL:%@ error:%@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:message:", 15, @"Failed to update asset catalog");
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    dispatch_semaphore_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_21(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:message:", 15, @"Failed to update asset catalog");
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_time_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 _handleB640WatchFaceManagerDidFinishWithError:v2 watchFaceModels:0];
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2;
  v16[3] = &unk_1E62C6348;
  id v17 = v9;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  id v18 = v10;
  uint64_t v19 = v11;
  id v20 = v8;
  id v21 = v7;
  id v22 = v12;
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

intptr_t __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) absoluteString];
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "B640 _failed to retrieve watch band image path and bundle with bandURL:%@ error:%@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 96), *(id *)(a1 + 56));
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 104), *(id *)(a1 + 64));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2_30;
  v11[3] = &unk_1E62C32F8;
  id v12 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2_30(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) absoluteString];
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "B640 _failed to retrieve watch faces  with bandURL:%@ error:%@", (uint8_t *)&v8, 0x16u);
    }
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:message:", 15, @"Failed to retrieve watch faces");
    [*(id *)(a1 + 48) _handleB640WatchFaceManagerDidFinishWithError:v5 watchFaceModels:0];
  }
  else
  {
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    [v6 _decodeWatchFacesUrls:v7];
  }
}

- (void)_decodeWatchFacesUrls:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "B640 did start to decode urls", buf, 2u);
  }

  self->_state = 2;
  if ([v4 count])
  {
    id v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    serialQueue = self->_serialQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke;
    v11[3] = &unk_1E62C32F8;
    id v12 = v4;
    id v13 = v7;
    id v14 = v6;
    id v15 = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(serialQueue, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 15);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(NTKGreenfieldB640Manager *)self _handleB640WatchFaceManagerDidFinishWithError:v10 watchFaceModels:0];
  }
}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke(uint64_t a1)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v92 objects:v109 count:16];
  if (v1)
  {
    uint64_t v49 = *(void *)v93;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v93 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v92 + 1) + 8 * v2);
        dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
        id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v6 = NSTemporaryDirectory();
        uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
        int v8 = [v7 UUIDString];
        id v9 = [v6 stringByAppendingPathComponent:v8];

        id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
        id v91 = 0;
        [v5 copyItemAtURL:v3 toURL:v10 error:&v91];
        uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))v91;
        if (v11)
        {
          id v12 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v3;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v10;
            *(_WORD *)&buf[22] = 2112;
            v106 = v11;
            _os_log_error_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_ERROR, "Failed to copy file from Mobile Asset URL:%@ to Bridge container URL:%@ with error:%@", buf, 0x20u);
          }
        }
        id v13 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "B640 did start to decoding url:%@", buf, 0xCu);
        }

        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_39;
        v85[3] = &unk_1E62C6398;
        id v86 = v10;
        id v87 = *(id *)(a1 + 40);
        id v88 = *(id *)(a1 + 48);
        id v89 = v5;
        dispatch_semaphore_t v90 = v4;
        id v14 = v4;
        id v15 = v5;
        id v16 = v10;
        +[NTKGreenfieldUtilities decodeWatchFaceFromUrl:v16 completionBlock:v85];
        dispatch_time_t v17 = dispatch_time(0, 15000000000);
        dispatch_semaphore_wait(v14, v17);

        ++v2;
      }
      while (v1 != v2);
      uint64_t v1 = [obj countByEnumeratingWithState:&v92 objects:v109 count:16];
    }
    while (v1);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v106 = __Block_byref_object_copy__34;
  v107 = __Block_byref_object_dispose__34;
  id v108 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__34;
  v83 = __Block_byref_object_dispose__34;
  id v84 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__34;
  v77 = __Block_byref_object_dispose__34;
  id v78 = 0;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  uint64_t v19 = +[NTKGreenfieldCompanionAppInstallationMonitor sharedMonitor];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_43;
  v68[3] = &unk_1E62C5678;
  v70 = buf;
  v71 = &v79;
  v72 = &v73;
  id v20 = v18;
  v69 = v20;
  [v19 fetchInstalledAppsOnWatchWithCompletionBlock:v68];
  uint64_t v44 = v19;
  dispatch_time_t v21 = dispatch_time(0, 15000000000);
  v43 = v20;
  dispatch_semaphore_wait(v20, v21);
  if (!v74[5] && *(void *)(*(void *)&buf[8] + 40) && v80[5])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v45 = *(id *)(a1 + 48);
    uint64_t v37 = [v45 countByEnumeratingWithState:&v56 objects:v96 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v57 != v38) {
            objc_enumerationMutation(v45);
          }
          v40 = *(void **)(a1 + 56);
          id v41 = [*(id *)(*((void *)&v56 + 1) + 8 * i) decodedRecipe];
          [v40 _updateComplicationForDecodedRecipe:v41 installedItemIds:*(void *)(*(void *)&buf[8] + 40) installedBundleIds:v80[5]];
        }
        uint64_t v37 = [v45 countByEnumeratingWithState:&v56 objects:v96 count:16];
      }
      while (v37);
    }
  }
  else
  {
    id v22 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v74[5];
      uint64_t v24 = *(void *)(*(void *)&buf[8] + 40);
      uint64_t v25 = v80[5];
      *(_DWORD *)v99 = 138412802;
      uint64_t v100 = v23;
      __int16 v101 = 2112;
      uint64_t v102 = v24;
      __int16 v103 = 2112;
      uint64_t v104 = v25;
      _os_log_impl(&dword_1BC5A9000, v22, OS_LOG_TYPE_DEFAULT, "Setting all complications to nil, error:%@, localResultsItemIds:%@, installedBundleIds:%@", v99, 0x20u);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v45 = *(id *)(a1 + 48);
    uint64_t v26 = [v45 countByEnumeratingWithState:&v64 objects:v98 count:16];
    if (v26)
    {
      id obja = *(id *)v65;
      do
      {
        uint64_t v48 = v26;
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(id *)v65 != obja) {
            objc_enumerationMutation(v45);
          }
          uint64_t v28 = [*(id *)(*((void *)&v64 + 1) + 8 * j) decodedRecipe];
          v29 = [v28 complicationSlotToTemplateMapping];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v61 = 0u;
          long long v60 = 0u;
          v50 = v29;
          v30 = [v29 allKeys];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v97 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v61;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v61 != v32) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v34 = *(void *)(*((void *)&v60 + 1) + 8 * k);
                v35 = [v28 watchFace];
                uint64_t v36 = +[NTKComplication nullComplication];
                [v35 setComplication:v36 forSlot:v34];
              }
              uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v97 count:16];
            }
            while (v31);
          }
        }
        uint64_t v26 = [v45 countByEnumeratingWithState:&v64 objects:v98 count:16];
      }
      while (v26);
    }
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_46;
  block[3] = &unk_1E62C04F0;
  int8x16_t v51 = *(int8x16_t *)(a1 + 48);
  id v42 = (id)v51.i64[0];
  int8x16_t v54 = vextq_s8(v51, v51, 8uLL);
  id v55 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(buf, 8);
}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "B640 did finish decoding url:%@ with error:%@", buf, 0x16u);
  }

  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else if (v5)
  {
    id v9 = [[NTKGreenfieldB640WatchFaceModel alloc] initWithDecodedRecipe:v5];
    [*(id *)(a1 + 48) addObject:v9];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 56);
  id v14 = 0;
  [v11 removeItemAtURL:v10 error:&v14];
  id v12 = v14;
  if (v12)
  {
    id v13 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_39_cold_1((uint64_t *)(a1 + 32), (uint64_t)v12, v13);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  uint64_t v11 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v15 = 138412802;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "B640 did finish fetching installed apps with error:%@, installedItemIds:%@, installedBundleIds:%@", (uint8_t *)&v15, 0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_46(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = 3;
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_semaphore_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  id v8 = *(void **)(a1 + 32);
  return [v8 _moveToDecodeStateCompletedIfPossible];
}

- (void)_updateComplicationForDecodedRecipe:(id)a3 installedItemIds:(id)a4 installedBundleIds:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 watchFace];
  uint64_t v11 = [v10 device];
  uint64_t v12 = NTKRestrictedComplicationsForDevice(v11);

  uint64_t v13 = objc_opt_new();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __100__NTKGreenfieldB640Manager__updateComplicationForDecodedRecipe_installedItemIds_installedBundleIds___block_invoke;
  v31[3] = &unk_1E62C5650;
  id v14 = v10;
  id v32 = v14;
  id v25 = v12;
  id v33 = v25;
  id v26 = v7;
  id v34 = v26;
  id v15 = v9;
  id v35 = v15;
  id v16 = v8;
  id v36 = v16;
  id v17 = v13;
  id v37 = v17;
  [v14 enumerateComplicationSlotsWithBlock:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * v22);
        uint64_t v24 = +[NTKComplication nullComplication];
        [v14 setComplication:v24 forSlot:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v20);
  }
}

void __100__NTKGreenfieldB640Manager__updateComplicationForDecodedRecipe_installedItemIds_installedBundleIds___block_invoke(id *a1, void *a2)
{
  id v17 = a2;
  uint64_t v3 = objc_msgSend(a1[4], "complicationForSlot:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 complication];

    uint64_t v3 = (void *)v4;
  }
  if ([v3 complicationType])
  {
    uint64_t v5 = [v3 appIdentifier];
    int v6 = NTKCanAddInternalComplicationWithBundleId(v5);

    if (!v6 || (objc_msgSend(a1[5], "containsIndex:", objc_msgSend(v3, "complicationType")) & 1) != 0) {
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v11 = [a1[6] complicationSlotToItemIdMapping];
      uint64_t v12 = [v11 objectForKeyedSubscript:v17];

      if (v12 && [v12 intValue])
      {
        char v13 = [a1[8] containsObject:v12];

        if (v13) {
          goto LABEL_7;
        }
      }
      else
      {
        id v14 = [a1[6] complicationSlotToBundleIdMapping];
        id v15 = [v14 objectForKeyedSubscript:v17];

        if (v15)
        {
          char v16 = [a1[7] containsObject:v15];

          if (v16) {
            goto LABEL_7;
          }
        }
        else
        {
        }
      }
LABEL_6:
      [a1[9] addObject:v17];
      goto LABEL_7;
    }
    uint64_t v7 = [a1[4] preferredComplicationFamilyForComplication:v3 withSlot:v17];
    id v8 = +[NTKBundleComplicationManager sharedManager];
    id v9 = [a1[4] device];
    uint64_t v10 = [v8 dataSourceClassForBundleComplication:v3 withFamily:v7 andDevice:v9 factorInMigration:1];

    if (!v10) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)_moveToDecodeStateCompletedIfPossible
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (self->_state != 3)
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      return;
    }
    unint64_t state = self->_state;
    *(_DWORD *)buf = 134217984;
    unint64_t v57 = state;
    id v14 = "B640 waiting for decode completion with decoding state: %lu.";
LABEL_8:
    _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_9;
  }
  uint64_t v3 = [MEMORY[0x1E4F19A30] currentDevice];
  uint64_t v4 = [v3 nrDevice];

  if (!v4)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 3;
    goto LABEL_12;
  }
  uint64_t v5 = [MEMORY[0x1E4F19A30] currentDevice];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"21EB4560-EFA0-46AA-B75C-401D30C5BBF1"];
  char v7 = [v5 supportsCapability:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 12;
    goto LABEL_12;
  }
  id v8 = [MEMORY[0x1E4F19A30] currentDevice];
  int v9 = [v8 isTinker];

  if (!v9)
  {
    unint64_t libraryState = self->_libraryState;
    if (libraryState != 1)
    {
      if (!libraryState)
      {
        uint64_t v12 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        unint64_t v17 = self->_libraryState;
        *(_DWORD *)buf = 134217984;
        unint64_t v57 = v17;
        id v14 = "B640 waiting for library to load, library state is: %lu.";
        goto LABEL_8;
      }
      if ([(NTKPersistentFaceCollection *)self->_library hasLoaded])
      {
        uint64_t v12 = objc_opt_new();
        id v47 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_watchFacesDecodeErrors];
        uint64_t v45 = objc_opt_new();
        id v18 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        uint64_t v19 = self->_watchFacesModels;
        uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v53 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              id v25 = objc_msgSend(v24, "decodedRecipe", v45);
              id v26 = [(NTKGreenfieldAddWatchFaceManager *)v18 canAddWatchFaceFromDecodedRecipe:v25 toLibrary:self->_library];
              long long v27 = v12;
              if (v26)
              {
                [v47 addObject:v26];
                long long v27 = (void *)v45;
              }
              [v27 addObject:v24];
            }
            uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v52 objects:v61 count:16];
          }
          while (v21);
        }

        if ([v12 count])
        {
          long long v28 = [[NTKGreenfieldB640Model alloc] initWithWatchFaceModels:v12 error:0 bandImagePath:self->_bandImagePath bandImageBundle:self->_bandImageBundle];
          greenfieldB640Model = self->_greenfieldB640Model;
          self->_greenfieldB640Model = v28;

          long long v30 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          uint64_t v31 = v47;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BC5A9000, v30, OS_LOG_TYPE_DEFAULT, "B640 did finish to decode urls", buf, 2u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained greenfieldB640WatchFacesManager:self updateStateToSelectWatchFacesState:self->_greenfieldB640Model];

          self->_unint64_t state = 4;
          id v33 = (void *)v45;
        }
        else
        {
          uint64_t v31 = v47;
          if ([v47 count])
          {
            id v34 = [v47 firstObject];
            uint64_t v35 = [v34 code];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v36 = v47;
            uint64_t v37 = [v36 countByEnumeratingWithState:&v48 objects:v60 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v49;
              while (2)
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v49 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  id v41 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                  if (v35 != objc_msgSend(v41, "code", v45))
                  {
                    id v42 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v43 = [v41 code];
                      *(_DWORD *)buf = 134218240;
                      unint64_t v57 = v35;
                      __int16 v58 = 2048;
                      uint64_t v59 = v43;
                      _os_log_impl(&dword_1BC5A9000, v42, OS_LOG_TYPE_DEFAULT, "B640 encountered different error codes errorCode:%ld and code:%ld:", buf, 0x16u);
                    }

                    uint64_t v44 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 16);

                    id v34 = (void *)v44;
                    goto LABEL_48;
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v48 objects:v60 count:16];
                if (v38) {
                  continue;
                }
                break;
              }
LABEL_48:
              uint64_t v31 = v47;
            }
            id v33 = (void *)v45;
          }
          else
          {
            id v34 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 16);
            id v33 = (void *)v45;
          }
          -[NTKGreenfieldB640Manager _handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:](self, "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:", v34, v33, v45);
        }
        goto LABEL_9;
      }
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:message:", 9, @"Library failed to load.");
    goto LABEL_13;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = 13;
LABEL_12:
  uint64_t v15 = objc_msgSend(v10, "greenfield_addWatchFaceErrorWithCode:", v11);
LABEL_13:
  id v46 = (id)v15;
  -[NTKGreenfieldB640Manager _handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:](self, "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:");
}

- (void)_startLibraryTimeoutTimer
{
  uint64_t v3 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "B640 _startLibraryTimeoutTimer", (uint8_t *)buf, 2u);
  }

  [(NTKGreenfieldB640Manager *)self _setLibraryState:0];
  [(NSTimer *)self->_libraryTimeoutTimer invalidate];
  objc_initWeak(buf, self);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB00];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NTKGreenfieldB640Manager__startLibraryTimeoutTimer__block_invoke;
  v7[3] = &unk_1E62C0628;
  objc_copyWeak(&v8, buf);
  uint64_t v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:10.0];
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __53__NTKGreenfieldB640Manager__startLibraryTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _libraryTimeoutTimerFired];
}

- (void)_libraryTimeoutTimerFired
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "B640 _libraryTimeoutTimerFired", v1, 2u);
}

- (void)_cancelLibraryTimeoutTimer
{
  uint64_t v3 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "B640 _cancelLibraryTimeoutTimer", v5, 2u);
  }

  [(NSTimer *)self->_libraryTimeoutTimer invalidate];
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = 0;
}

- (void)faceCollectionDidLoad:(id)a3
{
  uint64_t v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "B640 faceCollectionDidLoad", v5, 2u);
  }

  [(NTKGreenfieldB640Manager *)self _cancelLibraryTimeoutTimer];
  [(NTKGreenfieldB640Manager *)self _setLibraryState:2];
}

- (void)_setLibraryState:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_libraryState - 1 > 1)
  {
    self->_unint64_t libraryState = a3;
    char v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t libraryState = self->_libraryState;
      int v9 = 134217984;
      unint64_t v10 = libraryState;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "B640 library state updated to: %lu", (uint8_t *)&v9, 0xCu);
    }

    if (self->_libraryState - 1 <= 1) {
      [(NTKGreenfieldB640Manager *)self _moveToDecodeStateCompletedIfPossible];
    }
  }
  else
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = self->_libraryState;
      int v9 = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 2048;
      unint64_t v12 = v6;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "B640 setLibraryState called with state: %lu, when current state is: %lu", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_handleB640WatchFaceManagerDidFinishWithError:(id)a3 watchFaceModels:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t state = self->_state;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  unint64_t v10 = (NTKGreenfieldB640Model *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT);
  if (state == 5)
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1BC5A9000, &v10->super, OS_LOG_TYPE_DEFAULT, "B640 did tried to present another error while NTKGreenfieldB640ManagerStateError: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1BC5A9000, &v10->super, OS_LOG_TYPE_DEFAULT, "B640 _handleB640WatchFaceManagerDidFinishWithError: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)&self->_error, a3);
    self->_unint64_t state = 5;
    unint64_t v10 = [[NTKGreenfieldB640Model alloc] initWithWatchFaceModels:v8 error:v7 bandImagePath:self->_bandImagePath bandImageBundle:self->_bandImageBundle];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained greenfieldB640WatchFacesManager:self updateStateToError:v10];
  }
}

- (void)handleAddToMyFacesAction
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(v4);
      }
      int v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
      if ([v9 isSelected])
      {
        unint64_t v10 = [v9 decodedRecipe];
        BOOL v11 = [(NTKGreenfieldAddWatchFaceManager *)v3 canAddWatchFaceFromDecodedRecipe:v10 toLibrary:self->_library];

        if (v11) {
          break;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  unint64_t v12 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  uint64_t v13 = [v12 count];

  if (v13 - 1 >= 0)
  {
    do
    {
      --v13;
      id v14 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
      uint64_t v15 = [v14 objectAtIndex:v13];

      if ([v15 isSelected])
      {
        char v16 = [v15 decodedRecipe];
        unint64_t v17 = [v16 watchFace];
        id v18 = (void *)[v17 copy];

        if (![v18 origin]) {
          [v18 setOrigin:13];
        }
        [(NTKFaceCollection *)self->_library appendFace:v18 suppressingCallbackToObserver:0];
        [(NTKFaceCollection *)self->_library setSelectedFace:v18 suppressingCallbackToObserver:0];
        uint64_t v19 = [(NTKFaceCollection *)self->_library selectedUUID];
        addedFaceID = self->_addedFaceID;
        self->_addedFaceID = v19;

        if ([v18 editedState] == 2)
        {
          uint64_t v21 = [v18 lastEditedDate];
          [v18 setCreationDate:v21];
        }
        else
        {
          uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
          [v18 setCreationDate:v22];

          [v18 setEditedState:1];
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __52__NTKGreenfieldB640Manager_handleAddToMyFacesAction__block_invoke;
        v27[3] = &unk_1E62C3800;
        id v28 = v18;
        id v23 = v18;
        [v23 enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:v27];
        uint64_t v24 = (NTKFace *)[v23 copy];
        watchFaceAddedToLibrary = self->_watchFaceAddedToLibrary;
        self->_watchFaceAddedToLibrary = v24;
      }
    }
    while (v13 > 0);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didFinishAddingWatchFaceToLibrary:self];
}

void __52__NTKGreenfieldB640Manager_handleAddToMyFacesAction__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) complicationForSlot:a2];
  [v2 handleAddedFromFaceSharing];
}

- (void)handleWatchFaceSelectedActionWithSelectedIndex:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  unint64_t v6 = [v5 count];

  if ((a3 & 0x8000000000000000) == 0 && v6 > a3)
  {
    uint64_t v7 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    uint64_t v8 = [v7 objectAtIndex:a3];

    objc_msgSend(v8, "setIsSelected:", objc_msgSend(v8, "isSelected") ^ 1);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v9 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v9);
          }
          v12 += [*(id *)(*((void *)&v20 + 1) + 8 * i) isSelected];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }

    uint64_t v15 = [MEMORY[0x1E4F19A30] currentDevice];
    if (v12)
    {
      unint64_t v16 = [(NTKFaceCollection *)self->_library numberOfFaces] + v12;
      if (v16 <= NTKFaceLibraryMaxFaceCountForDevice(v15))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained greenfieldB640WatchFacesManager:self didSelectWatchFaceAtIndex:a3];
      }
      else
      {
        objc_msgSend(v8, "setIsSelected:", objc_msgSend(v8, "isSelected") ^ 1);
        unint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 5);
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 greenfieldB640WatchFacesManager:self didSelectWatchFaceWithError:v17];
      }
    }
    else
    {
      [v8 setIsSelected:1];
    }
  }
}

- (void)handleDidExitGreenfieldB640Flow
{
  if (self->_error)
  {
    uint64_t v3 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    uint64_t v4 = [v3 firstObject];

    uint64_t v5 = [v4 decodedRecipe];
    unint64_t v6 = [v5 watchFace];
    id v9 = [(NTKGreenfieldB640Manager *)self _analyticsModelForAddFaceEventsForWatchFace:v6];

    [v9 setError:self->_error];
    NTKSubmitAnalyticsForErrorAddFaceFlow(v9);
  }
  else if (self->_addedFaceID)
  {
    id v9 = [(NTKGreenfieldB640Manager *)self _analyticsModelForAddFaceEventsForWatchFace:self->_watchFaceAddedToLibrary];
    NTKSubmitAnalyticsForAddSharedFace(v9);
  }
  else
  {
    uint64_t v7 = [(NTKGreenfieldDecodedRecipe *)self->_selectedRecipe watchFace];
    id v9 = [(NTKGreenfieldB640Manager *)self _analyticsModelForAddFaceEventsForWatchFace:v7];

    uint64_t v8 = [(NTKGreenfieldB640Manager *)self _analyticsExitScreenNameForCurrentState];
    [v9 setAddFaceFlowExitScreenName:v8];

    NTKSubmitAnalyticsForExitAddSharedFaceFlow(v9);
  }
}

- (id)_analyticsExitScreenNameForCurrentState
{
  unint64_t state = self->_state;
  if (state > 4) {
    return 0;
  }
  else {
    return off_1E62C63B8[state];
  }
}

- (id)_analyticsModelForAddFaceEventsForWatchFace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(NTKGreenfieldAnalyticsModel);
  [(NTKGreenfieldAnalyticsModel *)v5 setWatchFace:v4];

  if (self->_sourceApplicationBundleIdentifier) {
    sourceApplicationBundleIdentifier = (__CFString *)self->_sourceApplicationBundleIdentifier;
  }
  else {
    sourceApplicationBundleIdentifier = @"com.apple.mpn";
  }
  [(NTKGreenfieldAnalyticsModel *)v5 setDistributionMechanism:sourceApplicationBundleIdentifier];
  [(NTKGreenfieldAnalyticsModel *)v5 setScannedCodeIdentifier:self->_scannedCodeIdentifier];
  return v5;
}

- (unint64_t)bandVariantForPairedDevice
{
  id v2 = [MEMORY[0x1E4F19A30] currentDevice];
  uint64_t v3 = [v2 deviceCategory];
  if ((unint64_t)(v3 - 3) >= 3) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = v3 - 2;
  }

  return v4;
}

- (NSUUID)addedFaceID
{
  return self->_addedFaceID;
}

- (NTKGreenfieldB640WatchFacesManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKGreenfieldB640WatchFacesManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addedFaceID, 0);
  objc_storeStrong((id *)&self->_productKitCatalog, 0);
  objc_storeStrong((id *)&self->_selectedRecipe, 0);
  objc_storeStrong((id *)&self->_bandImageBundle, 0);
  objc_storeStrong((id *)&self->_bandImagePath, 0);
  objc_storeStrong((id *)&self->_watchFaceAddedToLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_libraryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_watchFacesDecodeErrors, 0);
  objc_storeStrong((id *)&self->_greenfieldB640Model, 0);
  objc_storeStrong((id *)&self->_watchFacesModels, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_scannedCodeIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_39_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Failed to cleanup file at URL:%@ with error:%@", (uint8_t *)&v4, 0x16u);
}

@end