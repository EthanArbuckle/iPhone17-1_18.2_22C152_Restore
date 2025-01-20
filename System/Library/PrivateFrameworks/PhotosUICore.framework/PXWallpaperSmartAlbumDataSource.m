@interface PXWallpaperSmartAlbumDataSource
+ (BOOL)isAnySmartAlbumAvailableInPhotoLibrary:(id)a3;
+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3;
+ (unint64_t)supportedTypes;
- (BOOL)shouldIncludeCenterMediaWithPreviewAssets:(id)a3;
- (NSDictionary)classificationByPreviewAssetUUID;
- (NSDictionary)shuffleSuggestionByKeyAssetUUID;
- (PFPosterMediaSuggestion)centerMedia;
- (PHSuggestion)workQueue_centerSuggestion;
- (PXWallpaperSmartAlbumDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4 centerMedia:(id)a5;
- (PXWallpaperSmartAlbumDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4 registerForPhotoLibraryChanges:(BOOL)a5 centerMedia:(id)a6;
- (id)customPeopleSuggestions;
- (id)fetchAssetIfNeededForAssetUUID:(id)a3;
- (id)fetchShuffleSuggestionContainingAsset:(id)a3;
- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3;
- (void)fetchSuggestions;
- (void)photoLibraryDidChange:(id)a3;
- (void)setClassificationByPreviewAssetUUID:(id)a3;
- (void)setShuffleSuggestionByKeyAssetUUID:(id)a3;
- (void)setWorkQueue_centerSuggestion:(id)a3;
- (void)setupPreviewAssets;
@end

@implementation PXWallpaperSmartAlbumDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue_centerSuggestion, 0);
  objc_storeStrong((id *)&self->_centerMedia, 0);
  objc_storeStrong((id *)&self->_shuffleSuggestionByKeyAssetUUID, 0);
  objc_storeStrong((id *)&self->_classificationByPreviewAssetUUID, 0);
}

- (void)setWorkQueue_centerSuggestion:(id)a3
{
}

- (PFPosterMediaSuggestion)centerMedia
{
  return self->_centerMedia;
}

- (void)setShuffleSuggestionByKeyAssetUUID:(id)a3
{
}

- (NSDictionary)shuffleSuggestionByKeyAssetUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setClassificationByPreviewAssetUUID:(id)a3
{
}

- (NSDictionary)classificationByPreviewAssetUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (id)fetchShuffleSuggestionContainingAsset:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPassiveContentDataSourceBase *)self photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  v7 = (void *)MEMORY[0x1E4F28BA0];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v21[0] = v8;
  v9 = [MEMORY[0x1E4F39310] predicateForAllShuffleWallpaperSuggestions];
  v21[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v11 = [v7 andPredicateWithSubpredicates:v10];
  [v6 setPredicate:v11];

  v12 = (void *)MEMORY[0x1E4F38EE8];
  id v20 = v4;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v14 = [v12 fetchAssetCollectionsContainingAssets:v13 withType:8 options:v6];
  v15 = [v14 firstObject];

  if (!v15)
  {
    v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Cannot find suggestion with asset: %@", buf, 0xCu);
    }
  }
  return v15;
}

- (id)fetchAssetIfNeededForAssetUUID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPassiveContentDataSourceBase *)self keyAssetBySuggestionUUID];
  v6 = [v5 allValues];
  v7 = (void *)[v6 copy];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "uuid", (void)v24);
        char v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v21 = v13;
          v22 = v8;
          goto LABEL_14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16 = (void *)MEMORY[0x1E4F38EB8];
  id v30 = v4;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v18 = [(PXPassiveContentDataSourceBase *)self photoLibrary];
  id v19 = [v18 librarySpecificFetchOptions];
  id v20 = [v16 fetchAssetsWithUUIDs:v17 options:v19];
  id v21 = [v20 firstObject];

  if (!v21)
  {
    v22 = PLWallpaperGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Missing Key Asset for CenterMedia %@", buf, 0xCu);
    }
    id v21 = 0;
