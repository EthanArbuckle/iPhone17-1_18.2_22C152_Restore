@interface PNSuggestionWallpaperShuffleUtilities
+ (id)allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 withRejectedPersonLocalIdentifiers:(id)a5;
+ (id)allPotentialSuggestionLocalIdentifiersForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 withRejectedPersonLocalIdentifiers:(id)a5;
+ (id)chosenSuggestionLocalIdentifiersForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 atDate:(id)a5 usingStrategy:(unint64_t)a6 withRejectedPersonLocalIdentifiers:(id)a7;
+ (id)chosenSuggestionLocalIdentifiersFromGroups:(id)a3 atDate:(id)a4;
+ (id)chosenSuggestionLocalIdentifiersIn:(id)a3 atDate:(id)a4;
+ (id)chosenSuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 inPhotoLibrary:(id)a5;
+ (id)matchingSuggestionInternalPredicateForPosterConfiguration:(id)a3;
+ (id)mediaFromSuggestions:(id)a3 assetBySuggestionUUID:(id *)a4;
+ (id)suggestionLocalIdentifiersByFeatureForPosterConfiguration:(id)a3 atDate:(id)a4 inPhotoLibrary:(id)a5;
+ (void)enumerateFeaturesOfPosterConfiguration:(id)a3 withRejectedPersonLocalIdentifiers:(id)a4 usingBlock:(id)a5;
+ (void)setFeaturedStateOfSuggestions:(id)a3;
@end

@implementation PNSuggestionWallpaperShuffleUtilities

+ (void)setFeaturedStateOfSuggestions:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__PNSuggestionWallpaperShuffleUtilities_setFeaturedStateOfSuggestions___block_invoke;
  v9[3] = &unk_26544F1A0;
  id v5 = v3;
  id v10 = v5;
  id v8 = 0;
  char v6 = [v4 performChangesAndWait:v9 error:&v8];
  id v7 = v8;
  if ((v6 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to set featuredState for suggestions error:%@", buf, 0xCu);
  }
}

void __71__PNSuggestionWallpaperShuffleUtilities_setFeaturedStateOfSuggestions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
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
        char v6 = objc_msgSend(MEMORY[0x263F14F58], "changeRequestForSuggestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setFeaturedState:1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

+ (id)mediaFromSuggestions:(id)a3 assetBySuggestionUUID:(id *)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21 = [v4 photoLibrary];
  uint64_t v5 = [v21 librarySpecificFetchOptions];
  v29[0] = *MEMORY[0x263F14FE0];
  char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v5 setFetchPropertySets:v6];

  v20 = v5;
  long long v7 = [MEMORY[0x263F14D18] fetchKeyAssetBySuggestionUUIDForSuggestions:v4 options:v5];
  long long v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
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
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 uuid];
        v15 = [v7 objectForKeyedSubscript:v14];
        if (v15)
        {
          id v16 = objc_alloc(MEMORY[0x263F5DF50]);
          v17 = [v15 uuid];
          v18 = objc_msgSend(v16, "initWithAssetUUID:suggestionUUID:suggestionSubtype:", v17, v14, objc_msgSend(v13, "subtype"));

          [v8 addObject:v18];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  if (a4) {
    *a4 = v7;
  }

  return v8;
}

+ (id)chosenSuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 inPhotoLibrary:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [a1 suggestionLocalIdentifiersByFeatureForPosterConfiguration:v10 atDate:v9 inPhotoLibrary:v8];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F14F60]) initWithPhotoLibrary:v8];
  uint64_t v13 = [v12 personUUIDsWithNegativeFeedback];
  v14 = [a1 chosenSuggestionLocalIdentifiersForPosterConfiguration:v10 fromSuggestionLocalIdentifiersByFeature:v11 atDate:v9 usingStrategy:0 withRejectedPersonLocalIdentifiers:v13];

  v15 = [v8 librarySpecificFetchOptions];

  id v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"localIdentifier", v14];
  [v15 setPredicate:v16];

  v17 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v15];

  return v17;
}

+ (id)chosenSuggestionLocalIdentifiersFromGroups:(id)a3 atDate:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  unint64_t v9 = 0;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v5);
      }
      v9 += [*(id *)(*((void *)&v23 + 1) + 8 * i) count];
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v8);
  if (v9)
  {
    unint64_t v12 = [v5 count];
    if (v9 >= 0x10) {
      unint64_t v13 = 16;
    }
    else {
      unint64_t v13 = v9;
    }
    [v6 timeIntervalSinceReferenceDate];
    double v15 = v14;
    id v16 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    if ([v16 count] < v13)
    {
      unint64_t v17 = v13 * (unint64_t)(v15 / 86400.0) % v9;
      do
      {
        v18 = [v5 objectAtIndexedSubscript:v17 % v12];
        v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", v17 / v12 % objc_msgSend(v18, "count"));
        [v16 addObject:v19];

        ++v17;
      }
      while ([v16 count] < v13);
    }
    v20 = [v16 allObjects];
    v21 = [v20 sortedArrayUsingSelector:sel_compare_];
  }
  else
  {
LABEL_16:
    v21 = (void *)MEMORY[0x263EFFA68];
  }

  return v21;
}

