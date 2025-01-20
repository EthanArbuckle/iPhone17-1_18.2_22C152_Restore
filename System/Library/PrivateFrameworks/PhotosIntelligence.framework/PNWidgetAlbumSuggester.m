@interface PNWidgetAlbumSuggester
+ (unsigned)widgetSuggestionSubtypeForAssetCollectionType:(int64_t)a3;
- (NSString)sourceIdentifier;
- (NSString)suggestionContext;
- (NSString)widgetIdentifier;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)suggestions;
- (PHPhotoLibrary)photoLibrary;
- (PNWidgetAlbumSuggester)initWithAlbumLocalIdentifier:(id)a3 widgetIdentifier:(id)a4 photoLibrary:(id)a5;
- (id)_assetFetchOptions;
- (id)_assetIndexesForDate:(id)a3 count:(unint64_t)a4 from:(id)a5;
- (id)_makeSuggestionsFromAssets:(id)a3 numberOfSuggestions:(unint64_t)a4 date:(id)a5;
- (id)_mutableAssetIndexesForAssetCount:(unint64_t)a3;
- (id)_predicateForFeaturedSuggestions;
- (id)fetchSuggestionsWithOptions:(id)a3;
- (id)updatedSuggestionLocalIdentifiersForDate:(id)a3 numberOfSuggestions:(unint64_t)a4;
- (unint64_t)removeSuggestionsNotRelevantForDate:(id)a3;
- (unsigned)suggestionSubtype;
- (void)_shuffleAssetIndexes:(id)a3;
@end

@implementation PNWidgetAlbumSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
}

- (NSString)suggestionContext
{
  return self->_suggestionContext;
}

- (unsigned)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (PHFetchResult)suggestions
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = [(PNWidgetAlbumSuggester *)self photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  [v4 setWantsIncrementalChangeDetails:0];
  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:1];
  v11[0] = v5;
  v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:0];
  v11[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [v4 setSortDescriptors:v7];

  v8 = [(PNWidgetAlbumSuggester *)self _predicateForFeaturedSuggestions];
  [v4 setPredicate:v8];

  v9 = [(PNWidgetAlbumSuggester *)self fetchSuggestionsWithOptions:v4];

  return (PHFetchResult *)v9;
}

- (id)fetchSuggestionsWithOptions:(id)a3
{
  id v4 = a3;
  context = (void *)MEMORY[0x25A2E0AC0]();
  v21 = v4;
  v5 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v4];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x25A2E0AC0]();
      v9 = [v5 objectAtIndex:v7];
      v10 = [v9 featuresProperties];
      v11 = [v10 objectForKeyedSubscript:@"widgetIdentifier"];

      v12 = [(PNWidgetAlbumSuggester *)self widgetIdentifier];
      int v13 = [v12 isEqualToString:v11];

      if (v13) {
        [v6 addObject:v9];
      }

      ++v7;
    }
    while (v7 < [v5 count]);
  }
  id v14 = objc_alloc(MEMORY[0x263F14E58]);
  v15 = [(PNWidgetAlbumSuggester *)self photoLibrary];
  v16 = [v5 fetchType];
  v17 = [v5 fetchPropertySets];
  v18 = (void *)[v14 initWithObjects:v6 photoLibrary:v15 fetchType:v16 fetchPropertySets:v17 identifier:0 registerIfNeeded:0];

  return v18;
}

- (id)_predicateForFeaturedSuggestions
{
  v14[5] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"type", 7);
  id v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"subtype", -[PNWidgetAlbumSuggester suggestionSubtype](self, "suggestionSubtype"));
  v5 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"featuredState", 1);
  id v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"state", 1);
  unint64_t v7 = (void *)MEMORY[0x263F08A98];
  v8 = [(PNWidgetAlbumSuggester *)self suggestionContext];
  v9 = [v7 predicateWithFormat:@"%K == %@", @"context", v8];

  v10 = (void *)MEMORY[0x263F08730];
  v14[0] = v3;
  v14[1] = v4;
  v14[2] = v5;
  v14[3] = v6;
  v14[4] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:5];
  v12 = [v10 andPredicateWithSubpredicates:v11];

  return v12;
}

