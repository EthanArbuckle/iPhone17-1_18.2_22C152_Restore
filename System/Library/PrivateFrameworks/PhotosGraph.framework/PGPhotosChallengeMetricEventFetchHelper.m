@interface PGPhotosChallengeMetricEventFetchHelper
- (BOOL)_migrationStepNeededForTripTitlingQuestions:(id)a3;
- (BOOL)suggestsToStartSharedLibraryWithError:(id *)a3;
- (NSDictionary)activePersonUUIDByPersonUUID;
- (NSDictionary)assetByAssetIdentifier;
- (NSDictionary)assetByAssetSyndicationIdentifier;
- (NSDictionary)memoryByMemoryIdentifier;
- (NSDictionary)momentUUIDByAssetIdentifier;
- (NSDictionary)questionsByQuestionTypeByEntityType;
- (NSSet)dayHighlightAssetIdentifiers;
- (NSSet)momentUUIDsForExhaustiveMomentLabelingQuestion;
- (NSSet)tripKeyAssetIdentifiers;
- (PGPhotosChallengeMetricEventFetchHelper)initWithGraphManager:(id)a3;
- (PGSuggestionSession)featuredPhotosSuggestionSession;
- (id)initForTestingWithQuestions:(id)a3 assetsByAssetId:(id)a4 momentUUIDByAssetIdentifier:(id)a5 activePersonUUIDByPersonUUID:(id)a6 tripKeyAssetIdentifiers:(id)a7 momentUUIDsForExhaustiveMomentLabeling:(id)a8 dayHighlightAssetIdentifiers:(id)a9;
- (id)questionsForQuestionMetricType:(unsigned __int16)a3;
- (id)questionsForQuestionType:(unsigned __int16)a3 questionEntityTypes:(id)a4;
- (void)_buildQuestionsByQuestionTypeByEntityTypeFromQuestions:(id)a3;
- (void)_prefetchActivePersonUUIDByPersonUUID;
- (void)_prefetchAssetByAssetIdentifier;
- (void)_prefetchAssetByAssetSyndicationIdentifier;
- (void)_prefetchDayHighlightAssetIdentifiers;
- (void)_prefetchMemoryByMemoryIdentifier;
- (void)_prefetchMomentUUIDByAssetIdentifier;
- (void)_prefetchMomentUUIDsForExhaustiveMomentLabelingQuestion;
- (void)_prefetchQuestions;
- (void)_prefetchTripKeyAssetIdentifiers;
- (void)setActivePersonUUIDByPersonUUID:(id)a3;
- (void)setAssetByAssetIdentifier:(id)a3;
- (void)setAssetByAssetSyndicationIdentifier:(id)a3;
- (void)setDayHighlightAssetIdentifiers:(id)a3;
- (void)setFeaturedPhotosSuggestionSession:(id)a3;
- (void)setMemoryByMemoryIdentifier:(id)a3;
- (void)setMomentUUIDByAssetIdentifier:(id)a3;
- (void)setMomentUUIDsForExhaustiveMomentLabelingQuestion:(id)a3;
- (void)setQuestionsByQuestionTypeByEntityType:(id)a3;
- (void)setTripKeyAssetIdentifiers:(id)a3;
@end

@implementation PGPhotosChallengeMetricEventFetchHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayHighlightAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_tripKeyAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_memoryByMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_activePersonUUIDByPersonUUID, 0);
  objc_storeStrong((id *)&self->_momentUUIDByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetByAssetSyndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_momentUUIDsForExhaustiveMomentLabelingQuestion, 0);
  objc_storeStrong((id *)&self->_assetByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_featuredPhotosSuggestionSession, 0);
  objc_storeStrong((id *)&self->_questionsByQuestionTypeByEntityType, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setDayHighlightAssetIdentifiers:(id)a3
{
}

- (void)setTripKeyAssetIdentifiers:(id)a3
{
}

- (void)setMemoryByMemoryIdentifier:(id)a3
{
}

- (void)setActivePersonUUIDByPersonUUID:(id)a3
{
}

- (void)setMomentUUIDByAssetIdentifier:(id)a3
{
}

- (void)setAssetByAssetSyndicationIdentifier:(id)a3
{
}

- (void)setMomentUUIDsForExhaustiveMomentLabelingQuestion:(id)a3
{
}

- (void)setAssetByAssetIdentifier:(id)a3
{
}

- (void)setFeaturedPhotosSuggestionSession:(id)a3
{
}

- (PGSuggestionSession)featuredPhotosSuggestionSession
{
  return self->_featuredPhotosSuggestionSession;
}

- (void)setQuestionsByQuestionTypeByEntityType:(id)a3
{
}

- (NSDictionary)questionsByQuestionTypeByEntityType
{
  return self->_questionsByQuestionTypeByEntityType;
}

- (void)_prefetchDayHighlightAssetIdentifiers
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!self->_dayHighlightAssetIdentifiers)
  {
    v3 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v20[0] = *MEMORY[0x1E4F394A8];
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v3 setFetchPropertySets:v4];

    v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"highlightBeingKeyAssetPrivate.kind = %d || highlightBeingKeyAssetShared.kind = %d", 0, 0);
    [v3 setInternalPredicate:v5];

    v6 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v3];
    v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) uuid];
          [(NSSet *)v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    dayHighlightAssetIdentifiers = self->_dayHighlightAssetIdentifiers;
    self->_dayHighlightAssetIdentifiers = v7;
  }
}

