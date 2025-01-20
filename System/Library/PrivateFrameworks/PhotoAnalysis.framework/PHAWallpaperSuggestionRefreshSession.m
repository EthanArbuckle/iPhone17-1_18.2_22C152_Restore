@interface PHAWallpaperSuggestionRefreshSession
+ (id)lastGalleryRefreshDate;
+ (void)refreshPosterConfigurationWithPosterService:(id)a3 retryCount:(int64_t)a4 configuration:(id)a5 sessionInfo:(id)a6 log:(id)a7 completion:(id)a8;
+ (void)saveLastGalleryRefreshDate:(id)a3 loggingConnection:(id)a4;
- (BOOL)_prepareWithError:(id *)a3;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)reloadWallpaperSuggestionsForUUIDs:(id)a3 progress:(id)a4 error:(id *)a5;
- (BOOL)savePreviewSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withClassification:(unint64_t)a5 styleCategory:(id)a6 enableSettlingEffect:(BOOL)a7 error:(id *)a8;
- (BOOL)saveSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withOptions:(id)a5 classification:(unint64_t)a6 error:(id *)a7;
- (BOOL)saveShuffleSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withClassification:(unint64_t)a5 style:(id)a6 error:(id *)a7;
- (PHAWallpaperSuggestionRefreshSession)initWithGraphManager:(id)a3;
- (id)consolidatedShuffleConfigurationFromPosterConfigurations:(id)a3;
- (id)createAndExportMediaForSuggestionLocalIdentifiers:(id)a3 style:(id)a4 toURL:(id)a5 error:(id *)a6;
- (id)currentlyFeaturedSuggestionUUIDsForTop:(BOOL)a3;
- (id)featuredPhotoDescriptorsForDonationWithSuggestionUUIDsToAvoid:(id)a3 count:(unint64_t)a4;
- (id)fetchSuggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:(id)a3;
- (id)keyAssetBySuggestionUUIDFromSuggestions:(id)a3;
- (id)posterDescriptorOfType:(int64_t)a3 withSuggestion:(id)a4 assetBySuggestionUUID:(id)a5;
- (id)randomizeSuggestions:(id)a3;
- (id)randomizedWallpaperSuggesstionWithSubtype:(unsigned __int16)a3 suggestionUUIDsToAvoid:(id)a4;
- (id)settlingEffectDescriptorsForDonationWithSuggestionUUIDsToAvoid:(id)a3;
- (id)suggestionUUIDsForPosterDescriptors:(id)a3;
- (id)suggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:(id)a3;
- (id)updateIfNeededPosterDescriptors:(id)a3 fromCurrentPosterDescriptors:(id)a4 partialErrors:(id *)a5 progressReporter:(id)a6;
- (id)updatedPosterDescriptorsFromSuggestions:(id)a3;
- (id)uuidsOfSuggestions:(id)a3;
- (void)_cleanup;
- (void)_removeIfNeededFeaturedContent:(id)a3 withCompletion:(id)a4;
- (void)cleanup;
- (void)dealloc;
- (void)enumerateRefreshableShufflePosterConfigurationsIn:(id)a3 usingBlock:(id)a4;
- (void)refreshAmbientDescriptorsWithProgressReporter:(id)a3 completion:(id)a4;
- (void)refreshPosterConfigurationsForNightlyRefresh:(BOOL)a3 progressReporter:(id)a4 passingFilter:(id)a5 withCompletion:(id)a6;
- (void)refreshPosterDescriptorsWithProgressReporter:(id)a3 completion:(id)a4;
- (void)sendHasSmartShuffleWallpaperBiomeEvent;
- (void)updateSuggestionFeaturedStateWithNewSuggestionUUIDs:(id)a3 oldSuggestionUUIDs:(id)a4;
@end

@implementation PHAWallpaperSuggestionRefreshSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisService, 0);
  objc_storeStrong((id *)&self->_posterService, 0);
  objc_storeStrong((id *)&self->_refreshSessionURL, 0);

  objc_storeStrong((id *)&self->_refreshSessionIdentifier, 0);
}

- (void)refreshAmbientDescriptorsWithProgressReporter:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (PNStandbyModeAvailable())
  {
    id v8 = v6;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    int v9 = [v8 isCancelledWithProgress:0.0];
    *((unsigned char *)v21 + 24) = v9;
    loggingConnection = self->_loggingConnection;
    BOOL v11 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Ambient Descriptors refresh was canceled", buf, 2u);
      }
      v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      v7[2](v7, 0, v12);
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Start refreshing ambient poster descriptors", buf, 2u);
      }
      posterService = self->_posterService;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __97__PHAWallpaperSuggestionRefreshSession_refreshAmbientDescriptorsWithProgressReporter_completion___block_invoke;
      v14[3] = &unk_1E69187F0;
      v18 = &v20;
      id v15 = v8;
      v16 = self;
      v17 = v7;
      [(PRSService *)posterService refreshPosterDescriptorsForExtension:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider" completion:v14];

      v12 = v15;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v7[2](v7, MEMORY[0x1E4F1CC08], 0);
  }
}

void __97__PHAWallpaperSuggestionRefreshSession_refreshAmbientDescriptorsWithProgressReporter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Ambient Descriptors refresh was canceled", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 48);
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    if (v6)
    {
      v12 = *(NSObject **)(*(void *)(a1 + 40) + 56);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29[0] = v6;
        _os_log_error_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh poster descriptors: %@", buf, 0xCu);
      }
      id v13 = v6;
      BOOL v11 = 0;
    }
    else
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = v5;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "identifier", (void)v24);
            [v14 addObject:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v17);
      }

      v30 = @"posterDescriptorIdentifiers";
      v31 = v14;
      BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v21 = *(NSObject **)(*(void *)(a1 + 40) + 56);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = v21;
        int v23 = [v15 count];
        *(_DWORD *)buf = 67109378;
        LODWORD(v29[0]) = v23;
        WORD2(v29[0]) = 2112;
        *(void *)((char *)v29 + 6) = v14;
        _os_log_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed %d ambient poster descriptors: %@", buf, 0x12u);
      }
      id v13 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)suggestionUUIDsForPosterDescriptors:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "media", (void)v14);
        BOOL v11 = [v10 firstObject];

        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [v11 suggestionUUID];
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)uuidsOfSuggestions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uuid", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)currentlyFeaturedSuggestionUUIDsForTop:(BOOL)a3
{
  id v5 = (void *)MEMORY[0x1D26057A0](self, a2);
  uint64_t v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  if (a3) {
    [MEMORY[0x1E4F39310] predicateForAllTopWallpaperSuggestions];
  }
  else {
  uint64_t v7 = [MEMORY[0x1E4F39310] predicateForAllShuffleWallpaperSuggestions];
  }
  [v6 setPredicate:v7];

  uint64_t v8 = [MEMORY[0x1E4F39310] fetchWallpaperSuggestionsWithFeaturedState:1 withOptions:v6];
  int v9 = [(PHAWallpaperSuggestionRefreshSession *)self uuidsOfSuggestions:v8];

  return v9;
}

- (void)updateSuggestionFeaturedStateWithNewSuggestionUUIDs:(id)a3 oldSuggestionUUIDs:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = a3;
  int v9 = (void *)[[v6 alloc] initWithSet:v8];
  [v9 minusSet:v7];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v7];

  [v10 minusSet:v8];
  BOOL v11 = [v9 setByAddingObjectsFromSet:v10];
  if ([v11 count])
  {
    long long v12 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    long long v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v11];
    [v12 setPredicate:v13];

    long long v14 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v12];
    if ([v14 count])
    {
      photoLibrary = self->_photoLibrary;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __111__PHAWallpaperSuggestionRefreshSession_updateSuggestionFeaturedStateWithNewSuggestionUUIDs_oldSuggestionUUIDs___block_invoke;
      v21[3] = &unk_1E69189B0;
      id v22 = v14;
      id v16 = v9;
      id v23 = v16;
      id v20 = 0;
      BOOL v17 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v21 error:&v20];
      id v18 = v20;
      loggingConnection = self->_loggingConnection;
      if (v17)
      {
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v16;
          _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully updated all suggestions featured state.\n\tFeature: %@", buf, 0xCu);
          loggingConnection = self->_loggingConnection;
        }
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v10;
          _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Unfeature: %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v18;
        _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to update featured state of suggestions: %@", buf, 0xCu);
      }
    }
  }
}

void __111__PHAWallpaperSuggestionRefreshSession_updateSuggestionFeaturedStateWithNewSuggestionUUIDs_oldSuggestionUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", v7, (void)v12);
        int v9 = *(void **)(a1 + 40);
        uint64_t v10 = [v7 uuid];
        uint64_t v11 = [v9 containsObject:v10];

        [v8 setFeaturedState:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)sendHasSmartShuffleWallpaperBiomeEvent
{
  uint64_t v3 = BiomeLibrary();
  uint64_t v4 = [v3 Discoverability];
  uint64_t v5 = [v4 Signals];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F4FE08]) initWithContentIdentifier:@"com.apple.photoanalysisd.has-smart-shuffle-wallpaper" context:0 osBuild:0 userInfo:0];
  id v7 = [v5 source];
  [v7 sendEvent:v6];

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Sent has-smart-shuffle-wallpaper Biome event", v9, 2u);
  }
}

- (id)createAndExportMediaForSuggestionLocalIdentifiers:(id)a3 style:(id)a4 toURL:(id)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v40 = a4;
  v38 = self;
  id v39 = a5;
  uint64_t v11 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  long long v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"localIdentifier", v10];
  [v11 setPredicate:v12];

  long long v13 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v11];
  id v46 = 0;
  long long v14 = [MEMORY[0x1E4F8E850] mediaFromSuggestions:v13 assetBySuggestionUUID:&v46];
  id v15 = v46;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v33 = v13;
    v34 = v11;
    v35 = a6;
    id v36 = v10;
    id v18 = 0;
    uint64_t v19 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v22 = (void *)MEMORY[0x1D26057A0]();
        id v23 = [v21 suggestionUUID];
        long long v24 = [v15 objectForKeyedSubscript:v23];

        if (v24)
        {
          id v25 = [v21 subpath];
          uint64_t v26 = [v39 URLByAppendingPathComponent:v25];

          uint64_t v27 = [MEMORY[0x1E4F8E858] posterClassificationForSuggestionMedia:v21];
          id v41 = v18;
          LODWORD(v25) = [(PHAWallpaperSuggestionRefreshSession *)v38 saveShuffleSegmentationResourcesForAsset:v24 atURL:v26 withClassification:v27 style:v40 error:&v41];
          id v28 = v41;

          if (!v25)
          {

            int v29 = 0;
            goto LABEL_13;
          }
          id v18 = v28;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    int v29 = 1;
    id v28 = v18;
LABEL_13:
    a6 = v35;
    id v10 = v36;
    long long v13 = v33;
    uint64_t v11 = v34;
  }
  else
  {
    id v28 = 0;
    int v29 = 1;
  }

  if (a6) {
    *a6 = v28;
  }
  if (v29) {
    v30 = obj;
  }
  else {
    v30 = 0;
  }
  id v31 = v30;

  return v31;
}

- (id)consolidatedShuffleConfigurationFromPosterConfigurations:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "shuffleConfiguration", (void)v17);
        long long v13 = [v12 personLocalIdentifiers];
        [v4 unionSet:v13];

        long long v14 = [v12 albumCloudIdentifiers];
        [v5 unionSet:v14];

        v9 |= [v12 shuffleSmartAlbums];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F8CD38]) initWithShuffleType:0];
  [v15 setPersonLocalIdentifiers:v4];
  [v15 setAlbumCloudIdentifiers:v5];
  [v15 setShuffleSmartAlbums:v9];

  return v15;
}

