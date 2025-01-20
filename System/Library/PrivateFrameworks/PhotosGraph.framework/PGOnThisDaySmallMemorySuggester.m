@interface PGOnThisDaySmallMemorySuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (id)momentByMomentLocalIdentifierWithMomentLocalIdentifiers:(id)a3;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:(id)a3;
- (id)suggestionWithMomentLocalIdentifier:(id)a3;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
@end

@implementation PGOnThisDaySmallMemorySuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:401];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDateMatchingTitleOnThisDay, 0);
  objc_storeStrong((id *)&self->_suggestedMomentLocalIdentifierEnumerator, 0);
  objc_storeStrong((id *)&self->_momentByMomentLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedMomentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)suggestionWithMomentLocalIdentifier:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  if (!self->_momentByMomentLocalIdentifier)
  {
    v4 = [(PGOnThisDaySmallMemorySuggester *)self momentByMomentLocalIdentifierWithMomentLocalIdentifiers:self->_suggestedMomentLocalIdentifiers];
    momentByMomentLocalIdentifier = self->_momentByMomentLocalIdentifier;
    self->_momentByMomentLocalIdentifier = v4;
  }
  if (!self->_titleDateMatchingTitleOnThisDay)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PGRelativeDateTitleOnThisDay" value:@"PGRelativeDateTitleOnThisDay" table:@"Localizable"];
    titleDateMatchingTitleOnThisDay = self->_titleDateMatchingTitleOnThisDay;
    self->_titleDateMatchingTitleOnThisDay = v7;
  }
  v9 = [(NSDictionary *)self->_momentByMomentLocalIdentifier objectForKeyedSubscript:v42];
  if (!v9)
  {
    v30 = 0;
    goto LABEL_25;
  }
  v10 = [(PGAbstractSuggester *)self session];
  oslog = [v10 loggingConnection];
  v41 = [v10 workingContext];
  v11 = [v41 curationManager];
  v12 = [v10 curationContext];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__68249;
  v52 = __Block_byref_object_dispose__68250;
  id v53 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __71__PGOnThisDaySmallMemorySuggester_suggestionWithMomentLocalIdentifier___block_invoke;
  v43[3] = &unk_1E68EF5F0;
  v47 = &v48;
  id v13 = v11;
  id v44 = v13;
  id v14 = v9;
  id v45 = v14;
  id v15 = v12;
  id v46 = v15;
  [v41 performSynchronousConcurrentGraphReadUsingBlock:v43];
  v38 = v13;
  v39 = v15;
  v16 = [v13 curatedKeyAssetForAssetCollection:v14 curatedAssetCollection:0 options:0 criteria:v49[5] curationContext:v15];
  v17 = v16;
  if (!v16) {
    goto LABEL_19;
  }
  if ([(__CFString *)v16 isVideo])
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "On This Day: Picked key asset is a video, trying again with only images", buf, 2u);
    }
    v18 = [(id)objc_opt_class() noVideoPredicate];
    v19 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v18];

    v20 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v14 options:v19];
    v21 = (void *)MEMORY[0x1E4F38EE8];
    v22 = [v20 fetchedObjects];
    v23 = [v41 photoLibrary];
    v24 = [v21 transientAssetCollectionWithAssets:v22 title:&stru_1F283BC78 identifier:0 photoLibrary:v23];

    uint64_t v25 = [v38 curatedKeyAssetForAssetCollection:v24 curatedAssetCollection:0 options:0 criteria:v49[5] curationContext:v39];

    v17 = (__CFString *)v25;
    if (!v25) {
      goto LABEL_19;
    }
  }
  [(__CFString *)v17 fetchPropertySetsIfNeeded];
  v26 = (void *)MEMORY[0x1E4F38EB8];
  v56[0] = v17;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
  v28 = [v10 curationContext];
  [v26 prefetchOnAssets:v27 options:31 curationContext:v28];

  if (![(PGAbstractSuggester *)self assetIsValidForSuggesting:v17])
  {

    v17 = 0;
LABEL_19:
    v33 = @"Failed picking a key asset";
LABEL_20:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v33;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "On This Day: %@", buf, 0xCu);
    }
    v30 = 0;
    goto LABEL_23;
  }
  [(__CFString *)v17 curationScore];
  if (v29 <= *MEMORY[0x1E4F8E740])
  {
    v36 = NSString;
    [(__CFString *)v17 curationScore];
    v33 = [v36 stringWithFormat:@"Picked key asset %@ has too low a curation score %f", v17, v37];
    goto LABEL_20;
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v17;
    _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "On This Day: Picked key asset %@", buf, 0xCu);
  }
  v30 = [[PGSingleAssetSuggestion alloc] initWithType:4 subtype:401 asset:v17];
  if (!v30) {
    goto LABEL_24;
  }
  id v31 = objc_alloc(MEMORY[0x1E4F28C18]);
  v32 = [(__CFString *)v17 cls_localDate];
  v33 = (__CFString *)[v31 initWithStartDate:v32 duration:0.0];

  [(PGSingleAssetSuggestion *)v30 setTitle:self->_titleDateMatchingTitleOnThisDay];
  v34 = +[PGTimeTitleUtility timeTitleWithDateInterval:v33 allowedFormats:33];
  [(PGSingleAssetSuggestion *)v30 setSubtitle:v34];

  [(PGSingleAssetSuggestion *)v30 setRelevanceDurationInDays:1];