- (NSSet)dayHighlightAssetIdentifiers
{
  dayHighlightAssetIdentifiers = self->_dayHighlightAssetIdentifiers;
  if (!dayHighlightAssetIdentifiers)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchDayHighlightAssetIdentifiers];
    dayHighlightAssetIdentifiers = self->_dayHighlightAssetIdentifiers;
  }
  return dayHighlightAssetIdentifiers;
}

- (void)_prefetchTripKeyAssetIdentifiers
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!self->_tripKeyAssetIdentifiers)
  {
    v3 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v20[0] = *MEMORY[0x1E4F394A8];
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v3 setFetchPropertySets:v4];

    v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"dayGroupHighlightBeingKeyAssetPrivate.type = %d || dayGroupHighlightBeingKeyAssetPrivate.type = %d", 1, 2);
    [v3 setInternalPredicate:v5];

    v6 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v3];
    v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) uuid];
          [(NSSet *)v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    tripKeyAssetIdentifiers = self->_tripKeyAssetIdentifiers;
    self->_tripKeyAssetIdentifiers = v7;
  }
}

- (NSSet)tripKeyAssetIdentifiers
{
  tripKeyAssetIdentifiers = self->_tripKeyAssetIdentifiers;
  if (!tripKeyAssetIdentifiers)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchTripKeyAssetIdentifiers];
    tripKeyAssetIdentifiers = self->_tripKeyAssetIdentifiers;
  }
  return tripKeyAssetIdentifiers;
}

- (void)_prefetchMemoryByMemoryIdentifier
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!self->_memoryByMemoryIdentifier)
  {
    v3 = [MEMORY[0x1E4F1CA80] set];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v29 = self;
    v4 = [(NSDictionary *)self->_questionsByQuestionTypeByEntityType objectForKeyedSubscript:&unk_1F28D1B90];
    v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v35 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = [*(id *)(*((void *)&v34 + 1) + 8 * j) entityIdentifier];
                [v3 addObject:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v7);
    }

    long long v17 = [(PHPhotoLibrary *)v29->_photoLibrary librarySpecificFetchOptions];
    long long v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN (%@)", v3];
    [v17 setPredicate:v18];

    v19 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v17];
    v20 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v30 + 1) + 8 * k);
          v27 = [v26 uuid];
          [(NSDictionary *)v20 setObject:v26 forKeyedSubscript:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v23);
    }

    memoryByMemoryIdentifier = v29->_memoryByMemoryIdentifier;
    v29->_memoryByMemoryIdentifier = v20;
  }
}

- (NSDictionary)memoryByMemoryIdentifier
{
  memoryByMemoryIdentifier = self->_memoryByMemoryIdentifier;
  if (!memoryByMemoryIdentifier)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchMemoryByMemoryIdentifier];
    memoryByMemoryIdentifier = self->_memoryByMemoryIdentifier;
  }
  return memoryByMemoryIdentifier;
}

