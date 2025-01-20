@interface PXTimelineDataSource
+ (BOOL)_momentIsLocationTypeAtWork:(id)a3;
- (BOOL)_isAcceptableUserFeedbackForAssetCollection:(id)a3 personUUIDs:(id)a4 asset:(id)a5;
- (NSDictionary)keyAssetByFeaturedPhotoLocalIdentifier;
- (NSDictionary)keyAssetByMemoryLocalIdentifier;
- (NSDictionary)suggestedCropByFeaturedPhotoLocalIdentifier;
- (NSMutableArray)featuredPhotoCandidates;
- (NSMutableArray)filteredContent;
- (NSMutableArray)memoryCandidates;
- (NSString)sourceIdentifier;
- (PHFetchResult)featuredMemories;
- (PHPhotoLibrary)photoLibrary;
- (PHUserFeedbackCalculator)userFeedbackCalculator;
- (PXTimelineDataSource)init;
- (PXTimelineDataSource)initWithAlbumLocalIdentifier:(id)a3 widgetIdentifier:(id)a4 widgetSize:(CGSize)a5 photoLibrary:(id)a6;
- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3;
- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3 forWidgetSize:(CGSize)a4;
- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3 options:(id)a4;
- (PXTimelineDataSourceOptions)options;
- (id)_defaultSortDescriptorsForMemories;
- (id)_defaultSortDescriptorsForSuggestions;
- (id)_fetchFallbackMemoriesAndSetFeatured;
- (id)_fetchFallbackSuggestionsAndSetFeatured;
- (id)_fetchMemoriesWithFeaturedState:(int64_t)a3;
- (id)_fetchMemoriesWithFeaturedState:(int64_t)a3 fetchLimit:(unint64_t)a4;
- (id)_fetchMomentByAssetUUIDForAssets:(id)a3;
- (id)_fetchSuggestionsWithFeaturedState:(unsigned __int16)a3;
- (id)_fetchSuggestionsWithFeaturedState:(unsigned __int16)a3 fetchLimit:(unint64_t)a4;
- (id)_gatedCropSpecBySuggestionLocalIdentiferFromSuggestions:(id)a3;
- (id)_gatedKeyAssetByMemoryLocalIdentifierWithMemories:(id)a3;
- (id)_gatedKeyAssetBySuggestionLocalIdentifierWithSuggestions:(id)a3;
- (id)keyAssetFetchOptions;
- (unint64_t)sourceType;
- (unint64_t)widgetSizeClass;
- (void)_initializeFeaturedCandidatesWithMemoryResult:(id)a3 suggestionResult:(id)a4;
- (void)_initializeWithForceEntryUUID:(id)a3;
- (void)setFeaturedPhotoCandidates:(id)a3;
- (void)setFilteredContent:(id)a3;
- (void)setMemoryCandidates:(id)a3;
- (void)setOptions:(id)a3;
- (void)setUserFeedbackCalculator:(id)a3;
@end

@implementation PXTimelineDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_filteredContent, 0);
  objc_storeStrong((id *)&self->_featuredPhotoCandidates, 0);
  objc_storeStrong((id *)&self->_memoryCandidates, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_featuredMemories, 0);
  objc_storeStrong((id *)&self->_suggestedCropByFeaturedPhotoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAssetByFeaturedPhotoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAssetByMemoryLocalIdentifier, 0);
}

- (void)setOptions:(id)a3
{
}

- (PXTimelineDataSourceOptions)options
{
  return self->_options;
}

- (void)setUserFeedbackCalculator:(id)a3
{
}

- (PHUserFeedbackCalculator)userFeedbackCalculator
{
  return self->_userFeedbackCalculator;
}

- (void)setFilteredContent:(id)a3
{
}

- (NSMutableArray)filteredContent
{
  return self->_filteredContent;
}

- (void)setFeaturedPhotoCandidates:(id)a3
{
}

- (NSMutableArray)featuredPhotoCandidates
{
  return self->_featuredPhotoCandidates;
}

- (void)setMemoryCandidates:(id)a3
{
}

