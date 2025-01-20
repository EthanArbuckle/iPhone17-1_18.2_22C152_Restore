@interface PGMemoryPhotoKitPersister
+ (void)setStoryColorGradeKindFromPhotosGraphProperties:(id)a3 onMemoryChangeRequest:(id)a4;
- (BOOL)_enforceUniqueCreationDatesWithPendingState:(unsigned __int16)a3;
- (BOOL)_shouldPrefetchAudioForMemoriesInPhotoLibrary:(id)a3 withConfiguration:(id)a4;
- (BOOL)_shouldPrefetchMetadataForMemoriesInPhotoLibrary:(id)a3 withConfiguration:(id)a4;
- (BOOL)persistLocalMemoriesFromEnrichedMemories:(id)a3 localMemoriesToDelete:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)updateExistingMemories:(id)a3 localMemoryByUniqueIdentifier:(id)a4 progressReporter:(id)a5;
- (PGMemoryPhotoKitPersister)initWithPhotoLibrary:(id)a3;
- (id)_encodedFeaturesFromFeatureNodes:(id)a3;
- (id)_memoryCreationRequestForEnrichedMemory:(id)a3 pendingState:(unsigned __int16)a4 creationDate:(id)a5 photosGraphDataDictionary:(id)a6;
- (id)_photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:(id)a3;
- (id)_photosGraphDataDictionaryForEnrichedMemory:(id)a3;
- (id)memoryLocalIdentifiersFromPersistingEnrichedMemories:(id)a3 withPendingState:(unsigned __int16)a4 graph:(id)a5 progressReporter:(id)a6 error:(id *)a7;
- (unint64_t)_memoryIndexOffsetOnDate:(id)a3 includePendingMemories:(BOOL)a4;
- (void)cacheMusicAudioAndArtworkForEnrichedMemories:(id)a3 inflationContext:(id)a4 photoLibrary:(id)a5;
@end

@implementation PGMemoryPhotoKitPersister

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (BOOL)_shouldPrefetchAudioForMemoriesInPhotoLibrary:(id)a3 withConfiguration:(id)a4
{
  id v5 = a3;
  if (a4) {
    uint64_t v6 = [a4 audioFilePrefetchThresholdInDays];
  }
  else {
    uint64_t v6 = 15;
  }
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [v7 dateByAddingTimeInterval:(double)-v6 * 86400.0];

  v9 = [v5 librarySpecificFetchOptions];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"lastViewedDate >= %@", v8];
  [v9 setInternalPredicate:v10];

  [v9 setFetchLimit:1];
  v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];
  BOOL v12 = [v11 count] != 0;

  return v12;
}

- (BOOL)_shouldPrefetchMetadataForMemoriesInPhotoLibrary:(id)a3 withConfiguration:(id)a4
{
  id v5 = a3;
  if (a4) {
    uint64_t v6 = [a4 metadataPrefetchThresholdInDays];
  }
  else {
    uint64_t v6 = 60;
  }
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [v7 dateByAddingTimeInterval:(double)-v6 * 86400.0];

  v9 = [v5 librarySpecificFetchOptions];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"lastViewedDate >= %@", v8];
  [v9 setInternalPredicate:v10];

  [v9 setFetchLimit:1];
  v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];
  BOOL v12 = [v11 count] != 0;

  return v12;
}

