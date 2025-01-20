@interface VUIStoreMediaItem
@end

@implementation VUIStoreMediaItem

void __35__VUIStoreMediaItem_iOS_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIStoreMediaItem_iOS");
  v1 = (void *)sLogObject_14;
  sLogObject_14 = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v3 = (void *)sSecureKeyDeliveryLogObject;
  sSecureKeyDeliveryLogObject = (uint64_t)v2;
}

void __86__VUIStoreMediaItem_iOS_initWithMPMediaItem_videoManagedObject_isForStartingDownload___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) canonicalID];
  [v2 setMediaItemMetadata:v3 forProperty:*MEMORY[0x1E4FA9E28]];

  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) referenceID];
  [v4 setMediaItemMetadata:v5 forProperty:*MEMORY[0x1E4FAA008]];

  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) requiredAgeForPlayback];
  [v6 setMediaItemMetadata:v7 forProperty:*MEMORY[0x1E4FAA030]];

  v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 40) frequencyOfAgeConfirmation];
  [v8 setMediaItemMetadata:v9 forProperty:*MEMORY[0x1E4FA9F18]];

  v10 = *(void **)(a1 + 32);
  v11 = [*(id *)(a1 + 40) mediaMetrics];
  [v10 setMediaItemMetadata:v11 forProperty:*MEMORY[0x1E4FA9FA8]];

  v12 = *(void **)(a1 + 32);
  v13 = [*(id *)(a1 + 40) downloadedPlaybackMode];
  [v12 setMediaItemMetadata:v13 forProperty:@"VUIContentMetadataDownloadedPlaybackMode"];

  v14 = *(void **)(a1 + 32);
  v15 = [*(id *)(a1 + 40) playablePassThrough];
  [v14 setMediaItemMetadata:v15 forProperty:@"VUIMediaItemMetadataPlayablePassThrough"];

  v16 = [*(id *)(a1 + 40) programID];
  if (!v16)
  {
    v17 = [*(id *)(a1 + 40) downloadURL];
    if (v17)
    {
      v37 = v17;
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v17 resolvingAgainstBaseURL:0];
      v18 = [v36 queryItems];
      v19 = (void *)[v18 mutableCopy];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        v16 = 0;
        uint64_t v23 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v26 = [v25 name];
            int v27 = [v26 isEqualToString:@"id"];

            if (v27)
            {
              uint64_t v28 = [v25 value];

              v16 = (void *)v28;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v22);
      }
      else
      {
        v16 = 0;
      }

      v17 = v37;
    }
    else
    {
      v16 = 0;
    }
  }
  [*(id *)(a1 + 32) setMediaItemMetadata:v16 forProperty:*MEMORY[0x1E4FA9F30]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = *(void **)(a1 + 32);
    id v30 = *(id *)(a1 + 40);
    v31 = [v30 series];
    v32 = [v31 canonicalID];
    [v29 setMediaItemMetadata:v32 forProperty:*MEMORY[0x1E4FAA080]];

    v33 = *(void **)(a1 + 32);
    v34 = [v30 season];
    v35 = [v34 canonicalID];
    [v33 setMediaItemMetadata:v35 forProperty:*MEMORY[0x1E4FAA058]];
  }
}