- (NSMutableArray)memoryCandidates
{
  return self->_memoryCandidates;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (PHFetchResult)featuredMemories
{
  return self->_featuredMemories;
}

- (unint64_t)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (NSDictionary)suggestedCropByFeaturedPhotoLocalIdentifier
{
  return self->_suggestedCropByFeaturedPhotoLocalIdentifier;
}

- (NSDictionary)keyAssetByFeaturedPhotoLocalIdentifier
{
  return self->_keyAssetByFeaturedPhotoLocalIdentifier;
}

- (NSDictionary)keyAssetByMemoryLocalIdentifier
{
  return self->_keyAssetByMemoryLocalIdentifier;
}

- (id)_gatedCropSpecBySuggestionLocalIdentiferFromSuggestions:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PXTimelineDataSourceOptions *)self->_options widgetSize];
  double v7 = v6;
  double v8 = v5;
  BOOL v9 = v6 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v9 || ![v4 count])
  {
    id v67 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v62 = [NSString stringWithFormat:@"{%.f, %.f}", *(void *)&v7, *(void *)&v8];
    PLTimelineGetLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Gate - SuggestedCrop", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v13 = PLMemoriesGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v77 = 0x3FD999999999999ALL;
      __int16 v78 = 2112;
      uint64_t v79 = (uint64_t)v62;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Start filtering suggestions with minimum cropScore:%f, widgetSize:%@", buf, 0x16u);
    }

    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v61 = v4;
    obuint64_t j = v4;
    uint64_t v14 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v73 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          v19 = [v18 localIdentifier];
          v20 = [(PXTimelineDataSource *)self keyAssetByFeaturedPhotoLocalIdentifier];
          v21 = [v20 objectForKeyedSubscript:v19];

          if (v21)
          {
            v22 = +[PXTimelineCrop cropForAsset:withTargetSize:](PXTimelineCrop, "cropForAsset:withTargetSize:", v21, v7, v8);
            [v67 setObject:v22 forKeyedSubscript:v19];
            [v22 cropScore];
            if (v23 < 0.4)
            {
              v24 = [[PXTimelineDataItem alloc] initWithAssetCollection:v18 suggestedCrop:v22];
              [v63 addObject:v24];
            }
          }
          else
          {
            v22 = PLMemoriesGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v77 = (uint64_t)v19;
              _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "Suggestion key asset is nil: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v15);
    }

    v25 = PLMemoriesGetLog();
    v26 = v63;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v63 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v77 = v27;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEFAULT, "Found %lu suggestions with low crop score", buf, 0xCu);
    }

    if ([v63 count])
    {
      id v28 = v63;
      unint64_t v29 = (uint64_t)((double)(unint64_t)[obj count] * 0.25);
      v30 = v28;
      if ([v28 count] > v29)
      {
        v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"suggestedCrop.cropScore" ascending:1];
        v83 = v31;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
        [v28 sortUsingDescriptors:v32];

        v30 = objc_msgSend(v28, "subarrayWithRange:", 0, v29);
      }
      v33 = PLMemoriesGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [v28 count];
        uint64_t v35 = [v30 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v77 = v34;
        __int16 v78 = 2048;
        uint64_t v79 = v35;
        _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_DEFAULT, "BadCrop - Suggestions:%lu, Removed:%lu\n", buf, 0x16u);
      }

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v36 = v30;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v68 objects:v82 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v65 = *(void *)v69;
        v64 = v36;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v69 != v65) {
              objc_enumerationMutation(v64);
            }
            v40 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            v41 = [v40 assetCollection];
            v42 = [v41 localIdentifier];
            v43 = [(PXTimelineDataSource *)self keyAssetByFeaturedPhotoLocalIdentifier];
            v44 = [v43 objectForKeyedSubscript:v42];

            unint64_t v45 = [(PXTimelineDataSource *)self sourceType];
            v46 = [PXTimelineEntry alloc];
            if (v45 == 1)
            {
              v47 = [(PXTimelineDataSource *)self sourceIdentifier];
              v48 = [v40 suggestedCrop];
              v49 = [(PXTimelineEntry *)v46 initWithAlbumFeaturedPhoto:v41 localAlbumIdentifier:v47 andFeaturedPhotoKeyAsset:v44 suggestedCrop:v48];
            }
            else
            {
              v47 = [v40 suggestedCrop];
              v49 = [(PXTimelineEntry *)v46 initWithFeaturedPhoto:v41 andFeaturedPhotoKeyAsset:v44 suggestedCrop:v47];
            }

            [(PXTimelineEntry *)v49 setRejectReason:3];
            if (v49)
            {
              v50 = [(PXTimelineDataSource *)self filteredContent];
              [v50 addObject:v49];
            }
            [obj removeObject:v41];
            [v67 setObject:0 forKeyedSubscript:v42];
            v51 = PLMemoriesGetLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v52 = [v41 localIdentifier];
              v53 = [v40 suggestedCrop];
              *(_DWORD *)buf = 138543874;
              uint64_t v77 = (uint64_t)v52;
              __int16 v78 = 2114;
              uint64_t v79 = (uint64_t)v62;
              __int16 v80 = 2114;
              v81 = v53;
              _os_log_impl(&dword_1A9AE7000, v51, OS_LOG_TYPE_DEFAULT, "Removed:%{public}@ displaySize:%{public}@ suggestedCrop:%{public}@", buf, 0x20u);
            }
          }
          v36 = v64;
          uint64_t v38 = [v64 countByEnumeratingWithState:&v68 objects:v82 count:16];
        }
        while (v38);
      }

      PLTimelineGetLog();
      v54 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v54, self);
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v56 = v55;
        if (os_signpost_enabled(v54))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v54, OS_SIGNPOST_INTERVAL_END, v56, "Gate - SuggestedCrop", " enableTelemetry=YES ", buf, 2u);
        }
      }

      id v4 = v61;
      v26 = v63;
    }
    else
    {
      PLTimelineGetLog();
      v57 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v58 = os_signpost_id_make_with_pointer(v57, self);
      if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v59 = v58;
        if (os_signpost_enabled(v57))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v57, OS_SIGNPOST_INTERVAL_END, v59, "Gate - SuggestedCrop", " enableTelemetry=YES ", buf, 2u);
        }
      }

      v36 = PLMemoriesGetLog();
      id v4 = v61;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v36, OS_LOG_TYPE_DEFAULT, "BadCrop - Suggestions:0, Removed:0\n", buf, 2u);
      }
    }
  }
  return v67;
}