- (void)cacheMusicAudioAndArtworkForEnrichedMemories:(id)a3 inflationContext:(id)a4 photoLibrary:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v36 = a4;
  id v34 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "flexMusicCuration", v34);
        v16 = [v15 bestSongSuggestions];
        v17 = [v16 firstObject];
        v18 = [v17 uid];

        if (v18) {
          [v9 addObject:v18];
        }
        if (self->_isAppleMusicSubscriber)
        {
          v19 = [v14 musicCuration];
          v20 = [v19 keySongAdamID];

          if (v20) {
            [v37 addObject:v20];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v11);
  }

  if ([v9 count]) {
    +[PGFlexMusicCacher cacheSongAudioAndArtworkForUIDs:v9];
  }
  if (objc_msgSend(v37, "count", v34))
  {
    v21 = +[PGMusicCuratorConfigurationWrapper defaultConfiguration];
    v22 = dispatch_group_create();
    BOOL v23 = [(PGMemoryPhotoKitPersister *)self _shouldPrefetchMetadataForMemoriesInPhotoLibrary:v35 withConfiguration:v21];
    loggingConnection = self->_loggingConnection;
    BOOL v25 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v37;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[MemoriesMusic] prefetching song display metadata for adam IDs: %@", buf, 0xCu);
      }
      dispatch_group_enter(v22);
      v26 = [v37 allObjects];
      v27 = [MEMORY[0x1E4F71F08] ignoreProgress];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke;
      v41[3] = &unk_1E68E8660;
      v42 = v22;
      +[PGMusicCurator fetchSongDisplayMetadataJSONForAdamIDs:v26 inflationContext:v36 progressReporter:v27 completionHandler:v41];
    }
    else if (v25)
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v37;
      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[MemoriesMusic] usage is such that no song display metadata prefetching will be done for adam IDs: %@", buf, 0xCu);
    }
    BOOL v28 = [(PGMemoryPhotoKitPersister *)self _shouldPrefetchAudioForMemoriesInPhotoLibrary:v35 withConfiguration:v21];
    v29 = self->_loggingConnection;
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v37;
        _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] caching song audio for adam IDs: %@", buf, 0xCu);
      }
      dispatch_group_enter(v22);
      v31 = [v37 allObjects];
      v32 = [MEMORY[0x1E4F71F08] ignoreProgress];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke_264;
      v39[3] = &unk_1E68EAB90;
      v40 = v22;
      +[PGMusicAudioCacher cacheSongAudioForAdamIDs:v31 progressReporter:v32 completionHandler:v39];
    }
    else if (v30)
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v37;
      _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] usage is such that no song audio caching will be done for adam IDs: %@", buf, 0xCu);
    }
    dispatch_time_t v33 = dispatch_time(0, 20000000000);
    dispatch_group_wait(v22, v33);
  }
}

void __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke(uint64_t a1)
{
}

void __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke_264(uint64_t a1)
{
}

