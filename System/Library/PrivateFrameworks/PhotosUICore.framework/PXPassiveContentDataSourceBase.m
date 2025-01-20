@interface PXPassiveContentDataSourceBase
+ (id)baseSuggestionFetchOptionsForPhotoLibrary:(id)a3;
+ (id)fallbackSystemImageNameForSingleSmartAlbumType:(unint64_t)a3;
+ (id)fetchSuggestionsWithSubtype:(unsigned __int16)a3 options:(id)a4;
+ (id)localizedTitleForSingleSmartAlbumType:(unint64_t)a3;
+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3;
+ (id)systemImageNameForSingleSmartAlbumType:(unint64_t)a3;
+ (unint64_t)supportedTypes;
- (NSArray)peopleLocalIdentifiers;
- (NSArray)previewAssets;
- (NSDictionary)keyAssetBySuggestionUUID;
- (NSDictionary)personSuggestionsByPersonLocalIdentifier;
- (NSHashTable)changeObservers;
- (OS_dispatch_queue)workQueue;
- (OS_os_log)log;
- (PHFetchResult)cityscapeSuggestions;
- (PHFetchResult)featuredSuggestions;
- (PHFetchResult)landscapeSuggestions;
- (PHFetchResult)peopleSuggestions;
- (PHFetchResult)petSuggestions;
- (PHPhotoLibrary)photoLibrary;
- (PXPassiveContentDataSourceBase)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4;
- (id)combineSuggestionsForSelectedTypes:(unint64_t)a3 maxCount:(int64_t)a4;
- (id)customPeopleSuggestions;
- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3;
- (id)keyAssetFetchOptions;
- (unint64_t)availableTypes;
- (unint64_t)selectedTypes;
- (void)addChangeObserver:(id)a3;
- (void)cacheKeyAssetForSuggestionOids:(id)a3;
- (void)cacheSuggestionsAndKeyAssetsForPersons:(id)a3;
- (void)fetchSuggestions;
- (void)fetchSuggestionsAndAssets;
- (void)notifyAvailableTypeDidChange;
- (void)notifyPreviewAssetsDidChange;
- (void)removeChangeObserver:(id)a3;
- (void)setAvailableTypes:(unint64_t)a3;
- (void)setCityscapeSuggestions:(id)a3;
- (void)setFeaturedSuggestions:(id)a3;
- (void)setLandscapeSuggestions:(id)a3;
- (void)setPeopleLocalIdentifiers:(id)a3;
- (void)setPeopleSuggestions:(id)a3;
- (void)setPetSuggestions:(id)a3;
- (void)setPreviewAssets:(id)a3;
- (void)setSelectedTypes:(unint64_t)a3;
- (void)setupPreviewAssets;
@end

@implementation PXPassiveContentDataSourceBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_featuredSuggestions, 0);
  objc_storeStrong((id *)&self->_cityscapeSuggestions, 0);
  objc_storeStrong((id *)&self->_landscapeSuggestions, 0);
  objc_storeStrong((id *)&self->_petSuggestions, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_previewAssets, 0);
  objc_storeStrong((id *)&self->_peopleLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personSuggestionsByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setFeaturedSuggestions:(id)a3
{
}

- (PHFetchResult)featuredSuggestions
{
  return self->_featuredSuggestions;
}

- (void)setCityscapeSuggestions:(id)a3
{
}

- (PHFetchResult)cityscapeSuggestions
{
  return self->_cityscapeSuggestions;
}

- (void)setLandscapeSuggestions:(id)a3
{
}

- (PHFetchResult)landscapeSuggestions
{
  return self->_landscapeSuggestions;
}

- (void)setPetSuggestions:(id)a3
{
}

- (PHFetchResult)petSuggestions
{
  return self->_petSuggestions;
}

- (void)setPeopleSuggestions:(id)a3
{
}

- (PHFetchResult)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (void)setPreviewAssets:(id)a3
{
}

- (NSArray)previewAssets
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAvailableTypes:(unint64_t)a3
{
  self->_availableTypes = a3;
}

- (unint64_t)availableTypes
{
  return self->_availableTypes;
}

- (NSArray)peopleLocalIdentifiers
{
  return self->_peopleLocalIdentifiers;
}

- (unint64_t)selectedTypes
{
  return self->_selectedTypes;
}

- (void)removeChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(PXPassiveContentDataSourceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PXPassiveContentDataSourceBase_removeChangeObserver___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__PXPassiveContentDataSourceBase_removeChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changeObservers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)addChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(PXPassiveContentDataSourceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PXPassiveContentDataSourceBase_addChangeObserver___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__PXPassiveContentDataSourceBase_addChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changeObservers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)notifyAvailableTypeDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(PXPassiveContentDataSourceBase *)self changeObservers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) passiveContentDataSourceAvailableTypesDidChange:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)notifyPreviewAssetsDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(PXPassiveContentDataSourceBase *)self changeObservers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) passiveContentDataSourcePreviewAssetsDidChange:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSDictionary)personSuggestionsByPersonLocalIdentifier
{
  return (NSDictionary *)self->_personSuggestionsByPersonLocalIdentifier;
}