LABEL_23:

LABEL_24:
  _Block_object_dispose(&v48, 8);

LABEL_25:
  return v30;
}

void __71__PGOnThisDaySmallMemorySuggester_suggestionWithMomentLocalIdentifier___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v8 = [a2 graph];
  uint64_t v5 = [v3 criteriaForKeyAssetCurationWithAssetCollection:v4 graph:v8 options:0 curationContext:a1[6]];
  uint64_t v6 = *(void *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)momentByMomentLocalIdentifierWithMomentLocalIdentifiers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGAbstractSuggester *)self session];
  uint64_t v6 = [v5 photoLibrary];
  v7 = [v6 librarySpecificFetchOptions];

  id v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v4 options:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "localIdentifier", (void)v18);
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGAbstractSuggester *)self session];
  uint64_t v6 = [v5 loggingConnection];
  v7 = [v5 workingContext];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "On This Day: Computing eligible moments", buf, 2u);
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke;
  long long v19 = &unk_1E68F0AF0;
  id v20 = v4;
  id v9 = v8;
  id v21 = v9;
  id v10 = v4;
  [v7 performSynchronousConcurrentGraphReadUsingBlock:&v16];
  uint64_t v11 = v6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend(v9, "count", v16, v17, v18, v19, v20);
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "On This Day: found %lu eligible moments", buf, 0xCu);
  }

  uint64_t v13 = v21;
  id v14 = v9;

  return v14;
}

void __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke(uint64_t a1, void *a2)
{
  v31[3] = *MEMORY[0x1E4F143B8];
  v3 = [a2 graph];
  id v4 = objc_alloc_init(PGNeighborScoreComputer);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v3 dateNodesIgnoringYearForLocalDate:*(void *)(a1 + 32)];
  uint64_t v7 = [MEMORY[0x1E4F76C68] yearFromDate:*(void *)(a1 + 32)];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_2;
  v27[3] = &unk_1E68EF5A0;
  uint64_t v29 = v7;
  id v8 = v5;
  id v28 = v8;
  [v6 enumerateNodesUsingBlock:v27];
  id v9 = (void *)MEMORY[0x1E4F29008];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_4;
  v25[3] = &unk_1E68EF5C8;
  id v10 = v4;
  v26 = v10;
  uint64_t v11 = [v9 sortDescriptorWithKey:@"self" ascending:0 comparator:v25];
  v31[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"contentScore" ascending:0];
  v31[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localIdentifier" ascending:1];
  v31[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];

  [v8 sortUsingDescriptors:v14];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v19), "localIdentifier", (void)v21);
        [*(id *)(a1 + 40) addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v17);
  }
}

void __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 year] < *(void *)(a1 + 40))
  {
    id v4 = [v3 collection];
    id v5 = [v4 momentNodes];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_3;
    v6[3] = &unk_1E68EF578;
    id v7 = *(id *)(a1 + 32);
    [v5 enumerateNodesUsingBlock:v6];
  }
}