- (void)enumerateRefreshableShufflePosterConfigurationsIn:(id)a3 usingBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21 = (void (**)(id, void *, void *, uint8_t *))a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v24;
    *(void *)&long long v9 = 138412546;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v14 = (void *)MEMORY[0x1E4F8CCF8];
        id v15 = objc_msgSend(v13, "assetDirectory", v20);
        id v22 = 0;
        uint64_t v16 = [v14 loadFromURL:v15 error:&v22];
        id v17 = v22;

        if (v16)
        {
          if ([v16 configurationType] == 1)
          {
            long long v18 = [v16 shuffleConfiguration];
            if ([v18 shuffleType] != 1)
            {
              if (v18)
              {
                buf[0] = 0;
                v21[2](v21, v13, v16, buf);
                if (buf[0])
                {

                  goto LABEL_19;
                }
              }
              goto LABEL_16;
            }
LABEL_15:

            long long v18 = 0;
          }
          else
          {
            long long v18 = 0;
            if ([0 shuffleType] == 1) {
              goto LABEL_15;
            }
          }
LABEL_16:

          goto LABEL_17;
        }
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          id v28 = v13;
          __int16 v29 = 2112;
          id v30 = v17;
          _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "Error unarchiving poster configuration %@: %@", buf, 0x16u);
        }
LABEL_17:
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v10);
  }
LABEL_19:
}

- (BOOL)reloadWallpaperSuggestionsForUUIDs:(id)a3 progress:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isCancelledWithProgress:0.0])
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Wallpaper suggestions refresh was canceled", buf, 2u);
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
    goto LABEL_34;
  }
  long long v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  *(void *)buf = 0;
  v57 = buf;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__7048;
  v60 = __Block_byref_object_dispose__7049;
  id v61 = 0;
  long long v14 = [v9 progressReportersForParallelOperationsWithCount:3];
  if (v8 && ![v8 count])
  {
    v34 = self->_loggingConnection;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_1D21F2000, v34, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Empty suggestionUUIDs, bypassing refreshPosterConfigurations", v48, 2u);
    }
  }
  else
  {
    dispatch_group_enter(v12);
    uint64_t v15 = [v14 firstObject];
    uint64_t v16 = (void *)v15;
    if (v15) {
      id v17 = (void *)v15;
    }
    else {
      id v17 = v9;
    }
    id v18 = v17;

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke;
    v54[3] = &unk_1E69187A0;
    id v55 = v8;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_2;
    v49[3] = &unk_1E69187C8;
    v53 = buf;
    id v50 = v13;
    v51 = self;
    v52 = v12;
    [(PHAWallpaperSuggestionRefreshSession *)self refreshPosterConfigurationsForNightlyRefresh:0 progressReporter:v18 passingFilter:v54 withCompletion:v49];
  }
  dispatch_group_enter(v12);
  if ((unint64_t)[v14 count] < 2)
  {
    id v19 = v9;
  }
  else
  {
    id v19 = [v14 objectAtIndexedSubscript:1];
  }
  long long v20 = v19;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_402;
  v43[3] = &unk_1E69187C8;
  id v21 = v13;
  v47 = buf;
  id v44 = v21;
  long long v45 = self;
  id v22 = v12;
  id v46 = v22;
  [(PHAWallpaperSuggestionRefreshSession *)self refreshPosterDescriptorsWithProgressReporter:v20 completion:v43];
  dispatch_group_enter(v22);
  if ((unint64_t)[v14 count] < 3)
  {
    id v23 = v9;
  }
  else
  {
    id v23 = [v14 objectAtIndexedSubscript:2];
  }
  long long v24 = v23;
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  v37 = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_403;
  v38 = &unk_1E69187C8;
  id v25 = v21;
  long long v42 = buf;
  id v39 = v25;
  id v40 = self;
  long long v26 = v22;
  id v41 = v26;
  [(PHAWallpaperSuggestionRefreshSession *)self refreshAmbientDescriptorsWithProgressReporter:v24 completion:&v35];
  dispatch_group_leave(v26);
  dispatch_time_t v27 = dispatch_time(0, 300000000000);
  intptr_t v28 = dispatch_group_wait(v26, v27);
  if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0, v35, v36, v37, v38))
  {
    [v25 lock];
    if (!*((void *)v57 + 5))
    {
      __int16 v29 = self->_loggingConnection;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v48 = 0;
        _os_log_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Wallpaper suggestions refresh was canceled", v48, 2u);
      }
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
LABEL_28:
      uint64_t v32 = (void *)*((void *)v57 + 5);
      *((void *)v57 + 5) = v30;

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (v28)
  {
    [v25 lock];
    if (!*((void *)v57 + 5))
    {
      id v31 = self->_loggingConnection;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v48 = 0;
        _os_log_error_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Timed out reloading wallpaper suggestions", v48, 2u);
      }
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 9);
      goto LABEL_28;
    }
LABEL_29:
    [v25 unlock];
  }
  if (a5) {
    *a5 = *((id *)v57 + 5);
  }
  BOOL v11 = *((void *)v57 + 5) == 0;

  _Block_object_dispose(buf, 8);
LABEL_34:

  return v11;
}

uint64_t __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    id v5 = [v3 media];
    id v6 = [v5 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = objc_msgSend(v4, "media", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(a1 + 32);
            long long v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) suggestionUUID];
            LOBYTE(v13) = [v13 containsObject:v14];

            if (v13)
            {
              uint64_t v15 = 1;
              goto LABEL_15;
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      uint64_t v15 = 0;
LABEL_15:
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

void __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [*(id *)(a1 + 32) lock];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] refreshPosterConfigurations succeeded", (uint8_t *)&v8, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] refreshPosterConfigurations failed: %@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_402(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [*(id *)(a1 + 32) lock];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed poster descriptors", (uint8_t *)&v8, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh poster descriptors: %@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_403(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [*(id *)(a1 + 32) lock];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed ambient poster descriptors", (uint8_t *)&v8, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh ambient poster descriptors: %@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_removeIfNeededFeaturedContent:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 count];
  loggingConnection = self->_loggingConnection;
  BOOL v9 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Featured content is not allowed and there are existing poster descriptors, attempting to remove them", buf, 2u);
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F92360]);
    uint64_t v11 = [(NSURL *)self->_refreshSessionURL path];
    [v10 setIdentifier:v11];

    posterService = self->_posterService;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__PHAWallpaperSuggestionRefreshSession__removeIfNeededFeaturedContent_withCompletion___block_invoke;
    v13[3] = &unk_1E6918778;
    v13[4] = self;
    id v14 = v6;
    [(PRSService *)posterService refreshPosterDescriptorsForExtension:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" sessionInfo:v10 completion:v13];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Not allowed to feature content, and no existing poster descriptors", buf, 2u);
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC08], 0);
  }
}

void __86__PHAWallpaperSuggestionRefreshSession__removeIfNeededFeaturedContent_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully removed all existing poster descriptors", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to remove existing poster descriptors: %@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)saveSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withOptions:(id)a5 classification:(unint64_t)a6 error:(id *)a7
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v33 = a5;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 1;
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x3032000000;
  long long v45 = __Block_byref_object_copy__7048;
  id v46 = __Block_byref_object_dispose__7049;
  id v47 = 0;
  id v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)self->_loggingConnection);
  uint64_t v16 = self->_loggingConnection;
  long long v17 = v16;
  unint64_t v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "saveSegmentation", "", buf, 2u);
  }
  os_signpost_id_t spid = v15;

  long long v19 = a7;
  uint64_t v20 = [MEMORY[0x1E4F8E858] mediaAnalysisTypeForPosterClassification:a6];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F74538]];
  if (v33) {
    objc_msgSend(v21, "addEntriesFromDictionary:", v33, spid);
  }
  mediaAnalysisService = self->_mediaAnalysisService;
  v52[0] = v12;
  id v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v52, 1, spid);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __113__PHAWallpaperSuggestionRefreshSession_saveSegmentationResourcesForAsset_atURL_withOptions_classification_error___block_invoke_2;
  v34[3] = &unk_1E6918750;
  id v24 = v12;
  id v39 = &v48;
  id v35 = v24;
  uint64_t v36 = self;
  id v25 = v13;
  id v37 = v25;
  id v40 = &v42;
  long long v26 = v14;
  v38 = v26;
  [(VCPMediaAnalysisService *)mediaAnalysisService requestAnalysisTypes:v20 | 0x8000000000 forAssets:v23 withOptions:v21 progressHandler:&__block_literal_global_7056 andCompletionHandler:v34];

  dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_time_t v27 = self->_loggingConnection;
  intptr_t v28 = v27;
  if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled((os_log_t)v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v28, OS_SIGNPOST_INTERVAL_END, spida, "saveSegmentation", "", buf, 2u);
  }

  if (v19) {
    *long long v19 = (id) v43[5];
  }
  BOOL v29 = *((unsigned char *)v49 + 24) != 0;

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v29;
}

void __113__PHAWallpaperSuggestionRefreshSession_saveSegmentationResourcesForAsset_atURL_withOptions_classification_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) uuid];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v5 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    int v8 = [*(id *)(a1 + 32) localIdentifier];
    id v9 = [v5 objectForKeyedSubscript:v8];

    uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F744E0]];
    uint64_t v11 = [v10 firstObject];

    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(NSObject **)(v12 + 56);
    if (v11)
    {
      id v40 = v6;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v44 = v7;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully exported wallpaper for asset %@ to temporary directory at %@", buf, 0x16u);
      }
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v11];
      os_signpost_id_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v16 = [*(id *)(a1 + 48) path];
      int v17 = [v15 fileExistsAtPath:v16];

      if (v17)
      {
        unint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v19 = *(void *)(a1 + 48);
        id v42 = 0;
        char v20 = [v18 removeItemAtURL:v19 error:&v42];
        id v21 = v42;

        if ((v20 & 1) == 0)
        {
          uint64_t v22 = *(NSObject **)(*(void *)(a1 + 40) + 56);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v39 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138413058;
            uint64_t v44 = v7;
            __int16 v45 = 2112;
            id v46 = v14;
            __int16 v47 = 2112;
            id v48 = v39;
            __int16 v49 = 2112;
            id v50 = v21;
            _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to remove existing file so it can be overwritten when exporting wallpaper for asset %@ from %@ to %@: %@", buf, 0x2Au);
          }
        }
      }
      id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v24 = *(void *)(a1 + 48);
      id v41 = 0;
      char v25 = [v23 copyItemAtURL:v14 toURL:v24 error:&v41];
      id v26 = v41;
      id v27 = v41;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v25;

      intptr_t v28 = *(NSObject **)(*(void *)(a1 + 40) + 56);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        id v6 = v40;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v29 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          uint64_t v44 = v7;
          __int16 v45 = 2112;
          id v46 = v14;
          __int16 v47 = 2112;
          id v48 = v29;
          _os_log_impl(&dword_1D21F2000, v28, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully copied exported wallpaper for asset %@ from %@ to %@", buf, 0x20u);
        }
      }
      else
      {
        id v6 = v40;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v38 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          uint64_t v44 = v7;
          __int16 v45 = 2112;
          id v46 = v14;
          __int16 v47 = 2112;
          id v48 = v38;
          __int16 v49 = 2112;
          id v50 = v27;
          _os_log_error_impl(&dword_1D21F2000, v28, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to copy exported wallpaper for asset %@ from %@ to %@: %@", buf, 0x2Au);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v26);
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v12 + 56), OS_LOG_TYPE_ERROR))
      {
        id v37 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v44 = v7;
        __int16 v45 = 2112;
        id v46 = v37;
        _os_log_error_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to export wallpaper for asset %@ to directory at %@: MAD reported success but no exported file path", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 9);
      uint64_t v35 = *(void *)(*(void *)(a1 + 72) + 8);
      id v14 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v34;
    }

LABEL_27:
    goto LABEL_28;
  }
  uint64_t v30 = *(NSObject **)(*(void *)(a1 + 40) + 56);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v44 = v7;
    __int16 v45 = 2112;
    id v46 = v36;
    __int16 v47 = 2112;
    id v48 = v6;
    _os_log_error_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to export wallpaper for asset %@ to directory at %@: %@", buf, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v31 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Missing error while onDemandAnalysis is nil.", buf, 2u);
    }
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", -100, @"Missing error while onDemandAnalysis is nil.");
    uint64_t v33 = *(void *)(*(void *)(a1 + 72) + 8);
    id v9 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;
    goto LABEL_27;
  }
