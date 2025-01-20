@interface PHASuggestionController
+ (BOOL)_shouldCheckSuggestionRecylingForProfile:(unsigned __int8)a3;
+ (double)_maximumDurationBeforeDeletionForSuggestionType:(unsigned __int16)a3 andSubtype:(unsigned __int16)a4;
+ (id)availableSuggestionTypeInfosWithProfile:(unsigned __int8)a3;
+ (unint64_t)_retirementDelayInDaysForSuggestionType:(unsigned __int16)a3 andSubtype:(unsigned __int16)a4;
- (BOOL)_canFeatureSuggestion:(id)a3;
- (BOOL)_filterExistingSuggestion:(id)a3;
- (BOOL)existingSuggestion:(id)a3 matchesSuggestion:(id)a4;
- (BOOL)shouldDeleteSuggestion:(id)a3 atDate:(id)a4;
- (BOOL)shouldRetireSuggestion:(id)a3 atDate:(id)a4;
- (NSArray)existingMemories;
- (NSArray)existingSuggestions;
- (PGManager)graphManager;
- (PHASuggestionController)initWithGraphManager:(id)a3;
- (id)_createSuggestionSessionWithProfile:(unsigned __int8)a3;
- (id)_existingSuggestionsForProfile:(unsigned __int8)a3;
- (id)_forbiddenAssetUUIDs;
- (id)_suggestionsToReuseWithSuggestionSession:(id)a3 numberOfSuggestionsToReuse:(unint64_t)a4;
- (id)collidableMemoriesWithReferenceDate:(id)a3 andDelay:(double)a4;
- (id)collidableSuggestionsWithOptions:(id)a3;
- (id)commitSuggestions:(id)a3 retiringSuggestions:(id)a4 deletingSuggestions:(id)a5 withOptions:(id)a6 error:(id *)a7;
- (id)deniedSuggestionsForProfile:(unsigned __int8)a3;
- (id)existingSuggestionByKeyAssetUUIDWithType:(unsigned __int16)a3 subtypes:(id)a4;
- (id)generateAmbientSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)generateCameraStyleableSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)generateOnThisDayAssetSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)generateSharingSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)generateSingleAssetSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)generateSuggestionsWithProfile:(unsigned __int8)a3 options:(id)a4 progress:(id)a5;
- (id)generateWallpaperSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)generateWidgetSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)pendingOnThisDayMemories;
- (id)suggestionInfosWithOptions:(id)a3;
- (unint64_t)newFeaturedSuggestionsCount;
- (void)cacheWidgetSuggestionsWithCurrentlyFeaturedState;
- (void)ingestExistingSuggestionsWithOptions:(id)a3;
- (void)ingestSuggestions:(id)a3 atDate:(id)a4;
- (void)processSuggestions:(id)a3 forRecyclingWithExistingSuggestionByKeyAssetUUID:(id)a4 resultBlock:(id)a5;
- (void)recordCreatedSuggestions:(id)a3 duringSession:(id)a4;
- (void)recordDeletedSuggestions:(id)a3;
- (void)recordRetiredSuggestions:(id)a3;
- (void)setExistingMemories:(id)a3;
@end

@implementation PHASuggestionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_existingMemories, 0);
  objc_storeStrong((id *)&self->_deletedSuggestionLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedFeaturedSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionsToDelete, 0);
  objc_storeStrong((id *)&self->_suggestionsToRetire, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void)setExistingMemories:(id)a3
{
}

- (NSArray)existingMemories
{
  return self->_existingMemories;
}

- (id)suggestionInfosWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(PGManager *)self->_graphManager workingContextForSuggestions];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F8D928]) initWithProfile:0 workingContext:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F8D920]);
  v8 = (void *)MEMORY[0x1E4F28D60];
  v9 = [v4 objectForKeyedSubscript:@"type"];
  v10 = objc_msgSend(v8, "indexSetWithIndex:", objc_msgSend(v9, "unsignedIntegerValue"));
  [v7 setSuggestionTypeWhitelist:v10];

  v11 = (void *)MEMORY[0x1E4F28D60];
  v12 = [v4 objectForKeyedSubscript:@"subtype"];
  v13 = objc_msgSend(v11, "indexSetWithIndex:", objc_msgSend(v12, "unsignedIntegerValue"));
  [v7 setSuggestionSubtypeWhitelist:v13];

  [v7 setGenerateInvalidSuggestions:1];
  [v7 setComputeReasons:1];
  [v7 setIgnoreCollisionsWithExistingSuggestions:1];
  [v7 setIgnoreCollisionsWithSameBatchSuggestions:1];
  [v7 setShouldProcessExistingSuggestions:0];
  [v7 setDiscardGeneratedSuggestions:1];
  [v7 setAllowNotification:0];
  v14 = [v4 objectForKeyedSubscript:@"localDate"];
  if (v14) {
    [v7 setLocalToday:v14];
  }
  v15 = [v4 objectForKeyedSubscript:@"universalStartDate"];
  if (v15) {
    [v7 setUniversalStartDate:v15];
  }
  v16 = [v4 objectForKeyedSubscript:@"universalEndDate"];
  if (v16) {
    [v7 setUniversalEndDate:v16];
  }
  [v7 setDefaultStartAndEndDatesIfNeeded];
  [(PHASuggestionController *)self ingestExistingSuggestionsWithOptions:v7];
  [v6 setExistingSuggestions:self->_existingSuggestions];
  v17 = [v6 suggestionsWithOptions:v7 progress:&__block_literal_global_2706];
  v18 = [v6 infosWithSuggestions:v17];

  return v18;
}

- (BOOL)_canFeatureSuggestion:(id)a3
{
  return [a3 type] - 3 < 3;
}

- (BOOL)_filterExistingSuggestion:(id)a3
{
  unsigned int v3 = [a3 type];
  return (v3 < 0xC) & (0xF40u >> v3);
}

- (void)cacheWidgetSuggestionsWithCurrentlyFeaturedState
{
  id v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v8 setWantsIncrementalChangeDetails:0];
  unsigned int v3 = [MEMORY[0x1E4F39310] fetchWidgetSuggestionsWithFeaturedState:1 withOptions:v8];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v4);
    v6 = [v3 objectsAtIndexes:v5];
    cachedFeaturedSuggestions = self->_cachedFeaturedSuggestions;
    self->_cachedFeaturedSuggestions = v6;
  }
}