- (BOOL)updateExistingMemories:(id)a3 localMemoryByUniqueIdentifier:(id)a4 progressReporter:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v11 = self->_loggingConnection;
    photoLibrary = self->_photoLibrary;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__PGMemoryPhotoKitPersister_updateExistingMemories_localMemoryByUniqueIdentifier_progressReporter___block_invoke;
    v19[3] = &unk_1E68E8610;
    v19[4] = self;
    id v20 = v10;
    id v13 = v8;
    id v21 = v13;
    id v22 = v9;
    v14 = v11;
    BOOL v23 = v14;
    id v18 = 0;
    char v15 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v19 error:&v18];
    id v16 = v18;
    if ((v15 & 1) == 0 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "Failed to update the enriched memories %{private}@. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

void __99__PGMemoryPhotoKitPersister_updateExistingMemories_localMemoryByUniqueIdentifier_progressReporter___block_invoke(uint64_t a1)
{
  v97[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) librarySpecificFetchOptions];
  [v2 setIncludeGuestAssets:1];
  v97[0] = *MEMORY[0x1E4F394A8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
  [v2 setFetchPropertySets:v3];

  id v72 = *(id *)(a1 + 40);
  unint64_t v4 = [*(id *)(a1 + 48) count];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v78 = a1;
  id obj = *(id *)(a1 + 48);
  uint64_t v71 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v71)
  {
    double v6 = 1.0 / (double)v4;
    unint64_t v7 = 0x1E4F38000uLL;
    uint64_t v69 = *(void *)v85;
    double v8 = 0.0;
    *(void *)&long long v5 = 138478083;
    long long v67 = v5;
    v70 = v2;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v85 != v69) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        context = (void *)MEMORY[0x1D25FED50]();
        uint64_t v11 = *(void **)(v78 + 56);
        uint64_t v12 = [v10 uniqueMemoryIdentifier];
        id v13 = [v11 objectForKeyedSubscript:v12];

        v14 = [v13 title];
        if ([v14 length])
        {

LABEL_9:
          v17 = objc_msgSend(v13, "title", v67);
          id v18 = [v10 title];
          int v82 = [v17 isEqualToString:v18] ^ 1;

          goto LABEL_10;
        }
        char v15 = [v10 title];
        uint64_t v16 = [v15 length];

        if (v16) {
          goto LABEL_9;
        }
        int v82 = 0;
LABEL_10:
        v19 = objc_msgSend(v13, "subtitle", v67);
        if ([v19 length])
        {

LABEL_13:
          id v22 = [v13 subtitle];
          BOOL v23 = [v10 subtitle];
          int v81 = [v22 isEqualToString:v23] ^ 1;

          goto LABEL_14;
        }
        id v20 = [v10 subtitle];
        uint64_t v21 = [v20 length];

        if (v21) {
          goto LABEL_13;
        }
        int v81 = 0;
LABEL_14:
        v24 = [*(id *)(v7 + 3768) fetchKeyCuratedAssetInAssetCollection:v13 referenceAsset:0 options:v2];
        id v25 = [v24 firstObject];

        uint64_t v26 = [v10 keyAssetUUID];
        id v27 = [v25 uuid];
        v76 = v25;
        v80 = (void *)v26;
        if (v27 == (void *)v26)
        {
          int v29 = 0;
        }
        else
        {
          uint64_t v28 = [v25 uuid];
          int v29 = [v28 isEqualToString:v26] ^ 1;
        }
        BOOL v30 = [*(id *)(v7 + 3768) fetchCuratedAssetsInAssetCollection:v13 options:v2];
        uint64_t v31 = [v30 fetchedObjects];

        v75 = (void *)v31;
        v32 = +[PGMemoryGenerationHelper assetUUIDsFromAssets:v31];
        dispatch_time_t v33 = [v10 curatedAssetUUIDs];
        if ([v32 count] || objc_msgSend(v33, "count"))
        {
          id v34 = v33;
          v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
          int v36 = [v32 isEqualToSet:v35] ^ 1;
        }
        else
        {
          id v34 = v33;
          int v36 = 0;
        }
        v74 = v32;
        id v37 = [*(id *)(v7 + 3768) fetchExtendedCuratedAssetsInAssetCollection:v13 options:v2];
        uint64_t v38 = [v37 fetchedObjects];

        v73 = (void *)v38;
        v39 = +[PGMemoryGenerationHelper assetUUIDsFromAssets:v38];
        v40 = [v10 extendedCuratedAssetUUIDs];
        v79 = v40;
        if ([v39 count] || objc_msgSend(v40, "count"))
        {
          v41 = [MEMORY[0x1E4F1CAD0] setWithArray:v40];
          int v42 = [v39 isEqualToSet:v41] ^ 1;
        }
        else
        {
          int v42 = 0;
        }
        long long v43 = [MEMORY[0x1E4F39170] changeRequestForMemory:v13];
        long long v44 = [MEMORY[0x1E4F1C9C8] date];
        [v43 setLastEnrichmentDate:v44];

        uint64_t v45 = [v13 photosGraphVersion];
        if (v45 != [v10 photosGraphVersion]) {
          objc_msgSend(v43, "setPhotosGraphVersion:", objc_msgSend(v10, "photosGraphVersion"));
        }
        int v46 = [v13 isRejected];
        if (v46 != [v10 failedEnrichment]) {
          objc_msgSend(v43, "setRejected:", objc_msgSend(v10, "failedEnrichment"));
        }
        if ((v82 | v81 | v29 | v36 | v42) == 1)
        {
          v47 = *(NSObject **)(v78 + 64);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413570;
            *(void *)v89 = v13;
            *(_WORD *)&v89[8] = 1024;
            *(_DWORD *)&v89[10] = v82;
            *(_WORD *)&v89[14] = 1024;
            *(_DWORD *)&v89[16] = v81;
            __int16 v90 = 1024;
            int v91 = v29;
            __int16 v92 = 1024;
            int v93 = v36;
            __int16 v94 = 1024;
            int v95 = v42;
            _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "Updating Memory: %@, title %d, subtitle %d, keyAsset %d, curation %d, extendedCuration %d", buf, 0x2Au);
          }
          if (v82)
          {
            id v48 = [v10 title];
            [v43 setTitle:v48];
          }
          if (v81)
          {
            v49 = [v10 subtitle];
            [v43 setSubtitle:v49];
          }
          if ((v29 | v36 | v42) == 1)
          {
            uint64_t v50 = [v10 representativeAssetUUIDs];
            [v43 setRepresentativeAssetUUIDs:v50 curatedAssetUUIDs:v34 extendedCuratedAssetUUIDs:v79 keyAssetUUID:v80];
          }
          [v13 score];
          double v52 = v51;
          [v10 score];
          if (v52 != v53)
          {
            [v10 score];
            objc_msgSend(v43, "setScore:");
          }
          v54 = [*(id *)(v78 + 32) _photosGraphDataDictionaryForEnrichedMemory:v10];
          v55 = [v54 objectForKeyedSubscript:@"storyColorGradeKind"];
          uint64_t v56 = [v55 integerValue];

          if (!v56)
          {
            v57 = [v54 objectForKeyedSubscript:@"storyColorGradeCategory"];
            uint64_t v56 = PFStoryColorGradeKindDefaultForColorGradeCategory();
          }
          if ([v13 storyColorGradeKind] != v56) {
            [v43 setStoryColorGradeKind:v56];
          }
          v58 = [v13 photosGraphProperties];
          if ([v58 count])
          {

LABEL_45:
            v60 = [v13 photosGraphProperties];
            char v61 = [v60 isEqualToDictionary:v54];

            if ((v61 & 1) == 0)
            {
              id v83 = 0;
              v62 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v54 requiringSecureCoding:1 error:&v83];
              id v63 = v83;
              if (v62)
              {
                [v43 setPhotosGraphData:v62];
              }
              else
              {
                v64 = *(NSObject **)(v78 + 64);
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v67;
                  *(void *)v89 = v54;
                  *(_WORD *)&v89[8] = 2112;
                  *(void *)&v89[10] = v63;
                  _os_log_error_impl(&dword_1D1805000, v64, OS_LOG_TYPE_ERROR, "Failed to archived feature dictionary for photos graph data %{private}@. Error: %@", buf, 0x16u);
                }
              }
            }
          }
          else
          {
            uint64_t v59 = [v54 count];

            if (v59) {
              goto LABEL_45;
            }
          }
        }
        double v8 = v6 + v8;
        int v65 = [v72 isCancelledWithProgress:v8];
        char v66 = v65;
        if (v65 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v89 = 357;
          *(_WORD *)&v89[4] = 2080;
          *(void *)&v89[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/PGMemoryPhotoKitPersister.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        v2 = v70;
        unint64_t v7 = 0x1E4F38000;
        if (v66) {
          goto LABEL_62;
        }
      }
      uint64_t v71 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
    }
    while (v71);
  }