LABEL_28:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (BOOL)saveShuffleSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withClassification:(unint64_t)a5 style:(id)a6 error:(id *)a7
{
  id v11 = a6;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v12);
  if (v11)
  {
    uint64_t v16 = [MEMORY[0x1E4F8CCA8] dictionaryWithStyle:v11];
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (PFPosterWantsLowLuminanceContent()) {
    uint64_t v17 = 5;
  }
  else {
    uint64_t v17 = 1;
  }
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
    v17 |= 0x22uLL;
  }
  unint64_t v18 = [NSNumber numberWithUnsignedInteger:a5];
  [v15 setObject:v18 forKeyedSubscript:@"Classification"];

  [v15 setObject:v16 forKeyedSubscript:@"Style"];
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v17];
  [v15 setObject:v19 forKeyedSubscript:@"LayerStackOptions"];

  [v15 setObject:&unk_1F291ABD0 forKeyedSubscript:@"Priority"];
  BOOL v20 = [(PHAWallpaperSuggestionRefreshSession *)self saveSegmentationResourcesForAsset:v14 atURL:v13 withOptions:v15 classification:a5 error:a7];

  return v20;
}

- (BOOL)savePreviewSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withClassification:(unint64_t)a5 styleCategory:(id)a6 enableSettlingEffect:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v14 = (void *)MEMORY[0x1E4F8CE48];
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  int v18 = [v14 deviceSupportsLandscapeConfiguration];
  uint64_t v19 = 8;
  if (v18) {
    uint64_t v19 = 136;
  }
  if (v9) {
    uint64_t v20 = v19 | 0x40;
  }
  else {
    uint64_t v20 = v19;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v22 = [NSNumber numberWithUnsignedInteger:a5];
  [v21 setObject:v22 forKeyedSubscript:@"Classification"];

  id v23 = [NSNumber numberWithUnsignedInteger:v20];
  [v21 setObject:v23 forKeyedSubscript:@"LayerStackOptions"];

  [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"EnableSettlingEffect"];
  [v21 setObject:v15 forKeyedSubscript:@"StyleCategory"];

  [v21 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"OutOfProcess"];
  [v21 setObject:&unk_1F291ABB8 forKeyedSubscript:@"SettlingEffectGatingLevel"];
  BOOL v24 = [(PHAWallpaperSuggestionRefreshSession *)self saveSegmentationResourcesForAsset:v17 atURL:v16 withOptions:v21 classification:a5 error:a8];

  return v24;
}

- (id)updateIfNeededPosterDescriptors:(id)a3 fromCurrentPosterDescriptors:(id)a4 partialErrors:(id *)a5 progressReporter:(id)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  int v13 = [v12 isCancelledWithProgress:0.0];
  *((unsigned char *)v43 + 24) = v13;
  if (v13)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
    }
    if (!a5)
    {
      id v16 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v47[0] = v15;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    id v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)buf = 0;
    id v39 = buf;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    uint64_t v19 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __132__PHAWallpaperSuggestionRefreshSession_updateIfNeededPosterDescriptors_fromCurrentPosterDescriptors_partialErrors_progressReporter___block_invoke;
    v27[3] = &unk_1E6918708;
    uint64_t v34 = &v42;
    uint64_t v35 = v37;
    id v28 = v12;
    BOOL v29 = self;
    id v20 = v18;
    id v30 = v20;
    id v31 = v11;
    id v21 = v19;
    id v32 = v21;
    uint64_t v36 = buf;
    id v15 = v17;
    id v33 = v15;
    [v10 enumerateKeysAndObjectsUsingBlock:v27];
    if (*((unsigned char *)v43 + 24))
    {
      uint64_t v22 = self->_loggingConnection;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v26 = 0;
        _os_log_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", v26, 2u);
      }
      if (a5)
      {
        id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
        id v46 = v23;
        *a5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      }
      id v16 = 0;
    }
    else
    {
      if (a5) {
        *a5 = v20;
      }
      if (v39[24])
      {
        id v24 = v15;
      }
      else
      {
        id v24 = [MEMORY[0x1E4F1CAD0] set];
      }
      id v16 = v24;
    }

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(buf, 8);
  }
LABEL_21:
  _Block_object_dispose(&v42, 8);

  return v16;
}

void __132__PHAWallpaperSuggestionRefreshSession_updateIfNeededPosterDescriptors_fromCurrentPosterDescriptors_partialErrors_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v9 + 24))
  {
    char v10 = 1;
  }
  else
  {
    char v10 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  }
  *(unsigned char *)(v9 + 24) = v10;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    if ([v8 descriptorType] == 1)
    {
      id v11 = PFParallaxStyleFrequencyTable();
      id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) % (unint64_t)objc_msgSend(v11, "count"));
      [v8 setStyleCategory:v12];

      int v13 = *(NSObject **)(*(void *)(a1 + 40) + 56);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = v13;
        id v15 = [v8 styleCategory];
        id v16 = [v8 identifier];
        *(_DWORD *)buf = 138412546;
        v107 = v15;
        __int16 v108 = 2112;
        id v109 = v16;
        _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Applied Style: '%@' to descriptor %@", buf, 0x16u);
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    }
    id v17 = [*(id *)(*(void *)(a1 + 40) + 16) URLByAppendingPathComponent:v7];
    id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v102 = 0;
    int v19 = [v18 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v102];
    id v20 = v102;

    id v21 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (!v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v107 = v17;
        __int16 v108 = 2112;
        id v109 = v20;
        _os_log_error_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create poster descriptor directory at %@: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 48) addObject:v20];
      goto LABEL_33;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v17;
      _os_log_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created poster descriptor directory at %@", buf, 0xCu);
    }
    uint64_t v22 = *(void *)(*(void *)(a1 + 80) + 8);
    if (*(unsigned char *)(v22 + 24))
    {
      char v23 = 1;
    }
    else
    {
      char v23 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
      uint64_t v22 = *(void *)(*(void *)(a1 + 80) + 8);
    }
    *(unsigned char *)(v22 + 24) = v23;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      *a4 = 1;
LABEL_33:

      goto LABEL_34;
    }
    id v101 = v20;
    int v24 = [v8 saveToURL:v17 error:&v101];
    id v25 = v101;

    id v26 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (!v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v107 = v17;
        __int16 v108 = 2112;
        id v109 = v25;
        _os_log_error_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to save poster descriptor to directory at %@: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 48) addObject:v25];
      goto LABEL_32;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v17;
      _os_log_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully saved poster descriptor to directory at %@", buf, 0xCu);
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
    if (*(unsigned char *)(v27 + 24))
    {
      char v28 = 1;
    }
    else
    {
      char v28 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
      uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
    }
    *(unsigned char *)(v27 + 24) = v28;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      *a4 = 1;
LABEL_32:
      id v20 = v25;
      goto LABEL_33;
    }
    v85 = v25;
    BOOL v29 = [*(id *)(a1 + 56) objectForKeyedSubscript:v7];
    id v30 = v29;
    if (v29)
    {
      id v31 = (void *)MEMORY[0x1E4F8CD00];
      id v32 = [v29 assetDirectory];
      id v100 = v85;
      id v33 = [v31 loadFromURL:v32 error:&v100];
      id v34 = v100;

      v85 = v34;
    }
    else
    {
      id v33 = 0;
    }
    uint64_t v35 = *(void *)(*(void *)(a1 + 80) + 8);
    if (*(unsigned char *)(v35 + 24))
    {
      char v36 = 1;
    }
    else
    {
      char v36 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
      uint64_t v35 = *(void *)(*(void *)(a1 + 80) + 8);
    }
    *(unsigned char *)(v35 + 24) = v36;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      if (!v33) {
        goto LABEL_47;
      }
      if ([v8 isEqual:v33])
      {
LABEL_44:
        objc_msgSend(*(id *)(a1 + 72), "addObject:", v7, v71);
LABEL_50:

        id v20 = v85;
        goto LABEL_33;
      }
      uint64_t v37 = *(void *)(*(void *)(a1 + 80) + 8);
      if (*(unsigned char *)(v37 + 24))
      {
        char v38 = 1;
      }
      else
      {
LABEL_47:
        char v38 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
        uint64_t v37 = *(void *)(*(void *)(a1 + 80) + 8);
      }
      *(unsigned char *)(v37 + 24) = v38;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        v72 = v33;
        v73 = v30;
        v71 = a4;
        v74 = v17;
        id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v39 = [v8 media];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v96 objects:v105 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v97;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v97 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = (void *)MEMORY[0x1E4F38EB8];
              char v45 = objc_msgSend(*(id *)(*((void *)&v96 + 1) + 8 * i), "assetUUID", v71);
              id v46 = [v44 localIdentifierWithUUID:v45];

              if (v46) {
                [v86 addObject:v46];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v96 objects:v105 count:16];
          }
          while (v41);
        }

        __int16 v47 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v86 options:*(void *)(a1 + 64)];
        id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v49 = v47;
        uint64_t v50 = [v49 countByEnumeratingWithState:&v92 objects:v104 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v51; ++j)
            {
              if (*(void *)v93 != v52) {
                objc_enumerationMutation(v49);
              }
              v54 = *(void **)(*((void *)&v92 + 1) + 8 * j);
              id v55 = objc_msgSend(v54, "uuid", v71);
              [v48 setObject:v54 forKeyedSubscript:v55];
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v92 objects:v104 count:16];
          }
          while (v51);
        }

        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id obj = [v8 media];
        uint64_t v77 = [obj countByEnumeratingWithState:&v88 objects:v103 count:16];
        if (v77)
        {
          uint64_t v76 = *(void *)v89;
          id v17 = v74;
          while (2)
          {
            for (uint64_t k = 0; k != v77; ++k)
            {
              if (*(void *)v89 != v76) {
                objc_enumerationMutation(obj);
              }
              v57 = *(void **)(*((void *)&v88 + 1) + 8 * k);
              uint64_t v58 = (void *)MEMORY[0x1D26057A0]();
              uint64_t v59 = *(void *)(*(void *)(a1 + 80) + 8);
              if (*(unsigned char *)(v59 + 24))
              {
                char v60 = 1;
              }
              else
              {
                char v60 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
                uint64_t v59 = *(void *)(*(void *)(a1 + 80) + 8);
              }
              *(unsigned char *)(v59 + 24) = v60;
              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
              {
                goto LABEL_86;
              }
              context = v58;
              id v61 = [v57 assetUUID];
              uint64_t v62 = [v48 objectForKeyedSubscript:v61];

              v84 = (void *)v62;
              if (v62)
              {
                v63 = [v57 subpath];
                v82 = [v74 URLByAppendingPathComponent:v63];

                uint64_t v80 = objc_msgSend(MEMORY[0x1E4F8E858], "posterClassificationForMedia:descriptorType:", v57, objc_msgSend(v8, "descriptorType"));
                BOOL v79 = [v8 descriptorType] == 3;
                v78 = *(void **)(a1 + 40);
                v64 = [v8 styleCategory];
                id v87 = v85;
                int v65 = [v78 savePreviewSegmentationResourcesForAsset:v62 atURL:v82 withClassification:v80 styleCategory:v64 enableSettlingEffect:v79 error:&v87];
                id v81 = v87;

                v66 = *(NSObject **)(*(void *)(a1 + 40) + 56);
                if (!v65)
                {
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  {
                    v69 = v66;
                    v70 = [v84 uuid];
                    *(_DWORD *)buf = 138412546;
                    v107 = v70;
                    __int16 v108 = 2112;
                    id v109 = v81;
                    _os_log_error_impl(&dword_1D21F2000, v69, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to save preview segmentation resources for asset %@: %@", buf, 0x16u);
                  }
                  if (v81) {
                    [*(id *)(a1 + 48) addObject:v81];
                  }

                  v85 = v81;
                  goto LABEL_94;
                }
                if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
                {
                  v67 = v66;
                  v68 = [v84 uuid];
                  *(_DWORD *)buf = 138412290;
                  v107 = v68;
                  _os_log_impl(&dword_1D21F2000, v67, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully saved preview segmentation resources for asset %@", buf, 0xCu);
                }
                v85 = v81;
              }
            }
            uint64_t v77 = [obj countByEnumeratingWithState:&v88 objects:v103 count:16];
            if (v77) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v17 = v74;
        }
LABEL_86:

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
        {
          unsigned char *v71 = 1;
LABEL_94:

          id v33 = v72;
          id v30 = v73;
          goto LABEL_50;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;

        id v33 = v72;
        id v30 = v73;
        goto LABEL_44;
      }
    }
    *a4 = 1;
    goto LABEL_50;
  }
  *a4 = 1;
LABEL_34:
}