- (unint64_t)removeSuggestionsNotRelevantForDate:(id)a3
{
  v49[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PLMemoriesGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  unint64_t v7 = v5;
  v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WidgetRemoveSuggestionsNotRelevantForDate", "", buf, 2u);
  }

  uint64_t v10 = mach_absolute_time();
  v11 = [(PNWidgetAlbumSuggester *)self photoLibrary];
  v12 = [v11 librarySpecificFetchOptions];

  [v12 setWantsIncrementalChangeDetails:0];
  int v13 = [(PNWidgetAlbumSuggester *)self _predicateForFeaturedSuggestions];
  id v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"relevantUntilDate < %@", v4];

  v15 = (void *)MEMORY[0x263F08730];
  v49[0] = v13;
  v49[1] = v14;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
  v17 = [v15 andPredicateWithSubpredicates:v16];
  [v12 setPredicate:v17];

  v18 = [(PNWidgetAlbumSuggester *)self fetchSuggestionsWithOptions:v12];
  if ([v18 count])
  {
    uint64_t v38 = v10;
    v39 = v13;
    os_signpost_id_t v40 = v6;
    v19 = [(PNWidgetAlbumSuggester *)self photoLibrary];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __62__PNWidgetAlbumSuggester_removeSuggestionsNotRelevantForDate___block_invoke;
    v42[3] = &unk_26544F1A0;
    id v20 = v18;
    id v43 = v20;
    id v41 = 0;
    int v21 = [v19 performChangesAndWait:v42 error:&v41];
    id v22 = v41;

    v23 = PLMemoriesGetLog();
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [(PNWidgetAlbumSuggester *)self widgetIdentifier];
        int v26 = [v20 count];
        *(_DWORD *)buf = 138412546;
        v46 = v25;
        __int16 v47 = 1024;
        LODWORD(v48) = v26;
        v27 = "[PNWidgetAlbumSuggester] widgetIdentifier: %@, deleted non-relevant %d suggestions";
        v28 = v24;
        os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
        uint32_t v30 = 18;
LABEL_10:
        _os_log_impl(&dword_25934C000, v28, v29, v27, buf, v30);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = [(PNWidgetAlbumSuggester *)self widgetIdentifier];
      *(_DWORD *)buf = 138412546;
      v46 = v25;
      __int16 v47 = 2112;
      double v48 = *(double *)&v22;
      v27 = "[PNWidgetAlbumSuggester] failed to remove suggestions for widgetIdentifier %@, error: %@";
      v28 = v24;
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
      uint32_t v30 = 22;
      goto LABEL_10;
    }

    int v13 = v39;
    os_signpost_id_t v6 = v40;
    uint64_t v10 = v38;
  }
  uint64_t v31 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v34 = v8;
  v35 = v34;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v35, OS_SIGNPOST_INTERVAL_END, v6, "WidgetRemoveSuggestionsNotRelevantForDate", "", buf, 2u);
  }

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "WidgetRemoveSuggestionsNotRelevantForDate";
    __int16 v47 = 2048;
    double v48 = (float)((float)((float)((float)(v31 - v10) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  unint64_t v36 = [v18 count];

  return v36;
}

uint64_t __62__PNWidgetAlbumSuggester_removeSuggestionsNotRelevantForDate___block_invoke(uint64_t a1)
{
  return [MEMORY[0x263F14F58] deleteSuggestions:*(void *)(a1 + 32)];
}

- (id)_assetFetchOptions
{
  v15[2] = *MEMORY[0x263EF8340];
  v2 = [(PNWidgetAlbumSuggester *)self photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
  v15[0] = v4;
  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:1];
  v15[1] = v5;
  os_signpost_id_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  [v3 setSortDescriptors:v6];

  [v3 setIncludeGuestAssets:0];
  [v3 setWantsIncrementalChangeDetails:0];
  unint64_t v7 = objc_msgSend(MEMORY[0x263F5DB90], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x263F5DB90], "maskForGuestAsset"), 1);
  v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d && %K != %d", @"playbackStyle", 4, @"playbackStyle", 5);
  unint64_t v9 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(%K & %d) == 0", @"kindSubtype", 1);
  uint64_t v10 = (void *)MEMORY[0x263F08730];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  v12 = [v10 andPredicateWithSubpredicates:v11];
  [v3 setInternalPredicate:v12];

  return v3;
}