LABEL_62:
}

- (id)_encodedFeaturesFromFeatureNodes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v5 = objc_msgSend(v3, "allFeatures", 0);
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
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) encodedFeature];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)_memoryIndexOffsetOnDate:(id)a3 includePendingMemories:(BOOL)a4
{
  BOOL v4 = a4;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v7 setIncludePendingMemories:v4];
  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v33[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  [v7 setSortDescriptors:v9];

  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@", v6];
  [v7 setPredicate:v10];

  [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v7];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v24 = self;
    id v25 = v7;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v18 = (void *)MEMORY[0x1D25FED50]();
        v19 = (void *)MEMORY[0x1E4F76C68];
        id v20 = [v17 creationDate];
        uint64_t v21 = [v19 compareDate:v6 toDate:v20 toUnitGranularity:16];

        if (!v21) {
          ++v14;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v13);

    if (v14)
    {
      loggingConnection = self->_loggingConnection;
      uint64_t v7 = v25;
      if (os_log_type_enabled((os_log_t)v24->_loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v31 = v14;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Using memory index offset of %d", buf, 8u);
      }
    }
    else
    {
      uint64_t v7 = v25;
    }
  }
  else
  {

    unint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)_enforceUniqueCreationDatesWithPendingState:(unsigned __int16)a3
{
  return a3 != 2;
}

- (id)_memoryCreationRequestForEnrichedMemory:(id)a3 pendingState:(unsigned __int16)a4 creationDate:(id)a5 photosGraphDataDictionary:(id)a6
{
  unsigned int v25 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v27 = a6;
  long long v26 = self->_loggingConnection;
  id v10 = (void *)MEMORY[0x1E4F39170];
  id v11 = a5;
  uint64_t v12 = [v9 title];
  uint64_t v13 = [v9 subtitle];
  uint64_t v14 = [v9 memoryCategory];
  uint64_t v15 = [v9 representativeAssetUUIDs];
  uint64_t v16 = [v9 curatedAssetUUIDs];
  uint64_t v17 = [v9 extendedCuratedAssetUUIDs];
  id v18 = [v9 keyAssetUUID];
  v19 = [v10 creationRequestForMemoryWithTitle:v12 subtitle:v13 creationDate:v11 category:v14 subcategory:0 representativeAssetUUIDs:v15 curatedAssetUUIDs:v16 extendedCuratedAssetUUIDs:v17 keyAssetUUID:v18];

  objc_msgSend(v19, "setPhotosGraphVersion:", objc_msgSend(v9, "photosGraphVersion"));
  [v19 setPendingState:v25];
  id v20 = [v9 uniqueMemoryIdentifier];
  [v19 setGraphMemoryIdentifier:v20];

  if (v25 == 2)
  {
    uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
    [v19 setLastEnrichmentDate:v21];
  }
  else
  {
    [v19 setLastEnrichmentDate:0];
  }
  if ([v9 failedEnrichment])
  {
    [v19 setRejected:1];
  }
  else
  {
    [v19 setRejected:0];
    if (v25 != 2) {
      [v19 setFeaturedState:1];
    }
    [(id)objc_opt_class() setStoryColorGradeKindFromPhotosGraphProperties:v27 onMemoryChangeRequest:v19];
    id v28 = 0;
    id v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v28];
    id v23 = v28;
    if (v22)
    {
      [v19 setPhotosGraphData:v22];
    }
    else if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      id v30 = v27;
      __int16 v31 = 2112;
      id v32 = v23;
      _os_log_error_impl(&dword_1D1805000, (os_log_t)v26, OS_LOG_TYPE_ERROR, "Failed to archived feature dictionary for photos graph data %{private}@. Error: %@", buf, 0x16u);
    }
    [v9 score];
    objc_msgSend(v19, "setScore:");
  }
  return v19;
}