- (id)posterDescriptorOfType:(int64_t)a3 withSuggestion:(id)a4 assetBySuggestionUUID:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [v8 uuid];
  char v10 = [v7 objectForKeyedSubscript:v9];

  id v11 = [v10 uuid];

  id v12 = objc_alloc(MEMORY[0x1E4F8CD28]);
  uint64_t v13 = [v8 subtype];

  id v14 = (void *)[v12 initWithAssetUUID:v11 suggestionUUID:v9 suggestionSubtype:v13];
  id v15 = objc_alloc(MEMORY[0x1E4F8CD00]);
  v19[0] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v17 = (void *)[v15 initWithDescriptorType:a3 media:v16];

  return v17;
}

- (id)settlingEffectDescriptorsForDonationWithSuggestionUUIDsToAvoid:(id)a3
{
  v78[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v78[0] = v7;
  id v8 = [MEMORY[0x1E4F39310] predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper];
  v78[1] = v8;
  id v60 = v4;
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"uuid", v4];
  v78[2] = v9;
  char v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"subtype", 602);
  v78[3] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K <= %d", @"subtype", 605);
  v78[4] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:5];
  uint64_t v13 = [v6 andPredicateWithSubpredicates:v12];
  [v5 setPredicate:v13];

  uint64_t v59 = v5;
  id v14 = [MEMORY[0x1E4F8E858] fetchSettlingEffectSuggestionsWithOptions:v5];
  id v15 = [(PHAWallpaperSuggestionRefreshSession *)self randomizeSuggestions:v14];
  v64 = self;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = loggingConnection;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)uint64_t v76 = [v15 count];
    _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Found %d settling effect suggestions", buf, 8u);
  }
  v63 = [(PHAWallpaperSuggestionRefreshSession *)self keyAssetBySuggestionUUIDFromSuggestions:v15];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F8D978]) initWithType:5 loggingConnection:self->_loggingConnection];
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (!v20) {
    goto LABEL_21;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v70;
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v70 != v22) {
        objc_enumerationMutation(v19);
      }
      int v24 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      __int16 v25 = [v24 subtype];
      id v26 = PHSuggestionStringWithSubtype();
      if ((v25 & 0xFFFE) == 0x25A)
      {
        uint64_t v27 = [v24 uuid];
        char v28 = [v63 objectForKeyedSubscript:v27];

        if ([v18 assetIsUsingHeadroom:v28])
        {
          BOOL v29 = v64->_loggingConnection;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = v29;
            id v31 = [v24 uuid];
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v76 = v31;
            _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Skip suggestion %@ for settling effect descriptor donation because it's using headroom", buf, 0xCu);
          }
          goto LABEL_17;
        }
      }
      id v32 = v64->_loggingConnection;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = v32;
        id v34 = [v24 uuid];
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v76 = v26;
        *(_WORD *)&v76[8] = 2112;
        *(void *)&v76[10] = v34;
        _os_log_impl(&dword_1D21F2000, v33, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Select (%@) suggestion %@ for settling effect descriptor donation", buf, 0x16u);
      }
      [v62 addObject:v24];
      if ((unint64_t)[v62 count] >= 3)
      {

        goto LABEL_21;
      }
LABEL_17:
    }
    uint64_t v21 = [v19 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_21:

  uint64_t v35 = v62;
  if ([v62 count])
  {
    id v58 = v19;
    id v61 = v18;
    char v36 = [(PHAWallpaperSuggestionRefreshSession *)v64 uuidsOfSuggestions:v62];
    uint64_t v37 = v64->_loggingConnection;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      char v38 = v37;
      int v39 = [v62 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v76 = v39;
      *(_WORD *)&v76[4] = 2112;
      *(void *)&v76[6] = v36;
      _os_log_impl(&dword_1D21F2000, v38, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Refreshing gallery with %d settling effect suggestions %@", buf, 0x12u);
    }
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v41 = v62;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v66 != v44) {
            objc_enumerationMutation(v41);
          }
          id v46 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          __int16 v47 = [(PHAWallpaperSuggestionRefreshSession *)v64 posterDescriptorOfType:3 withSuggestion:v46 assetBySuggestionUUID:v63];
          id v48 = (void *)MEMORY[0x1E4F8CD00];
          id v49 = [v46 uuid];
          v73 = v49;
          uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          uint64_t v51 = [v48 descriptorIdentifierForDescriptorType:3 uuids:v50];
          [v47 setIdentifier:v51];

          [v40 addObject:v47];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v65 objects:v74 count:16];
      }
      while (v43);
    }

    uint64_t v52 = v64->_loggingConnection;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      int v54 = [v40 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v76 = v54;
      *(_WORD *)&v76[4] = 2112;
      *(void *)&v76[6] = v40;
      _os_log_impl(&dword_1D21F2000, v53, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Created %d SettlingEffect poster descriptors: %@", buf, 0x12u);
    }
    id v55 = v60;
    id v18 = v61;
    id v19 = v58;
    uint64_t v35 = v62;
  }
  else
  {
    v56 = v64->_loggingConnection;
    id v55 = v60;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v56, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No settling effect suggestions found to refresh gallery", buf, 2u);
    }
    id v40 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v40;
}

- (id)updatedPosterDescriptorsFromSuggestions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHAWallpaperSuggestionRefreshSession *)self keyAssetBySuggestionUUIDFromSuggestions:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = v4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
  id v8 = [v7 lastObject];
  if (v8)
  {
    uint64_t v9 = [(PHAWallpaperSuggestionRefreshSession *)self posterDescriptorOfType:2 withSuggestion:v8 assetBySuggestionUUID:v5];
    char v10 = [MEMORY[0x1E4F8CD00] descriptorTypeStringWithType:2];
    [v9 setIdentifier:v10];

    [v6 addObject:v9];
    [v7 removeLastObject];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v17 = [(PHAWallpaperSuggestionRefreshSession *)self posterDescriptorOfType:1 withSuggestion:v16 assetBySuggestionUUID:v5];
        id v18 = [v16 uuid];
        [v17 setIdentifier:v18];

        [v6 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v6;
}

- (id)keyAssetBySuggestionUUIDFromSuggestions:(id)a3
{
  photoLibrary = self->_photoLibrary;
  id v5 = a3;
  id v6 = [(PHPhotoLibrary *)photoLibrary librarySpecificFetchOptions];
  id v7 = [MEMORY[0x1E4F8D988] assetFetchPropertySetsIncludingGating:1];
  [v6 setFetchPropertySets:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F39150]) initWithObjects:v5 photoLibrary:self->_photoLibrary fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v8 options:v6];

  return v9;
}

- (id)randomizeSuggestions:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F8E858];
  id v4 = a3;
  id v5 = [v3 randomNumberGeneratorForWallpaperDonation];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v7 = [v4 fetchedObjects];

  id v8 = (void *)[v6 initWithArray:v7];
  PFMutableArrayShuffleWithRandomNumberGenerator();

  return v8;
}

- (id)randomizedWallpaperSuggesstionWithSubtype:(unsigned __int16)a3 suggestionUUIDsToAvoid:(id)a4
{
  unsigned int v4 = a3;
  v26[3] = *MEMORY[0x1E4F143B8];
  photoLibrary = self->_photoLibrary;
  id v7 = a4;
  id v8 = [(PHPhotoLibrary *)photoLibrary librarySpecificFetchOptions];
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  char v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v26[0] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"subtype", v4);
  v26[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"uuid", v7];

  v26[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  uint64_t v14 = [v9 andPredicateWithSubpredicates:v13];
  [v8 setPredicate:v14];

  id v15 = [MEMORY[0x1E4F39310] fetchAllFeaturedStateEnabledSuggestionsWithOptions:v8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    id v17 = loggingConnection;
    uint64_t v18 = [v15 count];
    id v19 = PHSuggestionStringWithSubtype();
    *(_DWORD *)buf = 134218242;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    __int16 v25 = v19;
    _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] found %lu %@ suggestions", buf, 0x16u);
  }
  uint64_t v20 = [(PHAWallpaperSuggestionRefreshSession *)self randomizeSuggestions:v15];

  return v20;
}