void __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setFpsKeyError:0];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E6DF9518;
    objc_copyWeak(&v41, (id *)(a1 + 40));
    id v40 = *(id *)(a1 + 32);
    v8 = _Block_copy(aBlock);
    id v9 = objc_loadWeakRetained(v6);
    v10 = [v9 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F10]];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      v12 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Force streaming is set; configuring for streaming",
          buf,
          2u);
      }
      v13 = objc_loadWeakRetained(v6);
      [v13 _configureForStreamingPlaybackWithCompletion:v8];
      goto LABEL_40;
    }
    id v15 = objc_loadWeakRetained(v6);
    v16 = [v15 videoManagedObject];
    if (v16)
    {
      id v17 = objc_loadWeakRetained(v6);
      v18 = [v17 videoManagedObject];
      uint64_t v19 = [v18 downloadState];

      if (v19 == 2)
      {
        id v20 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Using local file path from sideband database", buf, 2u);
        }
        id v21 = objc_loadWeakRetained(v6);
        uint64_t v22 = [v21 videoManagedObject];
        v13 = [v22 localPlaybackURL];

        id v38 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        uint64_t v23 = [v13 path];
        if (!v23 || ([v38 fileExistsAtPath:v23] & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR)) {
            __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_cold_1();
          }
          v24 = +[VUIMediaLibraryManager defaultManager];
          v25 = [v24 sidebandMediaLibrary];
          id v26 = objc_loadWeakRetained(v6);
          int v27 = [v26 videoManagedObject];
          [v25 removeDownloadedMediaForVideoManagedObject:v27 markAsDeleted:0 invalidateImmediately:1];
        }
        uint64_t v19 = 2;
        if (v13) {
          goto LABEL_24;
        }
      }
    }
    else
    {

      uint64_t v19 = 0;
    }
    id v28 = objc_loadWeakRetained(v6);
    v13 = [v28 _localPlaybackFilePathURL];

    if (v13)
    {
      v29 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Using local file path from MediaLibrary database", buf, 2u);
      }
      uint64_t v30 = 0;
LABEL_25:
      id v31 = objc_loadWeakRetained(v6);
      [v31 setUseSidebandLibraryForPlaybackKeys:v30];

      id v32 = objc_loadWeakRetained(v6);
      int v33 = [v32 isForStartingDownload];
      if (v19 == 1) {
        int v34 = 1;
      }
      else {
        int v34 = v33;
      }

      if (v34)
      {
        id v35 = objc_loadWeakRetained(v6);
        [v35 _configureForDownloadingWithCompletion:v8];
      }
      else if (v13)
      {
        v36 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v43 = v13;
          _os_log_impl(&dword_1E2BD7000, v36, OS_LOG_TYPE_DEFAULT, "Found local file path for this media item: %@", buf, 0xCu);
        }
        id v35 = objc_loadWeakRetained(v6);
        [v35 _configureForLocalPlaybackWithURL:v13 completion:v8];
      }
      else
      {
        if (v19 != 3 && v19) {
          goto LABEL_40;
        }
        v37 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v37, OS_LOG_TYPE_DEFAULT, "No local file path or download exists for this media item; configuring for streaming",
            buf,
            2u);
        }
        id v35 = objc_loadWeakRetained(v6);
        [v35 _configureForStreamingPlaybackWithCompletion:v8];
      }

LABEL_40:
      objc_destroyWeak(&v41);
      goto LABEL_41;
    }
LABEL_24:
    uint64_t v30 = 1;
    goto LABEL_25;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v5);
  }
LABEL_41:
}

void __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained _videoPlaybackTypeDescription];
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Playback type is %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void __68__VUIStoreMediaItem_iOS_prepareForPlaybackInitiationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = *MEMORY[0x1E4FAA148];
  v7 = [WeakRetained mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  v8 = (void *)MEMORY[0x1E4FAA368];
  [v7 addEndEventWithName:*MEMORY[0x1E4FAA368]];

  if (v14)
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v10 = [v9 mediaItemMetadataForProperty:v6];
    [v10 addSingleShotEventWithName:*MEMORY[0x1E4FAA2D8] value:v14];

    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = [v11 mediaItemMetadataForProperty:v6];
    [v12 addSingleShotEventWithName:*MEMORY[0x1E4FAA2E0] value:*v8];
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v14);
  }
}

uint64_t __63__VUIStoreMediaItem_iOS_processFinishedDownloadWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v2 = [WeakRetained mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
  uint64_t v3 = [WeakRetained mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
  v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FA82A0]) initWithAccountIdentifier:v3 rentalKeyIdentifier:v2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_2;
    v7[3] = &unk_1E6DF9568;
    v7[4] = WeakRetained;
    [v6 startWithResponseBlock:v7];
  }
}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3;
  block[3] = &unk_1E6DF45D8;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F580C8]];
  uint64_t v3 = sLogObject_14;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "rentalInformation: %@ error: %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v2;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Playback start date: %@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 48) _updateRentalPlaybackStartDate:v2];
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
  {
    __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3_cold_1();
  }
}