- (id)_makeSuggestionsFromAssets:(id)a3 numberOfSuggestions:(unint64_t)a4 date:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  context = (void *)MEMORY[0x25A2E0AC0]();
  uint64_t v10 = PLMemoriesGetLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v12 = v10;
  int v13 = v12;
  unint64_t v46 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WidgetMakeSuggestionFromAssets", "", buf, 2u);
  }
  os_signpost_id_t spid = v11;
  v49 = v13;

  uint64_t v45 = mach_absolute_time();
  unint64_t v14 = [v8 count];
  if (v14 >= a4) {
    unint64_t v15 = a4;
  }
  else {
    unint64_t v15 = v14;
  }
  __int16 v47 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15];
  uint64_t v16 = -[PNWidgetAlbumSuggester _mutableAssetIndexesForAssetCount:](self, "_mutableAssetIndexesForAssetCount:", [v8 count]);
  [(PNWidgetAlbumSuggester *)self _shuffleAssetIndexes:v16];
  v51 = v9;
  double v48 = (void *)v16;
  v17 = [(PNWidgetAlbumSuggester *)self _assetIndexesForDate:v9 count:a4 from:v16];
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "integerValue", spid));
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v21);
  }

  v25 = [(PNWidgetAlbumSuggester *)self widgetIdentifier];
  uint64_t v26 = [(PNWidgetAlbumSuggester *)self suggestionContext];
  unsigned __int16 v27 = [(PNWidgetAlbumSuggester *)self suggestionSubtype];
  v28 = [(PNWidgetAlbumSuggester *)self photoLibrary];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __78__PNWidgetAlbumSuggester__makeSuggestionsFromAssets_numberOfSuggestions_date___block_invoke;
  v53[3] = &unk_26544F178;
  id v29 = v18;
  id v54 = v29;
  id v30 = v25;
  id v55 = v30;
  unsigned __int16 v58 = v27;
  id v31 = (id)v26;
  id v56 = v31;
  id v32 = v47;
  id v57 = v32;
  id v52 = 0;
  LOBYTE(v26) = [v28 performChangesAndWait:v53 error:&v52];
  double v33 = COERCE_DOUBLE(v52);

  if (v26)
  {
    uint64_t v34 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v37 = v49;
    uint64_t v38 = v49;
    v39 = v38;
    if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25934C000, v39, OS_SIGNPOST_INTERVAL_END, spid, "WidgetMakeSuggestionFromAssets", "", buf, 2u);
    }

    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v65 = "WidgetMakeSuggestionFromAssets";
      __int16 v66 = 2048;
      double v67 = (float)((float)((float)((float)(v34 - v45) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_25934C000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    id v40 = v32;
  }
  else
  {
    id v41 = PLMemoriesGetLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = [(PNWidgetAlbumSuggester *)self widgetIdentifier];
      *(_DWORD *)buf = 138412546;
      v65 = v42;
      __int16 v66 = 2112;
      double v67 = v33;
      _os_log_impl(&dword_25934C000, v41, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] failed to create suggestions for identifier %@, error: %@", buf, 0x16u);
    }
    id v40 = (id)MEMORY[0x263EFFA68];
    v37 = v49;
  }

  return v40;
}