- (id)fetchSuggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:(id)a3
{
  v61[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_loggingConnection;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v7 = v5;
  id v8 = v7;
  unint64_t v41 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchGalleryDonation", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;
  id v40 = v8;

  uint64_t v38 = mach_absolute_time();
  uint64_t v9 = [(PHAWallpaperSuggestionRefreshSession *)self randomizedWallpaperSuggesstionWithSubtype:602 suggestionUUIDsToAvoid:v4];
  char v10 = [v9 objectEnumerator];
  v61[0] = v10;
  id v11 = [(PHAWallpaperSuggestionRefreshSession *)self randomizedWallpaperSuggesstionWithSubtype:603 suggestionUUIDsToAvoid:v4];
  uint64_t v12 = [v11 objectEnumerator];
  v61[1] = v12;
  uint64_t v13 = [(PHAWallpaperSuggestionRefreshSession *)self randomizedWallpaperSuggesstionWithSubtype:604 suggestionUUIDsToAvoid:v4];
  uint64_t v14 = [v13 objectEnumerator];
  v61[2] = v14;
  int v39 = self;
  uint64_t v42 = v4;
  id v15 = [(PHAWallpaperSuggestionRefreshSession *)self randomizedWallpaperSuggesstionWithSubtype:605 suggestionUUIDsToAvoid:v4];
  id v16 = [v15 objectEnumerator];
  v61[3] = v16;
  uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v44 = 0;
  double v20 = 0.0;
  do
  {
    if ((unint64_t)objc_msgSend(v17, "count", spid) > 0xA) {
      break;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v21 = v43;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v60 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      unint64_t v24 = 0;
      uint64_t v25 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = [*(id *)(*((void *)&v45 + 1) + 8 * i) nextObject];
          if (v27)
          {
            [v17 addObject:v27];
            switch([v27 subtype])
            {
              case 0x25Au:
                ++*(void *)&v20;
                break;
              case 0x25Bu:
                ++v18;
                break;
              case 0x25Cu:
                ++v19;
                break;
              case 0x25Du:
                ++v44;
                break;
              default:
                break;
            }
            if ((unint64_t)[v17 count] >= 0xB)
            {

              goto LABEL_24;
            }
          }
          else
          {
            ++v24;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v60 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v24 = 0;
    }
LABEL_24:
  }
  while (v24 < [v21 count]);
  loggingConnection = v39->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    BOOL v29 = loggingConnection;
    uint64_t v30 = [v17 count];
    *(_DWORD *)buf = 134219008;
    uint64_t v51 = (const char *)v30;
    __int16 v52 = 2048;
    double v53 = v20;
    __int16 v54 = 2048;
    uint64_t v55 = v18;
    __int16 v56 = 2048;
    uint64_t v57 = v19;
    __int16 v58 = 2048;
    uint64_t v59 = v44;
    _os_log_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] found %lu suggestions to donate to Featured Photos. TopPeople(%lu), TopPet(%lu), TopLandscape(%lu), TopCityscape(%lu)", buf, 0x34u);
  }
  uint64_t v31 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v34 = v40;
  uint64_t v35 = v34;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v35, OS_SIGNPOST_INTERVAL_END, spid, "FetchGalleryDonation", "", buf, 2u);
  }

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v51 = "FetchGalleryDonation";
    __int16 v52 = 2048;
    double v53 = (float)((float)((float)((float)(v31 - v38) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v17;
}

- (id)suggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_loggingConnection;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v7 = v5;
  id v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WallpaperFeaturedPhotoDonation", "", buf, 2u);
  }

  uint64_t v10 = mach_absolute_time();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Start Wallpaper Gallery donation", buf, 2u);
  }
  if (PLIsFeaturedContentAllowed())
  {
    uint64_t v12 = [(PHAWallpaperSuggestionRefreshSession *)self fetchSuggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:v4];
    uint64_t v13 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v16 = v8;
    id v17 = v16;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v17, OS_SIGNPOST_INTERVAL_END, v6, "WallpaperFeaturedPhotoDonation", "", buf, 2u);
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v29 = "WallpaperFeaturedPhotoDonation";
      __int16 v30 = 2048;
      double v31 = (float)((float)((float)((float)(v13 - v10) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v18 = self->_loggingConnection;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Featured Content not allowed. Clearing featuredState for existing top wallpaper suggestions.", buf, 2u);
    }
    uint64_t v19 = [(PHAWallpaperSuggestionRefreshSession *)self currentlyFeaturedSuggestionUUIDsForTop:1];
    double v20 = [MEMORY[0x1E4F1CAD0] set];
    [(PHAWallpaperSuggestionRefreshSession *)self updateSuggestionFeaturedStateWithNewSuggestionUUIDs:v20 oldSuggestionUUIDs:v19];

    uint64_t v21 = mach_absolute_time();
    uint32_t v23 = info.numer;
    uint32_t v22 = info.denom;
    unint64_t v24 = v8;
    uint64_t v25 = v24;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v25, OS_SIGNPOST_INTERVAL_END, v6, "WallpaperFeaturedPhotoDonation", "", buf, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v29 = "WallpaperFeaturedPhotoDonation";
      __int16 v30 = 2048;
      double v31 = (float)((float)((float)((float)(v21 - v10) * (float)v23) / (float)v22) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)featuredPhotoDescriptorsForDonationWithSuggestionUUIDsToAvoid:(id)a3 count:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v6 = [(PHAWallpaperSuggestionRefreshSession *)self suggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:a3];
  if ([v6 count])
  {
    id v7 = [(PHAWallpaperSuggestionRefreshSession *)self uuidsOfSuggestions:v6];
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = loggingConnection;
      int v19 = 67109378;
      int v20 = [v6 count];
      __int16 v21 = 2112;
      uint32_t v22 = v7;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Refreshing gallery with %d suggestions %@", (uint8_t *)&v19, 0x12u);
    }
    unint64_t v10 = [v6 count];
    if (v10 >= a4) {
      unint64_t v11 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t v12 = objc_msgSend(v6, "subarrayWithRange:", 0, v11);
    uint64_t v13 = [(PHAWallpaperSuggestionRefreshSession *)self updatedPosterDescriptorsFromSuggestions:v12];
    uint64_t v14 = self->_loggingConnection;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      int v16 = [v13 count];
      int v19 = 67109378;
      int v20 = v16;
      __int16 v21 = 2112;
      uint32_t v22 = v13;
      _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Created %d FeaturedPhoto poster descriptors: %@", (uint8_t *)&v19, 0x12u);
    }
  }
  else
  {
    id v17 = self->_loggingConnection;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No featured photo suggestions found to refresh gallery", (uint8_t *)&v19, 2u);
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (void)refreshPosterConfigurationsForNightlyRefresh:(BOOL)a3 progressReporter:(id)a4 passingFilter:(id)a5 withCompletion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void, id))a6;
  if (self->_refreshSessionIdentifier)
  {
    id v13 = v10;
    *(void *)id v33 = 0;
    id v34 = v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    int v14 = [v13 isCancelledWithProgress:0.0];
    v34[24] = v14;
    if (v14)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      int v16 = (PRSService *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v16);
    }
    else
    {
      uint64_t v18 = self->_posterService;
      int v19 = self->_photoLibrary;
      int v20 = self->_loggingConnection;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke;
      v23[3] = &unk_1E69186B8;
      v23[4] = self;
      char v28 = v12;
      __int16 v30 = v33;
      id v24 = v13;
      id v29 = v11;
      __int16 v21 = v19;
      uint64_t v25 = v21;
      uint32_t v22 = v20;
      uint64_t v26 = v22;
      BOOL v31 = a3;
      int v16 = v18;
      uint64_t v27 = v16;
      [(PRSService *)v16 fetchPosterConfigurationsForExtension:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" completion:v23];
    }
    _Block_object_dispose(v33, 8);
  }
  else
  {
    id v17 = self->_loggingConnection;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v33 = 0;
      _os_log_error_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] refreshPosterConfigurations called while refresh session has not been started", v33, 2u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 2);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v13);
  }
}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)buf = 67109378;
      v29[0] = [v5 count];
      LOWORD(v29[1]) = 2112;
      *(void *)((char *)&v29[1] + 2) = v5;
      _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully fetched %d current poster configurations: %@", buf, 0x12u);
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(unsigned char *)(v9 + 24))
    {
      char v10 = 1;
    }
    else
    {
      char v10 = [*(id *)(a1 + 40) isCancelledWithProgress:0.2];
      uint64_t v9 = *(void *)(*(void *)(a1 + 88) + 8);
    }
    *(unsigned char *)(v9 + 24) = v10;
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      uint64_t v12 = *(NSObject **)(v11 + 56);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
      }
      uint64_t v13 = *(void *)(a1 + 72);
      int v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
    else
    {
      id v15 = *(NSObject **)(v11 + 64);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_339;
      v18[3] = &unk_1E6918690;
      v18[4] = v11;
      id v16 = *(id *)(a1 + 72);
      uint64_t v17 = *(void *)(a1 + 88);
      id v24 = v16;
      uint64_t v26 = v17;
      id v19 = *(id *)(a1 + 40);
      id v20 = v5;
      id v25 = *(id *)(a1 + 80);
      id v21 = *(id *)(a1 + 48);
      id v22 = *(id *)(a1 + 56);
      char v27 = *(unsigned char *)(a1 + 96);
      id v23 = *(id *)(a1 + 64);
      dispatch_async(v15, v18);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v29 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to fetch current poster configurations: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_339(uint64_t a1)
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 8))
  {
    id v5 = *(NSObject **)(v2 + 56);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Refresh session has been cleaned up, bailing", buf, 2u);
    }
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 96) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [*(id *)(a1 + 40) isCancelledWithProgress:0.25];
    uint64_t v3 = *(void *)(*(void *)(a1 + 96) + 8);
  }
  *(unsigned char *)(v3 + 24) = v4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 48);
    v195[0] = MEMORY[0x1E4F143A8];
    v195[1] = 3221225472;
    v195[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_340;
    v195[3] = &unk_1E6918610;
    id v199 = *(id *)(a1 + 88);
    uint64_t v13 = a1;
    id v8 = v9;
    id v196 = v8;
    id v14 = v10;
    uint64_t v15 = *(void *)(v13 + 32);
    id v152 = v14;
    id v197 = v14;
    uint64_t v198 = v15;
    [v11 enumerateRefreshableShufflePosterConfigurationsIn:v12 usingBlock:v195];
    uint64_t v16 = [v8 count];
    uint64_t v161 = v13;
    uint64_t v17 = *(void **)(v13 + 32);
    uint64_t v18 = v17[7];
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No poster configurations eligible for update", buf, 2u);
        uint64_t v17 = *(void **)(v13 + 32);
      }
      id v22 = [v17 currentlyFeaturedSuggestionUUIDsForTop:0];
      id v23 = *(void **)(v161 + 32);
      id v24 = [MEMORY[0x1E4F1CAD0] set];
      [v23 updateSuggestionFeaturedStateWithNewSuggestionUUIDs:v24 oldSuggestionUUIDs:v22];

      id v25 = *(void (**)(void))(*(void *)(v161 + 80) + 16);
      goto LABEL_24;
    }
    if (v19)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v202 = v16;
      *(_WORD *)&v202[4] = 2112;
      *(void *)&v202[6] = v8;
      _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Found %d poster configurations eligible for update: %@", buf, 0x12u);
      uint64_t v17 = *(void **)(v13 + 32);
    }
    [v17 sendHasSmartShuffleWallpaperBiomeEvent];
    uint64_t v20 = *(void *)(*(void *)(v13 + 96) + 8);
    if (*(unsigned char *)(v20 + 24))
    {
      char v21 = 1;
    }
    else
    {
      char v21 = [*(id *)(v13 + 40) isCancelledWithProgress:0.3];
      uint64_t v20 = *(void *)(*(void *)(v13 + 96) + 8);
    }
    *(unsigned char *)(v20 + 24) = v21;
    if (*(unsigned char *)(*(void *)(*(void *)(v13 + 96) + 8) + 24))
    {
      uint64_t v26 = *(NSObject **)(*(void *)(v13 + 32) + 56);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
      }
      uint64_t v27 = *(void *)(v13 + 80);
      id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      id v25 = *(void (**)(void))(v27 + 16);
LABEL_24:
      v25();
LABEL_131:

      goto LABEL_132;
    }
    v136 = v8;
    uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
    id v29 = *(NSObject **)(*(void *)(v13 + 32) + 56);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v202 = v28;
      _os_log_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Date is %@", buf, 0xCu);
    }
    v147 = (void *)v28;
    __int16 v30 = (void *)[objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:*(void *)(v13 + 56)];
    id v160 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v191 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    v134 = v30;
    BOOL v31 = [v30 personUUIDsWithNegativeFeedback];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v191 objects:v207 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v192;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v192 != v34) {
            objc_enumerationMutation(v31);
          }
          char v36 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:*(void *)(*((void *)&v191 + 1) + 8 * i)];
          if (v36) {
            [v160 addObject:v36];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v191 objects:v207 count:16];
      }
      while (v33);
    }

    uint64_t v37 = v13;
    uint64_t v38 = *(void **)(v13 + 32);
    int v39 = v38[7];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v40 = v39;
      int v41 = [v160 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v202 = v41;
      *(_WORD *)&v202[4] = 2112;
      *(void *)&v202[6] = v160;
      _os_log_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Found %d rejected person local identifiers: %@", buf, 0x12u);

      uint64_t v38 = *(void **)(v13 + 32);
    }
    uint64_t v42 = [v152 allValues];
    uint64_t v43 = [v38 consolidatedShuffleConfigurationFromPosterConfigurations:v42];

    uint64_t v44 = *(NSObject **)(*(void *)(v13 + 32) + 56);
    id v22 = v147;
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(v161 + 32) + 56), OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v202 = v43;
      _os_log_impl(&dword_1D21F2000, v44, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Consolidated shuffle configuration: %@", buf, 0xCu);
    }
    v133 = (void *)v43;
    v151 = [MEMORY[0x1E4F8E850] suggestionLocalIdentifiersByFeatureForPosterConfiguration:v43 atDate:v147 inPhotoLibrary:*(void *)(v161 + 56)];
    long long v45 = *(NSObject **)(*(void *)(v161 + 32) + 56);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      long long v46 = v45;
      int v47 = [v151 count];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v202 = v47;
      _os_log_impl(&dword_1D21F2000, v46, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Found %d features with suggestions", buf, 8u);
    }
    id v48 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v145 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    id v49 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v16];
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v51 = dispatch_group_create();
    dispatch_group_enter(v51);
    __int16 v52 = *(NSObject **)(*(void *)(v161 + 32) + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_347;
    block[3] = &unk_1E6918638;
    uint64_t v190 = *(void *)(v161 + 96);
    id v53 = *(id *)(v161 + 40);
    uint64_t v54 = *(void *)(v161 + 32);
    id v184 = v53;
    uint64_t v185 = v54;
    id v189 = *(id *)(v161 + 80);
    id v141 = v48;
    id v186 = v141;
    id v144 = v50;
    id v187 = v144;
    id v139 = v49;
    group = v51;
    id v188 = v139;
    dispatch_group_notify(v51, v52, block);
    id v55 = objc_alloc_init(MEMORY[0x1E4F92360]);
    __int16 v56 = [*(id *)(*(void *)(v161 + 32) + 16) path];
    v138 = v55;
    [v55 setIdentifier:v56];

    v132 = (void *)[objc_alloc(MEMORY[0x1E4F8D970]) initWithPhotoLibrary:*(void *)(v161 + 56)];
    v137 = [[PHAWallpaperSuggestionAnalyticsSender alloc] initWithGraphManager:*(void *)(*(void *)(v161 + 32) + 40) libraryAnalysisSummary:v132];
    long long v179 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id obj = v136;
    uint64_t v150 = [obj countByEnumeratingWithState:&v179 objects:v206 count:16];
    if (!v150)
    {
LABEL_130:

      dispatch_group_leave(group);
      id v8 = v136;
      goto LABEL_131;
    }
    uint64_t v148 = *(void *)v180;
LABEL_44:
    uint64_t v57 = 0;
    while (1)
    {
      if (*(void *)v180 != v148) {
        objc_enumerationMutation(obj);
      }
      __int16 v58 = *(void **)(*((void *)&v179 + 1) + 8 * v57);
      uint64_t v59 = *(void *)(*(void *)(v37 + 96) + 8);
      if (*(unsigned char *)(v59 + 24))
      {
        char v60 = 1;
      }
      else
      {
        char v60 = [*(id *)(v37 + 40) isCancelledWithProgress:0.5];
        uint64_t v59 = *(void *)(*(void *)(v37 + 96) + 8);
      }
      *(unsigned char *)(v59 + 24) = v60;
      if (*(unsigned char *)(*(void *)(*(void *)(v37 + 96) + 8) + 24)) {
        goto LABEL_130;
      }
      uint64_t v153 = v57;
      id v61 = [v58 assetDirectory];
      id v62 = [v152 objectForKeyedSubscript:v61];

      v63 = [v62 shuffleConfiguration];
      v64 = *(NSObject **)(*(void *)(v37 + 32) + 56);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v202 = v58;
        *(_WORD *)&v202[8] = 2112;
        *(void *)&v202[10] = v62;
        _os_log_impl(&dword_1D21F2000, v64, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Handling poster configuration %@, PFPosterConfiguration %@", buf, 0x16u);
        v64 = *(NSObject **)(*(void *)(v37 + 32) + 56);
      }
      v149 = v58;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v202 = v63;
        _os_log_impl(&dword_1D21F2000, v64, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Handling PFPosterShuffleConfiguration: %@", buf, 0xCu);
      }
      long long v65 = (void *)MEMORY[0x1E4F8E850];
      long long v66 = [v62 shuffleConfiguration];
      long long v67 = [v65 chosenSuggestionLocalIdentifiersForPosterConfiguration:v66 fromSuggestionLocalIdentifiersByFeature:v151 atDate:v22 usingStrategy:1 withRejectedPersonLocalIdentifiers:v160];

      long long v68 = *(NSObject **)(*(void *)(v37 + 32) + 56);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        long long v69 = v68;
        int v70 = [v67 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v202 = v70;
        _os_log_impl(&dword_1D21F2000, v69, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Found %d suggestions", buf, 8u);
      }
      long long v71 = (void *)MEMORY[0x1E4F39310];
      long long v72 = [MEMORY[0x1E4F1CAD0] setWithArray:v67];
      v158 = [v71 uuidsFromLocalIdentifiers:v72];

      uint64_t v73 = [v62 identifier];
      v157 = v62;
      v74 = [v62 media];
      id v75 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v154 = v63;
      v155 = v74;
      v159 = v67;
      v156 = (void *)v73;
      if (!v74) {
        break;
      }
      int v76 = [v74 count];
      int v77 = [v67 count];
      v78 = *(NSObject **)(v37 + 64);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v202 = v76;
        *(_WORD *)&v202[4] = 2112;
        *(void *)&v202[6] = v74;
        _os_log_impl(&dword_1D21F2000, v78, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] %d previousMedia: %@", buf, 0x12u);
        v78 = *(NSObject **)(v37 + 64);
      }
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v202 = v77;
        *(_WORD *)&v202[4] = 2112;
        *(void *)&v202[6] = v159;
        _os_log_impl(&dword_1D21F2000, v78, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] %d updatedSuggestionLocalIdentifiers: %@", buf, 0x12u);
      }
      BOOL v80 = v76 > v77 && v77 < 2;
      id v81 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v82 = [v81 BOOLForKey:@"PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough"];

      uint64_t v83 = [v63 shuffleType];
      uint64_t v84 = v83;
      if (v80) {
        int v85 = ((*(unsigned char *)(v37 + 104) != 0) | ~v82) & (v83 != 2);
      }
      else {
        int v85 = 0;
      }
      v107 = *(NSObject **)(v37 + 64);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v108 = v107;
        id v109 = NSStringFromBOOL();
        uint64_t v110 = NSStringFromBOOL();
        v111 = NSStringFromBOOL();
        v112 = NSStringFromBOOL();
        *(_DWORD *)buf = 138413058;
        *(void *)v202 = v109;
        *(_WORD *)&v202[8] = 2112;
        *(void *)&v202[10] = v110;
        *(_WORD *)&v202[18] = 2112;
        v203 = v111;
        __int16 v204 = 2112;
        v205 = v112;
        _os_log_impl(&dword_1D21F2000, v108, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] notEnoughContent:%@, isNightlyRefresh:%@, libraryIsProcessedEnough:%@, isUserAlbumShuffle:%@", buf, 0x2Au);
      }
      v113 = v159;
      if (![v159 count] && v84 != 2)
      {
        v114 = *(NSObject **)(v37 + 64);
        v106 = v157;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v202 = v154;
          _os_log_fault_impl(&dword_1D21F2000, v114, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionRefreshSession] Found 0 suggestions for PFPosterShuffleConfiguration: %@. Skip refresh. This is unexpected because user must have enough content to create the first shuffle poster. If the library is processed enough please file a radar.", buf, 0xCu);
        }