- (BOOL)_isAcceptableUserFeedbackForAssetCollection:(id)a3 personUUIDs:(id)a4 asset:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_signpost_id_t v11 = [v10 uuid];
  v22 = v11;
  v23[0] = v9;
  os_signpost_id_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [(PXTimelineDataSource *)self userFeedbackCalculator];
    v21 = v11;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v13 scoreForAssetUUIDs:v14 personsUUIDsByAssetUUIDs:v12];
    double v16 = v15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v16 = *MEMORY[0x1E4F39860];
      goto LABEL_7;
    }
    v13 = [v8 blockableFeatures];
    uint64_t v14 = [(PXTimelineDataSource *)self userFeedbackCalculator];
    v17 = [v10 uuid];
    [v14 scoreForAssetUUIDs:MEMORY[0x1E4F1CBF0] keyAssetUUID:v17 personsUUIDsByAssetUUIDs:v12 memoryFeatures:v13];
    double v16 = v18;
  }
LABEL_7:
  char v19 = [MEMORY[0x1E4F39338] score:v16 meetsScoreThreshold:*MEMORY[0x1E4F39848]];

  return v19;
}

- (id)_fetchMomentByAssetUUIDForAssets:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PLTimelineGetLog();
  double v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Fetch - MomentsForAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [(PXTimelineDataSource *)self photoLibrary];
  uint64_t v10 = [v9 librarySpecificFetchOptions];

  v42 = (void *)v10;
  os_signpost_id_t v11 = [MEMORY[0x1E4F391A0] fetchMomentUUIDByAssetUUIDForAssets:v4 options:v10];
  os_signpost_id_t v12 = [v11 allValues];
  ptr = self;
  v13 = [(PXTimelineDataSource *)self photoLibrary];
  uint64_t v14 = [v13 librarySpecificFetchOptions];

  objc_msgSend(v14, "setFetchLimit:", objc_msgSend(v12, "count"));
  v41 = v12;
  double v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v12];
  [v14 setPredicate:v15];

  v40 = v14;
  double v16 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v14];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v24 = [v23 uuid];
        [v17 setObject:v23 forKeyedSubscript:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v20);
  }
  v39 = v18;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v25 = v4;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v31 = [v30 uuid];
        v32 = [v11 objectForKeyedSubscript:v31];

        v33 = [v17 objectForKeyedSubscript:v32];
        uint64_t v34 = [v30 uuid];
        [v8 setObject:v33 forKeyedSubscript:v34];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v27);
  }

  PLTimelineGetLog();
  uint64_t v35 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v36 = os_signpost_id_make_with_pointer(v35, ptr);
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v37 = v36;
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v35, OS_SIGNPOST_INTERVAL_END, v37, "Fetch - MomentsForAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v8;
}

- (id)_gatedKeyAssetBySuggestionLocalIdentifierWithSuggestions:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v4 count])
  {
    PLTimelineGetLog();
    double v5 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Fetch & Gate - SuggestionKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    uint64_t v8 = [(PXTimelineDataSource *)self keyAssetFetchOptions];
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v50 = (void *)v8;
    id v9 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v4 options:v8];
    uint64_t v10 = [v9 allValues];
    os_signpost_id_t v58 = [(PXTimelineDataSource *)self _fetchMomentByAssetUUIDForAssets:v10];
    id v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v67 != v13) {
            objc_enumerationMutation(obj);
          }
          double v15 = [*(id *)(*((void *)&v66 + 1) + 8 * i) uuid];
          [v61 addObject:v15];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v12);
    }

    double v16 = (void *)MEMORY[0x1E4F391F0];
    id v17 = [(PXTimelineDataSource *)self photoLibrary];
    id v18 = [v17 librarySpecificFetchOptions];
    v57 = [v16 fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v61 options:v18];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v51 = v4;
    id v55 = v4;
    uint64_t v19 = [v55 countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v60 = *(void *)v63;
      os_signpost_id_t v59 = self;
      v52 = v9;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v63 != v60) {
            objc_enumerationMutation(v55);
          }
          v22 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          double v23 = [v22 uuid];
          v24 = [v9 objectForKeyedSubscript:v23];

          if (v24)
          {
            id v25 = [v24 uuid];
            uint64_t v26 = [v58 objectForKeyedSubscript:v25];

            uint64_t v27 = [v24 uuid];
            uint64_t v28 = [v57 objectForKeyedSubscript:v27];
            unint64_t v29 = (void *)v28;
            v30 = (void *)MEMORY[0x1E4F1CBF0];
            if (v28) {
              v30 = (void *)v28;
            }
            id v31 = v30;

            if ([(PXTimelineDataSource *)self sourceType] == 1)
            {
LABEL_21:
              v32 = [v22 localIdentifier];
              [v54 setObject:v24 forKeyedSubscript:v32];
            }
            else
            {
              if ([MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:v24])
              {
                if ([(id)objc_opt_class() _momentIsLocationTypeAtWork:v26])
                {
                  uint64_t v34 = 2;
                }
                else
                {
                  if ([(PXTimelineDataSource *)self _isAcceptableUserFeedbackForAssetCollection:v22 personUUIDs:v31 asset:v24])
                  {
                    goto LABEL_21;
                  }
                  uint64_t v34 = 4;
                }
              }
              else
              {
                uint64_t v34 = 1;
              }
              [v53 addObject:v22];
              uint64_t v35 = [(PXTimelineDataSource *)v59 sourceType];
              os_signpost_id_t v36 = [PXTimelineEntry alloc];
              os_signpost_id_t v37 = v36;
              if (v35 == 1)
              {
                uint64_t v38 = [(PXTimelineDataSource *)v59 sourceIdentifier];
                v32 = [(PXTimelineEntry *)v37 initWithAlbumFeaturedPhoto:v22 localAlbumIdentifier:v38 andFeaturedPhotoKeyAsset:v24 suggestedCrop:0];
              }
              else
              {
                v32 = [(PXTimelineEntry *)v36 initWithFeaturedPhoto:v22 andFeaturedPhotoKeyAsset:v24];
              }
              [(PXTimelineEntry *)v32 setRejectReason:v34];
              id v9 = v52;
              if (v32)
              {
                v39 = [(PXTimelineDataSource *)v59 filteredContent];
                [v39 addObject:v32];
              }
              v40 = PLMemoriesGetLog();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                v41 = [v22 localIdentifier];
                v42 = +[PXTimelineEntry descriptionForRejectReason:v34];
                *(_DWORD *)buf = 138543618;
                uint64_t v71 = (uint64_t)v41;
                __int16 v72 = 2114;
                long long v73 = v42;
                _os_log_impl(&dword_1A9AE7000, v40, OS_LOG_TYPE_DEFAULT, "Suggestion %{public}@ is filtered from widget timeline with reason:%{public}@", buf, 0x16u);
              }
              self = v59;
            }

            goto LABEL_39;
          }
          uint64_t v26 = PLMemoriesGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v33 = [v22 localIdentifier];
            *(_DWORD *)buf = 138543362;
            uint64_t v71 = (uint64_t)v33;
            _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "Suggestion key asset is nil: %{public}@", buf, 0xCu);
          }