- (id)memoryLocalIdentifiersFromPersistingEnrichedMemories:(id)a3 withPendingState:(unsigned __int16)a4 graph:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  uint64_t v10 = a4;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v51 = a6;
  if (a7) {
    *a7 = 0;
  }
  if (![v12 count])
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_26;
  }
  uint64_t v45 = a7;
  if (v10 == 2)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
LABEL_14:
    BOOL v26 = 0;
    goto LABEL_15;
  }
  uint64_t v17 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v17 setIncludePendingMemories:1];
  id v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"pendingState = %d", 1);
  [v17 setPredicate:v18];

  uint64_t v15 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v17];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    id v20 = loggingConnection;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = [v15 count];
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Found %d existing pending memories", buf, 8u);
  }
  uint64_t v21 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v21 setIncludePendingMemories:1];
  id v22 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"featuredState = %d", 1);
  [v21 setPredicate:v22];

  uint64_t v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v21];
  id v23 = self->_loggingConnection;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    int v25 = [v14 count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v25;
    _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Found %d existing featured memories", buf, 8u);
  }
  if (!v10)
  {
    BOOL v26 = 0;
    BOOL v50 = [v15 count] != 0;
    goto LABEL_16;
  }
  if (v10 != 1) {
    goto LABEL_14;
  }
  BOOL v26 = [v15 count] != 0;