void __78__PNWidgetAlbumSuggester__makeSuggestionsFromAssets_numberOfSuggestions_date___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF910] date];
  v3 = [v2 dateByAddingTimeInterval:86400.0];
  id v4 = PLMemoriesGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    int v32 = v5;
    __int16 v33 = 2112;
    uint64_t v34 = v6;
    _os_log_impl(&dword_25934C000, v4, OS_LOG_TYPE_DEFAULT, "[PNWidgetAlbumSuggester] creating %d suggestions for widgetIdentifier %@", buf, 0x12u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    double v10 = 0.0;
    do
    {
      uint64_t v11 = 0;
      v12 = v2;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
        v2 = [v12 dateByAddingTimeInterval:v10];

        unint64_t v14 = (void *)MEMORY[0x263F14F58];
        uint64_t v15 = *(unsigned __int16 *)(a1 + 64);
        uint64_t v29 = v13;
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
        v17 = [v14 creationRequestForSuggestionWithType:7 subtype:v15 keyAssets:v16 representativeAssets:0 creationDate:v2 relevantUntilDate:v3 version:1];

        [v17 setFeaturedState:1];
        [v17 setContext:*(void *)(a1 + 48)];
        uint64_t v18 = *(void *)(a1 + 40);
        unsigned __int16 v27 = @"widgetIdentifier";
        uint64_t v28 = v18;
        id v19 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        [v17 setFeaturesProperties:v19];

        [v17 markActive];
        uint64_t v20 = [v17 placeholderForCreatedSuggestion];
        uint64_t v21 = [v20 localIdentifier];

        if (v21) {
          [*(id *)(a1 + 56) addObject:v21];
        }
        double v10 = v10 + 1.0;

        ++v11;
        v12 = v2;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v8);
  }
}

- (id)_assetIndexesForDate:(id)a3 count:(unint64_t)a4 from:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v9 count];
  if (v10)
  {
    unint64_t v11 = v10;
    if (v10 < a4) {
      a4 = v10;
    }
    [v8 timeIntervalSinceReferenceDate];
    unint64_t v13 = a4 * (unint64_t)(v12 / 86400.0) % v11;
    unint64_t v14 = PLMemoriesGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(PNWidgetAlbumSuggester *)self widgetIdentifier];
      int v21 = 138413314;
      id v22 = v8;
      __int16 v23 = 1024;
      int v24 = v13;
      __int16 v25 = 1024;
      int v26 = v11;
      __int16 v27 = 1024;
      int v28 = a4;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_25934C000, v14, OS_LOG_TYPE_DEFAULT, "[PNWidgetAlbumSuggester] selected assets for date:%@ offset: %d totalAssets: %d numberToChoose: %d widgetIdentifier: %@", (uint8_t *)&v21, 0x28u);
    }
    if (v13 <= v11 - a4)
    {
      id v19 = objc_msgSend(v9, "subarrayWithRange:", v13, a4);
    }
    else
    {
      unint64_t v16 = v11 - v13;
      v17 = objc_msgSend(v9, "subarrayWithRange:", v13, v16);
      uint64_t v18 = objc_msgSend(v9, "subarrayWithRange:", 0, a4 - v16);
      id v19 = [v17 arrayByAddingObjectsFromArray:v18];
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x263EFFA68];
  }

  return v19;
}

- (void)_shuffleAssetIndexes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F5DF58];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(PNWidgetAlbumSuggester *)self widgetIdentifier];
  id v8 = (id)objc_msgSend(v6, "initWithSeed:", objc_msgSend(v7, "hash"));

  PFMutableArrayShuffleWithRandomNumberGenerator();
}

- (id)_mutableAssetIndexesForAssetCount:(unint64_t)a3
{
  id v4 = [MEMORY[0x263EFF980] array];
  if (a3)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = [NSNumber numberWithInteger:v5];
      [v4 addObject:v6];

      ++v5;
    }
    while (a3 != v5);
  }
  return v4;
}

- (id)updatedSuggestionLocalIdentifiersForDate:(id)a3 numberOfSuggestions:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(PNWidgetAlbumSuggester *)self assetCollection];

  if (!v7)
  {
    unint64_t v11 = PLMemoriesGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = [(PNWidgetAlbumSuggester *)self sourceIdentifier];
      int v23 = 138412290;
      int v24 = v17;
      _os_log_impl(&dword_25934C000, v11, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] album not found: %@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_11;
  }
  if (![(PNWidgetAlbumSuggester *)self suggestionSubtype])
  {
    unint64_t v11 = PLMemoriesGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = (void *)MEMORY[0x263F14D28];
      id v19 = [(PNWidgetAlbumSuggester *)self assetCollection];
      uint64_t v20 = objc_msgSend(v18, "descriptionForSubtype:", objc_msgSend(v19, "assetCollectionSubtype"));
      int v23 = 138412290;
      int v24 = v20;
      _os_log_impl(&dword_25934C000, v11, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] album subtype not supported found: %@", (uint8_t *)&v23, 0xCu);
    }