- (void)_prefetchActivePersonUUIDByPersonUUID
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v36 = self;
  v4 = [(NSDictionary *)self->_questionsByQuestionTypeByEntityType objectForKeyedSubscript:&unk_1F28D1B78];
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v53 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v43 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [*(id *)(*((void *)&v42 + 1) + 8 * j) entityIdentifier];
              [v3 addObject:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v53 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v17 = [(PHPhotoLibrary *)v36->_photoLibrary librarySpecificFetchOptions];
  [v17 setPersonContext:5];
  long long v18 = (void *)MEMORY[0x1E4F391F0];
  v19 = [v3 allObjects];
  long long v35 = v17;
  v20 = [v18 fetchPersonsWithLocalIdentifiers:v19 options:v17];

  long long v37 = [(PHPhotoLibrary *)v36->_photoLibrary librarySpecificFetchOptions];
  id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(id *)(*((void *)&v38 + 1) + 8 * v26);
        v28 = [v27 uuid];
        if ([v27 verifiedType] == -2
          && ([MEMORY[0x1E4F391F0] fetchFinalMergeTargetPersonsForPersonWithUUID:v28 options:v37],
              v29 = objc_claimAutoreleasedReturnValue(),
              [v29 firstObject],
              uint64_t v30 = objc_claimAutoreleasedReturnValue(),
              v27,
              v29,
              (id v27 = (id)v30) == 0))
        {
          long long v32 = +[PGLogging sharedLogging];
          long long v31 = [v32 loggingConnection];

          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v28;
            _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "Failed to find final merge target person for person with UUID: '%@'", buf, 0xCu);
          }
          id v27 = 0;
        }
        else
        {
          long long v31 = [v27 uuid];
          [(NSDictionary *)v21 setObject:v31 forKeyedSubscript:v28];
        }

        ++v26;
      }
      while (v24 != v26);
      uint64_t v33 = [v22 countByEnumeratingWithState:&v38 objects:v52 count:16];
      uint64_t v24 = v33;
    }
    while (v33);
  }

  activePersonUUIDByPersonUUID = v36->_activePersonUUIDByPersonUUID;
  v36->_activePersonUUIDByPersonUUID = v21;
}

- (NSDictionary)activePersonUUIDByPersonUUID
{
  activePersonUUIDByPersonUUID = self->_activePersonUUIDByPersonUUID;
  if (!activePersonUUIDByPersonUUID)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchActivePersonUUIDByPersonUUID];
    activePersonUUIDByPersonUUID = self->_activePersonUUIDByPersonUUID;
  }
  return activePersonUUIDByPersonUUID;
}

- (void)_prefetchMomentUUIDByAssetIdentifier
{
  id v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v3 = (void *)MEMORY[0x1E4F391A0];
  v4 = [(PGPhotosChallengeMetricEventFetchHelper *)self assetByAssetIdentifier];
  v5 = [v4 allValues];
  uint64_t v6 = [v3 fetchMomentUUIDByAssetUUIDForAssets:v5 options:v8];
  momentUUIDByAssetIdentifier = self->_momentUUIDByAssetIdentifier;
  self->_momentUUIDByAssetIdentifier = v6;
}

- (NSDictionary)momentUUIDByAssetIdentifier
{
  momentUUIDByAssetIdentifier = self->_momentUUIDByAssetIdentifier;
  if (!momentUUIDByAssetIdentifier)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchMomentUUIDByAssetIdentifier];
    momentUUIDByAssetIdentifier = self->_momentUUIDByAssetIdentifier;
  }
  return momentUUIDByAssetIdentifier;
}

