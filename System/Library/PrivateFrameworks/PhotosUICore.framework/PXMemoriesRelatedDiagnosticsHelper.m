@interface PXMemoriesRelatedDiagnosticsHelper
+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceMemory:(id)a6 sourceDictionary:(id)a7;
+ (id)_curationFullsetForMemory:(id)a3;
+ (id)_datesAndAssetCountDictionaryForAssetCollection:(id)a3;
+ (id)_featureVectorInfoGroupedByKeyForFeatureVector:(id)a3;
+ (id)_isSafeForWidgetDisplayForAssetUUID:(id)a3;
+ (id)_sanitizedGraphDataDictionaryForArchivingDictionary:(id)a3 memoryLocalIdentifier:(id)a4;
+ (id)_userFeedbackScoreInfoForMemory:(id)a3;
+ (id)getSummaryFromProviderItem:(id)a3;
+ (id)preprocessDictionary:(id)a3 forMemoryWithLocalIdentifier:(id)a4 algorithmsVersion:(int64_t)a5 inPhotoLibrary:(id)a6;
@end

@implementation PXMemoriesRelatedDiagnosticsHelper

+ (id)_isSafeForWidgetDisplayForAssetUUID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = @"NO";
  if ([a3 length])
  {
    v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
    v5 = [v4 librarySpecificFetchOptions];

    v12[0] = *MEMORY[0x1E4F39538];
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v5 setFetchPropertySets:v6];

    [v5 setFetchLimit:1];
    [v5 setWantsIncrementalChangeDetails:0];
    [v5 setIncludeGuestAssets:1];
    v7 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v5];
    v8 = [v7 firstObject];

    int v9 = [MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:v8];
    v10 = @"YES";
    if (!v9) {
      v10 = @"NO";
    }
    v3 = v10;
  }
  return v3;
}

+ (id)_userFeedbackScoreInfoForMemory:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = (void *)MEMORY[0x1E4F38EB8];
  v5 = [v3 photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];
  v39 = v3;
  v7 = [v4 fetchAssetsInAssetCollection:v3 options:v6];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v7;
  uint64_t v44 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v44)
  {
    uint64_t v41 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v50 != v41) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v10 = [v9 uuid];
        [v43 addObject:v10];

        v11 = [v9 photoLibrary];
        v12 = [v11 librarySpecificFetchOptions];

        v13 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
        [v12 setIncludedDetectionTypes:v13];

        v14 = [MEMORY[0x1E4F391F0] fetchPersonsInAsset:v9 options:v12];
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v16 = [v14 fetchedObjects];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v46 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = [*(id *)(*((void *)&v45 + 1) + 8 * j) uuid];
              [v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v18);
        }

        v22 = [v9 uuid];
        [v42 setObject:v15 forKeyedSubscript:v22];
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v44);
  }

  v23 = (void *)MEMORY[0x1E4F38EB8];
  v24 = [v39 photoLibrary];
  v25 = [v24 librarySpecificFetchOptions];
  v26 = [v23 fetchKeyAssetsInAssetCollection:v39 options:v25];

  if (v26)
  {
    v27 = [v26 fetchedObjects];
    v28 = [v27 objectAtIndexedSubscript:0];
    v29 = [v28 uuid];
  }
  else
  {
    v29 = 0;
  }
  id v30 = objc_alloc(MEMORY[0x1E4F39338]);
  v31 = [v39 photoLibrary];
  v32 = (void *)[v30 initWithPhotoLibrary:v31];

  v33 = [v39 blockableFeatures];
  [v32 scoreForAssetUUIDs:v43 keyAssetUUID:v29 personsUUIDsByAssetUUIDs:v42 memoryFeatures:v33];
  double v35 = v34;

  v36 = [MEMORY[0x1E4F39338] descriptionForScore:v35];
  v37 = [NSString stringWithFormat:@"%@ (%.2f)", v36, *(void *)&v35];

  return v37;
}