- (void)processSuggestions:(id)a3 forRecyclingWithExistingSuggestionByKeyAssetUUID:(id)a4 resultBlock:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23 = (void (**)(id, id, void *))a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v11 = [v8 allValues];
  v24 = (void *)[v10 initWithArray:v11];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = [v17 keyAssets];
        v19 = [v18 firstObject];
        v20 = [v19 uuid];

        v21 = [v8 objectForKeyedSubscript:v20];
        if (v21
          && [(PHASuggestionController *)self existingSuggestion:v21 matchesSuggestion:v17])
        {
          [v24 removeObject:v21];
        }
        else
        {
          [v9 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  v22 = [v24 allObjects];
  v23[2](v23, v9, v22);
}

- (BOOL)existingSuggestion:(id)a3 matchesSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 type];
  if (v7 == [v6 type]
    && (int v8 = [v5 subtype], v8 == objc_msgSend(v6, "subtype"))
    && (uint64_t v9 = [v5 version], v9 == objc_msgSend(v6, "version")))
  {
    id v10 = [v5 features];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v15 = v12;

    v16 = [v6 features];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1CAD0] set];
    }
    v19 = v18;

    int v20 = [v15 isEqualToSet:v19];
    uint64_t v21 = [v5 suggestedPersonLocalIdentifiers];
    v22 = (void *)v21;
    v23 = (void *)MEMORY[0x1E4F1CBF0];
    if (v21) {
      v24 = (void *)v21;
    }
    else {
      v24 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v25 = v24;

    uint64_t v26 = [v6 suggestedPersonLocalIdentifiers];
    long long v27 = (void *)v26;
    if (v26) {
      long long v28 = (void *)v26;
    }
    else {
      long long v28 = v23;
    }
    id v29 = v28;

    if (v20)
    {
      if ([v25 isEqualToArray:v29])
      {
        v30 = [v5 recipe];
        uint64_t v31 = [v6 recipe];
        if (v30 == v31)
        {
          int v20 = 1;
        }
        else
        {
          v32 = [v5 recipe];
          [v6 recipe];
          v33 = v38 = v30;
          int v20 = [v32 isEqual:v33];

          v30 = v38;
        }
      }
      else
      {
        int v20 = 0;
      }
    }
    v34 = [MEMORY[0x1E4F39310] allTopWallpaperSuggestionSubtypes];
    v35 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v6, "subtype"));
    unsigned __int8 v36 = [v34 containsObject:v35];

    char v13 = (v36 ^ 1) & v20;
    if (((v36 ^ 1) & 1) == 0 && v20)
    {
      uint64_t v37 = [v5 availableFeatures];
      char v13 = v37 == [v6 availableFeatures];
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)existingSuggestionByKeyAssetUUIDWithType:(unsigned __int16)a3 subtypes:(id)a4
{
  unsigned int v4 = a3;
  v58[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v42 = self;
  int v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  int v8 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v58[0] = v9;
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d", v4);
  v58[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  id v12 = [v8 andPredicateWithSubpredicates:v11];

  if (v6)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __77__PHASuggestionController_existingSuggestionByKeyAssetUUIDWithType_subtypes___block_invoke;
    v47[3] = &unk_1E6917D18;
    id v48 = v13;
    id v14 = v13;
    [v6 enumerateIndexesUsingBlock:v47];
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"subtype IN %@", v14];
    v16 = (void *)MEMORY[0x1E4F28BA0];
    v57[0] = v12;
    v57[1] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    uint64_t v18 = [v16 andPredicateWithSubpredicates:v17];

    id v12 = (void *)v18;
  }
  [v7 setPredicate:v12];
  v19 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v7];
  if ([v19 count])
  {
    v38 = v12;
    v39 = v7;
    id v40 = v6;
    int v20 = [(PHPhotoLibrary *)v42->_photoLibrary librarySpecificFetchOptions];
    uint64_t v56 = *MEMORY[0x1E4F394A8];
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    [v20 setFetchPropertySets:v21];

    unsigned __int8 v36 = v20;
    v22 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v19 options:v20];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v37 = v19;
    id obj = v19;
    uint64_t v24 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(obj);
          }
          long long v28 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v29 = [v28 uuid];
          v30 = [v22 objectForKeyedSubscript:v29];

          if (v30)
          {
            uint64_t v31 = [v30 uuid];
            v32 = [v23 objectForKeyedSubscript:v31];
            if (v32)
            {
              loggingConnection = v42->_loggingConnection;
              if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v50 = v32;
                __int16 v51 = 2112;
                v52 = v28;
                __int16 v53 = 2112;
                v54 = v30;
                _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "Two suggestions (%@, %@) using the same asset (%@)", buf, 0x20u);
              }
            }
            else
            {
              [v23 setObject:v28 forKeyedSubscript:v31];
            }
          }
          else
          {
            v34 = v42->_loggingConnection;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v28;
              _os_log_error_impl(&dword_1D21F2000, v34, OS_LOG_TYPE_ERROR, "Could not find key asset for suggestion %@", buf, 0xCu);
            }
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v25);
    }

    int v7 = v39;
    id v6 = v40;
    v19 = v37;
    id v12 = v38;
  }
  else
  {
    id v23 = (id)MEMORY[0x1E4F1CC08];
  }

  return v23;
}

void __77__PHASuggestionController_existingSuggestionByKeyAssetUUIDWithType_subtypes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (id)pendingOnThisDayMemories
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v4 = self->_existingMemories;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "pendingState", (void)v13) == 1)
        {
          uint64_t v10 = [v9 category];
          if ((unint64_t)(v10 - 202) <= 0xB && ((1 << (v10 + 54)) & 0xC01) != 0) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_createSuggestionSessionWithProfile:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  unsigned int v4 = [(PGManager *)self->_graphManager workingContextForSuggestions];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8D928]) initWithProfile:v3 workingContext:v4];

  return v5;
}

- (id)_suggestionsToReuseWithSuggestionSession:(id)a3 numberOfSuggestionsToReuse:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 existingSuggestionsWithState:0 count:a4];
  if ([v6 count] == a4)
  {
    id v7 = v6;
  }
  else
  {
    int v8 = objc_msgSend(v5, "existingSuggestionsWithState:count:", 1, a4 - objc_msgSend(v6, "count"));
    if ([v8 count])
    {
      id v9 = [v6 arrayByAddingObjectsFromArray:v8];
    }
    else
    {
      id v9 = v6;
    }
    id v7 = v9;
  }

  return v7;
}

- (id)collidableSuggestionsWithOptions:(id)a3
{
  unsigned int v4 = (void *)MEMORY[0x1E4F76C68];
  id v5 = [a3 localToday];
  uint64_t v6 = [v4 universalDateFromLocalDate:v5];

  id v7 = [(PHASuggestionController *)self _existingSuggestionsForProfile:1];
  int v8 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PHASuggestionController_collidableSuggestionsWithOptions___block_invoke;
  v13[3] = &unk_1E6917CF0;
  id v14 = v6;
  id v9 = v6;
  uint64_t v10 = [v8 predicateWithBlock:v13];
  v11 = [v7 filteredArrayUsingPredicate:v10];

  return v11;
}

BOOL __60__PHASuggestionController_collidableSuggestionsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 creationDate];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  return v5 <= 604800.0 && v5 >= 0.0;
}