LABEL_15:
  BOOL v50 = 0;
LABEL_16:
  BOOL v27 = [(PGMemoryPhotoKitPersister *)self _enforceUniqueCreationDatesWithPendingState:v10];
  id v28 = [v12 firstObject];
  uint64_t v29 = [v28 creationDate];

  unint64_t v30 = 0;
  *(void *)buf = 0;
  uint64_t v71 = buf;
  uint64_t v72 = 0x2020000000;
  unint64_t v73 = 0;
  if (v27)
  {
    uint64_t v31 = [v12 count];
    unint64_t v30 = [(PGMemoryPhotoKitPersister *)self _memoryIndexOffsetOnDate:v29 includePendingMemories:v50]+ v31;
  }
  id v48 = v14;
  v49 = self;
  id v32 = v15;
  unint64_t v73 = v30;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v46 = (void *)v29;
  id v47 = v13;
  id v34 = [(PGMemoryPhotoKitPersister *)self _photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:v12];
  photoLibrary = self->_photoLibrary;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __128__PGMemoryPhotoKitPersister_memoryLocalIdentifiersFromPersistingEnrichedMemories_withPendingState_graph_progressReporter_error___block_invoke;
  v53[3] = &unk_1E68E8638;
  id v54 = v51;
  id v36 = v12;
  BOOL v63 = v27;
  id v55 = v36;
  char v61 = buf;
  id v37 = v34;
  id v56 = v37;
  v57 = self;
  __int16 v62 = v10;
  id v38 = v33;
  id v58 = v38;
  BOOL v64 = v50;
  id v39 = v32;
  id v59 = v39;
  BOOL v65 = v26;
  id v40 = v48;
  id v60 = v40;
  id v52 = 0;
  LOBYTE(photoLibrary) = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v53 error:&v52];
  id v41 = v52;
  if (photoLibrary)
  {
    id v16 = v38;
    int v42 = v46;
    id v13 = v47;
  }
  else
  {
    long long v43 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v49->_loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)char v66 = 138478083;
      id v67 = v36;
      __int16 v68 = 2112;
      id v69 = v41;
      _os_log_error_impl(&dword_1D1805000, v43, OS_LOG_TYPE_ERROR, "[PGMemoryPhotoKitPersister] Failed to persist the enriched memories %{private}@. Error: %@", v66, 0x16u);
    }
    int v42 = v46;
    if (v45)
    {
      id v13 = v47;
      id v16 = 0;
      *uint64_t v45 = v41;
    }
    else
    {
      id v16 = 0;
      id v13 = v47;
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_26:

  return v16;
}