+ (id)_curationFullsetForMemory:(id)a3
{
  v126[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = 0x1E4F1C000uLL;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = (void *)MEMORY[0x1E4F390A0];
  v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v8 = [v6 fetchOptionsWithPhotoLibrary:v7 orObject:v3];

  uint64_t v9 = *MEMORY[0x1E4F39538];
  v126[0] = *MEMORY[0x1E4F39568];
  v126[1] = v9;
  v126[2] = *MEMORY[0x1E4F39528];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:3];
  [v8 setFetchPropertySets:v10];

  v91 = v8;
  [v8 setChunkSizeForFetch:300];
  v83 = v3;
  v11 = [MEMORY[0x1E4F38EE8] fetchMomentsBackingMemory:v3 options:0];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v118 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v117 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x1AD10CB00]();
        uint64_t v19 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v17 options:v91];
        v20 = [v19 fetchedObjects];
        [v12 addObjectsFromArray:v20];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
    }
    while (v14);
  }
  v84 = v5;

  id v21 = objc_alloc(MEMORY[0x1E4F39150]);
  v22 = [v91 photoLibrary];
  v23 = [MEMORY[0x1E4F38EB8] fetchType];
  v24 = (void *)MEMORY[0x1E4F1CAD0];
  v25 = [v91 fetchPropertySets];
  v26 = [v24 setWithArray:v25];
  uint64_t v27 = [v21 initWithObjects:v12 photoLibrary:v22 fetchType:v23 fetchPropertySets:v26 identifier:0 registerIfNeeded:0];

  v89 = [MEMORY[0x1E4F391F0] fetchPersonsGroupedByAssetLocalIdentifierForAssets:v27 options:0];
  v82 = (void *)v27;
  v88 = [MEMORY[0x1E4F39280] fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v27];
  v90 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v85 = v12;
  uint64_t v92 = [v85 countByEnumeratingWithState:&v113 objects:v124 count:16];
  if (v92)
  {
    uint64_t v87 = *(void *)v114;
    do
    {
      for (uint64_t j = 0; j != v92; ++j)
      {
        if (*(void *)v114 != v87) {
          objc_enumerationMutation(v85);
        }
        v29 = *(void **)(*((void *)&v113 + 1) + 8 * j);
        id v30 = (void *)MEMORY[0x1AD10CB00]();
        id v31 = objc_alloc_init(*(Class *)(v4 + 2656));
        v32 = [v29 localIdentifier];
        [v31 setObject:v32 forKeyedSubscript:@"identifier"];
        v33 = [v29 creationDate];
        [v31 setObject:v33 forKeyedSubscript:@"creationDate"];

        double v34 = [v29 localCreationDate];
        [v31 setObject:v34 forKeyedSubscript:@"localCreationDate"];

        double v35 = [v29 location];
        v36 = [v29 location];

        if (v36)
        {
          v37 = NSNumber;
          [v35 coordinate];
          v38 = objc_msgSend(v37, "numberWithDouble:");
          [v31 setObject:v38 forKeyedSubscript:@"latitude"];

          v39 = NSNumber;
          [v35 coordinate];
          uint64_t v41 = [v39 numberWithDouble:v40];
          [v31 setObject:v41 forKeyedSubscript:@"longitude"];
        }
        id v42 = NSNumber;
        [v29 curationScore];
        id v43 = objc_msgSend(v42, "numberWithDouble:");
        [v31 setObject:v43 forKeyedSubscript:@"score"];

        uint64_t v44 = [v89 objectForKeyedSubscript:v32];
        uint64_t v98 = j;
        v100 = v44;
        if ([v44 count])
        {
          long long v45 = [v44 fetchedObjects];
          [v45 valueForKey:@"localIdentifier"];
          long long v46 = v32;
          long long v47 = v30;
          unint64_t v48 = v4;
          v50 = long long v49 = v35;
          [v31 setObject:v50 forKeyedSubscript:@"persons"];

          double v35 = v49;
          unint64_t v4 = v48;
          id v30 = v47;
          v32 = v46;
          uint64_t j = v98;

          long long v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v100, "count"));
          [v31 setObject:v51 forKeyedSubscript:@"peopleCount"];

          uint64_t v44 = v100;
        }
        v99 = [v88 objectForKeyedSubscript:v32];
        if ([v99 count])
        {
          v93 = v35;
          v94 = v29;
          v95 = v32;
          v96 = v31;
          v97 = v30;
          id v52 = objc_alloc_init(*(Class *)(v4 + 2656));
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v53 = v99;
          uint64_t v54 = [v53 countByEnumeratingWithState:&v109 objects:v123 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v110;
            do
            {
              for (uint64_t k = 0; k != v55; ++k)
              {
                if (*(void *)v110 != v56) {
                  objc_enumerationMutation(v53);
                }
                v58 = *(void **)(*((void *)&v109 + 1) + 8 * k);
                v59 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v58, "extendedSceneIdentifier"));
                v60 = NSNumber;
                [v58 confidence];
                v61 = objc_msgSend(v60, "numberWithDouble:");
                [v52 setObject:v61 forKeyedSubscript:v59];
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v109 objects:v123 count:16];
            }
            while (v55);
          }

          id v31 = v96;
          [v96 setObject:v52 forKeyedSubscript:@"sceneClassifications"];

          unint64_t v4 = 0x1E4F1C000;
          id v30 = v97;
          uint64_t j = v98;
          v29 = v94;
          v32 = v95;
          double v35 = v93;
          uint64_t v44 = v100;
        }
        if ([v29 isFavorite]) {
          [v31 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isFavorite"];
        }
        [v90 setObject:v31 forKeyedSubscript:v32];
      }
      uint64_t v92 = [v85 countByEnumeratingWithState:&v113 objects:v124 count:16];
    }
    while (v92);
  }

  [v5 setObject:v90 forKeyedSubscript:@"assetDataByIdentifier"];
  v62 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:v83];
  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v62, "count"));
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v64 = v62;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v105 objects:v122 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v106;
    do
    {
      for (uint64_t m = 0; m != v66; ++m)
      {
        if (*(void *)v106 != v67) {
          objc_enumerationMutation(v64);
        }
        v69 = [*(id *)(*((void *)&v105 + 1) + 8 * m) localIdentifier];
        [v63 addObject:v69];
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v105 objects:v122 count:16];
    }
    while (v66);
  }

  [v5 setObject:v63 forKeyedSubscript:@"curationIdentifiers"];
  v70 = [MEMORY[0x1E4F38EB8] fetchExtendedCuratedAssetsInAssetCollection:v83 options:0];
  v71 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v64, "count"));
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v72 = v70;
  uint64_t v73 = [v72 countByEnumeratingWithState:&v101 objects:v121 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v102;
    do
    {
      for (uint64_t n = 0; n != v74; ++n)
      {
        if (*(void *)v102 != v75) {
          objc_enumerationMutation(v72);
        }
        v77 = [*(id *)(*((void *)&v101 + 1) + 8 * n) localIdentifier];
        [v71 addObject:v77];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v101 objects:v121 count:16];
    }
    while (v74);
  }

  [v84 setObject:v71 forKeyedSubscript:@"extendedCurationIdentifiers"];
  v78 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v83 referenceAsset:0];
  v79 = [v78 firstObject];

  if (v79)
  {
    v80 = [v79 localIdentifier];
    [v84 setObject:v80 forKeyedSubscript:@"keyAssetIdentifier"];
  }
  return v84;
}

+ (id)_datesAndAssetCountDictionaryForAssetCollection:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v3 options:0];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__135735;
    v23 = __Block_byref_object_dispose__135736;
    id v24 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__135735;
    uint64_t v17 = __Block_byref_object_dispose__135736;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __86__PXMemoriesRelatedDiagnosticsHelper__datesAndAssetCountDictionaryForAssetCollection___block_invoke;
    v12[3] = &unk_1E5DBE348;
    v12[4] = &v19;
    v12[5] = &v13;
    [v5 enumerateObjectsUsingBlock:v12];
    uint64_t v8 = v20[5];
    if (v8) {
      [v4 setObject:v8 forKey:@"startDate"];
    }
    uint64_t v9 = v14[5];
    if (v9) {
      [v4 setObject:v9 forKey:@"endDate"];
    }
    v10 = [NSNumber numberWithUnsignedInteger:v7];
    [v4 setObject:v10 forKey:@"estimatedAssetCount"];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
  return v4;
}

void __86__PXMemoriesRelatedDiagnosticsHelper__datesAndAssetCountDictionaryForAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 creationDate];
  unint64_t v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  obuint64_t j = v3;
  if (*(void *)(v5 + 40))
  {
    if (objc_msgSend(v3, "compare:") != -1) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v4 = obj;
  }
  objc_storeStrong((id *)(v5 + 40), v4);