BOOL __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 neighborScoreWithMomentNode:a2];
  int64_t v7 = +[PGGraphMomentNode breakoutOfRoutineTypeWithNeighborScore:"breakoutOfRoutineTypeWithNeighborScore:"];
  [*(id *)(a1 + 32) neighborScoreWithMomentNode:v6];
  double v9 = v8;

  int64_t v10 = +[PGGraphMomentNode breakoutOfRoutineTypeWithNeighborScore:v9];
  if (v10 == 2) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v7 == 2) {
    return v10 != 2;
  }
  else {
    return v11;
  }
}

void __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 contentScore];
  if (v3 > *MEMORY[0x1E4F8E740]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)reset
{
  double v3 = [(PGAbstractSuggester *)self session];
  id v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEFAULT, "On This Day: Resetting", v6, 2u);
  }

  suggestedMomentLocalIdentifierEnumerator = self->_suggestedMomentLocalIdentifierEnumerator;
  self->_suggestedMomentLocalIdentifierEnumerator = 0;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  *(void *)&v25[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void (**)(void *, unsigned char *, double))_Block_copy(v4);
  double v6 = 0.0;
  if (!v5 || (double v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_8:
    double v9 = [(PGAbstractSuggester *)self session];
    int64_t v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "On This Day: nextSuggestion", buf, 2u);
    }
    if (self->_suggestedMomentLocalIdentifierEnumerator)
    {
      if (!v5) {
        goto LABEL_22;
      }
    }
    else
    {
      suggestedMomentLocalIdentifiers = self->_suggestedMomentLocalIdentifiers;
      if (!suggestedMomentLocalIdentifiers)
      {
        uint64_t v12 = [(PGSuggestionOptions *)self->_options localToday];
        uint64_t v13 = [(PGOnThisDaySmallMemorySuggester *)self sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:v12];
        id v14 = self->_suggestedMomentLocalIdentifiers;
        self->_suggestedMomentLocalIdentifiers = v13;

        suggestedMomentLocalIdentifiers = self->_suggestedMomentLocalIdentifiers;
      }
      id v15 = [(NSArray *)suggestedMomentLocalIdentifiers objectEnumerator];
      suggestedMomentLocalIdentifierEnumerator = self->_suggestedMomentLocalIdentifierEnumerator;
      self->_suggestedMomentLocalIdentifierEnumerator = v15;

      if (!v5) {
        goto LABEL_22;
      }
    }
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v6 >= 0.01)
    {
      char v23 = 0;
      v5[2](v5, &v23, 0.5);
      if (v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v25[0] = 126;
          LOWORD(v25[1]) = 2080;
          *(void *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOnTh"
                                             "isDaySmallMemorySuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        double v8 = 0;
LABEL_45:

        goto LABEL_46;
      }
      double v6 = Current;
    }
LABEL_22:
    uint64_t v18 = 0;
    while (1)
    {
      uint64_t v19 = v18;
      uint64_t v18 = [(NSEnumerator *)self->_suggestedMomentLocalIdentifierEnumerator nextObject];

      if (!v18) {
        break;
      }
      id v20 = (void *)MEMORY[0x1D25FED50]();
      if (v5)
      {
        double v21 = CFAbsoluteTimeGetCurrent();
        if (v21 - v6 >= 0.01)
        {
          char v23 = 0;
          v5[2](v5, &v23, 0.75);
          if (v23)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v25[0] = 132;
              LOWORD(v25[1]) = 2080;
              *(void *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggeste"
                                                 "r/PGOnThisDaySmallMemorySuggester.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            goto LABEL_43;
          }
          double v6 = v21;
        }
      }
      double v8 = [(PGOnThisDaySmallMemorySuggester *)self suggestionWithMomentLocalIdentifier:v18];
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)uint64_t v25 = v8;
          _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "On This Day: Suggesting %{private}@", buf, 0xCu);
        }
        goto LABEL_34;
      }
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "On This Day: Nothing to suggest", buf, 2u);
    }
    uint64_t v18 = 0;
    double v8 = 0;