- (void)_prefetchAssetByAssetSyndicationIdentifier
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!self->_assetByAssetSyndicationIdentifier)
  {
    if (!self->_questionsByQuestionTypeByEntityType) {
      [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchQuestions];
    }
    v3 = [MEMORY[0x1E4F1CA80] set];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v41 = self;
    v4 = [(NSDictionary *)self->_questionsByQuestionTypeByEntityType objectForKeyedSubscript:&unk_1F28D1B60];
    v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v52 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v48 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                if (![v16 entityType] && objc_msgSend(v16, "type") == 18)
                {
                  long long v17 = [v16 entityIdentifier];
                  [v3 addObject:v17];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v7);
    }

    id v46 = 0;
    long long v18 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v46];
    id v19 = v46;
    v20 = v19;
    if (v18)
    {
      id v39 = v19;
      long long v40 = v18;
      id v21 = [v18 librarySpecificFetchOptions];
      uint64_t v22 = *MEMORY[0x1E4F394E0];
      v56[0] = *MEMORY[0x1E4F39538];
      v56[1] = v22;
      v56[2] = *MEMORY[0x1E4F39458];
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
      [v21 setFetchPropertySets:v23];

      [v21 setIncludeGuestAssets:1];
      uint64_t v24 = (void *)MEMORY[0x1E4F38EB8];
      uint64_t v25 = [v3 allObjects];
      uint64_t v26 = [v24 fetchAssetsWithSyndicationIdentifiers:v25 options:v21];

      id v27 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v28 = v26;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v42 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v43;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v43 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void **)(*((void *)&v42 + 1) + 8 * k);
            long long v34 = [v33 curationProperties];
            long long v35 = [v34 syndicationIdentifier];
            [(NSDictionary *)v27 setObject:v33 forKeyedSubscript:v35];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v42 objects:v55 count:16];
        }
        while (v30);
      }

      assetByAssetSyndicationIdentifier = v41->_assetByAssetSyndicationIdentifier;
      v41->_assetByAssetSyndicationIdentifier = v27;

      v20 = v39;
      long long v18 = v40;
    }
    else
    {
      long long v37 = +[PGLogging sharedLogging];
      long long v38 = [v37 loggingConnection];

      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v20;
        _os_log_error_impl(&dword_1D1805000, v38, OS_LOG_TYPE_ERROR, "PGPhotosChallengeMetricEventFetchHelper: Failed to open syndicated library: %@", buf, 0xCu);
      }

      id v21 = v41->_assetByAssetSyndicationIdentifier;
      v41->_assetByAssetSyndicationIdentifier = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
  }
}

- (NSDictionary)assetByAssetSyndicationIdentifier
{
  assetByAssetSyndicationIdentifier = self->_assetByAssetSyndicationIdentifier;
  if (!assetByAssetSyndicationIdentifier)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchAssetByAssetSyndicationIdentifier];
    assetByAssetSyndicationIdentifier = self->_assetByAssetSyndicationIdentifier;
  }
  return assetByAssetSyndicationIdentifier;
}

- (void)_prefetchAssetByAssetIdentifier
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!self->_assetByAssetIdentifier)
  {
    v3 = [MEMORY[0x1E4F1CA80] set];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v34 = self;
    v4 = [(NSDictionary *)self->_questionsByQuestionTypeByEntityType objectForKeyedSubscript:&unk_1F28D1B60];
    v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v40 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                if (![v16 entityType] && objc_msgSend(v16, "type") != 18)
                {
                  long long v17 = [v16 entityIdentifier];
                  [v3 addObject:v17];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v48 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v7);
    }

    long long v18 = [(PHPhotoLibrary *)v34->_photoLibrary librarySpecificFetchOptions];
    id v19 = (void *)MEMORY[0x1E4F1CA48];
    v20 = +[PGCurationManager assetPropertySetsForCuration];
    id v21 = [v19 arrayWithArray:v20];

    [v21 addObject:*MEMORY[0x1E4F39498]];
    [v18 setFetchPropertySets:v21];
    uint64_t v22 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v23 = [v3 allObjects];
    uint64_t v24 = [v22 fetchAssetsWithLocalIdentifiers:v23 options:v18];

    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v35 + 1) + 8 * k);
          long long v32 = [v31 uuid];
          [(NSDictionary *)v25 setObject:v31 forKeyedSubscript:v32];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v28);
    }

    assetByAssetIdentifier = v34->_assetByAssetIdentifier;
    v34->_assetByAssetIdentifier = v25;
  }
}

- (NSDictionary)assetByAssetIdentifier
{
  assetByAssetIdentifier = self->_assetByAssetIdentifier;
  if (!assetByAssetIdentifier)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchAssetByAssetIdentifier];
    assetByAssetIdentifier = self->_assetByAssetIdentifier;
  }
  return assetByAssetIdentifier;
}

- (void)_prefetchMomentUUIDsForExhaustiveMomentLabelingQuestion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_momentUUIDsForExhaustiveMomentLabelingQuestion)
  {
    v3 = [MEMORY[0x1E4F1CA80] set];
    v4 = [(NSDictionary *)self->_questionsByQuestionTypeByEntityType objectForKeyedSubscript:&unk_1F28D1B30];
    v5 = [v4 objectForKeyedSubscript:&unk_1F28D1B48];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "entityIdentifier", (void)v13);
          [(NSSet *)v3 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    momentUUIDsForExhaustiveMomentLabelingQuestion = self->_momentUUIDsForExhaustiveMomentLabelingQuestion;
    self->_momentUUIDsForExhaustiveMomentLabelingQuestion = v3;
  }
}