+ (id)chosenSuggestionLocalIdentifiersIn:(id)a3 atDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 count];
  if (v7)
  {
    unint64_t v8 = v7;
    if (v7 >= 0x10) {
      uint64_t v9 = 16;
    }
    else {
      uint64_t v9 = v7;
    }
    [v6 timeIntervalSinceReferenceDate];
    unint64_t v11 = v9 * (unint64_t)(v10 / 86400.0) % v8;
    if (v11 >= v8 - v9)
    {
      unint64_t v13 = v8 - v11;
      double v14 = objc_msgSend(v5, "subarrayWithRange:");
      double v15 = objc_msgSend(v5, "subarrayWithRange:", 0, v9 - v13);
      unint64_t v12 = [v14 arrayByAddingObjectsFromArray:v15];
    }
    else
    {
      unint64_t v12 = objc_msgSend(v5, "subarrayWithRange:");
    }
    id v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      v19 = v12;
      _os_log_impl(&dword_25934C000, v16, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Chosen suggestion localIdentifiers: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    unint64_t v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

+ (id)allPotentialSuggestionLocalIdentifiersForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 withRejectedPersonLocalIdentifiers:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFF980];
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __177__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifiersForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke;
  v21 = &unk_26544EE70;
  id v22 = v8;
  id v13 = v12;
  id v23 = v13;
  id v14 = v8;
  [a1 enumerateFeaturesOfPosterConfiguration:v11 withRejectedPersonLocalIdentifiers:v10 usingBlock:&v18];

  objc_msgSend(v13, "sortUsingSelector:", sel_compare_, v18, v19, v20, v21);
  double v15 = v23;
  id v16 = v13;

  return v16;
}

void __177__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifiersForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (v4)
  {
    [*(id *)(a1 + 40) addObjectsFromArray:v4];
    id v5 = PLWallpaperGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109378;
      v6[1] = [v4 count];
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_25934C000, v5, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Adding %d suggestions for feature '%@'", (uint8_t *)v6, 0x12u);
    }
  }
}

+ (id)allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 withRejectedPersonLocalIdentifiers:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFF980];
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __182__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke;
  v18[3] = &unk_26544EE70;
  id v19 = v8;
  id v13 = v12;
  id v20 = v13;
  id v14 = v8;
  [a1 enumerateFeaturesOfPosterConfiguration:v11 withRejectedPersonLocalIdentifiers:v10 usingBlock:v18];

  double v15 = v20;
  id v16 = v13;

  return v16;
}

void __182__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
    id v5 = PLWallpaperGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109378;
      v6[1] = [v4 count];
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_25934C000, v5, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Adding %d suggestions for feature '%@'", (uint8_t *)v6, 0x12u);
    }
  }
}

+ (void)enumerateFeaturesOfPosterConfiguration:(id)a3 withRejectedPersonLocalIdentifiers:(id)a4 usingBlock:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  char v10 = [v7 shuffleSmartAlbums];
  char v11 = v10;
  if ((v10 & 2) == 0)
  {
    if ((v10 & 4) == 0) {
      goto LABEL_3;
    }
LABEL_10:
    unint64_t v17 = PHSuggestionStringWithSubtype();
    v9[2](v9, v17);

    if ((v11 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v16 = PHSuggestionStringWithSubtype();
  v9[2](v9, v16);

  if ((v11 & 4) != 0) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v11 & 8) != 0)
  {
LABEL_4:
    id v12 = PHSuggestionStringWithSubtype();
    v9[2](v9, v12);
  }
LABEL_5:
  id v13 = [v7 personLocalIdentifiers];
  id v14 = v13;
  if ((v11 & 1) != 0 && [v13 count])
  {
    if ((v11 & 0xE) != 0) {
      char v15 = 0;
    }
    else {
      char v15 = [v14 isSubsetOfSet:v8];
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v29 = v14;
    id v18 = v14;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
          if ((v15 & 1) != 0
            || ([v8 containsObject:*(void *)(*((void *)&v34 + 1) + 8 * v22)] & 1) == 0)
          {
            v9[2](v9, v23);
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v20);
    }

    id v14 = v29;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v24 = [v7 albumCloudIdentifiers];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v31;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(v24);
        }
        v9[2](v9, *(void **)(*((void *)&v30 + 1) + 8 * v28++));
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v26);
  }
}

+ (id)chosenSuggestionLocalIdentifiersForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 atDate:(id)a5 usingStrategy:(unint64_t)a6 withRejectedPersonLocalIdentifiers:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = PLWallpaperGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412290;
    id v22 = v12;
    _os_log_impl(&dword_25934C000, v16, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] choosing suggestions for configuration %@", (uint8_t *)&v21, 0xCu);
  }

  if (a6 == 1)
  {
    unint64_t v17 = [a1 allPotentialSuggestionLocalIdentifiersForPosterConfiguration:v12 fromSuggestionLocalIdentifiersByFeature:v13 withRejectedPersonLocalIdentifiers:v15];
    uint64_t v18 = [a1 chosenSuggestionLocalIdentifiersIn:v17 atDate:v14];
    goto LABEL_7;
  }
  if (!a6)
  {
    unint64_t v17 = [a1 allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration:v12 fromSuggestionLocalIdentifiersByFeature:v13 withRejectedPersonLocalIdentifiers:v15];
    uint64_t v18 = [a1 chosenSuggestionLocalIdentifiersFromGroups:v17 atDate:v14];
LABEL_7:
    uint64_t v19 = (void *)v18;

    goto LABEL_9;
  }
  uint64_t v19 = 0;