uint64_t __69__VUIStoreMediaItem_iOS_loadFairPlayStreamingKeyRequests_completion___block_invoke(uint64_t a1)
{
  os_log_t v2 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Received response for key request(s)", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v8 = [WeakRetained _loadingCancelled:*(void *)(a1 + 56)];

  if ((v8 & 1) == 0)
  {
    if (a2 == 1)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v10 = [v9 _localPlaybackFilePathURL];

      uint64_t v11 = [v10 pathExtension];
      int v12 = [v11 isEqualToString:@"movpkg"];

      uint64_t v13 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v10;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "After downloading, using local file path for this media item: %@", buf, 0xCu);
      }
      id v14 = objc_loadWeakRetained((id *)(a1 + 48));
      [v14 setPlaybackURL:v10];

      id v15 = objc_loadWeakRetained((id *)(a1 + 48));
      v16 = v15;
      if (v12) {
        uint64_t v17 = 6;
      }
      else {
        uint64_t v17 = 5;
      }
      if (v12) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = 1;
      }
      [v15 setPlaybackType:v17];

      id v19 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v20 = *MEMORY[0x1E4FAA148];
      id v21 = [v19 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [v21 setIsDownloaded:1];

      id v22 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v23 = [v22 mediaItemMetadataForProperty:v20];
      [v23 setVideoType:v18];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else if (a2 == 2)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v24 = [*(id *)(a1 + 32) assetsForType:*MEMORY[0x1E4FA8438]];
      v25 = [v24 firstObject];

      uint64_t v27 = *MEMORY[0x1E4FA8420];
      v66[0] = *MEMORY[0x1E4FA8428];
      uint64_t v26 = v66[0];
      v66[1] = v27;
      uint64_t v29 = *MEMORY[0x1E4FA8418];
      uint64_t v67 = *MEMORY[0x1E4FA8410];
      uint64_t v28 = v67;
      uint64_t v68 = v29;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];
      id v31 = objc_msgSend(v25, "vui_valuesForProperties:", v30);

      id v32 = [v31 objectForKey:v26];
      int v33 = [v31 objectForKey:v27];
      int v34 = [v31 objectForKey:v28];
      uint64_t v35 = v29;
      v36 = v25;
      v37 = [v31 objectForKey:v35];
      int v60 = [v37 BOOLValue];

      v62 = [v25 sinfs];
      if (![v32 length]
        || (v63 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v32]) == 0)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR)) {
          __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_3();
        }
        v63 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ![v33 length]
        || ([MEMORY[0x1E4F1CB10] fileURLWithPath:v33],
            (id v38 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR)) {
          __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_2();
        }
        id v38 = 0;
      }
      v61 = v33;
      if (!v34
        || ![v34 unsignedLongLongValue]
        || (uint64_t v39 = [v34 unsignedLongLongValue], v39 == *MEMORY[0x1E4FA83A8]))
      {
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR)) {
          __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_1();
        }

        int v34 = 0;
      }
      if (!v62)
      {
        id v40 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_DEFAULT, "sinfsArray is nil", buf, 2u);
        }
      }
      if (v63 && v38 && v34)
      {
        v59 = v32;
        id v41 = objc_loadWeakRetained((id *)(a1 + 48));
        [v41 setPlaybackURL:v63];

        if (v62)
        {
          id v42 = objc_loadWeakRetained((id *)(a1 + 48));
          v64 = @"sinfs";
          v65 = v62;
          uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
          [v42 setSinfsDict:v43];
        }
        id v44 = objc_loadWeakRetained((id *)(a1 + 48));
        [v44 setDownloadToken:v34];

        id v45 = objc_loadWeakRetained((id *)(a1 + 48));
        [v45 setDownloadDestinationURL:v38];

        id v46 = objc_loadWeakRetained((id *)(a1 + 48));
        v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v36, "fileSize"));
        [v46 setFileSize:v47];

        id v48 = objc_loadWeakRetained((id *)(a1 + 48));
        v49 = v48;
        if (v60) {
          uint64_t v50 = 4;
        }
        else {
          uint64_t v50 = 3;
        }
        if (v60) {
          uint64_t v51 = 2;
        }
        else {
          uint64_t v51 = 1;
        }
        [v48 setPlaybackType:v50];

        id v52 = objc_loadWeakRetained((id *)(a1 + 48));
        [v52 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
        v54 = v53 = v36;
        [v54 setVideoType:v51];

        v36 = v53;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        id v32 = v59;
      }
      else
      {
        uint64_t v55 = *(void *)(a1 + 40);
        id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
        v57 = (void *)[v56 initWithDomain:VUIStoreMediaItemErrorDomain code:-123004 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v55 + 16))(v55, 0, v57);
      }
    }
    id v58 = objc_loadWeakRetained(v6);
    [v58 setDownloadMonitor:0];
  }
}