LABEL_5:
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v6 + 40))
  {
    if (objc_msgSend(obj, "compare:") != 1) {
      goto LABEL_9;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  objc_storeStrong((id *)(v6 + 40), obj);
LABEL_9:
}

+ (id)_featureVectorInfoGroupedByKeyForFeatureVector:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "firstObject", (void)v15);
        id v12 = [v10 lastObject];
        if ([v11 isEqualToString:@"referenceKeywords"])
        {
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        else
        {
          uint64_t v13 = [v4 objectForKeyedSubscript:v11];
          if (!v13)
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
            [v4 setObject:v13 forKeyedSubscript:v11];
          }
          [v13 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_sanitizedGraphDataDictionaryForArchivingDictionary:(id)a3 memoryLocalIdentifier:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v11 = 0;
    goto LABEL_34;
  }
  uint64_t v7 = [v5 objectForKey:@"backingMoments"];
  uint64_t v8 = [v5 objectForKey:@"collectionsInfo"];
  uint64_t v9 = [v5 objectForKey:@"info"];
  uint64_t v10 = [v9 mutableCopy];

  id v33 = v6;
  if (!v7 || !v8 || !v10)
  {
    if (!v6)
    {
      id v31 = (void *)v8;
      uint64_t v13 = 0;
      id v14 = 0;
LABEL_17:
      id v30 = (void *)v10;

      goto LABEL_18;
    }
    id v12 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v42 = 0;
    uint64_t v13 = [v12 memoryDebugInformationForMemoryWithLocalIdentifier:v6 error:&v42];
    id v14 = v42;

    if (!v13)
    {
LABEL_12:
      id v31 = (void *)v8;
      if (v14)
      {
        long long v15 = PLUIGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v45 = "+[PXMemoriesRelatedDiagnosticsHelper _sanitizedGraphDataDictionaryForArchivingDictionary:memoryLocalIdentifier:]";
          __int16 v46 = 2112;
          id v47 = v14;
          _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
        }
      }
      goto LABEL_17;
    }
    if (v7)
    {
      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v7 = [v13 objectForKeyedSubscript:@"backingMoments"];
      if (v8)
      {
LABEL_11:
        if (v10) {
          goto LABEL_12;
        }
LABEL_39:
        v29 = [v13 objectForKeyedSubscript:@"info"];
        uint64_t v10 = [v29 mutableCopy];

        goto LABEL_12;
      }
    }
    uint64_t v8 = [v13 objectForKeyedSubscript:@"collectionsInfo"];
    if (v10) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
  id v30 = (void *)v10;
  id v31 = (void *)v8;
LABEL_18:
  id v34 = v5;
  v32 = (void *)[v5 mutableCopy];
  long long v16 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v7;
  uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v22 = [v21 objectForKey:@"keywords"];
        if (v22)
        {
          v23 = [MEMORY[0x1E4F1CA60] dictionary];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __112__PXMemoriesRelatedDiagnosticsHelper__sanitizedGraphDataDictionaryForArchivingDictionary_memoryLocalIdentifier___block_invoke;
          v36[3] = &unk_1E5DD2A90;
          id v37 = v23;
          id v24 = v23;
          [v22 enumerateKeysAndObjectsUsingBlock:v36];
          v25 = (void *)[v21 mutableCopy];
          [v25 setObject:v24 forKey:@"keywords"];
          [v16 addObject:v25];
        }
        else
        {
          [v16 addObject:v21];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v18);
  }

  v11 = v32;
  [v32 setObject:v16 forKey:@"backingMoments"];
  if (v31) {
    [v32 setObject:v31 forKey:@"collectionsInfo"];
  }
  v26 = [v30 objectForKeyedSubscript:@"moodKeywords"];
  id v6 = v33;
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [v26 allObjects];
      [v30 setObject:v27 forKeyedSubscript:@"moodKeywords"];
    }
  }
  [v32 setObject:v30 forKeyedSubscript:@"info"];

  id v5 = v34;
LABEL_34:

  return v11;
}

void __112__PXMemoriesRelatedDiagnosticsHelper__sanitizedGraphDataDictionaryForArchivingDictionary_memoryLocalIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 stringValue];

    id v5 = (id)v6;
  }
  [*(id *)(a1 + 32) setObject:v7 forKey:v5];
}