- (id)_forbiddenAssetUUIDs
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v19[0] = *MEMORY[0x1E4F394A8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v2 setFetchPropertySets:v3];

  double v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K CONTAINS %d", @"suggestionsBeingKeyAssets", @"state", 4);
  [v2 setInternalPredicate:v4];

  double v5 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v2];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) uuid];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)generateSuggestionsWithProfile:(unsigned __int8)a3 options:(id)a4 progress:(id)a5
{
  unsigned int v87 = a3;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v86 = a4;
  v89 = (void (**)(id, unsigned char *, double))a5;
  uint64_t v8 = self->_loggingConnection;
  os_signpost_id_t spid = os_signpost_id_generate((os_log_t)v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v8;
  uint64_t v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SuggestionGeneration", "", (uint8_t *)&buf, 2u);
  }
  v84 = v10;

  uint64_t v82 = mach_absolute_time();
  char v115 = 0;
  v89[2](v89, &v115, 0.0);
  if (!v115)
  {
    v83 = [(PHASuggestionController *)self _createSuggestionSessionWithProfile:v87];
    id v12 = [(PHASuggestionController *)self _existingSuggestionsForProfile:v87];
    [v83 setExistingSuggestions:v12];

    long long v13 = [(PHASuggestionController *)self deniedSuggestionsForProfile:v87];
    [v83 setDeniedSuggestions:v13];

    v89[2](v89, &v115, 0.1);
    if (v115)
    {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_121:

      goto LABEL_122;
    }
    switch(v87)
    {
      case 0u:
      case 5u:
        if ([v86 maximumNumberOfSuggestions] == 1)
        {
          long long v15 = v114;
          v114[0] = MEMORY[0x1E4F143A8];
          v114[1] = 3221225472;
          v114[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke;
          v114[3] = &unk_1E6917CA0;
          v114[4] = v89;
          v78 = [v83 coordinatedSuggestionsWithOptions:v86 progress:v114];
        }
        else
        {
          long long v15 = v113;
          v113[0] = MEMORY[0x1E4F143A8];
          v113[1] = 3221225472;
          v113[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_2;
          v113[3] = &unk_1E6917CA0;
          v113[4] = v89;
          v78 = [v83 uncoordinatedSuggestionsWithOptions:v86 progress:v113];
        }
        goto LABEL_17;
      case 1u:
        goto LABEL_13;
      case 2u:
      case 6u:
      case 7u:
        long long v14 = [(PHASuggestionController *)self _forbiddenAssetUUIDs];
        [v83 setForbiddenAssetUUIDs:v14];

        long long v15 = v112;
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_3;
        v112[3] = &unk_1E6917CA0;
        v112[4] = v89;
        v78 = [v83 suggestionsWithOptions:v86 progress:v112];
        goto LABEL_17;
      case 3u:
        long long v15 = v110;
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_5;
        v110[3] = &unk_1E6917CA0;
        v110[4] = v89;
        v78 = [v83 uncoordinatedSuggestionsWithOptions:v86 progress:v110];
        goto LABEL_17;
      case 4u:
        long long v16 = [(PHASuggestionController *)self pendingOnThisDayMemories];
        [v83 setCollidableMemories:v16];

LABEL_13:
        long long v15 = v111;
        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_4;
        v111[3] = &unk_1E6917CA0;
        v111[4] = v89;
        v78 = [v83 suggestionsWithOptions:v86 progress:v111];
LABEL_17:

        break;
      default:
        v78 = 0;
        break;
    }
    v89[2](v89, &v115, 0.6);
    if (v115)
    {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
      long long v17 = v78;
LABEL_120:

      goto LABEL_121;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v86 shouldProcessExistingSuggestions])
    {
      int v20 = [MEMORY[0x1E4F8D928] suggestionTypesWithProfile:v87];
      uint64_t v21 = [MEMORY[0x1E4F8D928] suggestionSubtypesWithProfile:v87];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      v22 = self->_suggestionsToRetire;
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v106 objects:v129 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v107 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v25 = *(void **)(*((void *)&v106 + 1) + 8 * i);
            if (objc_msgSend(v20, "containsIndex:", objc_msgSend(v25, "type"))
              && objc_msgSend(v21, "containsIndex:", objc_msgSend(v25, "subtype")))
            {
              [v18 addObject:v25];
            }
          }
          uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v106 objects:v129 count:16];
        }
        while (v23);
      }

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      uint64_t v26 = self->_suggestionsToDelete;
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v102 objects:v128 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v103;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v103 != v28) {
              objc_enumerationMutation(v26);
            }
            id v29 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            if (objc_msgSend(v20, "containsIndex:", objc_msgSend(v29, "type"))
              && objc_msgSend(v21, "containsIndex:", objc_msgSend(v29, "subtype")))
            {
              [v19 addObject:v29];
            }
          }
          uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v102 objects:v128 count:16];
        }
        while (v27);
      }

      if (v87 == 3 && (unint64_t v30 = [v86 maximumNumberOfSuggestions], v30 > objc_msgSend(v78, "count")))
      {
        id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        uint64_t v31 = [v83 existingSuggestions];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v98 objects:v127 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v99;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v99 != v33) {
                objc_enumerationMutation(v31);
              }
              v34 = *(void **)(*((void *)&v98 + 1) + 8 * i);
              if ([v34 state] != 4
                && objc_msgSend(v20, "containsIndex:", objc_msgSend(v34, "type"))
                && objc_msgSend(v21, "containsIndex:", objc_msgSend(v34, "subtype")))
              {
                [obj addObject:v34];
              }
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v98 objects:v127 count:16];
          }
          while (v32);
        }

        if ([obj count])
        {
          objc_msgSend(obj, "pha_shuffle");
          v35 = (void *)[v78 mutableCopy];
          uint64_t v36 = [v86 maximumNumberOfSuggestions];
          uint64_t v37 = [v78 count];
          unint64_t v38 = [obj count];
          if (v38 >= v36 - v37) {
            uint64_t v39 = v36 - v37;
          }
          else {
            uint64_t v39 = v38;
          }
          if (v39 - 1 >= 0)
          {
            do
            {
              id v40 = [obj objectAtIndexedSubscript:--v39];
              v41 = self->_loggingConnection;
              if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t i = [v40 localIdentifier];
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = i;
                _os_log_impl(&dword_1D21F2000, (os_log_t)v41, OS_LOG_TYPE_DEFAULT, "Reusing widget suggestion: %@", (uint8_t *)&buf, 0xCu);
              }
              [v35 addObject:v40];
              [v19 addObject:v40];
            }
            while (v39 > 0);
          }
          id v77 = v35;
        }
        else
        {
          id v77 = v78;
        }
      }
      else
      {
        id v77 = v78;
      }
    }
    else
    {
      id v77 = v78;
    }
    v89[2](v89, &v115, 0.7);
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v115)
    {
LABEL_119:

      long long v17 = v77;
      goto LABEL_120;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v123 = 0x3032000000;
    v124 = __Block_byref_object_copy__2753;
    v125 = __Block_byref_object_dispose__2754;
    int v42 = [v86 discardGeneratedSuggestions];
    long long v43 = v77;
    if (v42) {
      long long v43 = v11;
    }
    id v126 = v43;
    if ([(id)objc_opt_class() _shouldCheckSuggestionRecylingForProfile:v87])
    {
      switch(v87)
      {
        case 2u:
          uint64_t v73 = 6;
          break;
        case 6u:
          uint64_t v73 = 8;
          break;
        case 7u:
          uint64_t v73 = 11;
          break;
        default:
          id result = (id)_PFAssertFailHandler();
          __break(1u);
          return result;
      }
      v74 = [v86 suggestionSubtypeWhitelist];
      v75 = [(PHASuggestionController *)self existingSuggestionByKeyAssetUUIDWithType:v73 subtypes:v74];

      if ([v75 count])
      {
        uint64_t v76 = *(void *)(*((void *)&buf + 1) + 40);
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_294;
        v95[3] = &unk_1E6917CC8;
        v95[4] = self;
        p_long long buf = &buf;
        id v96 = v19;
        [(PHASuggestionController *)self processSuggestions:v76 forRecyclingWithExistingSuggestionByKeyAssetUUID:v75 resultBlock:v95];
      }
    }
    if ([*(id *)(*((void *)&buf + 1) + 40) count]
      || [v18 count]
      || [v19 count])
    {
      uint64_t v44 = *(void *)(*((void *)&buf + 1) + 40);
      id v94 = 0;
      id v45 = [(PHASuggestionController *)self commitSuggestions:v44 retiringSuggestions:v18 deletingSuggestions:v19 withOptions:v86 error:&v94];
      id v46 = v94;
      v89[2](v89, &v115, 0.8);
      if (v115)
      {

        goto LABEL_117;
      }
      if (v45)
      {
        if ([v45 count])
        {
          v47 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
          {
            int v48 = [v45 count];
            *(_DWORD *)v120 = 67109378;
            *(_DWORD *)v121 = v48;
            *(_WORD *)&v121[4] = 2112;
            *(void *)&v121[6] = v45;
            _os_log_impl(&dword_1D21F2000, (os_log_t)v47, OS_LOG_TYPE_DEFAULT, "Successfully committed %d suggestions: %@", v120, 0x12u);
          }

          [(NSMutableArray *)self->_existingSuggestions addObjectsFromArray:*(void *)(*((void *)&buf + 1) + 40)];
          [(PHASuggestionController *)self recordCreatedSuggestions:*(void *)(*((void *)&buf + 1) + 40) duringSession:v83];
        }
        if ([v18 count])
        {
          v49 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
          {
            int v50 = [v18 count];
            *(_DWORD *)v120 = 67109120;
            *(_DWORD *)v121 = v50;
            _os_log_impl(&dword_1D21F2000, (os_log_t)v49, OS_LOG_TYPE_DEFAULT, "Successfully retired %d suggestions", v120, 8u);
          }

          [(NSMutableArray *)self->_suggestionsToRetire removeObjectsInArray:v18];
          [(PHASuggestionController *)self recordRetiredSuggestions:v18];
        }
        if ([v19 count])
        {
          __int16 v51 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
          {
            int v52 = [v19 count];
            *(_DWORD *)v120 = 67109120;
            *(_DWORD *)v121 = v52;
            _os_log_impl(&dword_1D21F2000, (os_log_t)v51, OS_LOG_TYPE_DEFAULT, "Successfully deleted %d suggestions", v120, 8u);
          }

          [(NSMutableArray *)self->_suggestionsToDelete removeObjectsInArray:v19];
          [(PHASuggestionController *)self recordDeletedSuggestions:v19];
        }
      }
      else
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v120 = 136315394;
          *(void *)v121 = "-[PHASuggestionController generateSuggestionsWithProfile:options:progress:]";
          *(_WORD *)&v121[8] = 2112;
          *(void *)&v121[10] = v46;
          _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "%s: Failed to commit changes due to error: %@", v120, 0x16u);
        }
        id v45 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v45 = (id)MEMORY[0x1E4F1CBF0];
    }
    v89[2](v89, &v115, 0.9);
    if (!v115)
    {
      if ([v86 discardGeneratedSuggestions] && objc_msgSend(v77, "count"))
      {
        id v88 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id obja = v77;
        uint64_t v54 = [obja countByEnumeratingWithState:&v90 objects:v119 count:16];
        v79 = v45;
        if (v54)
        {
          uint64_t v55 = *(void *)v91;
          do
          {
            for (uint64_t j = 0; j != v54; ++j)
            {
              if (*(void *)v91 != v55) {
                objc_enumerationMutation(obja);
              }
              v57 = *(void **)(*((void *)&v90 + 1) + 8 * j);
              v58 = [v57 keyAssets];
              v59 = [v58 firstObject];
              v60 = [v59 localIdentifier];

              if (v60)
              {
                v118[0] = v60;
                v117[0] = @"assetLocalIdentifier";
                v117[1] = @"score";
                v61 = NSNumber;
                [v57 score];
                v62 = objc_msgSend(v61, "numberWithDouble:");
                v118[1] = v62;
                v117[2] = @"reasons";
                v63 = [v57 reasons];
                uint64_t v64 = (uint64_t)v63;
                if (!v63)
                {
                  uint64_t i = [MEMORY[0x1E4F1CAD0] set];
                  uint64_t v64 = i;
                }
                v118[2] = v64;
                v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:3];
                if (!v63) {

                }
                [v88 addObject:v65];
              }
            }
            uint64_t v54 = [obja countByEnumeratingWithState:&v90 objects:v119 count:16];
          }
          while (v54);
        }

        id v45 = v88;
      }
      uint64_t v66 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v69 = v84;
      v70 = v69;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
      {
        *(_WORD *)v120 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D21F2000, v70, OS_SIGNPOST_INTERVAL_END, spid, "SuggestionGeneration", "", v120, 2u);
      }

      v71 = v70;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v120 = 136315394;
        *(void *)v121 = "SuggestionGeneration";
        *(_WORD *)&v121[8] = 2048;
        *(double *)&v121[10] = (float)((float)((float)((float)(v66 - v82) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D21F2000, v71, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v120, 0x16u);
      }

      v89[2](v89, &v115, 1.0);
      if (!v115)
      {
        id v45 = v45;
        v11 = v45;
        goto LABEL_118;
      }
    }