LABEL_39:
        }
        uint64_t v20 = [v55 countByEnumeratingWithState:&v62 objects:v74 count:16];
      }
      while (v20);
    }

    v43 = PLMemoriesGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = [v53 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v71 = v44;
      _os_log_impl(&dword_1A9AE7000, v43, OS_LOG_TYPE_DEFAULT, "NotSafeForDisplay - Suggestions:%lu\n", buf, 0xCu);
    }

    long long v45 = [(PXTimelineDataSource *)self featuredPhotoCandidates];
    [v45 removeObjectsInArray:v53];

    PLTimelineGetLog();
    long long v46 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v47 = os_signpost_id_make_with_pointer(v46, self);
    id v4 = v51;
    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v48 = v47;
      if (os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v46, OS_SIGNPOST_INTERVAL_END, v48, "Fetch & Gate - SuggestionKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }
  }
  return v54;
}

- (id)_gatedKeyAssetByMemoryLocalIdentifierWithMemories:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v4 count])
  {
    PLTimelineGetLog();
    double v5 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Fetch & Gate - MemoryKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    uint64_t v8 = [(PXTimelineDataSource *)self keyAssetFetchOptions];
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v40 = v4;
    obuint64_t j = v4;
    uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v46)
    {
      uint64_t v45 = *(void *)v50;
      v42 = v8;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v10, 0, v8, v40);
          uint64_t v12 = [v11 firstObject];
          uint64_t v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 uuid];
            double v15 = [(PXTimelineDataSource *)self photoLibrary];
            double v16 = [v15 librarySpecificFetchOptions];

            id v17 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
            [v16 setIncludedDetectionTypes:v17];

            id v18 = (void *)MEMORY[0x1E4F391F0];
            v57 = v14;
            uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
            uint64_t v20 = [v18 fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v19 options:v16];

            os_signpost_id_t v48 = v20;
            uint64_t v21 = [v20 objectForKeyedSubscript:v14];
            v22 = (void *)v21;
            double v23 = (void *)MEMORY[0x1E4F1CBF0];
            if (v21) {
              double v23 = (void *)v21;
            }
            id v24 = v23;

            uint64_t v25 = 1;
            os_signpost_id_t v47 = v24;
            if ([MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:v13])
            {
              if ([(PXTimelineDataSource *)self _isAcceptableUserFeedbackForAssetCollection:v10 personUUIDs:v24 asset:v13])
              {
                uint64_t v26 = [v10 localIdentifier];
                [v41 setObject:v13 forKeyedSubscript:v26];
LABEL_24:

                goto LABEL_25;
              }
              uint64_t v25 = 4;
            }
            uint64_t v28 = self;
            [v43 addObject:v10];
            uint64_t v26 = [[PXTimelineEntry alloc] initWithMemory:v10 andMemoryKeyAsset:v13];
            [(PXTimelineEntry *)v26 setRejectReason:v25];
            if (v26)
            {
              unint64_t v29 = [(PXTimelineDataSource *)self filteredContent];
              [v29 addObject:v26];
            }
            v30 = PLMemoriesGetLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              id v31 = [v10 localIdentifier];
              v32 = +[PXTimelineEntry descriptionForRejectReason:v25];
              *(_DWORD *)buf = 138543618;
              uint64_t v54 = (uint64_t)v31;
              __int16 v55 = 2114;
              os_signpost_id_t v56 = v32;
              _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEFAULT, "Memory %{public}@ is filtered from widget timeline with reason:%{public}@", buf, 0x16u);
            }
            self = v28;
            uint64_t v8 = v42;
            goto LABEL_24;
          }
          uint64_t v14 = PLMemoriesGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = [v10 localIdentifier];
            *(_DWORD *)buf = 138543362;
            uint64_t v54 = (uint64_t)v27;
            _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Memory key asset is nil: %{public}@", buf, 0xCu);
          }