LABEL_91:
        v115 = *(NSObject **)(v37 + 64);
        id v22 = v147;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          v116 = v115;
          int v117 = [v155 count];
          int v118 = [v159 count];
          *(_DWORD *)buf = 138412802;
          *(void *)v202 = v156;
          *(_WORD *)&v202[8] = 1024;
          *(_DWORD *)&v202[10] = v117;
          *(_WORD *)&v202[14] = 1024;
          *(_DWORD *)&v202[16] = v118;
          _os_log_impl(&dword_1D21F2000, v116, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Special case. Poster configuration %@ has %d media and new shuffle has %d. Skip updating.", buf, 0x18u);
        }
        goto LABEL_128;
      }
      v106 = v157;
      if (v85) {
        goto LABEL_91;
      }
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v119 = v155;
      uint64_t v120 = [v119 countByEnumeratingWithState:&v175 objects:v200 count:16];
      if (v120)
      {
        uint64_t v121 = v120;
        uint64_t v122 = *(void *)v176;
        do
        {
          for (uint64_t j = 0; j != v121; ++j)
          {
            if (*(void *)v176 != v122) {
              objc_enumerationMutation(v119);
            }
            v124 = *(void **)(*((void *)&v175 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v125 = v124;
              v126 = [v125 suggestionUUID];
              [v75 addObject:v126];
            }
            else
            {
              v127 = *(NSObject **)(v161 + 64);
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v202 = v124;
                _os_log_error_impl(&dword_1D21F2000, v127, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Error: previous medium has unexpected class: %@.", buf, 0xCu);
              }
            }
          }
          uint64_t v121 = [v119 countByEnumeratingWithState:&v175 objects:v200 count:16];
        }
        while (v121);
      }

      int v128 = [v75 isEqualToSet:v158];
      uint64_t v37 = v161;
      v129 = *(NSObject **)(v161 + 64);
      BOOL v130 = os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT);
      if (v128)
      {
        id v22 = v147;
        v106 = v157;
        v113 = v159;
        if (v130)
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v202 = v156;
          *(_WORD *)&v202[8] = 2112;
          *(void *)&v202[10] = v158;
          _os_log_impl(&dword_1D21F2000, v129, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster configuration %@ is unchanged, %@", buf, 0x16u);
        }
        [v141 unionSet:v158];
        goto LABEL_128;
      }
      id v22 = v147;
      if (v130)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v73 = (uint64_t)v156;
        *(void *)v202 = v156;
        *(_WORD *)&v202[8] = 2112;
        *(void *)&v202[10] = v75;
        _os_log_impl(&dword_1D21F2000, v129, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster configuration %@ has changed from %@", buf, 0x16u);
        v129 = *(NSObject **)(v161 + 64);
      }
      else
      {
        uint64_t v73 = (uint64_t)v156;
      }
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v202 = v158;
        id v87 = v129;
        long long v88 = "[PHAWallpaperSuggestionRefreshSession] To %@";
        uint32_t v89 = 12;
LABEL_72:
        _os_log_impl(&dword_1D21F2000, v87, OS_LOG_TYPE_DEFAULT, v88, buf, v89);
      }
LABEL_73:
      long long v90 = [*(id *)(*(void *)(v37 + 32) + 16) URLByAppendingPathComponent:v73];
      long long v91 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v174 = 0;
      int v92 = [v91 createDirectoryAtURL:v90 withIntermediateDirectories:1 attributes:0 error:&v174];
      id v93 = v174;

      long long v94 = *(NSObject **)(*(void *)(v37 + 32) + 56);
      if (!v92)
      {
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v202 = v90;
          *(_WORD *)&v202[8] = 2112;
          *(void *)&v202[10] = v93;
          _os_log_error_impl(&dword_1D21F2000, v94, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create poster configuration directory at %@: %@\nSkipping configuration", buf, 0x16u);
        }
        [v145 lock];
        [v144 addObject:v93];
        [v145 unlock];
        v106 = v157;
        goto LABEL_127;
      }
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v202 = v90;
        _os_log_impl(&dword_1D21F2000, v94, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created poster configuration directory at %@", buf, 0xCu);
      }
      long long v95 = [v157 editConfiguration];
      long long v96 = *(void **)(v37 + 32);
      v143 = v95;
      long long v97 = [v95 style];
      id v173 = v93;
      long long v98 = [v96 createAndExportMediaForSuggestionLocalIdentifiers:v159 style:v97 toURL:v90 error:&v173];
      id v99 = v173;

      if (v98)
      {
        [v157 setMedia:v98];
        id v100 = *(NSObject **)(v37 + 64);
        if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v202 = v156;
          *(_WORD *)&v202[8] = 2112;
          *(void *)&v202[10] = v98;
          _os_log_impl(&dword_1D21F2000, v100, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created/exported media for poster configuration %@: %@", buf, 0x16u);
        }
        v142 = v98;
        id v172 = v99;
        char v101 = [v157 saveToURL:v90 error:&v172];
        id v93 = v172;

        id v102 = *(NSObject **)(v37 + 64);
        if (v101)
        {
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v202 = v156;
            _os_log_impl(&dword_1D21F2000, v102, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully saved updated poster configuration %@", buf, 0xCu);
          }
          dispatch_group_enter(group);
          v135 = objc_opt_class();
          v103 = *(void **)(v37 + 64);
          uint64_t v104 = *(void *)(v37 + 72);
          v162[0] = MEMORY[0x1E4F143A8];
          v162[1] = 3221225472;
          v162[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_353;
          v162[3] = &unk_1E6918668;
          id v105 = v103;
          id v163 = v105;
          v164 = v149;
          id v165 = v139;
          id v166 = v141;
          id v167 = v158;
          id v168 = v144;
          id v169 = v75;
          id v170 = v145;
          v171 = group;
          [v135 refreshPosterConfigurationWithPosterService:v104 retryCount:3 configuration:v149 sessionInfo:v138 log:v105 completion:v162];
          v106 = v157;
          [(PHAWallpaperSuggestionAnalyticsSender *)v137 sendRefreshSummaryEventWithPosterConfiguration:v157];
        }
        else
        {
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v202 = v156;
            *(_WORD *)&v202[8] = 2112;
            *(void *)&v202[10] = v93;
            _os_log_error_impl(&dword_1D21F2000, v102, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to save updated poster configuration %@: %@\nSkipping configuration", buf, 0x16u);
          }
          [v145 lock];
          [v144 addObject:v93];
          [v145 unlock];
          v106 = v157;
        }
        long long v98 = v142;
        goto LABEL_126;
      }
      v131 = *(NSObject **)(v37 + 64);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v202 = v156;
        *(_WORD *)&v202[8] = 2112;
        *(void *)&v202[10] = v99;
        _os_log_error_impl(&dword_1D21F2000, v131, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create/export media for poster configuration %@: %@\nSkipping configuration", buf, 0x16u);
        if (!v99)
        {
LABEL_124:
          id v93 = 0;
          goto LABEL_125;
        }
      }
      else if (!v99)
      {
        goto LABEL_124;
      }
      [v145 lock];
      [v144 addObject:v99];
      [v145 unlock];
      id v93 = v99;
LABEL_125:
      v106 = v157;
LABEL_126:

LABEL_127:
      v113 = v159;

LABEL_128:
      uint64_t v57 = v153 + 1;
      if (v153 + 1 == v150)
      {
        uint64_t v150 = [obj countByEnumeratingWithState:&v179 objects:v206 count:16];
        if (v150) {
          goto LABEL_44;
        }
        goto LABEL_130;
      }
    }
    id v86 = *(NSObject **)(v37 + 64);
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_73;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v202 = v73;
    *(_WORD *)&v202[8] = 2112;
    *(void *)&v202[10] = v158;
    id v87 = v86;
    long long v88 = "[PHAWallpaperSuggestionRefreshSession] Poster configuration %@ is new, %@";
    uint32_t v89 = 22;
    goto LABEL_72;
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
  }