LABEL_117:
    v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_118:

    _Block_object_dispose(&buf, 8);
    goto LABEL_119;
  }
  v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_122:

  return v11;
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_2(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_3(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_4(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_5(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

void __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v9 = v7;
    LODWORD(v8) = [v8 count];
    int v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    v14[0] = 67109888;
    v14[1] = v8;
    __int16 v15 = 1024;
    int v16 = v10 - [v5 count];
    __int16 v17 = 1024;
    int v18 = [v5 count];
    __int16 v19 = 1024;
    int v20 = [v6 count];
    _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "Generated %d wallpaper suggestions, %d already existing, about to commit %d new PHSuggestions, delete %d old PHSuggestions", (uint8_t *)v14, 0x1Au);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  [*(id *)(a1 + 40) addObjectsFromArray:v6];
}

- (id)generateCameraStyleableSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return [(PHASuggestionController *)self generateSuggestionsWithProfile:7 options:a3 progress:a4];
}

- (id)generateAmbientSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return [(PHASuggestionController *)self generateSuggestionsWithProfile:6 options:a3 progress:a4];
}

- (id)generateWidgetSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return [(PHASuggestionController *)self generateSuggestionsWithProfile:3 options:a3 progress:a4];
}

- (id)generateWallpaperSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return [(PHASuggestionController *)self generateSuggestionsWithProfile:2 options:a3 progress:a4];
}

- (id)generateSharingSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return [(PHASuggestionController *)self generateSuggestionsWithProfile:1 options:a3 progress:a4];
}

- (id)generateOnThisDayAssetSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return [(PHASuggestionController *)self generateSuggestionsWithProfile:4 options:a3 progress:a4];
}

- (id)generateSingleAssetSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return [(PHASuggestionController *)self generateSuggestionsWithProfile:0 options:a3 progress:a4];
}

- (id)collidableMemoriesWithReferenceDate:(id)a3 andDelay:(double)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:201];
  [v7 addIndex:302];
  [v7 addIndex:211];
  [v7 addIndex:215];
  [v7 addIndex:216];
  [v7 addIndex:217];
  [v7 addIndex:218];
  [v7 addIndex:220];
  [v7 addIndex:221];
  [v7 addIndex:301];
  [v7 addIndex:302];
  existingMemories = self->_existingMemories;
  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PHASuggestionController_collidableMemoriesWithReferenceDate_andDelay___block_invoke;
  v15[3] = &unk_1E6917C78;
  id v16 = v7;
  id v17 = v6;
  double v18 = a4;
  id v10 = v6;
  id v11 = v7;
  id v12 = [v9 predicateWithBlock:v15];
  id v13 = [(NSArray *)existingMemories filteredArrayUsingPredicate:v12];

  return v13;
}

BOOL __72__PHASuggestionController_collidableMemoriesWithReferenceDate_andDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v8 = (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "category")) & 1) == 0
    && (double v4 = *(void **)(a1 + 40),
        [v3 creationDate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 timeIntervalSinceDate:v5],
        double v7 = v6,
        v5,
        v7 >= 0.0)
    && v7 <= *(double *)(a1 + 48);

  return v8;
}

- (unint64_t)newFeaturedSuggestionsCount
{
  return self->_newFeaturedSuggestionsCount;
}