- (NSSet)momentUUIDsForExhaustiveMomentLabelingQuestion
{
  momentUUIDsForExhaustiveMomentLabelingQuestion = self->_momentUUIDsForExhaustiveMomentLabelingQuestion;
  if (!momentUUIDsForExhaustiveMomentLabelingQuestion)
  {
    [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchMomentUUIDsForExhaustiveMomentLabelingQuestion];
    momentUUIDsForExhaustiveMomentLabelingQuestion = self->_momentUUIDsForExhaustiveMomentLabelingQuestion;
  }
  return momentUUIDsForExhaustiveMomentLabelingQuestion;
}

- (void)_buildQuestionsByQuestionTypeByEntityTypeFromQuestions:(id)a3
{
  id v19 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "entityType", v19);
        uint64_t v11 = [v9 type];
        uint64_t v12 = [NSNumber numberWithUnsignedShort:v10];
        long long v13 = [(NSDictionary *)v4 objectForKeyedSubscript:v12];

        if (!v13)
        {
          long long v13 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v14 = [NSNumber numberWithUnsignedShort:v10];
          [(NSDictionary *)v4 setObject:v13 forKeyedSubscript:v14];
        }
        long long v15 = [NSNumber numberWithUnsignedShort:v11];
        long long v16 = [v13 objectForKeyedSubscript:v15];

        if (!v16)
        {
          long long v16 = [MEMORY[0x1E4F1CA48] array];
          long long v17 = [NSNumber numberWithUnsignedShort:v11];
          [v13 setObject:v16 forKeyedSubscript:v17];
        }
        [v16 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  questionsByQuestionTypeByEntityType = v19->_questionsByQuestionTypeByEntityType;
  v19->_questionsByQuestionTypeByEntityType = v4;
}

- (BOOL)_migrationStepNeededForTripTitlingQuestions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = *MEMORY[0x1E4F8EAA8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v12 type] == 26 && v10 > (int)objc_msgSend(v12, "questionVersion")) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [v5 count];
  if (v13)
  {
    photoLibrary = self->_photoLibrary;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __87__PGPhotosChallengeMetricEventFetchHelper__migrationStepNeededForTripTitlingQuestions___block_invoke;
    v22[3] = &unk_1E68F0B18;
    id v23 = v5;
    id v21 = 0;
    BOOL v15 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v22 error:&v21];
    id v16 = v21;
    if (v15)
    {
      long long v17 = +[PGLogging sharedLogging];
      uint64_t v18 = [v17 loggingConnection];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[Questions] Succeeded performing changes on Trip Titling Questions with duplicate titles", v20, 2u);
      }
    }
  }

  return v13 != 0;
}

void __87__PGPhotosChallengeMetricEventFetchHelper__migrationStepNeededForTripTitlingQuestions___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v24 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v28;
    uint64_t v1 = *MEMORY[0x1E4F8EAB0];
    uint64_t v26 = *MEMORY[0x1E4F8EAA0];
    uint64_t v20 = *MEMORY[0x1E4F8E920];
    uint64_t v2 = *MEMORY[0x1E4F8EA88];
    uint64_t v3 = *MEMORY[0x1E4F8E918];
    unsigned int v21 = (__int16)*MEMORY[0x1E4F8EAA8];
    uint64_t v22 = *MEMORY[0x1E4F8EAB0];
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v5 = [v25 additionalInfo];
        id v6 = (void *)MEMORY[0x1E4F8E828];
        uint64_t v7 = [v5 objectForKeyedSubscript:v1];
        uint64_t v8 = [v6 titleWithoutFormattingForTitle:v7];

        uint64_t v9 = (void *)MEMORY[0x1E4F8E828];
        uint64_t v10 = [v5 objectForKeyedSubscript:v26];
        uint64_t v11 = [v9 titleWithoutFormattingForTitle:v10];

        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v13 = [v8 isEqualToString:v11];
        if ((v13 & 1) == 0)
        {
          long long v14 = [v5 objectForKeyedSubscript:v20];

          if (v14)
          {
            BOOL v15 = [v5 objectForKeyedSubscript:v20];
            [v12 setObject:v15 forKeyedSubscript:v20];
          }
        }
        id v16 = [NSNumber numberWithBool:v13];
        [v12 setObject:v16 forKeyedSubscript:v2];

        uint64_t v1 = v22;
        [v12 setObject:v8 forKeyedSubscript:v22];
        [v12 setObject:v11 forKeyedSubscript:v26];
        long long v17 = [v5 objectForKeyedSubscript:v3];
        [v12 setObject:v17 forKeyedSubscript:v3];

        uint64_t v18 = [MEMORY[0x1E4F39258] changeRequestForQuestion:v25];
        [v18 setAdditionalInfo:v12];
        [v18 setQuestionVersion:v21];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v24);
  }
}