+ (id)getSummaryFromProviderItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v95 = [MEMORY[0x1E4F28B00] currentHandler];
    [v95 handleFailureInMethod:a2, a1, @"PXMemoriesRelatedDiagnosticsHelper.m", 313, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [v5 localIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    uint64_t v9 = [v8 localizedTitle];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = [v8 localizedTitle];
      [v6 setObject:v11 forKey:@"title"];
    }
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "assetCollectionType"));
    [v6 setObject:v12 forKey:@"assetCollectionType"];

    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "assetCollectionSubtype"));
    [v6 setObject:v13 forKey:@"assetCollectionSubtype"];

    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "estimatedAssetCount"));
    [v6 setObject:v14 forKey:@"estimatedAssetCount"];

    long long v15 = [v8 creationDate];

    if (v15)
    {
      long long v16 = [v8 creationDate];
      [v6 setObject:v16 forKey:@"creationDate"];
    }
    if (v7) {
      [v6 setObject:v7 forKey:@"localIdentifier"];
    }
    if ([v8 assetCollectionType] != 4)
    {
      if ([v8 assetCollectionType] == 3)
      {
        id v8 = v8;
        uint64_t v73 = [v8 startDate];
        if (v73) {
          [v6 setObject:v73 forKey:@"startDate"];
        }
        uint64_t v74 = [v8 endDate];
        if (v74) {
          [v6 setObject:v74 forKey:@"endDate"];
        }
        [v6 setObject:@"Moment" forKey:@"referenceOrigin"];
      }
      else
      {
        if ([v8 assetCollectionType] != 5)
        {
          [v6 setObject:@"Collection" forKey:@"referenceOrigin"];
          goto LABEL_74;
        }
        id v8 = v8;
        v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "relationType"));
        [v6 setObject:v78 forKey:@"relationType"];

        v79 = [v8 localizedSubtitle];
        uint64_t v80 = [v79 length];

        if (v80)
        {
          v81 = [v8 localizedSubtitle];
          [v6 setObject:v81 forKey:@"subtitle"];
        }
        v82 = [v8 localizedLocationNames];

        if (v82)
        {
          v83 = [v8 localizedLocationNames];
          [v6 setObject:v83 forKey:@"locationNames"];
        }
        v84 = [v8 debugInfo];
        uint64_t v85 = [v84 count];

        if (v85)
        {
          v86 = [v8 debugInfo];
          [v6 setObject:v86 forKey:@"relatedDebugInfo"];
        }
        uint64_t v73 = [v8 highlightLocalIdentifier];
        if ([v73 length]) {
          [v6 setObject:v73 forKey:@"highlightLocalIdentifier"];
        }
        uint64_t v74 = [v8 momentLocalIdentifiers];
        if ([v74 count]) {
          [v6 setObject:v74 forKey:@"momentLocalIdentifiers"];
        }
        uint64_t v87 = [a1 _datesAndAssetCountDictionaryForAssetCollection:v8];
        [v6 addEntriesFromDictionary:v87];
        [v6 setObject:@"Related" forKey:@"referenceOrigin"];
      }
      goto LABEL_74;
    }
    id v8 = v8;
    uint64_t v17 = [v8 isRejected];
    uint64_t v18 = [NSNumber numberWithBool:v17];
    [v6 setObject:v18 forKey:@"rejected"];

    uint64_t v19 = [v8 isFavorite];
    uint64_t v20 = [NSNumber numberWithBool:v19];
    [v6 setObject:v20 forKey:@"favorite"];

    uint64_t v21 = [v8 pendingState];
    v22 = [NSNumber numberWithUnsignedShort:v21];
    [v6 setObject:v22 forKey:@"pendingState"];

    [v8 score];
    v23 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v6 setObject:v23 forKey:@"score"];

    uint64_t v24 = [v8 uuid];
    if (v24) {
      [v6 setObject:v24 forKey:@"uuid"];
    }
    v100 = (void *)v24;
    uint64_t v25 = [v8 photosGraphVersion];
    v26 = [NSNumber numberWithLongLong:v25];
    [v6 setObject:v26 forKey:@"photoGraphVersion"];

    uint64_t v27 = [v8 photosGraphProperties];
    if (v27)
    {
      v28 = (void *)MEMORY[0x1AD10CB00]();
      v29 = [a1 _sanitizedGraphDataDictionaryForArchivingDictionary:v27 memoryLocalIdentifier:v7];
      [v6 setObject:v29 forKey:@"photosGraphProperties"];
    }
    uint64_t v30 = [v8 movieData];
    if (v30) {
      [v6 setObject:v30 forKey:@"movieData"];
    }
    id v31 = [v8 lastViewedDate];
    if (v31) {
      [v6 setObject:v31 forKey:@"lastViewedDate"];
    }
    v96 = (void *)v30;
    uint64_t v98 = (void *)v27;
    id v102 = v5;
    long long v104 = v7;
    v32 = [v8 lastViewedDate];
    if (v32) {
      [v6 setObject:v32 forKey:@"lastMoviePlayedDate"];
    }
    id v33 = a1;
    uint64_t v34 = [v8 category];
    double v35 = [MEMORY[0x1E4F39160] stringForCategory:v34];
    [v6 setObject:v35 forKey:@"category"];
    uint64_t v36 = [v8 subcategory];
    id v37 = [MEMORY[0x1E4F39160] stringForSubcategory:v36];
    [v6 setObject:v37 forKey:@"subCategory"];
    long long v38 = [v8 subtitle];
    if ([v38 length])
    {
      long long v39 = [v8 subtitle];
    }
    else
    {
      long long v39 = @"unknown";
    }

    [v6 setObject:v39 forKey:@"subtitle"];
    [v6 setObject:@"Memory" forKey:@"referenceOrigin"];
    uint64_t v88 = [v8 titleFontName];
    v89 = (void *)v88;
    if (v88) {
      v90 = (__CFString *)v88;
    }
    else {
      v90 = @"unknown";
    }
    [v6 setObject:v90 forKey:@"fontName"];

    v91 = (void *)MEMORY[0x1AD10CB00]();
    uint64_t v92 = [v33 _curationFullsetForMemory:v8];
    if (v92) {
      [v6 setObject:v92 forKeyedSubscript:@"curationFullset"];
    }

    v93 = [v33 _datesAndAssetCountDictionaryForAssetCollection:v8];
    [v6 addEntriesFromDictionary:v93];

    id v5 = v102;
    id v7 = v104;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v105 = v7;
      id v8 = v5;
      long long v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "mediaType"));
      [v6 setObject:v40 forKey:@"assetType"];

      long long v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "mediaSubtypes"));
      [v6 setObject:v41 forKey:@"mediaSubtypes"];

      id v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "pixelWidth"));
      [v6 setObject:v42 forKey:@"pixelWidth"];

      id v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "pixelHeight"));
      [v6 setObject:v43 forKey:@"pixelHeight"];

      uint64_t v44 = NSNumber;
      [v8 duration];
      long long v45 = objc_msgSend(v44, "numberWithDouble:");
      [v6 setObject:v45 forKey:@"duration"];

      __int16 v46 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isHidden"));
      [v6 setObject:v46 forKey:@"isHidden"];

      id v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isFavorite"));
      [v6 setObject:v47 forKey:@"isFavorite"];

      uint64_t v48 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isTrashed"));
      [v6 setObject:v48 forKey:@"isTrashed"];

      long long v49 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "hasAdjustments"));
      [v6 setObject:v49 forKey:@"hasAdjustments"];

      long long v50 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isVideo"));
      [v6 setObject:v50 forKey:@"isVideo"];

      long long v51 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isPhoto"));
      [v6 setObject:v51 forKey:@"isPhoto"];

      id v52 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isAudio"));
      [v6 setObject:v52 forKey:@"isAudio"];

      id v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isIncludedInMoments"));
      [v6 setObject:v53 forKey:@"isIncludedInMoments"];

      uint64_t v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isIncludedInCloudFeeds"));
      [v6 setObject:v54 forKey:@"isIncludedInCloudFeeds"];

      uint64_t v55 = [v8 assetUserActivityProperties];
      uint64_t v56 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v55, "playCount"));
      [v6 setObject:v56 forKey:@"playCount"];

      v57 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v55, "viewCount"));
      [v6 setObject:v57 forKey:@"viewCount"];

      long long v103 = v55;
      v58 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v55, "shareCount"));
      [v6 setObject:v58 forKey:@"shareCount"];

      uint64_t v59 = [v8 creationDate];
      if (v59) {
        [v6 setObject:v59 forKey:@"creationDate"];
      }
      uint64_t v60 = [v8 modificationDate];
      if (v60) {
        [v6 setObject:v60 forKey:@"modificationDate"];
      }
      v61 = [v8 location];
      v62 = v61;
      if (v61)
      {
        v63 = [v61 description];
        [v6 setObject:v63 forKey:@"location"];
      }
      id v64 = [v8 burstIdentifier];
      if (v64) {
        [v6 setObject:v64 forKey:@"burstIdentifier"];
      }
      uint64_t v65 = [v8 uniformTypeIdentifier];
      if (v65) {
        [v6 setObject:v65 forKey:@"uniformTypeIdentifier"];
      }
      v99 = (void *)v60;
      uint64_t v66 = [v8 filename];
      if (v66) {
        [v6 setObject:v66 forKey:@"filename"];
      }
      v97 = v62;
      uint64_t v67 = [v8 cloudIdentifier];
      if (v67) {
        [v6 setObject:v67 forKey:@"cloudIdentifier"];
      }
      long long v101 = (void *)v59;
      v68 = [v8 adjustmentVersion];
      if (v68) {
        [v6 setObject:v68 forKey:@"adjustmentVersion"];
      }
      v69 = [v8 faceAdjustmentVersion];
      if (v69) {
        [v6 setObject:v69 forKey:@"faceAdjustmentVersion"];
      }
      v70 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v8, "faceAnalysisVersion"));
      [v6 setObject:v70 forKey:@"faceAnalysisVersion"];

      v71 = (objc_class *)objc_opt_class();
      id v72 = NSStringFromClass(v71);
      [v6 setObject:v72 forKey:@"itemClass"];

      [v6 setObject:@"One Up" forKey:@"referenceOrigin"];
      id v7 = v105;
      if (v105) {
        [v6 setObject:v105 forKey:@"localIdentifier"];
      }
    }
    else
    {
      id v8 = [NSString stringWithFormat:@"%@", v5];
      uint64_t v75 = [v5 uuid];
      [v6 setObject:v8 forKey:v75];
      v76 = (objc_class *)objc_opt_class();
      v77 = NSStringFromClass(v76);
      [v6 setObject:v77 forKey:@"itemClass"];
      [v6 setObject:v77 forKey:@"referenceOrigin"];
      if (v7) {
        [v6 setObject:v7 forKey:@"localIdentifier"];
      }
    }
  }