LABEL_34:
    if (v5)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v23 = 0;
        v5[2](v5, &v23, 0.0);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v25[0] = 144;
            LOWORD(v25[1]) = 2080;
            *(void *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PG"
                                               "OnThisDaySmallMemorySuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

LABEL_43:
          double v8 = 0;
        }
      }
    }

    goto LABEL_45;
  }
  char v23 = 0;
  v5[2](v5, &v23, 0.0);
  if (!v23)
  {
    double v6 = v7;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v25[0] = 110;
    LOWORD(v25[1]) = 2080;
    *(void *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  double v8 = 0;
LABEL_46:

  return v8;
}

- (void)startSuggestingWithOptions:(id)a3
{
  id v4 = (PGSuggestionOptions *)a3;
  id v5 = [(PGAbstractSuggester *)self session];
  double v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "On This Day: Starting suggesting", v11, 2u);
  }

  suggestedMomentLocalIdentifiers = self->_suggestedMomentLocalIdentifiers;
  self->_suggestedMomentLocalIdentifiers = 0;

  momentByMomentLocalIdentifier = self->_momentByMomentLocalIdentifier;
  self->_momentByMomentLocalIdentifier = 0;

  suggestedMomentLocalIdentifierEnumerator = self->_suggestedMomentLocalIdentifierEnumerator;
  self->_suggestedMomentLocalIdentifierEnumerator = 0;

  options = self->_options;
  self->_options = v4;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = _Block_copy(v7);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  if (!v8
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v36[3] < 0.01)
    || (v36[3] = v9,
        LOBYTE(v43) = 0,
        (*((void (**)(void *, int *, double))v8 + 2))(v8, &v43, 0.0),
        char v10 = *((unsigned char *)v40 + 24) | v43,
        (*((unsigned char *)v40 + 24) = v10) == 0))
  {
    uint64_t v12 = [v6 localToday];
    uint64_t v13 = [(PGOnThisDaySmallMemorySuggester *)self sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:v12];

    id v14 = [(PGOnThisDaySmallMemorySuggester *)self momentByMomentLocalIdentifierWithMomentLocalIdentifiers:v13];
    momentByMomentLocalIdentifier = self->_momentByMomentLocalIdentifier;
    self->_momentByMomentLocalIdentifier = v14;

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v17 = [v6 maximumNumberOfSuggestions];
    if (v17) {
      unint64_t v18 = v17;
    }
    else {
      unint64_t v18 = -1;
    }
    uint64_t buf = 0;
    *(void *)&long long v48 = &buf;
    *((void *)&v48 + 1) = 0x2020000000;
    uint64_t v49 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__PGOnThisDaySmallMemorySuggester_suggestionsWithOptions_progress___block_invoke;
    v26[3] = &unk_1E68EF550;
    id v19 = v8;
    uint64_t v29 = &v35;
    p_uint64_t buf = &buf;
    id v31 = &v39;
    uint64_t v32 = 0x3F847AE147AE147BLL;
    id v28 = v19;
    v26[4] = self;
    double v33 = 1.0 / (double)v18;
    id v20 = v16;
    id v27 = v20;
    unint64_t v34 = v18;
    [v13 enumerateObjectsUsingBlock:v26];
    if (*((unsigned char *)v40 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v43 = 67109378;
        int v44 = 84;
        __int16 v45 = 2080;
        id v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
        double v21 = MEMORY[0x1E4F14500];
LABEL_13:
        _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v43, 0x12u);
      }
    }
    else
    {
      if (!v8
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v36[3] < 0.01)
        || (v36[3] = Current,
            char v25 = 0,
            (*((void (**)(id, char *, double))v19 + 2))(v19, &v25, 1.0),
            char v23 = *((unsigned char *)v40 + 24) | v25,
            (*((unsigned char *)v40 + 24) = v23) == 0))
      {
        id v11 = v20;
        goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v43 = 67109378;
        int v44 = 86;
        __int16 v45 = 2080;
        id v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
        double v21 = MEMORY[0x1E4F14500];
        goto LABEL_13;
      }
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_21:

    _Block_object_dispose(&buf, 8);
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x3D04000202;
    LOWORD(v48) = 2080;
    *(void *)((char *)&v48 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_22:
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v11;
}

void __67__PGOnThisDaySmallMemorySuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (*(void *)(a1 + 48)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 80))
    && (*(double *)(v8 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))(*(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    double v9 = [*(id *)(a1 + 32) suggestionWithMomentLocalIdentifier:v6];
    if (v9)
    {
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 88)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24);
      [*(id *)(a1 + 40) addObject:v9];
      if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 96)) {
        *a4 = 1;
      }
    }
  }
}

@end