LABEL_10:
  uint64_t v7 = *(void *)(a1 + 80);
  objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
LABEL_132:
}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_340(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 56);
  if (!v7 || (*(unsigned int (**)(uint64_t, id))(v7 + 16))(v7, v6))
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v8 = *(void **)(a1 + 40);
    id v9 = [v5 assetDirectory];
    [v8 setObject:v6 forKeyedSubscript:v9];

    id v10 = *(NSObject **)(*(void *)(a1 + 48) + 56);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster configurations eligible for update: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_347(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [*(id *)(a1 + 32) isCancelledWithProgress:0.95];
    uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  }
  *(unsigned char *)(v2 + 24) = v3;
  char v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    id v5 = v4[7];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", v16, 2u);
    }
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    uint64_t v7 = [v4 currentlyFeaturedSuggestionUUIDsForTop:0];
    [*(id *)(a1 + 40) updateSuggestionFeaturedStateWithNewSuggestionUUIDs:*(void *)(a1 + 48) oldSuggestionUUIDs:v7];
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    if (*(unsigned char *)(v8 + 24))
    {
      char v9 = 1;
    }
    else
    {
      char v9 = [*(id *)(a1 + 32) isCancelledWithProgress:1.0];
      uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    }
    *(unsigned char *)(v8 + 24) = v9;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      id v10 = *(NSObject **)(*(void *)(a1 + 40) + 56);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", v16, 2u);
      }
      uint64_t v11 = *(void *)(a1 + 72);
      id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
    else
    {
      if (![*(id *)(a1 + 56) count])
      {
        (*(void (**)(void, void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 64), 0);
        goto LABEL_19;
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v17 = *MEMORY[0x1E4F28750];
      v18[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v12 = objc_msgSend(v13, "pl_analysisErrorWithCode:userInfo:", 25, v15);

      (*(void (**)(void, void, void *))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 0, v12);
    }
  }
LABEL_19:
}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_353(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed poster configuration %@ to %@", buf, 0x16u);
    }
    char v9 = *(void **)(a1 + 48);
    id v10 = [v5 assetDirectory];
    uint64_t v11 = [v10 path];
    [v9 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:v11];

    id v12 = (void *)(a1 + 64);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Error refreshing poster configuration %@: %@", buf, 0x16u);
    }
    uint64_t v18 = @"error";
    id v19 = v6;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v14 = *(void **)(a1 + 48);
    uint64_t v15 = [*(id *)(a1 + 40) assetDirectory];
    uint64_t v16 = [v15 path];
    [v14 setObject:v13 forKeyedSubscript:v16];

    [*(id *)(a1 + 72) addObject:v6];
    id v12 = (void *)(a1 + 80);
  }
  [*(id *)(a1 + 56) unionSet:*v12];
  [*(id *)(a1 + 88) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
}

- (void)refreshPosterDescriptorsWithProgressReporter:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (self->_refreshSessionIdentifier)
  {
    id v8 = v6;
    *(void *)uint64_t v21 = 0;
    __int16 v22 = v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    int v9 = [v8 isCancelledWithProgress:0.0];
    v22[24] = v9;
    loggingConnection = self->_loggingConnection;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      v7[2](v7, 0, v11);
    }
    else
    {
      uint64_t v13 = loggingConnection;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(id)objc_opt_class() lastGalleryRefreshDate];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v14;
        _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] LastGalleryRefreshDate: %@", buf, 0xCu);
      }
      posterService = self->_posterService;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke;
      v16[3] = &unk_1E69185E8;
      v16[4] = self;
      id v19 = v7;
      uint64_t v20 = v21;
      id v17 = v8;
      id v18 = v17;
      [(PRSService *)posterService fetchPosterDescriptorsForExtension:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" completion:v16];
    }
    _Block_object_dispose(v21, 8);
  }
  else
  {
    id v12 = self->_loggingConnection;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_error_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] refreshPosterDescriptors called while refresh session has not been started", v21, 2u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 2);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
  }
}

void __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v30[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = v8;
      *(_DWORD *)buf = 67109378;
      v30[0] = [v5 count];
      LOWORD(v30[1]) = 2112;
      *(void *)((char *)&v30[1] + 2) = v5;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully fetched %d current poster descriptors: %@", buf, 0x12u);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v10 + 24))
    {
      char v11 = 1;
    }
    else
    {
      char v11 = [*(id *)(a1 + 40) isCancelledWithProgress:0.2];
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    }
    *(unsigned char *)(v10 + 24) = v11;
    uint64_t v16 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v17 = *(NSObject **)(v16 + 56);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
      uint64_t v18 = *(void *)(a1 + 56);
      id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
    }
    else
    {
      uint64_t v20 = *(NSObject **)(v16 + 64);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_319;
      v23[3] = &unk_1E69185C0;
      v23[4] = v16;
      id v27 = *(id *)(a1 + 56);
      id v21 = v5;
      uint64_t v22 = *(void *)(a1 + 64);
      id v24 = v21;
      uint64_t v28 = v22;
      id v25 = *(id *)(a1 + 40);
      id v26 = *(id *)(a1 + 48);
      dispatch_async(v20, v23);
    }
  }
  else
  {
    uint64_t v12 = [v6 code];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(NSObject **)(v13 + 56);
    if (v12 == -2218)
    {
      if (os_log_type_enabled(*(os_log_t *)(v13 + 56), OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)__int16 v30 = v7;
        _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] PosterDescriptor dataStore is not initialized, currentPosterDescriptors is empty, received fetchError: %@. Proceed with refreshSession.", buf, 0xCu);
      }
      uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v13 + 56), OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)__int16 v30 = v7;
        _os_log_error_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to fetch current poster descriptors: %@", buf, 0xCu);
      }
      uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v15();
  }
}

void __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_319(uint64_t a1)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 8))
  {
    id v5 = *(NSObject **)(v2 + 56);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Refresh session has been cleaned up, bailing", buf, 2u);
    }
    goto LABEL_14;
  }
  if (PLIsFeaturedContentAllowed())
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    if (*(unsigned char *)(v3 + 24))
    {
      char v4 = 1;
    }
    else
    {
      char v4 = [*(id *)(a1 + 48) isCancelledWithProgress:0.25];
      uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    }
    *(unsigned char *)(v3 + 24) = v4;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      int v9 = *(NSObject **)(*(void *)(a1 + 32) + 56);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
LABEL_14:
      uint64_t v10 = *(void *)(a1 + 64);
      char v11 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

      return;
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if ([MEMORY[0x1E4F8E858] wallpaperDemoModeEnabled])
    {
      uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 56);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Wallpaper Demo Mode ON", buf, 2u);
      }
      uint64_t v15 = [[PHAWallpaperGalleryDemoHelper alloc] initWithPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 48) loggingConnection:*(void *)(*(void *)(a1 + 32) + 56)];
      uint64_t v16 = [(PHAWallpaperGalleryDemoHelper *)v15 demoDescriptors];
      [v12 addObjectsFromArray:v16];
    }
    else
    {
      uint64_t v15 = [[PHAWallpaperShuffleDescriptorGenerator alloc] initWithPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 48) loggingConnection:*(void *)(*(void *)(a1 + 32) + 56)];
      uint64_t v16 = [(PHAWallpaperGalleryDemoHelper *)v15 shuffleDescriptorsForDonation];
      [v12 addObjectsFromArray:v16];
      id v17 = [*(id *)(a1 + 32) suggestionUUIDsForPosterDescriptors:v16];
      [v13 unionSet:v17];

      uint64_t v18 = [*(id *)(a1 + 32) settlingEffectDescriptorsForDonationWithSuggestionUUIDsToAvoid:v13];
      [v12 addObjectsFromArray:v18];
      id v19 = [*(id *)(a1 + 32) suggestionUUIDsForPosterDescriptors:v18];
      [v13 unionSet:v19];

      uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "featuredPhotoDescriptorsForDonationWithSuggestionUUIDsToAvoid:count:", v13, 11 - objc_msgSend(v18, "count"));
      [v12 addObjectsFromArray:v20];
      id v21 = [*(id *)(a1 + 32) suggestionUUIDsForPosterDescriptors:v20];
      [v13 unionSet:v21];
    }
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v23 = v12;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v110 objects:v121 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v111 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          id v29 = [v28 identifier];
          [v22 setObject:v28 forKeyedSubscript:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v110 objects:v121 count:16];
      }
      while (v25);
    }

    __int16 v30 = [*(id *)(a1 + 32) currentlyFeaturedSuggestionUUIDsForTop:1];
    [*(id *)(a1 + 32) updateSuggestionFeaturedStateWithNewSuggestionUUIDs:v13 oldSuggestionUUIDs:v30];
    BOOL v31 = [v22 allKeys];
    uint64_t v32 = [v22 count];
    uint64_t v33 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (!v32)
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v33, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No poster descriptors to refresh gallery, bailing", buf, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_86;
    }
    if (v34)
    {
      uint64_t v35 = v33;
      int v36 = [v22 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v120 = v36;
      *(_WORD *)&v120[4] = 2112;
      *(void *)&v120[6] = v31;
      _os_log_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Refreshing gallery with %d suggestions %@", buf, 0x12u);
    }
    uint64_t v37 = *(void *)(*(void *)(a1 + 72) + 8);
    if (*(unsigned char *)(v37 + 24))
    {
      char v38 = 1;
    }
    else
    {
      char v38 = [*(id *)(a1 + 48) isCancelledWithProgress:0.3];
      uint64_t v37 = *(void *)(*(void *)(a1 + 72) + 8);
    }
    *(unsigned char *)(v37 + 24) = v38;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      int v39 = *(NSObject **)(*(void *)(a1 + 32) + 56);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v39, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
      uint64_t v40 = *(void *)(a1 + 64);
      int v41 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v41);

      goto LABEL_86;
    }
    long long v94 = v30;
    long long v95 = v31;
    id v96 = v13;
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v43 = *(id *)(a1 + 40);
    uint64_t v44 = [v43 countByEnumeratingWithState:&v106 objects:v118 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v107;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v107 != v46) {
            objc_enumerationMutation(v43);
          }
          id v48 = *(void **)(*((void *)&v106 + 1) + 8 * j);
          id v49 = [v48 identifier];
          [v42 setObject:v48 forKeyedSubscript:v49];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v106 objects:v118 count:16];
      }
      while (v45);
    }

    id v50 = [*(id *)(a1 + 56) childProgressReporterFromStart:0.3 toEnd:0.8];
    uint64_t v51 = *(void **)(a1 + 32);
    id v105 = 0;
    __int16 v52 = [v51 updateIfNeededPosterDescriptors:v22 fromCurrentPosterDescriptors:v42 partialErrors:&v105 progressReporter:v50];
    id v53 = v105;
    if (!v52)
    {
      __int16 v56 = *(NSObject **)(*(void *)(a1 + 32) + 56);
      id v13 = v96;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v56, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
      uint64_t v57 = *(void *)(a1 + 64);
      __int16 v58 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v57 + 16))(v57, 0, v58);
      goto LABEL_85;
    }
    id v93 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v53];
    id v13 = v96;
    if ([v52 count])
    {
      uint64_t v54 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(unsigned char *)(v54 + 24))
      {
        char v55 = 1;
      }
      else
      {
        char v55 = [*(id *)(a1 + 48) isCancelledWithProgress:0.85];
        uint64_t v54 = *(void *)(*(void *)(a1 + 72) + 8);
      }
      *(unsigned char *)(v54 + 24) = v55;
      int v64 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v65 = *(void *)(a1 + 32);
      long long v66 = *(NSObject **)(v65 + 56);
      BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
      if (!v64)
      {
        id v92 = v53;
        if (v67)
        {
          long long v69 = v66;
          int v70 = [v52 count];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v120 = v70;
          _os_log_impl(&dword_1D21F2000, v69, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] %d poster descriptors changed, needs actual refresh", buf, 8u);

          uint64_t v65 = *(void *)(a1 + 32);
        }
        uint64_t v71 = [*(id *)(v65 + 16) URLByAppendingPathComponent:@"UpdatedPosterDescriptorIdentifiers"];
        long long v72 = [v52 allObjects];
        uint64_t v73 = [v72 sortedArrayUsingSelector:sel_compare_];

        id v104 = 0;
        long long v90 = v73;
        id v87 = (void *)v71;
        LODWORD(v72) = [v73 writeToURL:v71 error:&v104];
        id v88 = v104;
        v74 = *(NSObject **)(*(void *)(a1 + 32) + 56);
        if (v72)
        {
          id v13 = v96;
          __int16 v58 = v93;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v120 = v90;
            _os_log_impl(&dword_1D21F2000, v74, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully persisted updated poster descriptor identifiers: %@", buf, 0xCu);
          }
          uint64_t v75 = *(void *)(*(void *)(a1 + 72) + 8);
          if (*(unsigned char *)(v75 + 24))
          {
            char v76 = 1;
          }
          else
          {
            char v76 = [*(id *)(a1 + 48) isCancelledWithProgress:0.9];
            uint64_t v75 = *(void *)(*(void *)(a1 + 72) + 8);
          }
          *(unsigned char *)(v75 + 24) = v76;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
          {
            BOOL v79 = *(NSObject **)(*(void *)(a1 + 32) + 56);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D21F2000, v79, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
            }
            uint64_t v80 = *(void *)(a1 + 64);
            id v81 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
            (*(void (**)(uint64_t, void, void *))(v80 + 16))(v80, 0, v81);

            id v53 = v92;
            __int16 v58 = v93;
          }
          else
          {
            id v82 = objc_alloc_init(MEMORY[0x1E4F92360]);
            uint64_t v83 = [*(id *)(*(void *)(a1 + 32) + 16) path];
            [v82 setIdentifier:v83];

            uint64_t v84 = *(void **)(*(void *)(a1 + 32) + 24);
            v97[0] = MEMORY[0x1E4F143A8];
            v97[1] = 3221225472;
            v97[2] = __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_337;
            v97[3] = &unk_1E6918598;
            uint64_t v103 = *(void *)(a1 + 72);
            id v85 = *(id *)(a1 + 48);
            uint64_t v86 = *(void *)(a1 + 32);
            id v98 = v85;
            uint64_t v99 = v86;
            id v102 = *(id *)(a1 + 64);
            id v100 = v93;
            id v101 = v95;
            [v84 refreshPosterDescriptorsForExtension:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" sessionInfo:v82 completion:v97];

            id v53 = v92;
          }
          v78 = v88;
        }
        else
        {
          id v13 = v96;
          __int16 v58 = v93;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v120 = v88;
            _os_log_error_impl(&dword_1D21F2000, v74, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to persist updated poster descriptor identifiers: %@", buf, 0xCu);
          }
          v78 = v88;
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          id v53 = v92;
        }

        v63 = v87;
        goto LABEL_84;
      }
      if (v67)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v66, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
      uint64_t v68 = *(void *)(a1 + 64);
      v63 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v68 + 16))(v68, 0, v63);
      id v13 = v96;
    }
    else
    {
      uint64_t v59 = *(NSObject **)(*(void *)(a1 + 32) + 56);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v59, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No poster descriptors changed, no actual refresh needed", buf, 2u);
      }
      uint32_t v89 = v50;
      id v91 = v53;
      if ([v93 count])
      {
        char v60 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v114 = *MEMORY[0x1E4F28750];
        v115 = v93;
        id v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        id v62 = objc_msgSend(v60, "pl_analysisErrorWithCode:userInfo:", 24, v61);
        v63 = 0;
      }
      else
      {
        v116 = @"posterDescriptorIdentifiers";
        int v117 = v95;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        int v77 = objc_opt_class();
        id v61 = [MEMORY[0x1E4F1C9C8] date];
        [v77 saveLastGalleryRefreshDate:v61 loggingConnection:*(void *)(*(void *)(a1 + 32) + 56)];
        id v62 = 0;
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v50 = v89;
      id v53 = v91;
    }
    __int16 v58 = v93;