void __128__PGMemoryPhotoKitPersister_memoryLocalIdentifiersFromPersistingEnrichedMemories_withPendingState_graph_progressReporter_error___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v51 = *(id *)(a1 + 32);
  unint64_t v2 = [*(id *)(a1 + 40) count];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v52 = [v3 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v52)
  {
    double v4 = 1.0 / (double)v2;
    uint64_t v50 = *(void *)v66;
    double v5 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v66 != v50) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x1D25FED50]();
        id v9 = [v7 creationDate];
        if (*(unsigned char *)(a1 + 98))
        {
          uint64_t v10 = [v7 creationDate];
          uint64_t v11 = [v10 dateByAddingTimeInterval:(double)*(unint64_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];

          --*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          id v9 = (void *)v11;
        }
        id v12 = *(void **)(a1 + 48);
        id v13 = objc_msgSend(v7, "uniqueMemoryIdentifier", v50);
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];

        uint64_t v15 = [*(id *)(a1 + 56) _memoryCreationRequestForEnrichedMemory:v7 pendingState:*(unsigned __int16 *)(a1 + 96) creationDate:v9 photosGraphDataDictionary:v14];
        id v16 = *(void **)(a1 + 64);
        uint64_t v17 = [v15 placeholderForCreatedMemory];
        id v18 = [v17 localIdentifier];
        [v16 addObject:v18];

        double v5 = v4 + v5;
        if ([v51 isCancelledWithProgress:v5])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)unint64_t v73 = 163;
            *(_WORD *)&v73[4] = 2080;
            *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/PGMemoryPhotoKitPersister.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_48;
        }
      }
      uint64_t v52 = [v3 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v52) {
        continue;
      }
      break;
    }
  }

  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (*(unsigned char *)(a1 + 99))
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v19 = *(id *)(a1 + 72);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v62 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v61 + 1) + 8 * j);
          int v25 = [MEMORY[0x1E4F39170] changeRequestForMemory:v24];
          [v25 setPendingState:0];
          BOOL v26 = *(NSObject **)(*(void *)(a1 + 56) + 16);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            BOOL v27 = v26;
            id v28 = [v24 uuid];
            *(_DWORD *)buf = 138412290;
            *(void *)unint64_t v73 = v28;
            _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Unpending memory with uuid %@", buf, 0xCu);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }
      while (v21);
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 100)) {
      goto LABEL_36;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v29 = *(id *)(a1 + 72);
    uint64_t v30 = [v29 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v58;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v58 != v32) {
            objc_enumerationMutation(v29);
          }
          id v34 = [*(id *)(*((void *)&v57 + 1) + 8 * k) uuid];
          [v3 addObject:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v31);
    }

    [MEMORY[0x1E4F39170] deleteMemories:*(void *)(a1 + 72)];
    v35 = *(NSObject **)(*(void *)(a1 + 56) + 16);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
      goto LABEL_36;
    }
    id v36 = *(void **)(a1 + 72);
    v19 = v35;
    int v37 = [v36 count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)unint64_t v73 = v37;
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Deleting %d previously existing pending memories", buf, 8u);
  }

LABEL_36:
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v38 = *(id *)(a1 + 80);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v69 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v54;
    do
    {
      for (uint64_t m = 0; m != v40; ++m)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(v38);
        }
        long long v43 = *(void **)(*((void *)&v53 + 1) + 8 * m);
        long long v44 = [v43 uuid];
        char v45 = [v3 containsObject:v44];

        if ((v45 & 1) == 0)
        {
          int v46 = [MEMORY[0x1E4F39170] changeRequestForMemory:v43];
          [v46 setFeaturedState:0];
          id v47 = *(NSObject **)(*(void *)(a1 + 56) + 16);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            id v48 = v47;
            v49 = [v43 uuid];
            *(_DWORD *)buf = 138412290;
            *(void *)unint64_t v73 = v49;
            _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Clearing currently featured state for memory with uuid %@", buf, 0xCu);
          }
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v53 objects:v69 count:16];
    }
    while (v40);
  }

LABEL_48:
}