- (id)commitSuggestions:(id)a3 retiringSuggestions:(id)a4 deletingSuggestions:(id)a5 withOptions:(id)a6 error:(id *)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = loggingConnection;
    *(_DWORD *)buf.sysname = 67109120;
    *(_DWORD *)&buf.sysname[4] = [v11 count];
    _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_DEFAULT, "Committing %d new suggestions", (uint8_t *)&buf, 8u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = loggingConnection;
    int v18 = [v12 count];
    *(_DWORD *)buf.sysname = 67109120;
    *(_DWORD *)&buf.sysname[4] = v18;
    _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_DEFAULT, "Retiring %d suggestions", (uint8_t *)&buf, 8u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = loggingConnection;
    int v20 = [v13 count];
    *(_DWORD *)buf.sysname = 67109120;
    *(_DWORD *)&buf.sysname[4] = v20;
    _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_DEFAULT, "Deleting %d suggestions", (uint8_t *)&buf, 8u);
  }
  __int16 v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  int v52 = objc_opt_new();
  memset(&buf, 0, 512);
  uname(&buf);
  __int16 v51 = [NSString stringWithCString:buf.machine encoding:4];
  uint64_t v21 = [MEMORY[0x1E4F28F80] processInfo];
  int v50 = [v21 operatingSystemVersionString];

  uint64_t v22 = [v14 localToday];
  v58 = v12;
  uint64_t v54 = (void *)v22;
  uint64_t v55 = v11;
  if (v22) {
    [MEMORY[0x1E4F76C68] universalDateFromLocalDate:v22];
  }
  else {
  v49 = [MEMORY[0x1E4F1C9C8] date];
  }
  v57 = v14;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v23 = v13;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v73 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v29 = self->_loggingConnection;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v30 = v29;
          uint64_t v31 = objc_msgSend(v28, "localIdentifier", v49, v50);
          *(_DWORD *)uint64_t v76 = 138412290;
          *(void *)id v77 = v31;
          _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_DEFAULT, "Delete suggestion: %@", v76, 0xCu);
        }
        deletedSuggestionLocalIdentifiers = self->_deletedSuggestionLocalIdentifiers;
        uint64_t v33 = objc_msgSend(v28, "localIdentifier", v49);
        [(NSMutableSet *)deletedSuggestionLocalIdentifiers addObject:v33];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v25);
  }

  photoLibrary = self->_photoLibrary;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __103__PHASuggestionController_commitSuggestions_retiringSuggestions_deletingSuggestions_withOptions_error___block_invoke;
  v61[3] = &unk_1E6917C50;
  id v60 = v55;
  id v62 = v60;
  v63 = self;
  id v35 = v49;
  id v64 = v35;
  id v56 = v51;
  id v65 = v56;
  id v36 = v50;
  id v66 = v36;
  id v37 = v52;
  id v67 = v37;
  unint64_t v38 = v53;
  v68 = v38;
  id v39 = v57;
  id v69 = v39;
  id v40 = v58;
  id v70 = v40;
  id v41 = v23;
  id v71 = v41;
  if ([(PHPhotoLibrary *)photoLibrary performChangesAndWait:v61 error:a7])
  {
    if (![v37 count]) {
      goto LABEL_26;
    }
    int v42 = self->_loggingConnection;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      long long v43 = v42;
      int v44 = [v37 count];
      *(_DWORD *)uint64_t v76 = 67109378;
      *(_DWORD *)id v77 = v44;
      *(_WORD *)&v77[4] = 2112;
      *(void *)&v77[6] = v37;
      _os_log_impl(&dword_1D21F2000, v43, OS_LOG_TYPE_DEFAULT, "Firing notification for %d suggestions: %@", v76, 0x12u);
    }
    id v45 = [[PHANotificationController alloc] initWithGraphManager:self->_graphManager];
    [(PHANotificationController *)v45 fireNotificationForSuggestionIdentifiers:v37];
  }
  else
  {
    id v45 = v38;
    unint64_t v38 = 0;
  }

LABEL_26:
  id v46 = v71;
  v47 = v38;

  return v47;
}

uint64_t __103__PHASuggestionController_commitSuggestions_retiringSuggestions_deletingSuggestions_withOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v95 objects:v106 count:16];
  uint64_t v80 = v1;
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v73 = *(void *)v96;
    double v4 = 0.0;
    do
    {
      uint64_t v5 = 0;
      uint64_t v72 = v3;
      do
      {
        if (*(void *)v96 != v73) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v95 + 1) + 8 * v5);
        double v7 = (void *)MEMORY[0x1D26057A0]();
        BOOL v8 = [v6 keyAssets];
        uint64_t v9 = [v6 representativeAssets];
        if (![v8 count])
        {
          id v12 = *(NSObject **)(*(void *)(v1 + 40) + 8);
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
          *(_DWORD *)utsname buf = 138412290;
          long long v102 = (const char *)v6;
          id v13 = v12;
          id v14 = "Trying to persist a suggestion without key assets: %@";
LABEL_44:
          _os_log_error_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
          goto LABEL_57;
        }
        if ([v6 type] == 1 && !objc_msgSend(v9, "count"))
        {
          id v36 = *(NSObject **)(*(void *)(v1 + 40) + 8);
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
          *(_DWORD *)utsname buf = 138412290;
          long long v102 = (const char *)v6;
          id v13 = v36;
          id v14 = "Trying to persist a cmm suggestion without representative assets: %@";
          goto LABEL_44;
        }
        uint64_t v10 = [v6 relevanceDurationInDays];
        v79 = v7;
        if (v10)
        {
          uint64_t v11 = [MEMORY[0x1E4F76C68] dateByAddingDays:v10 toDate:*(void *)(v1 + 48)];
        }
        else
        {
          uint64_t v11 = 0;
        }
        [*(id *)(v1 + 48) dateByAddingTimeInterval:v4];
        v75 = id v77 = v9;
        __int16 v15 = objc_msgSend(MEMORY[0x1E4F39318], "creationRequestForSuggestionWithType:subtype:keyAssets:representativeAssets:creationDate:relevantUntilDate:version:", objc_msgSend(v6, "type"), objc_msgSend(v6, "subtype"), v8, v9, v75, v11, objc_msgSend(v6, "version"));
        uint64_t v16 = [v6 recipe];
        if (v16) {
          [v15 setActionProperties:v16];
        }
        long long v74 = (void *)v16;
        uint64_t v1 = v80;
        if ([*(id *)(v80 + 40) _canFeatureSuggestion:v6])
        {
          id v17 = *(NSObject **)(*(void *)(v80 + 40) + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v18 = v17;
            __int16 v19 = [v15 uuid];
            *(_DWORD *)utsname buf = 138412290;
            long long v102 = v19;
            _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_INFO, "Set currentlyFeatured state on suggestion: %@", buf, 0xCu);
          }
          [v15 setFeaturedState:1];
          ++*(void *)(*(void *)(v80 + 40) + 56);
        }
        v78 = v8;
        int v20 = objc_opt_new();
        v81 = [v6 features];
        uint64_t v76 = (void *)v11;
        uint64_t v82 = v20;
        if ([v81 count])
        {
          uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v81, "count"));
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v22 = v81;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v91 objects:v105 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v92;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v92 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(*((void *)&v91 + 1) + 8 * i) requiringSecureCoding:1 error:0];
                if (v27) {
                  [v21 addObject:v27];
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v91 objects:v105 count:16];
            }
            while (v24);
          }

          int v20 = v82;
          [v82 setObject:v21 forKeyedSubscript:@"features"];

          uint64_t v1 = v80;
        }
        if ([v6 type] == 1)
        {
          uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "containsUnverifiedPersons"));
          [v20 setObject:v28 forKeyedSubscript:@"containsUnverifiedPersons"];
        }
        id v29 = [v6 suggestedPersonLocalIdentifiers];
        if ([v29 count]) {
          [v20 setObject:v29 forKeyedSubscript:@"suggestedPersonLocalIdentifiers"];
        }
        unint64_t v30 = [NSString stringWithFormat:@"%@ - %@", *(void *)(v1 + 56), *(void *)(v1 + 64)];
        [v20 setObject:v30 forKeyedSubscript:@"deviceInformation"];

        [v15 setFeaturesProperties:v20];
        uint64_t v31 = [v6 title];
        if (v31) {
          [v15 setTitle:v31];
        }
        uint64_t v32 = [v6 subtitle];
        if (v32) {
          [v15 setSubtitle:v32];
        }
        uint64_t v33 = [v6 subtype];
        if ([MEMORY[0x1E4F39310] hasPersonLocalIdentifierInContextForSuggestionSubype:v33])
        {
          v34 = [v6 suggestedPersonLocalIdentifiers];
          id v35 = [v34 firstObject];

          if (v35)
          {
            [v15 setContext:v35];
          }
          else
          {
            id v37 = *(NSObject **)(*(void *)(v1 + 40) + 8);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)utsname buf = 138412290;
              long long v102 = (const char *)v6;
              _os_log_error_impl(&dword_1D21F2000, v37, OS_LOG_TYPE_ERROR, "Unexpected 'nil' personLocalIdentifier for People/Pet Wallpaper Suggestion %@", buf, 0xCu);
            }
          }
        }
        uint64_t v38 = [v6 availableFeatures];
        if (v38) {
          [v15 setAvailableFeatures:v38];
        }
        id v39 = [v15 placeholderForCreatedSuggestion];
        id v40 = [v39 localIdentifier];

        if (v40)
        {
          id v41 = v76;
          if ([v6 notificationState] == 1)
          {
            [v15 setNotificationState:1];
            [*(id *)(v1 + 72) addObject:v40];
          }
          [*(id *)(v1 + 80) addObject:v40];
        }
        else
        {
          int v42 = *(NSObject **)(*(void *)(v1 + 40) + 8);
          id v41 = v76;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)utsname buf = 136315394;
            long long v102 = "-[PHASuggestionController commitSuggestions:retiringSuggestions:deletingSuggestions:withOptions:error:]_block_invoke";
            __int16 v103 = 2112;
            long long v104 = v15;
            _os_log_error_impl(&dword_1D21F2000, v42, OS_LOG_TYPE_ERROR, "%s: Getting a nil placeholder for created suggestion: %@", buf, 0x16u);
          }
        }
        double v4 = v4 + 1.0;

        uint64_t v3 = v72;
        BOOL v8 = v78;
        double v7 = v79;
        uint64_t v9 = v77;