- (void)_prefetchQuestions
{
  id v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39250], "fetchAnsweredYesOrNoQuestionsWithOptions:validQuestionsOnly:");
  if ([(PGPhotosChallengeMetricEventFetchHelper *)self _migrationStepNeededForTripTitlingQuestions:v3])
  {
    uint64_t v4 = [MEMORY[0x1E4F39250] fetchAnsweredYesOrNoQuestionsWithOptions:v5 validQuestionsOnly:1];

    uint64_t v3 = (void *)v4;
  }
  [(PGPhotosChallengeMetricEventFetchHelper *)self _buildQuestionsByQuestionTypeByEntityTypeFromQuestions:v3];
}

- (id)questionsForQuestionType:(unsigned __int16)a3 questionEntityTypes:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4)
  {
    uint64_t v8 = v4;
    if (!self->_questionsByQuestionTypeByEntityType) {
      [(PGPhotosChallengeMetricEventFetchHelper *)self _prefetchQuestions];
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v6;
    obuint64_t j = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = [(NSDictionary *)self->_questionsByQuestionTypeByEntityType objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          long long v14 = [NSNumber numberWithUnsignedShort:v8];
          uint64_t v15 = [v13 objectForKeyedSubscript:v14];
          id v16 = (void *)v15;
          if (v15) {
            long long v17 = (void *)v15;
          }
          else {
            long long v17 = v7;
          }
          uint64_t v18 = v7;
          id v19 = v17;

          [v23 addObjectsFromArray:v19];
          uint64_t v7 = v18;
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    id v6 = v21;
  }
  else
  {
    id v23 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

- (id)questionsForQuestionMetricType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = +[PGPhotosChallengeMetricEvent questionEntityTypesFromQuestionMetricType:](PGPhotosChallengeMetricEvent, "questionEntityTypesFromQuestionMetricType:");
  id v6 = [(PGPhotosChallengeMetricEventFetchHelper *)self questionsForQuestionType:+[PGPhotosChallengeMetricEvent questionTypeFromQuestionMetricType:v3] questionEntityTypes:v5];

  return v6;
}

- (BOOL)suggestsToStartSharedLibraryWithError:(id *)a3
{
  return [(PGManager *)self->_manager suggestsToStartSharedLibraryWithError:a3];
}

- (id)initForTestingWithQuestions:(id)a3 assetsByAssetId:(id)a4 momentUUIDByAssetIdentifier:(id)a5 activePersonUUIDByPersonUUID:(id)a6 tripKeyAssetIdentifiers:(id)a7 momentUUIDsForExhaustiveMomentLabeling:(id)a8 dayHighlightAssetIdentifiers:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)PGPhotosChallengeMetricEventFetchHelper;
  uint64_t v18 = [(PGPhotosChallengeMetricEventFetchHelper *)&v25 init];
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _buildQuestionsByQuestionTypeByEntityTypeFromQuestions:](v18, "_buildQuestionsByQuestionTypeByEntityTypeFromQuestions:", v24, v21, v22, v23);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 8, a5);
    objc_storeStrong(p_isa + 9, a6);
    objc_storeStrong(p_isa + 11, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 12, a9);
  }

  return p_isa;
}

- (PGPhotosChallengeMetricEventFetchHelper)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGPhotosChallengeMetricEventFetchHelper;
  id v6 = [(PGPhotosChallengeMetricEventFetchHelper *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    uint64_t v8 = [v5 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    uint64_t v10 = [v5 workingContextForSuggestions];
    uint64_t v11 = [[PGSuggestionSession alloc] initWithProfile:5 workingContext:v10];
    featuredPhotosSuggestionSession = v7->_featuredPhotosSuggestionSession;
    v7->_featuredPhotosSuggestionSession = v11;
  }
  return v7;
}

@end