void __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v9 = [WeakRetained _loadingCancelled:*(void *)(a1 + 48)];

  uint64_t v10 = v6;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = (uint64_t *)MEMORY[0x1E4FAA148];
    if (v5)
    {
      location = (id *)(a1 + 40);
      id v73 = v6;
      uint64_t v71 = a1;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v74 = v5;
      id obj = [v5 objectForKey:@"assets"];
      uint64_t v12 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (!v12)
      {
        id v14 = 0;
        v75 = 0;
        v76 = 0;
        v79 = 0;
        goto LABEL_22;
      }
      uint64_t v13 = v12;
      id v14 = 0;
      v75 = 0;
      v76 = 0;
      v79 = 0;
      uint64_t v15 = *(void *)v81;
      while (1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v81 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          uint64_t v18 = [v17 objectForKey:@"flavor"];
          if ([v18 isEqualToString:@"1080p"])
          {
            id v19 = v79;
            uint64_t v20 = v14;
            v79 = v17;
          }
          else if ([v18 isEqualToString:@"720p"])
          {
            id v19 = v76;
            uint64_t v20 = v14;
            v76 = v17;
          }
          else if ([v18 isEqualToString:@"480p"])
          {
            id v19 = v75;
            uint64_t v20 = v14;
            v75 = v17;
          }
          else
          {
            id v19 = v14;
            uint64_t v20 = v17;
            if (![v18 isEqualToString:@"SD"]) {
              goto LABEL_16;
            }
          }
          id v21 = v17;

          id v14 = v20;
LABEL_16:
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
        if (!v13)
        {
LABEL_22:

          id v22 = +[VUIPlaybackSettings sharedSettings];
          uint64_t v23 = [v22 preferredPlaybackQualityForCurrentNetworkStatus];

          int v7 = (id *)(a1 + 40);
          id v24 = objc_loadWeakRetained(location);
          v25 = [v24 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB8]];

          if (v25) {
            uint64_t v23 = [v25 BOOLValue] ^ 1;
          }
          if (!v23 && (uint64_t v26 = v79) != 0 || !v23 && (uint64_t v26 = v76) != 0 || (uint64_t v26 = v75) != 0 || (uint64_t v26 = v14) != 0)
          {
            id v27 = v26;
            uint64_t v28 = (void *)sLogObject_14;
            if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v29 = v28;
              uint64_t v30 = [v27 objectForKey:@"flavor"];
              *(_DWORD *)buf = 138412290;
              v87 = v30;
              _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Preferred CRABS asset flavor: %@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v68 = (void *)sLogObject_14;
            if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
            {
              v69 = v68;
              v70 = [v74 valueForKeyPath:@"asset-info.flavor"];
              *(_DWORD *)buf = 138412290;
              v87 = v70;
              _os_log_impl(&dword_1E2BD7000, v69, OS_LOG_TYPE_DEFAULT, "No assets available in store item dictionary.  Returning store item dictionary itself.  Flavor is %@", buf, 0xCu);
            }
            id v27 = v74;
          }
          id v31 = [v27 objectForKey:@"URL"];
          id v32 = [v74 objectForKey:@"hls-playlist-url"];
          if ([v32 length] && !*(unsigned char *)(v71 + 56))
          {
            id obja = v31;
            id v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v32];
            id v46 = objc_loadWeakRetained(location);
            v47 = [v46 _hlsURLEnsuringDsidQueryParamIsPresentFromURL:v45];

            id v48 = objc_loadWeakRetained(location);
            int v33 = +[VUIPlaybackUtilities updatedHLSURL:forPlaybackContext:](VUIPlaybackUtilities, "updatedHLSURL:forPlaybackContext:", v47, [v48 playbackContext]);

            id v49 = objc_loadWeakRetained(location);
            [v49 setPlaybackURL:v33];

            id v50 = objc_loadWeakRetained(location);
            [v50 setPlaybackType:2];

            id v51 = objc_loadWeakRetained(location);
            id v52 = [v51 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
            [v52 setVideoType:2];

            v53 = sLogObject_14;
            if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E2BD7000, v53, OS_LOG_TYPE_DEFAULT, "Updating ML3Track's HLS playlist URL", buf, 2u);
            }
            id v54 = objc_loadWeakRetained(location);
            uint64_t v55 = [v54 ml3Track];
            v85 = v32;
            id v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
            uint64_t v84 = *MEMORY[0x1E4F79648];
            v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
            [v55 setValues:v56 forProperties:v57 async:1 withCompletionBlock:0];

            int v7 = location;
            uint64_t v10 = v73;
            id v31 = obja;
          }
          else if (v31)
          {
            int v33 = [MEMORY[0x1E4F1CB10] URLWithString:v31];
            int v34 = v31;
            id v35 = objc_loadWeakRetained(location);
            v36 = [v27 objectForKey:@"downloadKey"];
            [v35 _setDownloadKeyCookieWithURL:v33 downloadKey:v36];

            id v37 = objc_loadWeakRetained(location);
            [v37 setPlaybackURL:v33];

            id v38 = objc_loadWeakRetained(location);
            [v38 setSinfsDict:v27];

            id v39 = objc_loadWeakRetained(location);
            id v40 = [v27 objectForKey:@"file-size"];
            [v39 setFileSize:v40];

            id v41 = objc_loadWeakRetained(location);
            [v41 setPlaybackType:1];

            id v42 = objc_loadWeakRetained(location);
            uint64_t v43 = [v42 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
            [v43 setVideoType:1];

            id v31 = v34;
            uint64_t v10 = v73;
          }
          else
          {
            id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v10 = (void *)[v44 initWithDomain:VUIStoreMediaItemErrorDomain code:-123005 userInfo:0];
            int v33 = v73;
          }

          id v6 = v73;
          id v5 = v74;
          a1 = v71;
          uint64_t v11 = (uint64_t *)MEMORY[0x1E4FAA148];
          goto LABEL_41;
        }
      }
    }
    if (v6)
    {
      uint64_t v10 = v6;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR)) {
        __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke_cold_1();
      }
      id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v10 = (void *)[v67 initWithDomain:VUIStoreMediaItemErrorDomain code:-123006 userInfo:0];
    }