LABEL_57:

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v95 objects:v106 count:16];
    }
    while (v3);
  }

  if ([*(id *)(v1 + 88) clearFeaturedSuggestions]
    && [*(id *)(*(void *)(v1 + 40) + 48) count])
  {
    uint64_t v43 = *(void *)(v1 + 40);
    int v44 = *(NSObject **)(v43 + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      id v45 = *(void **)(v43 + 48);
      id v46 = v44;
      uint64_t v47 = [v45 count];
      *(_DWORD *)utsname buf = 134217984;
      long long v102 = (const char *)v47;
      _os_log_impl(&dword_1D21F2000, v46, OS_LOG_TYPE_DEFAULT, "Clearing featured state for %lu suggestions", buf, 0xCu);

      uint64_t v43 = *(void *)(v1 + 40);
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v48 = *(id *)(v43 + 48);
    uint64_t v49 = [v48 countByEnumeratingWithState:&v87 objects:v100 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v88 != v51) {
            objc_enumerationMutation(v48);
          }
          __int16 v53 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          uint64_t v54 = *(void **)(*(void *)(v80 + 40) + 64);
          uint64_t v55 = [v53 localIdentifier];
          int v56 = [v54 containsObject:v55];

          v57 = *(NSObject **)(*(void *)(v80 + 40) + 8);
          if (v56)
          {
            if (!os_log_type_enabled(v57, OS_LOG_TYPE_INFO)) {
              continue;
            }
            v58 = v57;
            v59 = [v53 localIdentifier];
            *(_DWORD *)utsname buf = 138412290;
            long long v102 = v59;
            _os_log_impl(&dword_1D21F2000, v58, OS_LOG_TYPE_INFO, "Skip unfeaturing deleted suggestion: %@", buf, 0xCu);
          }
          else
          {
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              id v60 = v57;
              v61 = [v53 localIdentifier];
              *(_DWORD *)utsname buf = 138412290;
              long long v102 = v61;
              _os_log_impl(&dword_1D21F2000, v60, OS_LOG_TYPE_DEFAULT, "Unfeature suggestion: %@", buf, 0xCu);
            }
            v58 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:v53];
            [v58 setFeaturedState:0];
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v87 objects:v100 count:16];
      }
      while (v50);
    }

    uint64_t v1 = v80;
    uint64_t v62 = *(void *)(v80 + 40);
    v63 = *(void **)(v62 + 48);
    *(void *)(v62 + 48) = 0;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v64 = *(id *)(v1 + 96);
  uint64_t v65 = [v64 countByEnumeratingWithState:&v83 objects:v99 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v84;
    do
    {
      for (uint64_t k = 0; k != v66; ++k)
      {
        if (*(void *)v84 != v67) {
          objc_enumerationMutation(v64);
        }
        id v69 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:*(void *)(*((void *)&v83 + 1) + 8 * k)];
        [v69 markRetired];
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v83 objects:v99 count:16];
    }
    while (v66);
  }

  uint64_t result = [*(id *)(v80 + 104) count];
  if (result) {
    return [MEMORY[0x1E4F39318] deleteSuggestions:*(void *)(v80 + 104)];
  }
  return result;
}

- (void)ingestSuggestions:(id)a3 atDate:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (![(PHASuggestionController *)self _filterExistingSuggestion:v16])
        {
          switch([v16 state])
          {
            case 0u:
              [(NSMutableArray *)v9 addObject:v16];
              int v18 = v27;
              goto LABEL_14;
            case 1u:
            case 3u:
            case 4u:
              BOOL v17 = [(PHASuggestionController *)self shouldRetireSuggestion:v16 atDate:v7];
              int v18 = v8;
              if (v17)
              {
                [(NSMutableArray *)v10 addObject:v16];
                int v18 = v8;
              }
              goto LABEL_14;
            case 2u:
              if ([(PHASuggestionController *)self shouldDeleteSuggestion:v16 atDate:v7])
              {
                int v18 = v9;
              }
              else
              {
                int v18 = v8;
              }
LABEL_14:
              [(NSMutableArray *)v18 addObject:v16];
              break;
            default:
              continue;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v13);
  }

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = loggingConnection;
    uint64_t v21 = [(NSMutableArray *)v27 count];
    *(_DWORD *)utsname buf = 134218242;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    id v35 = v27;
    _os_log_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_DEFAULT, "Found %lu existing pending suggestions: %@", buf, 0x16u);
  }
  existingSuggestions = self->_existingSuggestions;
  self->_existingSuggestions = v8;
  uint64_t v23 = v8;

  suggestionsToRetire = self->_suggestionsToRetire;
  self->_suggestionsToRetire = v10;
  uint64_t v25 = v10;

  suggestionsToDelete = self->_suggestionsToDelete;
  self->_suggestionsToDelete = v9;
}

- (BOOL)shouldDeleteSuggestion:(id)a3 atDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 activationDate];
  [v5 timeIntervalSinceDate:v7];
  double v9 = v8;

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v6 type];
  uint64_t v12 = [v6 subtype];

  [v10 _maximumDurationBeforeDeletionForSuggestionType:v11 andSubtype:v12];
  LOBYTE(v6) = v9 > v13;

  return (char)v6;
}

- (BOOL)shouldRetireSuggestion:(id)a3 atDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 relevantUntilDate];
  double v8 = [v5 activationDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = v9;
  if ([v5 state] != 4)
  {
    if ([v6 compare:v7] == 1)
    {
      BOOL v11 = 1;
      goto LABEL_7;
    }
    if (v8)
    {
      BOOL v11 = v10 > (double)(unint64_t)objc_msgSend((id)objc_opt_class(), "_retirementDelayInDaysForSuggestionType:andSubtype:", objc_msgSend(v5, "type"), objc_msgSend(v5, "subtype"))* 86400.0;
      goto LABEL_7;
    }
  }
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (id)deniedSuggestionsForProfile:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a3 <= 7u && ((1 << a3) & 0xC4) != 0)
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = self->_existingSuggestions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v12 state] == 4) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v3 <= 4 && ((1 << v3) & 0x19) != 0)
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v13 = v6;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * j);
              if ([(PHASuggestionController *)self _canFeatureSuggestion:v18]) {
                [v5 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }
          while (v15);
        }
      }
      else
      {
        id v13 = [MEMORY[0x1E4F8D928] suggestionTypesWithProfile:v3];
        __int16 v19 = [MEMORY[0x1E4F8D928] suggestionSubtypesWithProfile:v3];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v20 = v6;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v28;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v28 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void **)(*((void *)&v27 + 1) + 8 * k);
              if (objc_msgSend(v13, "containsIndex:", objc_msgSend(v25, "type", (void)v27))&& objc_msgSend(v19, "containsIndex:", objc_msgSend(v25, "subtype")))
              {
                [v5 addObject:v25];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v22);
        }
      }
    }
    else
    {
      id v5 = v6;
    }
  }

  return v5;
}