LABEL_14:
  }
  return v21;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PXPassiveContentDataSourceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PXWallpaperSmartAlbumDataSource_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__PXWallpaperSmartAlbumDataSource_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) peopleSuggestions];
  id v4 = [v2 changeDetailsForFetchResult:v3];

  if (v4)
  {
    v5 = [v4 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setPeopleSuggestions:v5];

    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) petSuggestions];
  uint64_t v9 = [v7 changeDetailsForFetchResult:v8];

  if (v9)
  {
    uint64_t v10 = [v9 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setPetSuggestions:v10];

    int v6 = 1;
  }
  uint64_t v11 = *(void **)(a1 + 32);
  v12 = [*(id *)(a1 + 40) landscapeSuggestions];
  id v14 = [v11 changeDetailsForFetchResult:v12];

  if (v14)
  {
    v13 = [v14 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setLandscapeSuggestions:v13];
  }
  else if (!v6)
  {
    goto LABEL_10;
  }
  [*(id *)(a1 + 40) setupPreviewAssets];
LABEL_10:
}

- (id)customPeopleSuggestions
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPassiveContentDataSourceBase *)self peopleLocalIdentifiers];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = [(PXPassiveContentDataSourceBase *)self personSuggestionsByPersonLocalIdentifier];
        v12 = [v11 objectForKeyedSubscript:v10];

        if ([v12 count])
        {
          id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
          id v14 = [v12 fetchedObjects];
          char v15 = (void *)[v13 initWithArray:v14];

          [v4 addObject:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  do
  {
    v17 = (void *)[v4 copy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          long long v24 = [v23 firstObject];
          if (v24)
          {
            [v16 addObject:v24];
            [v23 removeObject:v24];
          }
          if (![v23 count]) {
            [v4 removeObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }

    uint64_t v25 = [v4 count];
  }
  while (v25);

  return v16;
}

- (PHSuggestion)workQueue_centerSuggestion
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPassiveContentDataSourceBase *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PXWallpaperSmartAlbumDataSource *)self centerMedia];

  if (v4)
  {
    workQueue_centerSuggestion = self->_workQueue_centerSuggestion;
    if (!workQueue_centerSuggestion)
    {
      uint64_t v6 = [(PXPassiveContentDataSourceBase *)self photoLibrary];
      uint64_t v7 = [v6 librarySpecificFetchOptions];

      uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v9 = [(PXWallpaperSmartAlbumDataSource *)self centerMedia];
      uint64_t v10 = [v9 suggestionUUID];
      uint64_t v11 = [v8 predicateWithFormat:@"%K = %@", @"uuid", v10];
      [v7 setPredicate:v11];

      [v7 setFetchLimit:1];
      v12 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v7];
      id v13 = [v12 firstObject];
      id v14 = self->_workQueue_centerSuggestion;
      self->_workQueue_centerSuggestion = v13;

      if (!self->_workQueue_centerSuggestion)
      {
        char v15 = PLWallpaperGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = [(PXWallpaperSmartAlbumDataSource *)self centerMedia];
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v16;
          _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Cannot find suggestion for centerMedia %@", buf, 0xCu);
        }
      }

      workQueue_centerSuggestion = self->_workQueue_centerSuggestion;
    }
    v17 = workQueue_centerSuggestion;
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (BOOL)shouldIncludeCenterMediaWithPreviewAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(PXWallpaperSmartAlbumDataSource *)self centerMedia];
  if (v5)
  {
    v5;
    PXExists();
  }

  return 0;
}