LABEL_41:
    id v58 = objc_loadWeakRetained(v7);
    uint64_t v59 = *v11;
    int v60 = [v58 mediaItemMetadataForProperty:*v11];
    v61 = v7;
    v62 = (void *)MEMORY[0x1E4FAA2C0];
    [v60 addEndEventWithName:*MEMORY[0x1E4FAA2C0]];

    if (v10)
    {
      id v63 = objc_loadWeakRetained(v61);
      v64 = [v63 mediaItemMetadataForProperty:v59];
      [v64 addSingleShotEventWithName:*MEMORY[0x1E4FAA2D8] value:v10];

      id v65 = objc_loadWeakRetained(v61);
      v66 = [v65 mediaItemMetadataForProperty:v59];
      [v66 addSingleShotEventWithName:*MEMORY[0x1E4FAA2E0] value:*v62];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __64__VUIStoreMediaItem_iOS__configureForDownloadingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v8 = [WeakRetained _loadingCancelled:*(void *)(a1 + 48)];

  char v9 = v6;
  if (v8) {
    goto LABEL_42;
  }
  if (!v5)
  {
    if (v6)
    {
      char v9 = v6;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR)) {
        __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke_cold_1();
      }
      id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
      char v9 = (void *)[v57 initWithDomain:VUIStoreMediaItemErrorDomain code:-123006 userInfo:0];
    }
    goto LABEL_41;
  }
  location = (id *)(a1 + 40);
  v62 = v5;
  uint64_t v63 = a1;
  id v64 = v6;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = [v5 objectForKey:@"assets"];
  uint64_t v10 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (!v10)
  {
    uint64_t v12 = 0;
    id v65 = 0;
    v66 = 0;
    uint64_t v68 = 0;
    goto LABEL_22;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  id v65 = 0;
  v66 = 0;
  uint64_t v68 = 0;
  uint64_t v13 = *(void *)v70;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v70 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      v16 = [v15 objectForKey:@"flavor"];
      if ([v16 isEqualToString:@"1080p"])
      {
        uint64_t v17 = v68;
        uint64_t v18 = v12;
        uint64_t v68 = v15;
      }
      else if ([v16 isEqualToString:@"720p"])
      {
        uint64_t v17 = v66;
        uint64_t v18 = v12;
        v66 = v15;
      }
      else if ([v16 isEqualToString:@"480p"])
      {
        uint64_t v17 = v65;
        uint64_t v18 = v12;
        id v65 = v15;
      }
      else
      {
        uint64_t v17 = v12;
        uint64_t v18 = v15;
        if (![v16 isEqualToString:@"SD"]) {
          goto LABEL_16;
        }
      }
      id v19 = v15;

      uint64_t v12 = v18;
LABEL_16:
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  }
  while (v11);