- (id)_existingSuggestionsForProfile:(unsigned __int8)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((a3 - 3) < 3) {
    goto LABEL_4;
  }
  if (a3 == 1)
  {
    double v4 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F8D928] suggestionTypesWithProfile:1];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = self->_existingSuggestions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v6, "containsIndex:", objc_msgSend(v12, "type", (void)v13))) {
            [(NSMutableArray *)v4 addObject:v12];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  else
  {
    if (!a3)
    {
LABEL_4:
      double v4 = self->_existingSuggestions;
      goto LABEL_5;
    }
    double v4 = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  }
LABEL_5:

  return v4;
}

- (void)ingestExistingSuggestionsWithOptions:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  double v4 = [a3 localToday];
  if (v4) {
    [MEMORY[0x1E4F76C68] universalDateFromLocalDate:v4];
  }
  else {
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"activationDate" ascending:0];
  v14[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v14[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  _DWORD v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  [v6 setSortDescriptors:v10];

  if (v4)
  {
    BOOL v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate < %@", v5];
    [v6 setPredicate:v11];
  }
  uint64_t v12 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v6];
  long long v13 = [v12 fetchedObjects];
  [(PHASuggestionController *)self ingestSuggestions:v13 atDate:v5];
}

- (NSArray)existingSuggestions
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_existingSuggestions];
}