LABEL_74:

  return v6;
}

+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceMemory:(id)a6 sourceDictionary:(id)a7
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = v13;
  if (a3) {
    BOOL v15 = a4 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = !v15;
  if (!v15)
  {
    switch(a5)
    {
      case 2:
        v141 = [v13 objectForKeyedSubscript:@"collectionsInfo"];
        [v14 objectForKeyedSubscript:@"backingMoments"];
        v143 = v142 = a3;
        v144 = objc_opt_new();
        v145 = objc_opt_new();
        v212[0] = MEMORY[0x1E4F143A8];
        v212[1] = 3221225472;
        v212[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_2;
        v212[3] = &unk_1E5DBE2F8;
        id v146 = v144;
        id v213 = v146;
        id v147 = v145;
        id v214 = v147;
        [v141 enumerateObjectsUsingBlock:v212];
        v209[0] = MEMORY[0x1E4F143A8];
        v209[1] = 3221225472;
        v209[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_3;
        v209[3] = &unk_1E5DBE2F8;
        id v210 = v146;
        id v211 = v147;
        id v148 = v147;
        id v149 = v146;
        [v143 enumerateObjectsUsingBlock:v209];
        id v150 = v149;
        id *v142 = v150;
        id v151 = v148;
        *a4 = v151;

        break;
      case 1:
        v152 = [v13 objectForKeyedSubscript:@"featureVector"];
        *a3 = [v152 allKeys];
        id v153 = v152;
        *a4 = v153;

        break;
      case 0:
        v198 = a3;
        v199 = a4;
        uint64_t v17 = objc_opt_new();
        v202 = v14;
        uint64_t v18 = [v14 objectForKeyedSubscript:@"info"];
        objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"category", @"subcategory", @"originalsubcategory", @"sourceType", @"creationDate", @"assetCount", @"title", @"subtitle", @"fontname", @"representativeassetcount", @"repCount", @"relevantAssetCount", @"curatedCount", @"extendedCuratedCount", @"meaningLabels", @"numberOfMoments", @"numberOfCollections",
          @"notificationstate",
          @"suggestedMood",
          @"recommendedMoods",
          @"forbiddenMoods",
          @"moodWeights",
          @"moodKeywords",
        v207 = 0);
        uint64_t v19 = NSString;
        uint64_t v20 = [v12 localIdentifier];
        uint64_t v21 = [v19 stringWithFormat:@"[localIdentifier] %@", v20];
        [v17 addObject:v21];

        v22 = NSString;
        [v12 pendingState];
        v23 = PHMemoryPendingStateDescription();
        uint64_t v24 = [v22 stringWithFormat:@"[pendingState] %@ (%d)", v23, objc_msgSend(v12, "pendingState")];
        [v17 addObject:v24];

        uint64_t v25 = NSString;
        [v12 creationType];
        v26 = PHMemoryCreationTypeDescription();
        uint64_t v27 = [v25 stringWithFormat:@"[creationType] %@ (%d)", v26, objc_msgSend(v12, "creationType")];
        [v17 addObject:v27];

        v28 = NSString;
        v29 = objc_msgSend(MEMORY[0x1E4F39160], "stringForCategory:", objc_msgSend(v12, "category"));
        uint64_t v30 = [v28 stringWithFormat:@"[category] %@", v29];
        [v17 addObject:v30];

        id v31 = NSString;
        uint64_t v32 = [v18 objectForKeyedSubscript:@"sourceType"];
        id v33 = (void *)v32;
        uint64_t v34 = @"## Missing Source Type ##";
        if (v32) {
          uint64_t v34 = (__CFString *)v32;
        }
        double v35 = [v31 stringWithFormat:@"[sourceType] %@", v34];
        [v17 addObject:v35];

        v203 = v18;
        uint64_t v36 = [v18 objectForKeyedSubscript:@"creationDate"];
        if (!v36
          || ([MEMORY[0x1E4F28C10] localizedStringFromDate:v36 dateStyle:2 timeStyle:2],
              (id v37 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v37 = @"## Missing Creation Date ##";
        }
        v196 = v37;
        v197 = (void *)v36;
        long long v38 = [NSString stringWithFormat:@"[creationDate] %@", v37];
        [v17 addObject:v38];

        long long v39 = NSString;
        [v12 score];
        long long v41 = objc_msgSend(v39, "stringWithFormat:", @"[score] %.3f", v40);
        [v17 addObject:v41];

        id v42 = NSString;
        id v43 = (void *)MEMORY[0x1E4F39188];
        uint64_t v44 = [MEMORY[0x1E4F1C9C8] date];
        [v43 relevanceScoreForMemory:v12 atDate:v44];
        __int16 v46 = objc_msgSend(v42, "stringWithFormat:", @"[current relevance score] %.3f", v45);
        [v17 addObject:v46];

        id v47 = NSString;
        uint64_t v48 = (void *)MEMORY[0x1E4F39188];
        long long v49 = [v12 creationDate];
        [v48 relevanceScoreForMemory:v12 atDate:v49];
        long long v51 = objc_msgSend(v47, "stringWithFormat:", @"[relevance score on creation date] %.3f", v50);
        [v17 addObject:v51];

        id v52 = NSString;
        uint64_t v53 = [v12 localizedTitle];
        uint64_t v54 = (void *)v53;
        uint64_t v55 = @"## Missing Title ##";
        if (v53) {
          uint64_t v55 = (__CFString *)v53;
        }
        uint64_t v56 = [v52 stringWithFormat:@"[title] %@", v55];
        [v17 addObject:v56];

        v57 = NSString;
        uint64_t v58 = [v12 localizedSubtitle];
        uint64_t v59 = (void *)v58;
        uint64_t v60 = &stru_1F00B0030;
        if (v58) {
          uint64_t v60 = (__CFString *)v58;
        }
        v61 = [v57 stringWithFormat:@"[subtitle] %@", v60];
        [v17 addObject:v61];

        v62 = NSString;
        uint64_t v63 = [v12 titleFontName];
        id v64 = (void *)v63;
        uint64_t v65 = @"## Missing Title Font Name";
        if (v63) {
          uint64_t v65 = (__CFString *)v63;
        }
        uint64_t v66 = [v62 stringWithFormat:@"[fontName] %@", v65];
        [v17 addObject:v66];

        uint64_t v67 = NSString;
        uint64_t v68 = [v18 objectForKeyedSubscript:@"assetCount"];
        v69 = (void *)v68;
        v70 = @"## Missing Asset Count ##";
        if (v68) {
          v70 = (__CFString *)v68;
        }
        v71 = [v67 stringWithFormat:@"[assetCount] %@", v70];
        [v17 addObject:v71];

        id v72 = NSString;
        uint64_t v73 = [v18 objectForKeyedSubscript:@"repCount"];
        uint64_t v74 = v73;
        if (!v73)
        {
          uint64_t v75 = [v18 objectForKeyedSubscript:@"representativeAssetCount"];
          v69 = (void *)v75;
          uint64_t v74 = @"## Missing Representative Asset Count ##";
          if (v75) {
            uint64_t v74 = (__CFString *)v75;
          }
        }
        v76 = [v72 stringWithFormat:@"[representativeAssetCount] %@", v74];
        [v17 addObject:v76];

        if (!v73) {
        v77 = NSString;
        }
        uint64_t v78 = [v18 objectForKeyedSubscript:@"relevantAssetCount"];
        v79 = (void *)v78;
        uint64_t v80 = @"## Missing Relevant Asset Count ##";
        if (v78) {
          uint64_t v80 = (__CFString *)v78;
        }
        v81 = [v77 stringWithFormat:@"[relevantAssetCount] %@", v80];
        [v17 addObject:v81];

        v82 = NSString;
        uint64_t v83 = [v18 objectForKeyedSubscript:@"curatedCount"];
        v84 = (void *)v83;
        uint64_t v85 = @"## Missing Curated Asset Count ##";
        if (v83) {
          uint64_t v85 = (__CFString *)v83;
        }
        v86 = [v82 stringWithFormat:@"[curatedAssetCount] %@", v85];
        [v17 addObject:v86];

        uint64_t v87 = NSString;
        uint64_t v88 = [v18 objectForKeyedSubscript:@"extendedCuratedCount"];
        v89 = (void *)v88;
        v90 = @"## Missing Extended Curated Asset Count ##";
        if (v88) {
          v90 = (__CFString *)v88;
        }
        v91 = [v87 stringWithFormat:@"[extendedCuratedAssetCount] %@", v90];
        [v17 addObject:v91];

        uint64_t v92 = NSString;
        uint64_t v93 = [v18 objectForKeyedSubscript:@"keyAssetUUID"];
        v94 = (void *)v93;
        v95 = @"## Missing Key Asset ##";
        if (v93) {
          v95 = (__CFString *)v93;
        }
        v96 = [v92 stringWithFormat:@"[keyAssetUUID] %@", v95];
        [v17 addObject:v96];

        v97 = NSString;
        uint64_t v98 = [v18 objectForKeyedSubscript:@"keyAssetUUID"];
        v99 = [a1 _isSafeForWidgetDisplayForAssetUUID:v98];
        v100 = [v97 stringWithFormat:@"[keyAssetIsSafeForWidgetDisplay] %@", v99];
        [v17 addObject:v100];

        long long v101 = NSString;
        uint64_t v102 = [v18 objectForKeyedSubscript:@"numberOfMoments"];
        long long v103 = (void *)v102;
        long long v104 = @"## Missing Number of Moments ##";
        if (v102) {
          long long v104 = (__CFString *)v102;
        }
        long long v105 = [v101 stringWithFormat:@"[numberOfMoments] %@", v104];
        [v17 addObject:v105];

        long long v106 = NSString;
        uint64_t v107 = [v18 objectForKeyedSubscript:@"numberOfCollections"];
        long long v108 = (void *)v107;
        long long v109 = @"## Missing Number of Collections ##";
        if (v107) {
          long long v109 = (__CFString *)v107;
        }
        long long v110 = [v106 stringWithFormat:@"[numberOfCollections] %@", v109];
        [v17 addObject:v110];

        long long v111 = NSString;
        long long v112 = [v18 objectForKeyedSubscript:@"suggestedMood"];
        long long v113 = [v111 stringWithFormat:@"[suggestedMood] %@", v112];
        [v17 addObject:v113];

        long long v114 = NSString;
        long long v115 = [v18 objectForKeyedSubscript:@"recommendedMoods"];
        long long v116 = [v114 stringWithFormat:@"[recommendedMoods] %@", v115];
        [v17 addObject:v116];

        long long v117 = NSString;
        long long v118 = [v18 objectForKeyedSubscript:@"forbiddenMoods"];
        long long v119 = [v117 stringWithFormat:@"[forbiddenMoods] %@", v118];
        [v17 addObject:v119];

        long long v120 = NSString;
        v121 = [v18 objectForKeyedSubscript:@"moodWeights"];
        v122 = [v120 stringWithFormat:@"[moodWeights] %@", v121];
        [v17 addObject:v122];

        v123 = NSString;
        v124 = [v18 objectForKeyedSubscript:@"moodKeywords"];
        v125 = [v124 componentsJoinedByString:@", "];
        v126 = [v123 stringWithFormat:@"[moodKeywords] %@", v125];
        [v17 addObject:v126];

        v127 = NSString;
        v128 = [a1 _userFeedbackScoreInfoForMemory:v12];
        v129 = [v127 stringWithFormat:@"[userFeedbackScore] %@", v128];
        [v17 addObject:v129];

        v130 = NSString;
        v131 = [v14 objectForKeyedSubscript:@"triggerTypes"];
        v132 = [v130 stringWithFormat:@"[triggerTypes] %@", v131];
        [v17 addObject:v132];

        v133 = NSString;
        v134 = [v14 objectForKeyedSubscript:@"encodedFeatures"];
        v135 = [v133 stringWithFormat:@"[memoryFeatures] %@", v134];
        [v17 addObject:v135];

        v136 = NSString;
        v137 = [v12 graphMemoryIdentifier];
        v138 = [v136 stringWithFormat:@"[graphMemoryIdentifier] %@", v137];
        [v17 addObject:v138];

        uint64_t v139 = [v12 notificationState];
        if (v139 == 1)
        {
          v140 = @"Requested";
        }
        else
        {
          if (v139 != 2) {
            goto LABEL_48;
          }
          v140 = @"Seen";
        }
        v154 = [NSString stringWithFormat:@"[notificationState] Notification State %@ (%lu)", v140, objc_msgSend(v12, "notificationState")];
        [v17 addObject:v154];

LABEL_48:
        BOOL v200 = v16;
        v155 = [v18 objectForKeyedSubscript:@"meaningLabels"];
        if ([v155 count])
        {
          v156 = [v203 objectForKeyedSubscript:@"meaning"];

          if (!v156)
          {
            v157 = NSString;
            v158 = [v155 componentsJoinedByString:@", "];
            v159 = [v157 stringWithFormat:@"[meaning] %@", v158];
            [v17 addObject:v159];
          }
        }
        v195 = v155;
        [v12 photosGraphVersion];
        v160 = objc_msgSend(NSString, "stringWithFormat:", @"[graphVersion] %u", PLGraphAlgorithmsVersionFromPhotosGraphVersion());
        [v17 addObject:v160];

        v161 = objc_msgSend(NSString, "stringWithFormat:", @"[curationAlgorithmsVersion] %u", PLCurationAlgorithmsVersionFromPhotosGraphVersion());
        [v17 addObject:v161];

        v162 = objc_msgSend(NSString, "stringWithFormat:", @"[relatedAlgorithmsVersion] %u", PLRelatedAlgorithmsVersionFromPhotosGraphVersion());
        [v17 addObject:v162];

        v163 = objc_msgSend(NSString, "stringWithFormat:", @"[memoriesAlgorithmsVersion] %u", PLMemoriesAlgorithmsVersionFromPhotosGraphVersion());
        [v17 addObject:v163];

        v219[0] = MEMORY[0x1E4F143A8];
        v219[1] = 3221225472;
        v219[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke;
        v219[3] = &unk_1E5DBE2D0;
        id v194 = v207;
        id v220 = v194;
        id v208 = v17;
        id v221 = v208;
        [v203 enumerateKeysAndObjectsUsingBlock:v219];
        id v164 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v164 setDateStyle:2];
        [v164 setTimeStyle:0];
        v165 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
        v204 = v164;
        [v164 setTimeZone:v165];

        long long v217 = 0u;
        long long v218 = 0u;
        long long v215 = 0u;
        long long v216 = 0u;
        id v201 = v12;
        obuint64_t j = [v12 blockableFeatures];
        uint64_t v166 = [obj countByEnumeratingWithState:&v215 objects:v225 count:16];
        if (v166)
        {
          uint64_t v167 = v166;
          uint64_t v206 = *(void *)v216;
          do
          {
            uint64_t v168 = 0;
            do
            {
              if (*(void *)v216 != v206) {
                objc_enumerationMutation(obj);
              }
              v169 = *(void **)(*((void *)&v215 + 1) + 8 * v168);
              if ([v169 type] == 1)
              {
                v170 = [v169 personLocalIdentifier];
                v171 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
                v172 = [v171 librarySpecificFetchOptions];

                v173 = (void *)MEMORY[0x1E4F391F0];
                v224 = v170;
                v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v224 count:1];
                v175 = [v173 fetchPersonsWithLocalIdentifiers:v174 options:v172];

                v176 = [v175 firstObject];
                v177 = [v176 name];
                if ([v177 length]) {
                  v178 = v177;
                }
                else {
                  v178 = v170;
                }
                id v179 = v178;

LABEL_66:
LABEL_67:

                goto LABEL_68;
              }
              if ([v169 type] == 16)
              {
                v170 = [v169 date];
                uint64_t v180 = [v204 stringFromDate:v170];
                goto LABEL_63;
              }
              if ([v169 type] == 512)
              {
                v170 = [v169 dateInterval];
                v181 = NSString;
                v172 = [v170 startDate];
                v175 = [v204 stringFromDate:v172];
                v182 = [v170 endDate];
                v183 = [v204 stringFromDate:v182];
                id v179 = [v181 stringWithFormat:@"%@ - %@", v175, v183];

                goto LABEL_66;
              }
              if ([v169 type] == 32)
              {
                uint64_t v187 = [v169 holidayName];
LABEL_76:
                id v179 = (id)v187;
                goto LABEL_68;
              }
              if ([v169 type] == 4096)
              {
                v170 = [v169 location];
                v188 = NSString;
                [v170 coordinate];
                uint64_t v190 = v189;
                [v170 coordinate];
                uint64_t v180 = objc_msgSend(v188, "stringWithFormat:", @"(%f,%f)", v190, v191);
LABEL_63:
                id v179 = (id)v180;
                goto LABEL_67;
              }
              if ([v169 type] == 0x20000)
              {
                uint64_t v187 = [v169 areaName];
                goto LABEL_76;
              }
              id v179 = 0;
LABEL_68:
              v184 = NSString;
              v185 = objc_msgSend(MEMORY[0x1E4F39178], "stringForType:", objc_msgSend(v169, "type"));
              v186 = [v184 stringWithFormat:@"[blockableFeature] %@: %@", v185, v179];
              [v208 addObject:v186];

              ++v168;
            }
            while (v167 != v168);
            uint64_t v192 = [obj countByEnumeratingWithState:&v215 objects:v225 count:16];
            uint64_t v167 = v192;
          }
          while (v192);
        }

        id *v198 = &unk_1F02D46F0;
        v222 = &stru_1F00B0030;
        id v223 = v208;
        id *v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v223 forKeys:&v222 count:1];

        id v12 = v201;
        id v14 = v202;
        BOOL v16 = v200;
        break;
    }
  }

  return v16;
}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v8] & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = [NSString stringWithFormat:@"[%@] %@", v8, v5];
    [v6 addObject:v7];
  }
}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = NSString;
  uint64_t v5 = (a3 + 1);
  id v6 = a2;
  uint64_t v30 = objc_msgSend(v4, "stringWithFormat:", @"Collection %d", v5);
  uint64_t v32 = [v30 stringByAppendingString:@" - Scores"];
  [*(id *)(a1 + 32) addObject:v32];
  id v7 = NSString;
  id v8 = [v6 objectForKeyedSubscript:@"averageContentScore"];
  [v8 floatValue];
  uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", @"Content Average: %.3f", v9);
  v34[0] = v10;
  v11 = NSString;
  id v12 = [v6 objectForKeyedSubscript:@"meaningScore"];
  [v12 floatValue];
  id v14 = objc_msgSend(v11, "stringWithFormat:", @"Meaning: %.3f", v13);
  v34[1] = v14;
  BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  id v31 = (void *)[v15 mutableCopy];

  [*(id *)(a1 + 40) setObject:v31 forKeyedSubscript:v32];
  v29 = [v30 stringByAppendingString:@" - Titling"];
  [*(id *)(a1 + 32) addObject:v29];
  BOOL v16 = NSString;
  uint64_t v17 = [v6 objectForKeyedSubscript:@"title"];
  uint64_t v18 = [v16 stringWithFormat:@"Title: %@", v17];
  v33[0] = v18;
  uint64_t v19 = NSString;
  uint64_t v20 = [v6 objectForKeyedSubscript:@"subtitle"];
  uint64_t v21 = [v19 stringWithFormat:@"Subtitle: %@", v20];
  v33[1] = v21;
  v22 = NSString;
  v23 = [v6 objectForKeyedSubscript:@"titleCategory"];
  uint64_t v24 = objc_msgSend(v22, "stringWithFormat:", @"Category: %ld", objc_msgSend(v23, "integerValue"));
  v33[2] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v26 = (void *)[v25 mutableCopy];

  [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:v29];
  uint64_t v27 = [v30 stringByAppendingString:@" - Meanings"];
  [*(id *)(a1 + 32) addObject:v27];
  v28 = [v6 objectForKeyedSubscript:@"meaningLabels"];

  [*(id *)(a1 + 40) setObject:v28 forKeyedSubscript:v27];
}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v31 = objc_msgSend(NSString, "stringWithFormat:", @"Moment %d", (a3 + 1));
  id v33 = [v31 stringByAppendingString:@" - General"];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [v5 objectForKeyedSubscript:@"numberOfAssets"];
  id v8 = v7;
  if (v7)
  {
    float v9 = objc_msgSend(NSString, "stringWithFormat:", @"Asset Count: %lu", objc_msgSend(v7, "unsignedIntegerValue"));
    [v6 addObject:v9];
  }
  uint64_t v32 = v8;
  uint64_t v10 = [v5 objectForKeyedSubscript:@"matchingScore"];
  v11 = v10;
  if (v10)
  {
    id v12 = NSString;
    [v10 floatValue];
    id v14 = objc_msgSend(v12, "stringWithFormat:", @"Matching: %.3f", v13);
    [v6 addObject:v14];
  }
  BOOL v15 = NSString;
  BOOL v16 = [v5 objectForKeyedSubscript:@"curationScore"];
  [v16 floatValue];
  uint64_t v18 = objc_msgSend(v15, "stringWithFormat:", @"Curation: %.3f", v17);
  v38[0] = v18;
  uint64_t v19 = NSString;
  uint64_t v20 = [v5 objectForKeyedSubscript:@"graphScore"];
  [v20 floatValue];
  v22 = objc_msgSend(v19, "stringWithFormat:", @"Graph: %.3f", v21);
  v38[1] = v22;
  uint64_t v30 = v11;
  v23 = NSString;
  uint64_t v24 = [v5 objectForKeyedSubscript:@"neighborScore"];
  [v24 floatValue];
  v26 = objc_msgSend(v23, "stringWithFormat:", @"Neighbor: %.3f", v25);
  v38[2] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  [v6 addObjectsFromArray:v27];

  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v33];
  v28 = [v5 objectForKeyedSubscript:@"keywords"];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_4;
  void v34[3] = &unk_1E5DBE320;
  id v35 = v31;
  id v36 = *(id *)(a1 + 32);
  id v37 = *(id *)(a1 + 40);
  id v29 = v31;
  [v28 enumerateKeysAndObjectsUsingBlock:v34];
}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [NSString stringWithFormat:@"%@ - %@", *(void *)(a1 + 32), v7];
    [*(id *)(a1 + 40) addObject:v6];
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
  }
}