- (NSDictionary)keyAssetBySuggestionUUID
{
  return (NSDictionary *)self->_keyAssetBySuggestionUUID;
}

- (id)combineSuggestionsForSelectedTypes:(unint64_t)a3 maxCount:(int64_t)a4
{
  char v5 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(PXPassiveContentDataSourceBase *)self petSuggestions];
  uint64_t v8 = [v7 count];

  long long v9 = [(PXPassiveContentDataSourceBase *)self landscapeSuggestions];
  uint64_t v10 = [v9 count];

  long long v11 = [(PXPassiveContentDataSourceBase *)self cityscapeSuggestions];
  uint64_t v12 = [v11 count];

  uint64_t v13 = [(PXPassiveContentDataSourceBase *)self featuredSuggestions];
  uint64_t v14 = [v13 count];

  v37 = [(PXPassiveContentDataSourceBase *)self customPeopleSuggestions];
  uint64_t v15 = [v37 count];
  uint64_t v16 = v15;
  uint64_t v44 = v10;
  uint64_t v45 = v8;
  uint64_t v43 = v12;
  if (v10 + v8 + v12 + v14 + v15 >= a4) {
    unint64_t v17 = a4;
  }
  else {
    unint64_t v17 = v10 + v8 + v12 + v14 + v15;
  }
  if (v5)
  {
    v19 = [(PXPassiveContentDataSourceBase *)self peopleLocalIdentifiers];
    BOOL v18 = [v19 count] != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  v20 = PLWallpaperGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = PFPosterShuffleSmartAlbumsDescription();
    *(_DWORD *)buf = 138412290;
    v47 = v21;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Selecting types: %@", buf, 0xCu);
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((uint64_t)v17 < 1)
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    v38 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    v38 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    do
    {
      BOOL v24 = v23 < v16 && v18;
      if (v24 && [v22 count] < v17)
      {
        v25 = [v37 objectAtIndex:v23];
        [v22 addObject:v25];

        ++v38;
      }
      if ((v5 & 2) != 0 && v23 < v45 && [v22 count] < v17)
      {
        v26 = [(PXPassiveContentDataSourceBase *)self petSuggestions];
        v27 = [v26 objectAtIndex:v23];
        [v22 addObject:v27];

        ++v39;
      }
      if ((v5 & 4) != 0 && v23 < v44 && [v22 count] < v17)
      {
        v28 = [(PXPassiveContentDataSourceBase *)self landscapeSuggestions];
        v29 = [v28 objectAtIndex:v23];
        [v22 addObject:v29];

        ++v40;
      }
      if ((v5 & 8) != 0 && v23 < v43 && [v22 count] < v17)
      {
        v30 = [(PXPassiveContentDataSourceBase *)self cityscapeSuggestions];
        v31 = [v30 objectAtIndex:v23];
        [v22 addObject:v31];

        ++v41;
      }
      if ((v5 & 0x10) != 0 && v23 < v14 && [v22 count] < v17)
      {
        v32 = [(PXPassiveContentDataSourceBase *)self featuredSuggestions];
        v33 = [v32 objectAtIndex:v23];
        [v22 addObject:v33];

        ++v42;
      }
      ++v23;
    }
    while (v17 != v23);
  }
  v34 = PLWallpaperGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    uint64_t v35 = [v22 count];
    *(_DWORD *)buf = 134219264;
    v47 = v38;
    __int16 v48 = 2048;
    uint64_t v49 = v39;
    __int16 v50 = 2048;
    uint64_t v51 = v40;
    __int16 v52 = 2048;
    uint64_t v53 = v41;
    __int16 v54 = 2048;
    uint64_t v55 = v42;
    __int16 v56 = 2048;
    uint64_t v57 = v35;
    _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Selected %lu people, %lu pet, %lu landscape, %lu cityscape, %lu featured. Total: %lu", buf, 0x3Eu);
  }

  return v22;
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
        long long v11 = [(PXPassiveContentDataSourceBase *)self personSuggestionsByPersonLocalIdentifier];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];

        if ([v12 count])
        {
          id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v14 = [v12 fetchedObjects];
          uint64_t v15 = (void *)[v13 initWithArray:v14];

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
    unint64_t v17 = (void *)[v4 copy];
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
          uint64_t v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          BOOL v24 = [v23 firstObject];
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

- (void)cacheKeyAssetForSuggestionOids:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x1AD10CB00]();
  id v5 = objc_alloc(MEMORY[0x1E4F39150]);
  uint64_t v6 = [(PXPassiveContentDataSourceBase *)self photoLibrary];
  uint64_t v7 = (void *)[v5 initWithOids:v10 photoLibrary:v6 fetchType:*MEMORY[0x1E4F39688] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  uint64_t v8 = [(PXPassiveContentDataSourceBase *)self keyAssetFetchOptions];
  long long v9 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v7 options:v8];
  [(NSMutableDictionary *)self->_keyAssetBySuggestionUUID addEntriesFromDictionary:v9];
}