- (PHASuggestionController)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHASuggestionController;
  id v6 = [(PHASuggestionController *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    uint64_t v8 = [v5 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    os_log_t v10 = os_log_create("com.apple.photoanalysisd", "suggestions");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v10;

    v7->_newFeaturedSuggestionsCount = 0;
    uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deletedSuggestionLocalIdentifiers = v7->_deletedSuggestionLocalIdentifiers;
    v7->_deletedSuggestionLocalIdentifiers = v12;
  }
  return v7;
}

+ (id)availableSuggestionTypeInfosWithProfile:(unsigned __int8)a3
{
  return (id)[MEMORY[0x1E4F8D928] availableSuggestionTypeInfosWithProfile:a3];
}

+ (double)_maximumDurationBeforeDeletionForSuggestionType:(unsigned __int16)a3 andSubtype:(unsigned __int16)a4
{
  return dbl_1D24333A0[a4 == 502];
}

+ (unint64_t)_retirementDelayInDaysForSuggestionType:(unsigned __int16)a3 andSubtype:(unsigned __int16)a4
{
  if (a4 == 502) {
    return 15;
  }
  if ((unsigned __int16)(a3 - 1) > 7u) {
    return 0;
  }
  return qword_1D2433428[(unsigned __int16)(a3 - 1)];
}

+ (BOOL)_shouldCheckSuggestionRecylingForProfile:(unsigned __int8)a3
{
  return (a3 < 8u) & (0xC4u >> a3);
}

- (void)recordCreatedSuggestions:(id)a3 duringSession:(id)a4
{
  int v52 = self;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v54 = a4;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v84 objects:v98 count:16];
  id v80 = v5;
  if (!v6)
  {
    uint64_t v75 = 0;
    uint64_t v77 = 0;
    uint64_t v8 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    uint64_t v55 = 0;
    uint64_t v9 = 0;
    unint64_t v66 = 0;
    unint64_t v69 = 0;
    unint64_t v72 = 0;
    uint64_t v64 = 0;
    unint64_t v65 = 0;
    unint64_t v81 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = v6;
  uint64_t v75 = 0;
  uint64_t v77 = 0;
  uint64_t v8 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  uint64_t v55 = 0;
  uint64_t v9 = 0;
  unint64_t v66 = 0;
  unint64_t v69 = 0;
  unint64_t v72 = 0;
  uint64_t v64 = 0;
  unint64_t v65 = 0;
  unint64_t v81 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  uint64_t v10 = *(void *)v85;
LABEL_3:
  uint64_t v11 = 0;
  while (2)
  {
    if (*(void *)v85 != v10) {
      objc_enumerationMutation(v5);
    }
    uint64_t v12 = *(void **)(*((void *)&v84 + 1) + 8 * v11);
    int v13 = objc_msgSend(v12, "type", v52);
    int v14 = [v12 subtype];
    int v15 = v14;
    switch(v13)
    {
      case 1:
        long long v16 = [v12 features];
        uint64_t v17 = [v16 count];

        uint64_t v18 = [v12 suggestedPersonLocalIdentifiers];
        uint64_t v19 = [v18 count];

        if ([v12 notificationState]) {
          ++v9;
        }
        if (v15 == 101)
        {
          ++v72;
          v65 += v17;
        }
        else
        {
          if (v15 != 102) {
            goto LABEL_23;
          }
          v66 += v17;
          ++v69;
        }
        v81 += v19;
LABEL_23:
        id v5 = v80;
LABEL_24:
        if (v7 != ++v11) {
          continue;
        }
        uint64_t v20 = [v5 countByEnumeratingWithState:&v84 objects:v98 count:16];
        uint64_t v7 = v20;
        if (v20) {
          goto LABEL_3;
        }
LABEL_37:
        uint64_t v21 = v54;
        switch(objc_msgSend(v54, "profile", v52))
        {
          case 0u:
            uint64_t v22 = [v53 graphManager];
            uint64_t v82 = [v22 analytics];
            v94[0] = @"numberOfSingleAssetSuggestionCreated";
            uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
            v95[0] = v23;
            v94[1] = @"editLoopCreated";
            uint64_t v24 = [NSNumber numberWithUnsignedInteger:v61];
            v95[1] = v24;
            v94[2] = @"editLongExposureCreated";
            uint64_t v76 = [NSNumber numberWithUnsignedInteger:v62];
            v95[2] = v76;
            v94[3] = @"editBounceCreated";
            uint64_t v73 = [NSNumber numberWithUnsignedInteger:v63];
            v95[3] = v73;
            v94[4] = @"editPortraitStudioLightCreated";
            id v70 = [NSNumber numberWithUnsignedInteger:v64];
            v95[4] = v70;
            v94[5] = @"outstanderCreated";
            v78 = [NSNumber numberWithUnsignedInteger:v77];
            void v95[5] = v78;
            v94[6] = @"recentFavoriteCreated";
            uint64_t v67 = [NSNumber numberWithUnsignedInteger:v56];
            v95[6] = v67;
            v94[7] = @"recentEditCreated";
            uint64_t v25 = [NSNumber numberWithUnsignedInteger:v57];
            v95[7] = v25;
            v94[8] = @"recentAestheticsCreated";
            uint64_t v26 = [NSNumber numberWithUnsignedInteger:v58];
            v95[8] = v26;
            v94[9] = @"recentPersonCentricCreated";
            long long v27 = [NSNumber numberWithUnsignedInteger:v59];
            v95[9] = v27;
            v94[10] = @"recentSocialGroupCentricCreated";
            long long v28 = [NSNumber numberWithUnsignedInteger:v60];
            v95[10] = v28;
            v94[11] = @"recentSyndicatedAssetCreated";
            long long v29 = [NSNumber numberWithUnsignedInteger:v55];
            v95[11] = v29;
            long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:12];
            [v82 sendEvent:@"com.apple.Photos.suggestion.singleAsset" withPayload:v30];

            uint64_t v21 = v54;
            id v5 = v80;

            long long v31 = v82;
            long long v32 = (void *)v76;
            goto LABEL_51;
          case 1u:
            long long v33 = (void *)MEMORY[0x1E4F1CA60];
            v96[0] = @"sentNotifications";
            long long v34 = [NSNumber numberWithUnsignedInteger:v9];
            v96[1] = @"numberOfPersonsSuggested";
            v97[0] = v34;
            long long v35 = [NSNumber numberWithDouble:(double)v81 / (double)(v72 + v69)];
            v97[1] = v35;
            long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
            uint64_t v22 = [v33 dictionaryWithDictionary:v36];

            uint64_t v21 = v54;
            long long v37 = [v54 notificationProfile];
            long long v31 = v37;
            if (v37)
            {
              [v37 userType];
              long long v38 = PGStringFromSuggestionNotificationUserType();
              [v22 setObject:v38 forKeyedSubscript:@"notificationProfile"];
            }
            if (v72)
            {
              id v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
              [v22 setObject:v39 forKeyedSubscript:@"momentShareCreated"];

              id v40 = [NSNumber numberWithDouble:(double)v65 / (double)v72];
              [v22 setObject:v40 forKeyedSubscript:@"numberOfTextFeaturesPerMoment"];
            }
            if (v69)
            {
              id v41 = [NSNumber numberWithUnsignedInteger:v69];
              [v22 setObject:v41 forKeyedSubscript:@"collectionShareCreated"];

              uint64_t v42 = [NSNumber numberWithDouble:(double)v66 / (double)v69];
              [v22 setObject:v42 forKeyedSubscript:@"numberOfTextFeaturesPerCollection"];
            }
            uint64_t v23 = [v53 graphManager];
            uint64_t v43 = [v23 analytics];
            uint64_t v24 = v43;
            int v44 = @"com.apple.Photos.suggestion.sharing";
            id v45 = v22;
            goto LABEL_49;
          case 3u:
            uint64_t v22 = [v53 graphManager];
            long long v31 = [v22 analytics];
            long long v90 = @"longtailCreated";
            uint64_t v23 = [NSNumber numberWithUnsignedInteger:v75];
            long long v91 = v23;
            uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
            int v44 = @"com.apple.Photos.suggestion.widget";
            goto LABEL_48;
          case 4u:
            uint64_t v22 = [v53 graphManager];
            long long v31 = [v22 analytics];
            long long v92 = @"onThisDayCreated";
            uint64_t v23 = [NSNumber numberWithUnsignedInteger:v8];
            long long v93 = v23;
            uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
            int v44 = @"com.apple.Photos.suggestion.onThisDay";
LABEL_48:
            uint64_t v43 = v31;
            id v45 = v24;
LABEL_49:
            [v43 sendEvent:v44 withPayload:v45];
            goto LABEL_52;
          case 5u:
            long long v74 = (void *)MEMORY[0x1E4F56658];
            v88[0] = @"numberOfSingleAssetSuggestionCreated";
            uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
            v89[0] = v22;
            v88[1] = @"editLoopCreated";
            uint64_t v83 = [NSNumber numberWithUnsignedInteger:v61];
            v89[1] = v83;
            v88[2] = @"editLongExposureCreated";
            uint64_t v23 = [NSNumber numberWithUnsignedInteger:v62];
            v89[2] = v23;
            v88[3] = @"editBounceCreated";
            uint64_t v24 = [NSNumber numberWithUnsignedInteger:v63];
            v89[3] = v24;
            v88[4] = @"editPortraitStudioLightCreated";
            uint64_t v71 = [NSNumber numberWithUnsignedInteger:v64];
            v89[4] = v71;
            v88[5] = @"outstanderCreated";
            v79 = [NSNumber numberWithUnsignedInteger:v77];
            v89[5] = v79;
            v88[6] = @"recentFavoriteCreated";
            v68 = [NSNumber numberWithUnsignedInteger:v56];
            v89[6] = v68;
            v88[7] = @"recentEditCreated";
            id v46 = [NSNumber numberWithUnsignedInteger:v57];
            v89[7] = v46;
            v88[8] = @"recentAestheticsCreated";
            uint64_t v47 = [NSNumber numberWithUnsignedInteger:v58];
            v89[8] = v47;
            v88[9] = @"recentPersonCentricCreated";
            id v48 = [NSNumber numberWithUnsignedInteger:v59];
            v89[9] = v48;
            v88[10] = @"recentSocialGroupCentricCreated";
            uint64_t v49 = [NSNumber numberWithUnsignedInteger:v60];
            v89[10] = v49;
            v88[11] = @"longtailCreated";
            uint64_t v50 = [NSNumber numberWithUnsignedInteger:v75];
            v89[11] = v50;
            uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:12];
            [v74 sendEvent:@"com.apple.Photos.suggestion.singleAsset" withPayload:v51];

            id v5 = v80;
            uint64_t v21 = v54;

            long long v31 = (void *)v83;
            long long v32 = (void *)v71;
LABEL_51:

LABEL_52:
            break;
          default:
            break;
        }

        return;
      case 2:
        switch(v14)
        {
          case 201:
            ++v61;
            break;
          case 202:
            ++v62;
            break;
          case 203:
            ++v63;
            break;
          case 204:
            ++v64;
            break;
          default:
            goto LABEL_24;
        }
        goto LABEL_24;
      case 3:
        switch(v14)
        {
          case 301:
            ++v56;
            break;
          case 302:
            ++v57;
            break;
          case 303:
            ++v58;
            break;
          case 304:
            ++v59;
            break;
          case 305:
            ++v60;
            break;
          case 306:
            ++v55;
            break;
          default:
            goto LABEL_24;
        }
        goto LABEL_24;
      case 4:
        ++v8;
        goto LABEL_24;
      case 5:
        if (v14 == 502)
        {
          ++v75;
        }
        else if (v14 == 501)
        {
          ++v77;
        }
        goto LABEL_24;
      default:
        goto LABEL_24;
    }
  }
}

- (void)recordDeletedSuggestions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 type] != 1 && !objc_msgSend(v10, "state")) {
          ++v7;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
    if (v7)
    {
      uint64_t v11 = [(PHASuggestionController *)self graphManager];
      uint64_t v12 = [v11 analytics];
      uint64_t v19 = @"singleAssetSuggestionNotConsumed";
      int v13 = [NSNumber numberWithUnsignedInteger:v7];
      uint64_t v20 = v13;
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [v12 sendEvent:@"com.apple.Photos.suggestion.singleAssetSuggestionNotConsumed" withPayload:v14];
    }
  }
}

- (void)recordRetiredSuggestions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v13 = [v12 type];
        int v14 = [v12 state];
        if (v13 == 1 && v14 == 1)
        {
          int v16 = [v12 notificationState];
          if (v16 == 2)
          {
            ++v8;
          }
          else if (v16 == 1)
          {
            ++v9;
          }
          else
          {
            ++v7;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v6);
    if (v9) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  if (v8 || v7)
  {
LABEL_23:
    long long v17 = [(PHASuggestionController *)self graphManager];
    long long v18 = [v17 analytics];
    v27[0] = @"ignoredNotifications";
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:v9];
    v28[0] = v19;
    v27[1] = @"ignoredNotifiedSuggestion";
    uint64_t v20 = [NSNumber numberWithUnsignedInteger:v8];
    v28[1] = v20;
    v27[2] = @"sharingSuggestionIgnored";
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:v7];
    v28[2] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    [v18 sendEvent:@"com.apple.Photos.suggestion.retired" withPayload:v22];
  }
}

@end