LABEL_22:

  id v20 = objc_loadWeakRetained(location);
  id v21 = [v20 mediaItemMetadataForProperty:@"VUIContentMetadataDownloadQuality"];
  uint64_t v22 = [v21 integerValue];

  if (!v22 && (uint64_t v23 = v68) != 0 || (uint64_t v23 = v66) != 0 || (uint64_t v23 = v65) != 0 || (uint64_t v23 = v12) != 0)
  {
    id v24 = v23;
    v25 = (void *)sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v25;
      id v27 = [v24 objectForKey:@"flavor"];
      *(_DWORD *)buf = 138412290;
      v74 = v27;
      _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Preferred CRABS asset flavor: %@", buf, 0xCu);
    }
    id v5 = v62;
  }
  else
  {
    id v58 = (void *)sLogObject_14;
    id v5 = v62;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v59 = v58;
      int v60 = [v62 valueForKeyPath:@"asset-info.flavor"];
      *(_DWORD *)buf = 138412290;
      v74 = v60;
      _os_log_impl(&dword_1E2BD7000, v59, OS_LOG_TYPE_DEFAULT, "No assets available in store item dictionary.  Returning store item dictionary itself.  Flavor is %@", buf, 0xCu);
    }
    id v24 = v62;
  }
  uint64_t v28 = [v24 objectForKey:@"URL"];
  uint64_t v29 = [v5 objectForKey:@"hls-playlist-url"];
  if ([v29 length] && !*(unsigned char *)(v63 + 56))
  {
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v29];
    id v48 = objc_loadWeakRetained(location);
    id v49 = [v48 _hlsURLEnsuringDsidQueryParamIsPresentFromURL:v47];

    uint64_t v30 = objc_msgSend(v49, "vui_URLByAddingQueryParamWithName:value:", @"playback-type", @"download");

    id v5 = v62;
    id v50 = objc_loadWeakRetained(location);
    [v50 setPlaybackURL:v30];

    id v51 = objc_loadWeakRetained(location);
    [v51 setPlaybackType:4];

    id v52 = objc_loadWeakRetained(location);
    v53 = [v52 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v53 setVideoType:2];