LABEL_84:

LABEL_85:
    __int16 v30 = v94;
    BOOL v31 = v95;
LABEL_86:

    return;
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);

  [v6 _removeIfNeededFeaturedContent:v7 withCompletion:v8];
}

void __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_337(uint64_t a1, void *a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [*(id *)(a1 + 32) isCancelledWithProgress:0.95];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", (uint8_t *)&v26, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 64);
    char v11 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        int v26 = 67109120;
        LODWORD(v27) = [v5 count];
        _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed %d poster descriptors", (uint8_t *)&v26, 8u);
      }
      if ([*(id *)(a1 + 48) count])
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = *(void *)(a1 + 48);
        uint64_t v28 = *MEMORY[0x1E4F28750];
        uint64_t v29 = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        objc_msgSend(v14, "pl_analysisErrorWithCode:userInfo:", 24, v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        char v11 = 0;
      }
      else
      {
        uint64_t v18 = *(void *)(a1 + 56);
        __int16 v30 = @"posterDescriptorIdentifiers";
        v31[0] = v18;
        char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        id v17 = 0;
      }
      id v19 = objc_opt_class();
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      [v19 saveLastGalleryRefreshDate:v20 loggingConnection:*(void *)(*(void *)(a1 + 40) + 56)];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        id v27 = v6;
        _os_log_error_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh poster descriptors: %@", (uint8_t *)&v26, 0xCu);
      }
      id v17 = v6;
      char v11 = 0;
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
    if (*(unsigned char *)(v21 + 24))
    {
      char v22 = 1;
    }
    else
    {
      char v22 = [*(id *)(a1 + 32) isCancelledWithProgress:1.0];
      uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
    }
    *(unsigned char *)(v21 + 24) = v22;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      id v23 = *(NSObject **)(*(void *)(a1 + 40) + 56);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", (uint8_t *)&v26, 2u);
      }
      uint64_t v24 = *(void *)(a1 + 64);
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
      (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v25);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

- (void)_cleanup
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_refreshSessionIdentifier)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    refreshSessionURL = self->_refreshSessionURL;
    id v12 = 0;
    int v5 = [v3 removeItemAtURL:refreshSessionURL error:&v12];
    id v6 = v12;

    loggingConnection = self->_loggingConnection;
    if (v5)
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        refreshSessionIdentifier = self->_refreshSessionIdentifier;
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = refreshSessionIdentifier;
        _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully removed refresh session '%@' directory", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      char v11 = self->_refreshSessionIdentifier;
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to remove refresh session '%@' directory: %@", buf, 0x16u);
    }
    uint64_t v10 = self->_refreshSessionIdentifier;
    self->_refreshSessionIdentifier = 0;
  }
  else
  {
    int v9 = self->_loggingConnection;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionRefreshSession] Failed to close refresh session, session was not started or already closed", buf, 2u);
    }
  }
}

- (void)cleanup
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PHAWallpaperSuggestionRefreshSession_cleanup__block_invoke;
  block[3] = &unk_1E6918C50;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __47__PHAWallpaperSuggestionRefreshSession_cleanup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanup];
}

- (BOOL)_prepareWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  refreshSessionIdentifier = self->_refreshSessionIdentifier;
  if (refreshSessionIdentifier)
  {
    if (a3)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = (NSURL *)refreshSessionIdentifier;
        _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to begin refresh session, session already inflight with identifier '%@'", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 2);
      LOBYTE(v7) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    char v8 = [MEMORY[0x1E4F29128] UUID];
    int v9 = [v8 UUIDString];
    uint64_t v10 = self->_refreshSessionIdentifier;
    self->_refreshSessionIdentifier = v9;

    char v11 = self->_loggingConnection;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = self->_refreshSessionIdentifier;
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (NSURL *)v12;
      _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Starting refresh session with identifier '%@'", buf, 0xCu);
    }
    id v13 = NSTemporaryDirectory();
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v13 isDirectory:1];
    __int16 v15 = [v14 URLByAppendingPathComponent:@"RefreshSessions"];

    id v16 = [v15 URLByAppendingPathComponent:self->_refreshSessionIdentifier];
    refreshSessionURL = self->_refreshSessionURL;
    self->_refreshSessionURL = v16;

    uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v19 = self->_refreshSessionURL;
    id v26 = 0;
    int v7 = [v18 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v20 = v26;

    uint64_t v21 = self->_loggingConnection;
    if (v7)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        char v22 = self->_refreshSessionURL;
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v22;
        _os_log_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created refresh session directory at url '%@'", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = self->_refreshSessionURL;
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v25;
        __int16 v29 = 2112;
        id v30 = v20;
        _os_log_error_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create refresh session directory at url '%@': %@", buf, 0x16u);
      }
      id v23 = self->_refreshSessionIdentifier;
      self->_refreshSessionIdentifier = 0;

      if (a3) {
        *a3 = v20;
      }
    }
  }
  return v7;
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__7048;
  id v12 = __Block_byref_object_dispose__7049;
  id v13 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PHAWallpaperSuggestionRefreshSession_prepareWithError___block_invoke;
  block[3] = &unk_1E6918570;
  void block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(workQueue, block);
  if (a3) {
    *a3 = (id) v9[5];
  }
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __57__PHAWallpaperSuggestionRefreshSession_prepareWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id obj = 0;
  char v3 = [v2 _prepareWithError:&obj];
  id v4 = obj;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v4);
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  refreshSessionIdentifier = self->_refreshSessionIdentifier;
  if (refreshSessionIdentifier)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v7 = refreshSessionIdentifier;
      _os_log_fault_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionRefreshSession] Refresh session %@ deallocated while still in-flight, did you forget to call cleanup?", buf, 0xCu);
    }
    [(PHAWallpaperSuggestionRefreshSession *)self cleanup];
  }
  v5.receiver = self;
  v5.super_class = (Class)PHAWallpaperSuggestionRefreshSession;
  [(PHAWallpaperSuggestionRefreshSession *)&v5 dealloc];
}

- (PHAWallpaperSuggestionRefreshSession)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHAWallpaperSuggestionRefreshSession;
  id v6 = [(PHAWallpaperSuggestionRefreshSession *)&v24 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    uint64_t v8 = [v5 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    uint64_t v10 = (PRSService *)objc_alloc_init(MEMORY[0x1E4F92380]);
    posterService = v7->_posterService;
    v7->_posterService = v10;

    uint64_t v12 = [MEMORY[0x1E4F744E8] analysisService];
    mediaAnalysisService = v7->_mediaAnalysisService;
    v7->_mediaAnalysisService = (VCPMediaAnalysisService *)v12;

    uint64_t v14 = [v5 workingContext];
    uint64_t v15 = [v14 loggingConnection];
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v15;

    char v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.PHAWallpaperSuggestionRefreshSession", v18);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [v5 analytics];
    analytics = v7->_analytics;
    v7->_analytics = (CPAnalytics *)v21;
  }
  return v7;
}

+ (id)lastGalleryRefreshDate
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PHAWallpaperSuggestionLastGalleryRefreshDate"];

  return v3;
}

+ (void)saveLastGalleryRefreshDate:(id)a3 loggingConnection:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 setObject:v5 forKey:@"PHAWallpaperSuggestionLastGalleryRefreshDate"];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Saved lastGalleryRefreshDate: %@", (uint8_t *)&v8, 0xCu);
  }
}

+ (void)refreshPosterConfigurationWithPosterService:(id)a3 retryCount:(int64_t)a4 configuration:(id)a5 sessionInfo:(id)a6 log:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __136__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationWithPosterService_retryCount_configuration_sessionInfo_log_completion___block_invoke;
  v24[3] = &unk_1E69186E0;
  id v25 = v17;
  id v26 = v15;
  int64_t v30 = a4;
  id v31 = a1;
  id v27 = v14;
  id v28 = v16;
  id v29 = v18;
  id v19 = v18;
  id v20 = v16;
  id v21 = v14;
  id v22 = v15;
  id v23 = v17;
  [v21 refreshPosterConfiguration:v22 sessionInfo:v20 completion:v24];
}

void __136__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationWithPosterService_retryCount_configuration_sessionInfo_log_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 || (uint64_t v7 = *(void *)(a1 + 72), v7 < 1))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    int v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_error_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Error refreshing poster configuration %@: %@ retries left: %ld", (uint8_t *)&v10, 0x20u);
      uint64_t v7 = *(void *)(a1 + 72);
      int v8 = *(NSObject **)(a1 + 32);
    }
    [*(id *)(a1 + 80) refreshPosterConfigurationWithPosterService:*(void *)(a1 + 48) retryCount:v7 - 1 configuration:*(void *)(a1 + 40) sessionInfo:*(void *)(a1 + 56) log:v8 completion:*(void *)(a1 + 64)];
  }
}

@end