LABEL_25:
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v46);
    }

    v33 = PLMemoriesGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v43 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v54 = v34;
      _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_DEFAULT, "NotSafeForDisplay - Memories:%lu\n", buf, 0xCu);
    }

    uint64_t v35 = [(PXTimelineDataSource *)self memoryCandidates];
    [v35 removeObjectsInArray:v43];

    PLTimelineGetLog();
    os_signpost_id_t v36 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v36, self);
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v38 = v37;
      if (os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v36, OS_SIGNPOST_INTERVAL_END, v38, "Fetch & Gate - MemoryKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    id v4 = v40;
  }

  return v41;
}

- (id)keyAssetFetchOptions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PXTimelineDataSource *)self photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  uint64_t v4 = *MEMORY[0x1E4F39538];
  v7[0] = *MEMORY[0x1E4F394A8];
  v7[1] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [v3 setFetchPropertySets:v5];

  [v3 setFetchLimit:1];
  [v3 setWantsIncrementalChangeDetails:0];
  [v3 setIncludeGuestAssets:1];
  return v3;
}

- (id)_fetchFallbackSuggestionsAndSetFeatured
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  PLTimelineGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Fetch - FallbackSuggestionsAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  os_signpost_id_t v6 = [(PXTimelineDataSource *)self _fetchSuggestionsWithFeaturedState:0 fetchLimit:10];
  if ([v6 count])
  {
    os_signpost_id_t v7 = [(PXTimelineDataSource *)self photoLibrary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__PXTimelineDataSource__fetchFallbackSuggestionsAndSetFeatured__block_invoke;
    v19[3] = &unk_1E5DD36F8;
    id v8 = v6;
    id v20 = v8;
    id v18 = 0;
    char v9 = [v7 performChangesAndWait:v19 error:&v18];
    uint64_t v10 = v18;

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = PLMemoriesGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Setting featureState on suggestions - failed: %@", buf, 0xCu);
      }
    }
    uint64_t v12 = PLMemoriesGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v8 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Using fallback: %d suggestions", buf, 8u);
    }
  }
  else
  {
    uint64_t v10 = PLMemoriesGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "No fallback suggestions", buf, 2u);
    }
  }

  PLTimelineGetLog();
  uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v16, "Fetch - FallbackSuggestionsAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v6;
}

void __63__PXTimelineDataSource__fetchFallbackSuggestionsAndSetFeatured__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        os_signpost_id_t v6 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setFeaturedState:1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)_fetchFallbackMemoriesAndSetFeatured
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  PLTimelineGetLog();
  uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Fetch - FallbackMemoriesAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  os_signpost_id_t v6 = [(PXTimelineDataSource *)self _fetchMemoriesWithFeaturedState:0 fetchLimit:3];
  if ([v6 count])
  {
    long long v7 = [(PXTimelineDataSource *)self photoLibrary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__PXTimelineDataSource__fetchFallbackMemoriesAndSetFeatured__block_invoke;
    v19[3] = &unk_1E5DD36F8;
    id v8 = v6;
    id v20 = v8;
    id v18 = 0;
    char v9 = [v7 performChangesAndWait:v19 error:&v18];
    long long v10 = v18;

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = PLMemoriesGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Setting featureState on memories - failed: %@", buf, 0xCu);
      }
    }
    uint64_t v12 = PLMemoriesGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v8 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Using fallback: %d memories", buf, 8u);
    }
  }
  else
  {
    long long v10 = PLMemoriesGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "No fallback memories", buf, 2u);
    }
  }

  PLTimelineGetLog();
  uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v16, "Fetch - FallbackMemoriesAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v6;
}

void __60__PXTimelineDataSource__fetchFallbackMemoriesAndSetFeatured__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        os_signpost_id_t v6 = objc_msgSend(MEMORY[0x1E4F39170], "changeRequestForMemory:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setFeaturedState:1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)_fetchSuggestionsWithFeaturedState:(unsigned __int16)a3 fetchLimit:(unint64_t)a4
{
  uint64_t v5 = a3;
  PLTimelineGetLog();
  long long v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetch - SuggestionsWithFeaturedState", " enableTelemetry=YES ", buf, 2u);
    }
  }

  long long v10 = [(PXTimelineDataSource *)self photoLibrary];
  uint64_t v11 = [v10 librarySpecificFetchOptions];
  [v11 setFetchLimit:a4];
  [v11 setWantsIncrementalChangeDetails:0];
  uint64_t v12 = [(PXTimelineDataSource *)self _defaultSortDescriptorsForSuggestions];
  [v11 setSortDescriptors:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K == %d || %K == %d)", @"state", 1, @"state", 0);
  [v13 addObject:v14];

  os_signpost_id_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"subtype", 302);
  [v13 addObject:v15];

  os_signpost_id_t v16 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v10];
  if (([v16 showUnsavedSyndicatedContentInFeaturedPhotos] & 1) == 0)
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"subtype", 306);
    [v13 addObject:v17];
  }
  id v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
  [v11 setPredicate:v18];

  uint64_t v19 = [MEMORY[0x1E4F39310] fetchWidgetSuggestionsWithFeaturedState:v5 withOptions:v11];
  PLTimelineGetLog();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)id v24 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v20, OS_SIGNPOST_INTERVAL_END, v22, "Fetch - SuggestionsWithFeaturedState", " enableTelemetry=YES ", v24, 2u);
    }
  }

  return v19;
}