+ (id)preprocessDictionary:(id)a3 forMemoryWithLocalIdentifier:(id)a4 algorithmsVersion:(int64_t)a5 inPhotoLibrary:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v47 = a6;
  uint64_t v10 = (void *)[a3 mutableCopy];
  v11 = [v10 objectForKeyedSubscript:@"backingMoments"];
  id v12 = [v10 objectForKeyedSubscript:@"collectionsInfo"];
  if (![v11 count] || !objc_msgSend(v12, "count"))
  {
    id v54 = 0;
    float v13 = [v47 memoryDebugInformationForMemoryWithLocalIdentifier:v9 error:&v54];
    id v14 = v54;
    if (v13)
    {
      if (![v11 count])
      {
        BOOL v15 = [v13 objectForKeyedSubscript:@"backingMoments"];
        [v10 setObject:v15 forKeyedSubscript:@"backingMoments"];
      }
      if (![v12 count])
      {
        BOOL v16 = [v13 objectForKeyedSubscript:@"collectionsInfo"];
        [v10 setObject:v16 forKeyedSubscript:@"collectionsInfo"];
      }
    }
    if (v14)
    {
      float v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v58 = "+[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:]";
        __int16 v59 = 2112;
        id v60 = v14;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
      }
    }
  }
  uint64_t v18 = [v10 objectForKeyedSubscript:@"featureVector"];
  id v19 = [v10 objectForKeyedSubscript:@"featureVector_v2"];
  if (v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (id v19 = v18) != 0)
  {
    uint64_t v20 = [a1 _featureVectorInfoGroupedByKeyForFeatureVector:v19];

    if (!v20) {
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v20 = (void *)[v18 mutableCopy];
    if (!v20) {
      goto LABEL_39;
    }
  }
  unsigned int v49 = PLMemoriesAlgorithmsVersionFromPhotosGraphVersion();
  float v21 = [v20 objectForKeyedSubscript:@"People"];
  if (v21
    || ([v20 objectForKeyedSubscript:@"people"],
        (float v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v41 = v20;
    id v42 = v18;
    id v43 = v12;
    uint64_t v44 = v11;
    uint64_t v45 = v10;
    id v46 = v9;
    v22 = [v47 librarySpecificFetchOptions];
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = v21;
    uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(id *)(*((void *)&v50 + 1) + 8 * i);
          id v29 = v28;
          if (v49 < 0x201)
          {
            id v33 = v28;
          }
          else
          {
            uint64_t v30 = [MEMORY[0x1E4F39178] personLocalIdentifierForPersonUniversalIdentifier:v28 photoLibrary:v47];
            id v31 = (void *)v30;
            if (v30) {
              uint64_t v32 = (void *)v30;
            }
            else {
              uint64_t v32 = v29;
            }
            id v33 = v32;
          }
          uint64_t v34 = (void *)MEMORY[0x1E4F391F0];
          id v55 = v33;
          id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
          id v36 = [v34 fetchPersonsWithLocalIdentifiers:v35 options:v22];

          id v37 = [v36 firstObject];
          long long v38 = [v37 name];
          if ([v38 length]) {
            long long v39 = v38;
          }
          else {
            long long v39 = v29;
          }
          [v23 addObject:v39];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v25);
    }

    uint64_t v20 = v41;
    [v41 setObject:v23 forKeyedSubscript:@"People"];
    [v41 setObject:0 forKeyedSubscript:@"people"];

    uint64_t v10 = v45;
    id v9 = v46;
    id v12 = v43;
    v11 = v44;
    uint64_t v18 = v42;
  }
  [v10 setObject:v20 forKeyedSubscript:@"featureVector"];
LABEL_39:

  return v10;
}

@end