- (BOOL)persistLocalMemoriesFromEnrichedMemories:(id)a3 localMemoriesToDelete:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6) {
    *a6 = 0;
  }
  if (![v10 count] && !objc_msgSend(v11, "count"))
  {
    LOBYTE(v18) = 1;
    goto LABEL_12;
  }
  id v13 = [(PGMemoryPhotoKitPersister *)self _photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:v10];
  photoLibrary = self->_photoLibrary;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __115__PGMemoryPhotoKitPersister_persistLocalMemoriesFromEnrichedMemories_localMemoriesToDelete_progressReporter_error___block_invoke;
  v29[3] = &unk_1E68E8610;
  id v30 = v12;
  id v15 = v11;
  id v31 = v15;
  id v16 = v10;
  id v32 = v16;
  id v17 = v13;
  id v33 = v17;
  id v34 = self;
  id v28 = 0;
  BOOL v18 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v29 error:&v28];
  id v19 = v28;
  loggingConnection = self->_loggingConnection;
  if (v18)
  {
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = loggingConnection;
      uint64_t v22 = [v16 count];
      uint64_t v23 = [v15 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v36 = v22;
      __int16 v37 = 2048;
      uint64_t v38 = v23;
      _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Successfully persisted %lu and deleted %lu enriched local memories", buf, 0x16u);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
  {
    int v25 = loggingConnection;
    uint64_t v26 = [v16 count];
    uint64_t v27 = [v15 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v36 = v26;
    __int16 v37 = 2048;
    uint64_t v38 = v27;
    __int16 v39 = 2112;
    id v40 = v19;
    _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "[PGMemoryPhotoKitPersister] Failed to persist %lu and delete %lu enriched local memories. Error: %@", buf, 0x20u);

    if (!a6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a6) {
LABEL_10:
  }
    *a6 = v19;
LABEL_11:

LABEL_12:
  return v18;
}

void __115__PGMemoryPhotoKitPersister_persistLocalMemoriesFromEnrichedMemories_localMemoriesToDelete_progressReporter_error___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) count]) {
    [MEMORY[0x1E4F39170] deleteMemories:*(void *)(a1 + 40)];
  }
  double v3 = 0.1;
  if ([v2 isCancelledWithProgress:0.1])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v25 = 91;
      __int16 v26 = 2080;
      uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/P"
            "GMemoryPhotoKitPersister.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    unint64_t v4 = [*(id *)(a1 + 48) count];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      double v7 = 0.9 / (double)v4;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x1D25FED50]();
          id v12 = *(void **)(a1 + 56);
          id v13 = [v10 uniqueMemoryIdentifier];
          uint64_t v14 = [v12 objectForKeyedSubscript:v13];

          id v15 = *(void **)(a1 + 64);
          id v16 = [v10 creationDate];
          id v17 = (id)[v15 _memoryCreationRequestForEnrichedMemory:v10 pendingState:2 creationDate:v16 photosGraphDataDictionary:v14];

          double v3 = v7 + v3;
          if ([v2 isCancelledWithProgress:v3])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v25 = 98;
              __int16 v26 = 2080;
              uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/PGMemoryPhotoKitPersister.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_18;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
}

- (id)_photosGraphDataDictionaryForEnrichedMemory:(id)a3
{
  id v4 = a3;
  if ([v4 failedEnrichment])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v6 = [[PGMemoryPhotosGraphProperties alloc] initWithEnrichedMemory:v4 neighborScoreComputer:self->_neighborScoreComputer isAppleMusicSubscriber:self->_isAppleMusicSubscriber photoLibrary:self->_photoLibrary loggingConnection:self->_loggingConnection];
    uint64_t v5 = [(PGMemoryPhotosGraphProperties *)v6 dictionary];
  }
  return v5;
}

- (id)_photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1D25FED50](v7);
        id v13 = -[PGMemoryPhotoKitPersister _photosGraphDataDictionaryForEnrichedMemory:](self, "_photosGraphDataDictionaryForEnrichedMemory:", v11, (void)v16);
        uint64_t v14 = [v11 uniqueMemoryIdentifier];
        [v5 setObject:v13 forKeyedSubscript:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (PGMemoryPhotoKitPersister)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGMemoryPhotoKitPersister;
  id v6 = [(PGMemoryPhotoKitPersister *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    os_log_t v8 = os_log_create("com.apple.PhotosGraph", "MemoryPhotoKitPersister");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;

    uint64_t v10 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v7->_neighborScoreComputer;
    v7->_neighborScoreComputer = v10;

    id v12 = [MEMORY[0x1E4F71F08] ignoreProgress];
    v7->_isAppleMusicSubscriber = +[PGMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:v12];
  }
  return v7;
}

+ (void)setStoryColorGradeKindFromPhotosGraphProperties:(id)a3 onMemoryChangeRequest:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v9 objectForKeyedSubscript:@"storyColorGradeKind"];
  uint64_t v7 = [v6 integerValue];

  if (!v7)
  {
    os_log_t v8 = [v9 objectForKeyedSubscript:@"storyColorGradeCategory"];
    uint64_t v7 = PFStoryColorGradeKindDefaultForColorGradeCategory();
  }
  [v5 setStoryColorGradeKind:v7];
}

@end