- (id)keyAssetFetchOptions
{
  id v2 = [(PXPassiveContentDataSourceBase *)self photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  [v3 setIncludeGuestAssets:1];
  return v3;
}

- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(PXPassiveContentDataSourceBase *)self photoLibrary];
  uint64_t v7 = [v5 baseSuggestionFetchOptionsForPhotoLibrary:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  long long v9 = [v7 internalPredicate];
  id v10 = [(id)objc_opt_class() suggestionPredicateForSmartAlbumTypes:1];
  long long v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"suggestionContext", v4, v9, v10];

  v16[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  id v13 = [v8 andPredicateWithSubpredicates:v12];
  [v7 setInternalPredicate:v13];

  uint64_t v14 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v7];

  return v14;
}

- (void)cacheSuggestionsAndKeyAssetsForPersons:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPassiveContentDataSourceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PXPassiveContentDataSourceBase_cacheSuggestionsAndKeyAssetsForPersons___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__PXPassiveContentDataSourceBase_cacheSuggestionsAndKeyAssetsForPersons___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        long long v9 = objc_msgSend(*(id *)(a1 + 40), "personSuggestionsByPersonLocalIdentifier", (void)v13);
        id v10 = [v9 objectForKeyedSubscript:v8];

        if (!v10)
        {
          long long v11 = [*(id *)(a1 + 40) fetchSuggestionsForPersonLocalIdentifier:v8];
          [*(id *)(*(void *)(a1 + 40) + 16) setObject:v11 forKeyedSubscript:v8];
          uint64_t v12 = [v11 fetchedObjectIDs];
          [v2 addObjectsFromArray:v12];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) cacheKeyAssetForSuggestionOids:v2];
}

- (void)setupPreviewAssets
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXPassiveContentDataSourceBase.m", 132, @"Method %s is a responsibility of subclass %@", "-[PXPassiveContentDataSourceBase setupPreviewAssets]", v6 object file lineNumber description];

  abort();
}

- (void)fetchSuggestions
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXPassiveContentDataSourceBase.m", 128, @"Method %s is a responsibility of subclass %@", "-[PXPassiveContentDataSourceBase fetchSuggestions]", v6 object file lineNumber description];

  abort();
}