LABEL_11:
    unint64_t v16 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_16;
  }
  id v8 = [(PNWidgetAlbumSuggester *)self _assetFetchOptions];
  id v9 = (void *)MEMORY[0x263F14D18];
  unint64_t v10 = [(PNWidgetAlbumSuggester *)self assetCollection];
  unint64_t v11 = [v9 fetchAssetsInAssetCollection:v10 options:v8];

  uint64_t v12 = [v11 count];
  unint64_t v13 = PLMemoriesGetLog();
  unint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(PNWidgetAlbumSuggester *)self sourceIdentifier];
      int v23 = 138412546;
      int v24 = v15;
      __int16 v25 = 1024;
      int v26 = [v11 count];
      _os_log_impl(&dword_25934C000, v14, OS_LOG_TYPE_DEFAULT, "[PNWidgetAlbumSuggester] source: %@, eligibleAssets: %d", (uint8_t *)&v23, 0x12u);
    }
    unint64_t v16 = [(PNWidgetAlbumSuggester *)self _makeSuggestionsFromAssets:v11 numberOfSuggestions:a4 date:v6];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v21 = [(PNWidgetAlbumSuggester *)self sourceIdentifier];
      int v23 = 138412290;
      int v24 = v21;
      _os_log_impl(&dword_25934C000, v14, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] source: %@, no eligible assets", (uint8_t *)&v23, 0xCu);
    }
    unint64_t v16 = (void *)MEMORY[0x263EFFA68];
  }

LABEL_16:
  return v16;
}

- (PNWidgetAlbumSuggester)initWithAlbumLocalIdentifier:(id)a3 widgetIdentifier:(id)a4 photoLibrary:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PNWidgetAlbumSuggester;
  uint64_t v12 = [(PNWidgetAlbumSuggester *)&v27 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_widgetIdentifier, a4);
    objc_storeStrong((id *)&v13->_sourceIdentifier, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    unint64_t v14 = [v11 librarySpecificFetchOptions];
    [v14 setWantsIncrementalChangeDetails:0];
    uint64_t v15 = (void *)MEMORY[0x263F14D28];
    unint64_t v16 = [(PNWidgetAlbumSuggester *)v13 sourceIdentifier];
    v28[0] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    uint64_t v18 = [v15 fetchAssetCollectionsWithLocalIdentifiers:v17 options:v14];
    uint64_t v19 = [v18 firstObject];
    assetCollection = v13->_assetCollection;
    v13->_assetCollection = (PHAssetCollection *)v19;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v21 = v13->_assetCollection;
      v13->_assetCollection = 0;
    }
    if (v13->_assetCollection)
    {
      v13->_suggestionSubtype = objc_msgSend((id)objc_opt_class(), "widgetSuggestionSubtypeForAssetCollectionType:", -[PHAssetCollection assetCollectionSubtype](v13->_assetCollection, "assetCollectionSubtype"));
      id v22 = (void *)MEMORY[0x263F14D28];
      int v23 = [(PNWidgetAlbumSuggester *)v13 sourceIdentifier];
      uint64_t v24 = [v22 uuidFromLocalIdentifier:v23];
      suggestionContext = v13->_suggestionContext;
      v13->_suggestionContext = (NSString *)v24;
    }
  }

  return v13;
}

+ (unsigned)widgetSuggestionSubtypeForAssetCollectionType:(int64_t)a3
{
  if (a3 == 203) {
    __int16 v3 = 702;
  }
  else {
    __int16 v3 = 0;
  }
  if (a3 == 212) {
    unsigned __int16 v4 = 703;
  }
  else {
    unsigned __int16 v4 = v3;
  }
  if (a3 == 2) {
    return 701;
  }
  else {
    return v4;
  }
}

@end