LABEL_9:

  return v19;
}

+ (id)suggestionLocalIdentifiersByFeatureForPosterConfiguration:(id)a3 atDate:(id)a4 inPhotoLibrary:(id)a5
{
  v70[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v50 = a4;
  id v9 = a5;
  char v10 = PLWallpaperGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v69 = v8;
    _os_log_impl(&dword_25934C000, v10, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] fetching suggestions for poster configuration %@", buf, 0xCu);
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [a1 matchingSuggestionInternalPredicateForPosterConfiguration:v8];
  v48 = id v51 = v9;
  if (v48)
  {
    id v12 = v8;
    id v13 = [v9 librarySpecificFetchOptions];
    id v14 = (void *)MEMORY[0x263F08730];
    id v15 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
    v70[0] = v15;
    v70[1] = v48;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
    unint64_t v17 = [v14 andPredicateWithSubpredicates:v16];
    [v13 setInternalPredicate:v17];

    uint64_t v18 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v13];
    uint64_t v19 = PLWallpaperGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = [v18 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v69 = v20;
      *(_WORD *)&v69[4] = 2112;
      *(void *)&v69[6] = v18;
      _os_log_impl(&dword_25934C000, v19, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Found %d suggestions: %@", buf, 0x12u);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v62 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          if ([v26 subtype] == 652)
          {
            [v26 context];
          }
          else
          {
            [v26 subtype];
            PHSuggestionStringWithSubtype();
          uint64_t v27 = };
          id v28 = [v11 objectForKeyedSubscript:v27];
          if (!v28)
          {
            id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v11 setObject:v28 forKeyedSubscript:v27];
          }
          v29 = [v26 localIdentifier];
          [v28 addObject:v29];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v23);
    }

    id v8 = v12;
    id v9 = v51;
  }
  v52 = v11;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v47 = v8;
  id obj = [v8 albumCloudIdentifiers];
  uint64_t v30 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v58;
    long long v33 = (char *)&unk_26B2F5000;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v58 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        long long v36 = [v33 + 600 shuffleUserAlbumForCloudIdentifier:v35 photoLibrary:v9];
        if (v36)
        {
          long long v37 = (void *)[objc_alloc((Class)(v33 + 600)) initWithAssetCollection:v36 photoLibrary:v9];
          v38 = [v37 updateSuggestionsForDate:v50 numberOfSuggestions:16];
        }
        else
        {
          v38 = 0;
        }
        v39 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v38, "count"));
        [v52 setObject:v39 forKeyedSubscript:v35];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v40 = v38;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v54;
          do
          {
            for (uint64_t k = 0; k != v42; ++k)
            {
              if (*(void *)v54 != v43) {
                objc_enumerationMutation(v40);
              }
              v45 = [*(id *)(*((void *)&v53 + 1) + 8 * k) localIdentifier];
              [v39 addObject:v45];
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v65 count:16];
          }
          while (v42);
        }

        id v9 = v51;
        long long v33 = (unsigned char *)&unk_26B2F5000;
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v31);
  }

  [v52 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1080];
  return v52;
}

void __121__PNSuggestionWallpaperShuffleUtilities_suggestionLocalIdentifiersByFeatureForPosterConfiguration_atDate_inPhotoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  [v5 sortUsingSelector:sel_compare_];
  id v6 = PLWallpaperGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = [v5 count];
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_25934C000, v6, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Found %d suggestions for '%@'", (uint8_t *)v7, 0x12u);
  }
}

+ (id)matchingSuggestionInternalPredicateForPosterConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [v3 personLocalIdentifiers];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %d AND %K IN %@", @"subtype", 652, @"suggestionContext", v5];
    [v4 addObject:v6];
  }
  char v7 = [v3 shuffleSmartAlbums];
  char v8 = v7;
  if ((v7 & 2) != 0)
  {
    id v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", 653);
    [v4 addObject:v11];

    if ((v8 & 4) == 0)
    {
LABEL_5:
      if ((v8 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_5;
  }
  id v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", 654);
  [v4 addObject:v12];

  if ((v8 & 8) != 0)
  {
LABEL_6:
    id v9 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", 655);
    [v4 addObject:v9];
  }
LABEL_7:
  if ([v4 count])
  {
    uint64_t v10 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v4];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v13 = PLWallpaperGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [v10 predicateFormat];
    *(_DWORD *)buf = 138412290;
    unint64_t v17 = v14;
    _os_log_impl(&dword_25934C000, v13, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] matchingSuggestionPredicate: %@", buf, 0xCu);
  }
  return v10;
}

@end