- (void)setPeopleLocalIdentifiers:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_peopleLocalIdentifiers isEqualToArray:v4])
  {
    uint64_t v5 = (NSArray *)[v4 copy];
    peopleLocalIdentifiers = self->_peopleLocalIdentifiers;
    self->_peopleLocalIdentifiers = v5;

    if ([(NSArray *)self->_peopleLocalIdentifiers count]) {
      [(PXPassiveContentDataSourceBase *)self cacheSuggestionsAndKeyAssetsForPersons:self->_peopleLocalIdentifiers];
    }
    uint64_t v7 = PLWallpaperGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = self->_peopleLocalIdentifiers;
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Set custom people: %@", (uint8_t *)&v9, 0xCu);
    }

    if ([(PXPassiveContentDataSourceBase *)self selectedTypes]) {
      [(PXPassiveContentDataSourceBase *)self setupPreviewAssets];
    }
  }
}

- (void)setSelectedTypes:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_selectedTypes != a3)
  {
    self->_selectedTypes = a3;
    id v4 = PLWallpaperGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = PFPosterShuffleSmartAlbumsDescription();
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Set selected types: %@", (uint8_t *)&v7, 0xCu);
    }
    if ((self->_selectedTypes & 1) == 0
      || ([(PXPassiveContentDataSourceBase *)self peopleLocalIdentifiers],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      [(PXPassiveContentDataSourceBase *)self setupPreviewAssets];
    }
  }
}

- (void)fetchSuggestionsAndAssets
{
  id v3 = [(PXPassiveContentDataSourceBase *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PXPassiveContentDataSourceBase_fetchSuggestionsAndAssets__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__PXPassiveContentDataSourceBase_fetchSuggestionsAndAssets__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) log];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  id v4 = v2;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FetchSuggestionsAndAssets", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v6 = mach_absolute_time();
  [*(id *)(a1 + 32) fetchSuggestions];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [*(id *)(a1 + 32) peopleSuggestions];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) peopleSuggestions];
    uint64_t v11 = [v10 fetchedObjectIDs];
    [v7 addObjectsFromArray:v11];

    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v13 = [*(id *)(a1 + 32) petSuggestions];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    long long v15 = [*(id *)(a1 + 32) petSuggestions];
    long long v16 = [v15 fetchedObjectIDs];
    [v7 addObjectsFromArray:v16];

    v12 |= 2uLL;
  }
  unint64_t v17 = [*(id *)(a1 + 32) landscapeSuggestions];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = [*(id *)(a1 + 32) landscapeSuggestions];
    uint64_t v20 = [v19 fetchedObjectIDs];
    [v7 addObjectsFromArray:v20];

    v12 |= 4uLL;
  }
  uint64_t v21 = [*(id *)(a1 + 32) cityscapeSuggestions];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    uint64_t v23 = [*(id *)(a1 + 32) cityscapeSuggestions];
    BOOL v24 = [v23 fetchedObjectIDs];
    [v7 addObjectsFromArray:v24];

    v12 |= 8uLL;
  }
  uint64_t v25 = [*(id *)(a1 + 32) featuredSuggestions];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    long long v27 = [*(id *)(a1 + 32) featuredSuggestions];
    long long v28 = [v27 fetchedObjectIDs];
    [v7 addObjectsFromArray:v28];

    v12 |= 0x10uLL;
  }
  [*(id *)(a1 + 32) setAvailableTypes:v12];
  [*(id *)(a1 + 32) notifyAvailableTypeDidChange];
  long long v29 = PLWallpaperGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    PFPosterShuffleSmartAlbumsDescription();
    long long v30 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v30;
    _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Available types: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) cacheKeyAssetForSuggestionOids:v7];
  uint64_t v31 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  long long v34 = v5;
  uint64_t v35 = v34;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v35, OS_SIGNPOST_INTERVAL_END, v3, "FetchSuggestionsAndAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "FetchSuggestionsAndAssets";
    __int16 v39 = 2048;
    double v40 = (float)((float)((float)((float)(v31 - v6) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A9AE7000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (PXPassiveContentDataSourceBase)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPassiveContentDataSourceBase;
  uint64_t v9 = [(PXPassiveContentDataSourceBase *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v10->_selectedTypes = 0;
    px_dispatch_queue_create_serial();
  }

  return 0;
}

+ (id)localizedTitleForSingleSmartAlbumType:(unint64_t)a3
{
  SEL v3 = a2;
  uint64_t v5 = @"PXWallpaperPickerDataSourceModeTopPeople";
  switch(a3)
  {
    case 0uLL:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:v3, a1, @"PXPassiveContentDataSourceBase.m", 366, @"Invalid parameter not satisfying: %@", @"type != PFPosterShuffleSmartAlbumsNone" object file lineNumber description];

      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:v3 object:a1 file:@"PXPassiveContentDataSourceBase.m" lineNumber:369 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = @"PXWallpaperPickerDataSourceModePet";
      goto LABEL_7;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_8;
    case 4uLL:
      uint64_t v5 = @"PXWallpaperPickerDataSourceModeLandscape";
      goto LABEL_7;
    case 8uLL:
      uint64_t v5 = @"PXWallpaperPickerDataSourceModeCityscape";
      goto LABEL_7;
    default:
      if (a3 != 16) {
        goto LABEL_8;
      }
      uint64_t v5 = @"PXWallpaperPickerDataSourceModeFeatured";
LABEL_7:
      PXLocalizedStringFromTable(v5, @"PhotosUICore");
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_8:
      return (id)(id)a2;
  }
}

+ (id)fallbackSystemImageNameForSingleSmartAlbumType:(unint64_t)a3
{
  id result = @"person.circle.fill";
  switch(__ROR8__(a3, 1))
  {
    case 0:
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, a1, @"PXPassiveContentDataSourceBase.m", 348, @"Invalid parameter not satisfying: %@", @"type != PFPosterShuffleSmartAlbumsNone" object file lineNumber description];

      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:a1 file:@"PXPassiveContentDataSourceBase.m" lineNumber:351 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      id result = @"pawprint.circle.fill";
      break;
    case 2:
      id result = @"leaf.circle.fill";
      break;
    case 4:
      id result = @"building.2.crop.circle.fill";
      break;
    case 8:
      id result = @"star.circle.fill";
      break;
    default:
      return result;
  }
  return result;
}

+ (id)systemImageNameForSingleSmartAlbumType:(unint64_t)a3
{
  id result = @"person.fill";
  switch(__ROR8__(a3, 1))
  {
    case 0:
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, a1, @"PXPassiveContentDataSourceBase.m", 330, @"Invalid parameter not satisfying: %@", @"type != PFPosterShuffleSmartAlbumsNone" object file lineNumber description];

      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:a1 file:@"PXPassiveContentDataSourceBase.m" lineNumber:333 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      id result = @"pawprint.fill";
      break;
    case 2:
      id result = @"leaf.fill";
      break;
    case 4:
      id result = @"building.fill";
      break;
    case 8:
      id result = @"star.fill";
      break;
    default:
      return result;
  }
  return result;
}