uint64_t __77__PXWallpaperSmartAlbumDataSource_shouldIncludeCenterMediaWithPreviewAssets___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) assetUUID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)setupPreviewAssets
{
  v3 = [(PXPassiveContentDataSourceBase *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) log];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  id v4 = v2;
  uint64_t v5 = v4;
  os_signpost_id_t spid = v3;
  unint64_t v43 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SetupPreviewAssets", "", buf, 2u);
  }
  v42 = v5;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v40 = mach_absolute_time();
  uint64_t v6 = [*(id *)(a1 + 32) selectedTypes];
  uint64_t v7 = [*(id *)(a1 + 32) combineSuggestionsForSelectedTypes:v6 maxCount:*MEMORY[0x1E4F8EAE0]];
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)buf = 0;
  v58 = buf;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__145119;
  v61 = __Block_byref_object_dispose__145120;
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__145119;
  v55 = __Block_byref_object_dispose__145120;
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke_254;
  aBlock[3] = &unk_1E5DBEDC0;
  aBlock[4] = buf;
  aBlock[5] = &v51;
  uint64_t v8 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v68 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v13 = [*(id *)(a1 + 32) keyAssetBySuggestionUUID];
        id v14 = [v12 uuid];
        char v15 = [v13 objectForKeyedSubscript:v14];

        if (v15)
        {
          [v45 addObject:v15];
          v8[2](v8, v12, v15);
        }
        else
        {
          id v16 = PLWallpaperGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = [v12 uuid];
            *(_DWORD *)v64 = 138412290;
            v65 = v17;
            _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Missing Key Asset for Suggestion %@", v64, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v68 count:16];
    }
    while (v9);
  }

  id v18 = [*(id *)(a1 + 32) centerMedia];
  uint64_t v19 = PLWallpaperGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v64 = 138412290;
    v65 = v18;
    _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumDataSource] CenterMedia %@", v64, 0xCu);
  }

  if ([*(id *)(a1 + 32) shouldIncludeCenterMediaWithPreviewAssets:v45])
  {
    uint64_t v20 = *(void **)(a1 + 32);
    uint64_t v21 = [v18 assetUUID];
    v22 = [v20 fetchAssetIfNeededForAssetUUID:v21];

    if (!v22)
    {
      v23 = PLWallpaperGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v64 = 138412290;
        v65 = v18;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Cannot find asset for centerMedia %@", v64, 0xCu);
      }
      goto LABEL_34;
    }
    v23 = [*(id *)(a1 + 32) fetchShuffleSuggestionContainingAsset:v22];
    if (v23)
    {
      v8[2](v8, v23, v22);
      [v45 removeObject:v22];
      long long v24 = PLWallpaperGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = [v45 count];
        *(_DWORD *)v64 = 67109120;
        LODWORD(v65) = v25;
        _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumDataSource] %d previewAssets before inserting", v64, 8u);
      }

      if ((unint64_t)[v45 count] <= 5) {
        unint64_t v26 = (unint64_t)[v45 count] >> 1;
      }
      else {
        unint64_t v26 = 3;
      }
      [v45 insertObject:v22 atIndex:v26];
      long long v27 = PLWallpaperGetLog();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_DWORD *)v64 = 138412546;
      v65 = v18;
      __int16 v66 = 1024;
      LODWORD(v67) = v26;
      long long v28 = "[PXWallpaperSmartAlbumDataSource] Setting CenterMedia %@ at index %d";
      long long v29 = v27;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      uint32_t v31 = 18;
    }
    else
    {
      long long v27 = PLWallpaperGetLog();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      *(_DWORD *)v64 = 138412290;
      v65 = v18;
      long long v28 = "[PXWallpaperSmartAlbumDataSource] Cannot find suggestion for centerMedia %@";
      long long v29 = v27;
      os_log_type_t v30 = OS_LOG_TYPE_ERROR;
      uint32_t v31 = 12;
    }
    _os_log_impl(&dword_1A9AE7000, v29, v30, v28, v64, v31);
    goto LABEL_33;
  }
LABEL_35:
  long long v32 = (void *)[v45 copy];
  [*(id *)(a1 + 32) setPreviewAssets:v32];

  long long v33 = (void *)[*((id *)v58 + 5) copy];
  [*(id *)(a1 + 32) setClassificationByPreviewAssetUUID:v33];

  long long v34 = (void *)[(id)v52[5] copy];
  [*(id *)(a1 + 32) setShuffleSuggestionByKeyAssetUUID:v34];

  [*(id *)(a1 + 32) notifyPreviewAssetsDidChange];
  uint64_t v35 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v38 = v42;
  v39 = v38;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)v64 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v39, OS_SIGNPOST_INTERVAL_END, spid, "SetupPreviewAssets", "", v64, 2u);
  }

  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v64 = 136315394;
    v65 = "SetupPreviewAssets";
    __int16 v66 = 2048;
    double v67 = (float)((float)((float)((float)(v35 - v40) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v64, 0x16u);
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(buf, 8);
}

void __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke_254(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F8E858];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_msgSend(v5, "posterClassificationForSuggestionSubtype:", objc_msgSend(v7, "subtype"));
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v11 = [v6 uuid];
  [v10 setObject:v9 forKeyedSubscript:v11];

  v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v13 = [v6 uuid];

  [v12 setObject:v7 forKeyedSubscript:v13];
}

- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXWallpaperSmartAlbumDataSource;
  os_signpost_id_t v3 = [(PXPassiveContentDataSourceBase *)&v6 fetchSuggestionsForPersonLocalIdentifier:a3];
  id v4 = [MEMORY[0x1E4F8E858] randomizedSuggestionsFromSuggestions:v3 limit:*MEMORY[0x1E4F8EAE0]];

  return v4;
}

- (void)fetchSuggestions
{
  os_signpost_id_t v3 = objc_opt_class();
  id v4 = [(PXPassiveContentDataSourceBase *)self photoLibrary];
  id v14 = [v3 baseSuggestionFetchOptionsForPhotoLibrary:v4];

  uint64_t v5 = [(id)objc_opt_class() fetchSuggestionsWithSubtype:652 options:v14];
  uint64_t v6 = *MEMORY[0x1E4F8EAE0];
  id v7 = [MEMORY[0x1E4F8E858] randomizedSuggestionsFromSuggestions:v5 limit:*MEMORY[0x1E4F8EAE0]];
  [(PXPassiveContentDataSourceBase *)self setPeopleSuggestions:v7];

  uint64_t v8 = [(id)objc_opt_class() fetchSuggestionsWithSubtype:653 options:v14];
  uint64_t v9 = [MEMORY[0x1E4F8E858] randomizedSuggestionsFromSuggestions:v8 limit:v6];
  [(PXPassiveContentDataSourceBase *)self setPetSuggestions:v9];

  uint64_t v10 = [(id)objc_opt_class() fetchSuggestionsWithSubtype:654 options:v14];
  uint64_t v11 = [MEMORY[0x1E4F8E858] randomizedSuggestionsFromSuggestions:v10 limit:v6];
  [(PXPassiveContentDataSourceBase *)self setLandscapeSuggestions:v11];

  v12 = [(id)objc_opt_class() fetchSuggestionsWithSubtype:655 options:v14];
  id v13 = [MEMORY[0x1E4F8E858] randomizedSuggestionsFromSuggestions:v12 limit:v6];
  [(PXPassiveContentDataSourceBase *)self setCityscapeSuggestions:v13];
}

- (PXWallpaperSmartAlbumDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4 registerForPhotoLibraryChanges:(BOOL)a5 centerMedia:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PXWallpaperSmartAlbumDataSource;
  v12 = [(PXPassiveContentDataSourceBase *)&v15 initWithPhotoLibrary:v10 changeObserver:a4];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_centerMedia, a6);
    if (v7) {
      [v10 registerChangeObserver:v13];
    }
  }

  return v13;
}

- (PXWallpaperSmartAlbumDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4 centerMedia:(id)a5
{
  return [(PXWallpaperSmartAlbumDataSource *)self initWithPhotoLibrary:a3 changeObserver:a4 registerForPhotoLibraryChanges:1 centerMedia:a5];
}

+ (BOOL)isAnySmartAlbumAvailableInPhotoLibrary:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() baseSuggestionFetchOptionsForPhotoLibrary:v3];

  [v4 setFetchLimit:1];
  [v4 setShouldPrefetchCount:1];
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v12[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F39310] predicateForAllShuffleWallpaperSuggestions];
  v12[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v9 = [v5 andPredicateWithSubpredicates:v8];
  [v4 setInternalPredicate:v9];

  id v10 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v4];
  LOBYTE(v9) = [v10 count] != 0;

  return (char)v9;
}

+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"subtype", 652);
    [v4 addObject:v8];

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"subtype", 653);
  [v4 addObject:v9];

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"subtype", 654);
  [v4 addObject:v10];

  if ((v3 & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"subtype", 655);
    [v4 addObject:v5];
  }
LABEL_6:
  uint64_t v6 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v6;
}

+ (unint64_t)supportedTypes
{
  return 15;
}

@end