- (id)_fetchSuggestionsWithFeaturedState:(unsigned __int16)a3
{
  return [(PXTimelineDataSource *)self _fetchSuggestionsWithFeaturedState:a3 fetchLimit:20];
}

- (id)_fetchMemoriesWithFeaturedState:(int64_t)a3 fetchLimit:(unint64_t)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  PLTimelineGetLog();
  long long v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetch - MemoriesWithFeaturedState", " enableTelemetry=YES ", buf, 2u);
    }
  }

  long long v10 = [(PXTimelineDataSource *)self photoLibrary];
  uint64_t v11 = [v10 librarySpecificFetchOptions];

  [v11 setFetchLimit:a4];
  [v11 setWantsIncrementalChangeDetails:1];
  [v11 setIncludePendingMemories:1];
  uint64_t v12 = [(PXTimelineDataSource *)self _defaultSortDescriptorsForMemories];
  [v11 setSortDescriptors:v12];

  id v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"featuredState == %d", a3);
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"rejected == NO AND userCreated == NO"];
  os_signpost_id_t v15 = (void *)MEMORY[0x1E4F28BA0];
  v24[0] = v13;
  v24[1] = v14;
  os_signpost_id_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v17 = [v15 andPredicateWithSubpredicates:v16];
  [v11 setPredicate:v17];

  id v18 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v11];
  PLTimelineGetLog();
  uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_END, v21, "Fetch - MemoriesWithFeaturedState", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v18;
}

- (id)_fetchMemoriesWithFeaturedState:(int64_t)a3
{
  return [(PXTimelineDataSource *)self _fetchMemoriesWithFeaturedState:a3 fetchLimit:20];
}

- (id)_defaultSortDescriptorsForSuggestions
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_defaultSortDescriptorsForMemories
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)_initializeFeaturedCandidatesWithMemoryResult:(id)a3 suggestionResult:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = PLMemoriesGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218240;
    uint64_t v25 = [v6 count];
    __int16 v26 = 2048;
    uint64_t v27 = [v7 count];
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Candidate For Scheduling - Memories:%lu, Suggestions:%lu\n", (uint8_t *)&v24, 0x16u);
  }

  os_signpost_id_t v9 = (void *)MEMORY[0x1E4F1CA48];
  long long v10 = [v6 fetchedObjects];
  uint64_t v11 = [v9 arrayWithArray:v10];
  memoryCandidates = self->_memoryCandidates;
  self->_memoryCandidates = v11;

  id v13 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v14 = [v7 fetchedObjects];
  os_signpost_id_t v15 = [v13 arrayWithArray:v14];
  featuredPhotoCandidates = self->_featuredPhotoCandidates;
  self->_featuredPhotoCandidates = v15;

  if ([(PXTimelineDataSourceOptions *)self->_options includeAssets])
  {
    id v17 = [(PXTimelineDataSource *)self _gatedKeyAssetByMemoryLocalIdentifierWithMemories:v6];
    keyAssetByMemoryLocalIdentifier = self->_keyAssetByMemoryLocalIdentifier;
    self->_keyAssetByMemoryLocalIdentifier = v17;

    uint64_t v19 = [(PXTimelineDataSource *)self _gatedKeyAssetBySuggestionLocalIdentifierWithSuggestions:v7];
    keyAssetByFeaturedPhotoLocalIdentifier = self->_keyAssetByFeaturedPhotoLocalIdentifier;
    self->_keyAssetByFeaturedPhotoLocalIdentifier = v19;

    os_signpost_id_t v21 = [(PXTimelineDataSource *)self featuredPhotoCandidates];
    os_signpost_id_t v22 = [(PXTimelineDataSource *)self _gatedCropSpecBySuggestionLocalIdentiferFromSuggestions:v21];
    suggestedCropByFeaturedPhotoLocalIdentifier = self->_suggestedCropByFeaturedPhotoLocalIdentifier;
    self->_suggestedCropByFeaturedPhotoLocalIdentifier = v22;
  }
}