+ (id)fetchSuggestionsWithSubtype:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4 = a3;
  v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a4 copy];
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = [v5 internalPredicate];
  v20[0] = v7;
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"subtype", v4);
  v20[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v10 = [v6 andPredicateWithSubpredicates:v9];
  [v5 setInternalPredicate:v10];

  uint64_t v11 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v5];
  objc_super v12 = PLWallpaperGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v11 count];
    uint64_t v14 = PHSuggestionStringWithSubtype();
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "[PXPassiveContentDataSourceBase] found %lu %@", buf, 0x16u);
  }
  return v11;
}

+ (id)baseSuggestionFetchOptionsForPhotoLibrary:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  SEL v3 = [a3 librarySpecificFetchOptions];
  unsigned int v4 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v13[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v7 = [v4 andPredicateWithSubpredicates:v6];
  [v3 setInternalPredicate:v7];

  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v3 setSortDescriptors:v10];

  return v3;
}

+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, a1, @"PXPassiveContentDataSourceBase.m", 136, @"Method %s is a responsibility of subclass %@", "+[PXPassiveContentDataSourceBase suggestionPredicateForSmartAlbumTypes:]", v7 object file lineNumber description];

  abort();
}

+ (unint64_t)supportedTypes
{
  unsigned int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PXPassiveContentDataSourceBase.m", 122, @"Method %s is a responsibility of subclass %@", "+[PXPassiveContentDataSourceBase supportedTypes]", v6 object file lineNumber description];

  abort();
}

@end