LABEL_36:
    char v9 = v64;
  }
  else
  {
    if (v28)
    {
      uint64_t v30 = [MEMORY[0x1E4F1CB10] URLWithString:v28];
      id v31 = objc_loadWeakRetained(location);
      id v32 = [v24 objectForKey:@"downloadKey"];
      [v31 _setDownloadKeyCookieWithURL:v30 downloadKey:v32];

      id v33 = objc_loadWeakRetained(location);
      [v33 setPlaybackURL:v30];

      id v34 = objc_loadWeakRetained(location);
      [v34 setSinfsDict:v24];

      id v35 = objc_loadWeakRetained(location);
      v36 = [v24 objectForKey:@"file-size"];
      [v35 setFileSize:v36];

      id v37 = objc_loadWeakRetained(location);
      [v37 setPlaybackType:3];

      id v38 = objc_loadWeakRetained(location);
      id v39 = [v38 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [v39 setVideoType:1];

      id v40 = objc_loadWeakRetained(location);
      id v41 = [v40 videoManagedObject];
      [v41 setPlaybackURL:v30];

      id v42 = objc_loadWeakRetained(location);
      uint64_t v43 = [v42 videoManagedObject];
      [v43 setRedownloadProductResponseDictionary:v24];

      id v44 = +[VUIMediaLibraryManager defaultManager];
      id v45 = [v44 sidebandMediaLibrary];
      [v45 saveChangesToManagedObjects];

      goto LABEL_36;
    }
    id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
    char v9 = (void *)[v46 initWithDomain:VUIStoreMediaItemErrorDomain code:-123005 userInfo:0];
    uint64_t v30 = v64;
  }

  id v54 = objc_msgSend(v5, "vui_numberForKey:", @"rental-id");
  uint64_t v55 = v54;
  if (v54 && ([v54 isEqualToNumber:&unk_1F3F3D190] & 1) == 0)
  {
    id v56 = objc_loadWeakRetained(location);
    [v56 setMediaItemMetadata:v55 forProperty:*MEMORY[0x1E4FAA018]];

    id v5 = v62;
  }

  a1 = v63;
  id v6 = v64;
LABEL_41:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_42:
}

void __87__VUIStoreMediaItem_iOS__checkoutRentalWithCheckoutType_startPlaybackClock_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = v5;
  char v8 = [v7 domain];
  if ([v8 isEqualToString:@"TVPlaybackErrorDomain"])
  {
    uint64_t v9 = [v7 code];

    uint64_t v10 = v7;
    if (v9 == 812)
    {
      uint64_t v11 = [WeakRetained mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];
      if (![(__CFString *)v11 length])
      {

        uint64_t v11 = &stru_1F3E921E0;
      }
      uint64_t v12 = NSString;
      uint64_t v13 = +[VUILocalizationManager sharedInstance];
      id v14 = [v13 localizedStringForKey:@"TOO_MANY_STREAMS_FORMAT"];
      uint64_t v15 = [v12 stringWithValidatedFormat:v14, @"%@", 0, v11 validFormatSpecifiers error];

      uint64_t v18 = *MEMORY[0x1E4F285A0];
      v19[0] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:812 userInfo:v16];
    }
  }
  else
  {

    uint64_t v10 = v7;
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, a2, v10);
  }
}

void __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Resetting managed object download state since download is missing", v2, v3, v4, v5, v6);
}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "SSRentalInformationRequest response is missing playbackStartDate", v2, v3, v4, v5, v6);
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Download token is invalid", v2, v3, v4, v5, v6);
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "downloadDestinationURL is nil", v2, v3, v4, v5, v6);
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "playbackURL is nil", v2, v3, v4, v5, v6);
}

void __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "storeItemDict is nil", v2, v3, v4, v5, v6);
}

@end