- (void)_initializeWithForceEntryUUID:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXTimelineDataSource *)self photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  [v6 setFetchLimit:1];
  [v6 setWantsIncrementalChangeDetails:0];
  [v6 setIncludePendingMemories:1];
  id v7 = [MEMORY[0x1E4F39160] localIdentifierWithUUID:v4];
  os_signpost_id_t v8 = (void *)MEMORY[0x1E4F38EE8];
  v21[0] = v7;
  os_signpost_id_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  long long v10 = [v8 fetchAssetCollectionsWithLocalIdentifiers:v9 options:v6];
  featuredMemories = self->_featuredMemories;
  self->_featuredMemories = v10;

  if ([(PHFetchResult *)self->_featuredMemories count])
  {
    uint64_t v12 = PLMemoriesGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Using forced memory with uuid: %@", buf, 0xCu);
    }

    id v13 = objc_alloc_init(MEMORY[0x1E4F390B0]);
  }
  else
  {
    uint64_t v14 = [(PXTimelineDataSource *)self photoLibrary];
    os_signpost_id_t v15 = [v14 librarySpecificFetchOptions];

    [v15 setFetchLimit:1];
    [v15 setWantsIncrementalChangeDetails:0];
    os_signpost_id_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"uuid", v4];
    [v15 setPredicate:v16];

    id v13 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v15];
    if ([v13 count])
    {
      id v17 = PLMemoriesGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "Using forced suggestion with uuid: %@", buf, 0xCu);
      }
    }
    id v6 = v15;
  }
  [(PXTimelineDataSource *)self _initializeFeaturedCandidatesWithMemoryResult:self->_featuredMemories suggestionResult:v13];
  if (!-[PHFetchResult count](self->_featuredMemories, "count") && ![v13 count])
  {
    id v18 = PLMemoriesGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "Forced entry was not found: %@", buf, 0xCu);
    }
  }
}

- (PXTimelineDataSource)initWithAlbumLocalIdentifier:(id)a3 widgetIdentifier:(id)a4 widgetSize:(CGSize)a5 photoLibrary:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (NSString *)a3;
  id v13 = a4;
  id v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)PXTimelineDataSource;
  os_signpost_id_t v15 = [(PXTimelineDataSource *)&v35 init];
  if (v15)
  {
    os_signpost_id_t v16 = -[PXTimelineDataSourceOptions initForWidgetWithSize:]([PXTimelineDataSourceOptions alloc], "initForWidgetWithSize:", width, height);
    options = v15->_options;
    v15->_options = v16;

    objc_storeWeak((id *)&v15->_photoLibrary, v14);
    id v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    filteredContent = v15->_filteredContent;
    v15->_filteredContent = v18;

    v15->_unint64_t sourceType = 1;
    objc_storeStrong((id *)&v15->_sourceIdentifier, a3);
    id v20 = objc_alloc(MEMORY[0x1E4F39150]);
    os_signpost_id_t v21 = [(PXTimelineDataSource *)v15 photoLibrary];
    uint64_t v22 = [v20 initWithObjects:MEMORY[0x1E4F1CBF0] photoLibrary:v21 fetchType:*MEMORY[0x1E4F39668] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
    featuredMemories = v15->_featuredMemories;
    v15->_featuredMemories = (PHFetchResult *)v22;

    int v24 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F8E888]) initWithAlbumLocalIdentifier:v12 widgetIdentifier:v13 photoLibrary:v14];
    [v25 removeSuggestionsNotRelevantForDate:v24];
    __int16 v26 = [v25 suggestions];
    [(PXTimelineDataSource *)v15 _initializeFeaturedCandidatesWithMemoryResult:0 suggestionResult:v26];
    if (![(NSMutableArray *)v15->_featuredPhotoCandidates count])
    {
      uint64_t v27 = PLMemoriesGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v37 = v12;
        _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_DEFAULT, "No suggestions for album %@, generating new", buf, 0xCu);
      }

      id v28 = (id)[v25 updatedSuggestionLocalIdentifiersForDate:v24 numberOfSuggestions:*MEMORY[0x1E4F8EAF8]];
      uint64_t v29 = [v25 suggestions];

      [(PXTimelineDataSource *)v15 _initializeFeaturedCandidatesWithMemoryResult:0 suggestionResult:v29];
      __int16 v26 = (void *)v29;
    }
    v30 = PLMemoriesGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      sourceIdentifier = v15->_sourceIdentifier;
      unint64_t sourceType = v15->_sourceType;
      int v33 = [v26 count];
      *(_DWORD *)buf = 138413570;
      os_signpost_id_t v37 = sourceIdentifier;
      __int16 v38 = 2112;
      id v39 = v13;
      __int16 v40 = 1024;
      int v41 = sourceType;
      __int16 v42 = 1024;
      int v43 = v33;
      __int16 v44 = 2048;
      double v45 = width;
      __int16 v46 = 2048;
      double v47 = height;
      _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEFAULT, "Initialized source id %@, widget id %@, type %d, with %d suggestions for widgetSize:{%.2f, %.2f}", buf, 0x36u);
    }
  }
  return v15;
}

- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PXTimelineDataSource;
  os_signpost_id_t v8 = [(PXTimelineDataSource *)&v46 init];
  if (v8)
  {
    PLTimelineGetLog();
    os_signpost_id_t v9 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v8);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Initialize - TimelineDataSource", " enableTelemetry=YES ", buf, 2u);
      }
    }

    uint64_t v12 = PLMemoriesGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v7 widgetSize];
      uint64_t v14 = v13;
      [v7 widgetSize];
      *(_DWORD *)buf = 134218240;
      uint64_t v48 = v14;
      __int16 v49 = 2048;
      uint64_t v50 = v15;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Prepare TimelineDataSource for WidgetSize:{%.2f, %.2f}:", buf, 0x16u);
    }

    objc_storeWeak((id *)&v8->_photoLibrary, v6);
    objc_storeStrong((id *)&v8->_options, a4);
    os_signpost_id_t v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    filteredContent = v8->_filteredContent;
    v8->_filteredContent = v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:v6];
    userFeedbackCalculator = v8->_userFeedbackCalculator;
    v8->_userFeedbackCalculator = (PHUserFeedbackCalculator *)v18;

    if (PFOSVariantHasInternalUI())
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
      os_signpost_id_t v21 = [v20 stringForKey:@"forceWidgetEntryUUID"];
    }
    else
    {
      os_signpost_id_t v21 = 0;
    }
    if ([v21 length])
    {
      [(PXTimelineDataSource *)v8 _initializeWithForceEntryUUID:v21];
    }
    else
    {
      if (PLIsFeaturedContentAllowed())
      {
        uint64_t v22 = [(PXTimelineDataSource *)v8 _fetchMemoriesWithFeaturedState:1];
        objc_storeStrong((id *)&v8->_featuredMemories, v22);
        if ([v7 includeSuggestions])
        {
          uint64_t v23 = [(PXTimelineDataSource *)v8 _fetchSuggestionsWithFeaturedState:1];
          int v24 = PLMemoriesGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = [v22 count];
            uint64_t v26 = [v23 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v48 = v25;
            __int16 v49 = 2048;
            uint64_t v50 = v26;
            _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEFAULT, "%lu memories and %lu suggestions are featured", buf, 0x16u);
          }
        }
        else
        {
          int v24 = PLMemoriesGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = [v22 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v48 = v35;
            _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEFAULT, "%lu memories featured with no suggestions", buf, 0xCu);
          }
          uint64_t v23 = 0;
        }

        [(PXTimelineDataSource *)v8 _initializeFeaturedCandidatesWithMemoryResult:v22 suggestionResult:v23];
        uint64_t v36 = [(NSMutableArray *)v8->_memoryCandidates count];
        if (!(v36 + [(NSMutableArray *)v8->_featuredPhotoCandidates count]))
        {
          os_signpost_id_t v37 = [(PXTimelineDataSource *)v8 _fetchFallbackMemoriesAndSetFeatured];
          objc_storeStrong((id *)&v8->_featuredMemories, v37);
          if ([v7 includeSuggestions])
          {
            __int16 v38 = [(PXTimelineDataSource *)v8 _fetchFallbackSuggestionsAndSetFeatured];
          }
          else
          {
            __int16 v38 = 0;
          }
          [(PXTimelineDataSource *)v8 _initializeFeaturedCandidatesWithMemoryResult:v37 suggestionResult:v38];
        }
        id v39 = PLMemoriesGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = [(NSMutableArray *)v8->_memoryCandidates count];
          uint64_t v41 = [(NSMutableArray *)v8->_featuredPhotoCandidates count];
          *(_DWORD *)buf = 134218240;
          uint64_t v48 = v40;
          __int16 v49 = 2048;
          uint64_t v50 = v41;
          _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_DEFAULT, "Used For Scheduling - Memories:%lu, Suggestions:%lu\n", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        memoryCandidates = v8->_memoryCandidates;
        v8->_memoryCandidates = v27;

        uint64_t v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        featuredPhotoCandidates = v8->_featuredPhotoCandidates;
        v8->_featuredPhotoCandidates = v29;

        id v31 = objc_alloc(MEMORY[0x1E4F39150]);
        v32 = [(PXTimelineDataSource *)v8 photoLibrary];
        uint64_t v33 = [v31 initWithObjects:MEMORY[0x1E4F1CBF0] photoLibrary:v32 fetchType:*MEMORY[0x1E4F39668] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
        featuredMemories = v8->_featuredMemories;
        v8->_featuredMemories = (PHFetchResult *)v33;

        uint64_t v22 = PLMemoriesGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "Featured Content is disabled", buf, 2u);
        }
      }
    }
    PLTimelineGetLog();
    __int16 v42 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v43 = os_signpost_id_make_with_pointer(v42, v8);
    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v44 = v43;
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v42, OS_SIGNPOST_INTERVAL_END, v44, "Initialize - TimelineDataSource", " enableTelemetry=YES ", buf, 2u);
      }
    }
  }
  return v8;
}

- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3 forWidgetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = -[PXTimelineDataSourceOptions initForWidgetWithSize:]([PXTimelineDataSourceOptions alloc], "initForWidgetWithSize:", width, height);
  os_signpost_id_t v9 = [(PXTimelineDataSource *)self initWithPhotoLibrary:v7 options:v8];

  return v9;
}

- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3
{
  return -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:](self, "initWithPhotoLibrary:forWidgetSize:", a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (PXTimelineDataSource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXTimelineDataSource.m", 101, @"%s is not available as initializer", "-[PXTimelineDataSource init]");

  abort();
}

+ (BOOL)_momentIsLocationTypeAtWork:(id)a3
{
  return [a3 processedLocation] == 4;
}

@end