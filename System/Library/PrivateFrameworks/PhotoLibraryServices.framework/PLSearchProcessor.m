@interface PLSearchProcessor
+ (id)_OCRProcessedGroupResultsFromGroupResults:(id)a3 query:(id)a4;
+ (id)_groupResultFromCombinedGroupResults:(id)a3 query:(id)a4;
+ (id)_singleOCRGroupResultFromOCRGroupResults:(id)a3 query:(id)a4;
+ (id)searchProcessorLog;
- (BOOL)_categoryMaskIsCombinable:(unint64_t)a3;
- (BOOL)_shouldOmitSectionForCategoryMask:(unint64_t)a3;
- (PLSearchProcessor)initWithDatabase:(id)a3;
- (PSIDatabase)searchIndex;
- (double)_scoreForSearchIndexCategory:(unint64_t)a3;
- (id)_alphabeticalSortDescriptors;
- (id)_collectionSearchResultsFromGroupResults:(id)a3 query:(id)a4;
- (id)_combinedFilenameSearchResultsFromSearchResults:(id)a3 inQuery:(id)a4;
- (id)_completionFilenameResultsForFilenameResults:(id)a3;
- (id)_dateSortDescriptors;
- (id)_numberOfAssetsSortDescriptors;
- (id)_searchResultsByCategoryMasksForSearchResults:(id)a3;
- (id)_sortDescriptorsForCategoryMask:(unint64_t)a3;
- (id)_topAssetSearchResultFromGroupResults:(id)a3;
- (id)completionSuggestionsForQuery:(id)a3 withSearchSections:(id)a4 numberOfSuggestions:(unint64_t)a5;
- (id)performQueryForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4 searchIndex:(id)a5;
- (id)searchResultSectionsForQuery:(id)a3 withAssetResults:(id)a4 assetResultsForCompletions:(id)a5 collectionResults:(id)a6 combineAssetSections:(BOOL)a7;
- (id)updatedSearchSections:(id)a3 withTopCollectionResults:(id)a4;
- (void)_extractSearchResultsFromGroupResults:(id)a3 withQuery:(id)a4 resultsHandler:(id)a5;
- (void)performQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 withResultsHandler:(id)a5;
- (void)performQuery:(id)a3 withResultsHandler:(id)a4;
- (void)performQueryV2:(id)a3 resultsHandler:(id)a4;
@end

@implementation PLSearchProcessor

- (void).cxx_destruct
{
}

- (PLSearchProcessor)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchProcessor;
  v6 = [(PLSearchProcessor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchIndex, a3);
  }

  return v7;
}

- (id)performQueryForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4 searchIndex:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLSearchProcessor.m", 1633, @"Invalid parameter not satisfying: %@", @"lookupIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PLSearchProcessor.m", 1634, @"Invalid parameter not satisfying: %@", @"searchIndex" object file lineNumber description];

LABEL_3:
  v12 = [[PSIQueryToken alloc] initWithIdentifier:v9 userCategory:0];
  v20[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  LOBYTE(v19) = 0;
  v14 = (void *)[v11 newQueryWithSearchTextV2:0 queryTokens:v13 scopedSearchIdentifiers:0 searchResultTypes:a4 searchSuggestionType:0 useWildcardSearchText:0 enableExactMatchPrioritization:v19 libraryScope:0 suggestionLimit:0];

  v15 = [v14 runLookupIdentifierQuery];

  return v15;
}

- (PSIDatabase)searchIndex
{
  return self->_searchIndex;
}

- (void)performQueryV2:(id)a3 resultsHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  PLPhotosSearchGetLog();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLSearchQuerySignpost", "", buf, 2u);
  }

  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLSearchProcessor.m", 1612, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v8) {
      goto LABEL_6;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLSearchProcessor.m", 1613, @"Invalid parameter not satisfying: %@", @"searchResultsHandler" object file lineNumber description];

    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_6:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3254779904;
  v18[2] = __51__PLSearchProcessor_performQueryV2_resultsHandler___block_invoke;
  v18[3] = &unk_1EEB29AC8;
  v13 = v12;
  v21 = v13;
  os_signpost_id_t v22 = v10;
  id v14 = v7;
  id v19 = v14;
  id v15 = v8;
  id v20 = v15;
  [v14 runWithResultsHandlerV2:v18];
}

void __51__PLSearchProcessor_performQueryV2_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(id *)(a1 + 48);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLSearchQuerySignpost", "", (uint8_t *)&v12, 2u);
  }

  if ([*(id *)(a1 + 32) isCanceled])
  {
    id v7 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Search query was cancelled: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    os_signpost_id_t v10 = [*(id *)(a1 + 32) queryBeginResultGenerationAndIntersectionsTime];
    [v10 timeIntervalSinceNow];
    [*(id *)(a1 + 32) setElapsedTimeResultGenerationAndIntersections:0.0 - v11];

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (id)_collectionSearchResultsFromGroupResults:(id)a3 query:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v14 = [v13 collectionIds];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v45 != v17) {
                objc_enumerationMutation(v14);
              }
              [(__CFSet *)Mutable addObject:*(void *)(*((void *)&v44 + 1) + 8 * j)];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v54 count:16];
          }
          while (v16);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v10);
  }

  v32 = [(PSIDatabase *)self->_searchIndex collectionResultByCollectionIdWithCollectionIds:Mutable];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v8;
  uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v41;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v20;
        v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
        [v21 resolveObjectsWithAssetCache:MEMORY[0x1E4F1CC08] collectionCache:v32];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        os_signpost_id_t v22 = [v21 collectionResults];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v52 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v37 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = -[PLCollectionSearchResult initWithGroupResult:collectionResult:libraryScope:]([PLCollectionSearchResult alloc], "initWithGroupResult:collectionResult:libraryScope:", v21, *(void *)(*((void *)&v36 + 1) + 8 * k), [v35 libraryScope]);
              [v19 addObject:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v52 count:16];
          }
          while (v24);
        }

        uint64_t v20 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v33);
  }

  v28 = (void *)[v19 copy];
  return v28;
}

- (id)_topAssetSearchResultFromGroupResults:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        -[__CFArray addObjectsFromArray:](Mutable, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "assetIds", (void)v14));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v11 = objc_opt_new();
  [v11 setDelegate:self->_searchIndex];
  [v11 setAssetIds:Mutable];
  int v12 = [[PLTopAssetsSearchResult alloc] initWithTopAssetsResult:v11];

  return v12;
}

- (BOOL)_shouldOmitSectionForCategoryMask:(unint64_t)a3
{
  return (a3 & 0x3FFFFFFDD8CFBFFFLL) == 0;
}

- (BOOL)_categoryMaskIsCombinable:(unint64_t)a3
{
  return (a3 & 0x3FFFFFBDDBDFBFEBLL) == 0;
}

- (void)_extractSearchResultsFromGroupResults:(id)a3 withQuery:(id)a4 resultsHandler:(id)a5
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v128 = (void (**)(id, void *, void *, void *, PLTopAssetsSearchResult *, void *))a5;
  uint64_t v10 = [(id)objc_opt_class() searchProcessorLog];
  v130 = self;
  v129 = v8;
  uint64_t v11 = [(id)objc_opt_class() _OCRProcessedGroupResultsFromGroupResults:v8 query:v9];
  int v12 = [v9 searchText];
  uint64_t v13 = [v9 tokenizer];
  v166 = v9;
  long long v14 = [v9 searchText];
  v156 = [v13 normalizeString:v14];

  v127 = v12;
  unint64_t v159 = [v12 length];
  v134 = [MEMORY[0x1E4F1CA80] set];
  v144 = [MEMORY[0x1E4F1CA80] set];
  v153 = [MEMORY[0x1E4F1CA48] array];
  v152 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  id v140 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v139 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v138 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
  os_signpost_id_t v18 = os_signpost_id_generate(v10);
  uint64_t v19 = v10;
  uint64_t v20 = v19;
  unint64_t v21 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SearchProcessor - extractSearchResults - prepareIdSets", "", buf, 2u);
  }
  os_signpost_id_t spid = v18;
  v148 = v20;

  CFMutableSetRef v22 = CFSetCreateMutable(v16, 0, 0);
  CFMutableSetRef v23 = CFSetCreateMutable(v16, 0, 0);
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  id v24 = v11;
  uint64_t v25 = (void *)v15;
  uint64_t v163 = [v24 countByEnumeratingWithState:&v187 objects:v202 count:16];
  v165 = (void *)v17;
  v131 = v23;
  v132 = v22;
  if (v163)
  {
    unint64_t v135 = v21;
    uint64_t v150 = 0;
    uint64_t v154 = 0;
    uint64_t v161 = *(void *)v188;
    id v145 = v24;
    do
    {
      for (uint64_t i = 0; i != v163; ++i)
      {
        if (*(void *)v188 != v161) {
          objc_enumerationMutation(v24);
        }
        v27 = *(void **)(*((void *)&v187 + 1) + 8 * i);
        long long v183 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        v28 = v27;
        v29 = [v27 assetIds];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v183 objects:v201 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v184;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v184 != v32) {
                objc_enumerationMutation(v29);
              }
              [(__CFSet *)v22 addObject:*(void *)(*((void *)&v183 + 1) + 8 * j)];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v183 objects:v201 count:16];
          }
          while (v31);
        }

        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        uint64_t v34 = [v28 collectionIds];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v179 objects:v200 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v180;
          do
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v180 != v37) {
                objc_enumerationMutation(v34);
              }
              [(__CFSet *)v23 addObject:*(void *)(*((void *)&v179 + 1) + 8 * k)];
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v179 objects:v200 count:16];
          }
          while (v36);
        }

        long long v39 = [v28 fullSearchTextGroupSnapshot];
        long long v40 = v39;
        if (v39 && (unsigned __int16)([v39 category] - 1402) <= 0xFFFDu)
        {
          long long v41 = [v40 normalizedString];
          [v144 addObject:v28];
          if (v159 >= 3)
          {
            unint64_t v42 = [v156 length];
            v157 = v41;
            if (v42 <= [v41 length])
            {
              id v55 = v156;
            }
            else
            {
              long long v43 = [v40 groupRanges];
              long long v44 = [v43 firstObject];
              uint64_t location = [v44 rangeValue];
              NSUInteger length = v46;

              long long v177 = 0u;
              long long v178 = 0u;
              long long v175 = 0u;
              long long v176 = 0u;
              id v48 = v43;
              uint64_t v49 = [v48 countByEnumeratingWithState:&v175 objects:v199 count:16];
              if (v49)
              {
                uint64_t v50 = v49;
                uint64_t v51 = *(void *)v176;
                do
                {
                  for (uint64_t m = 0; m != v50; ++m)
                  {
                    if (*(void *)v176 != v51) {
                      objc_enumerationMutation(v48);
                    }
                    v205.uint64_t location = [*(id *)(*((void *)&v175 + 1) + 8 * m) rangeValue];
                    v205.NSUInteger length = v53;
                    v204.uint64_t location = location;
                    v204.NSUInteger length = length;
                    NSRange v54 = NSUnionRange(v204, v205);
                    uint64_t location = v54.location;
                    NSUInteger length = v54.length;
                  }
                  uint64_t v50 = [v48 countByEnumeratingWithState:&v175 objects:v199 count:16];
                }
                while (v50);
              }

              objc_msgSend(v156, "substringWithRange:", location, length);
              id v55 = (id)objc_claimAutoreleasedReturnValue();

              CFMutableSetRef v23 = v131;
              CFMutableSetRef v22 = v132;
              id v24 = v145;
            }
            long long v41 = v157;
            if (![v157 compare:v55 options:141])
            {
              [v134 addObject:v28];
              ++v154;
              if ([v40 category] == 1203
                || [v40 category] == 1204)
              {
                ++v150;
              }
            }
          }
        }
      }
      uint64_t v163 = [v24 countByEnumeratingWithState:&v187 objects:v202 count:16];
    }
    while (v163);

    BOOL v147 = v154 == v150;
    unint64_t v21 = v135;
    if (v154) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  BOOL v147 = 0;
LABEL_48:
  uint64_t v56 = v148;
  v57 = v56;
  if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v57, OS_SIGNPOST_INTERVAL_END, spid, "SearchProcessor - extractSearchResults - prepareIdSets", "", buf, 2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  os_signpost_id_t v59 = os_signpost_id_generate(v57);
  v60 = v57;
  v61 = v60;
  v62 = v156;
  if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "SearchProcessor - extractSearchResults - assetUUIDByAssetId", "", buf, 2u);
  }

  v151 = [(PSIDatabase *)v130->_searchIndex assetUUIDByAssetIdWithAssetIds:v22];
  v63 = v61;
  v64 = v63;
  if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v64, OS_SIGNPOST_INTERVAL_END, v59, "SearchProcessor - extractSearchResults - assetUUIDByAssetId", "", buf, 2u);
  }

  v65 = v64;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v66 = CFAbsoluteTimeGetCurrent() - Current;
    int v67 = [(__CFSet *)v22 count];
    *(_DWORD *)buf = 134218240;
    CFAbsoluteTime v192 = v66;
    __int16 v193 = 1024;
    int v194 = v67;
    _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_INFO, "extractSearchResults: getting asset UUIDs took %f seconds for %d assets", buf, 0x12u);
  }

  double v68 = CFAbsoluteTimeGetCurrent();
  os_signpost_id_t v69 = os_signpost_id_generate(v65);
  v70 = v65;
  v71 = v70;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v69, "SearchProcessor - extractSearchResults - collectionResultByCollectionId", "", buf, 2u);
  }

  v149 = [(PSIDatabase *)v130->_searchIndex collectionResultByCollectionIdWithCollectionIds:v23];
  v72 = v71;
  v73 = v72;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v73, OS_SIGNPOST_INTERVAL_END, v69, "SearchProcessor - extractSearchResults - collectionResultByCollectionId", "", buf, 2u);
  }

  v74 = v73;
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v75 = CFAbsoluteTimeGetCurrent() - v68;
    int v76 = [(__CFSet *)v23 count];
    *(_DWORD *)buf = 134218240;
    CFAbsoluteTime v192 = v75;
    __int16 v193 = 1024;
    int v194 = v76;
    _os_log_impl(&dword_19B3C7000, v74, OS_LOG_TYPE_INFO, "extractSearchResults: getting collection results took %f seconds for %d collections", buf, 0x12u);
  }

  uint64_t v136 = [v134 count];
  if (v136)
  {
    BOOL v133 = 0;
  }
  else
  {
    uint64_t v77 = [v144 count];
    BOOL v133 = v77 != 0;
    char v78 = v147;
    if (!v77) {
      char v78 = 1;
    }
    BOOL v147 = v78;
  }
  double v79 = CFAbsoluteTimeGetCurrent();
  os_signpost_id_t v80 = os_signpost_id_generate(v74);
  v81 = v74;
  v82 = v81;
  unint64_t v83 = v80 - 1;
  if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v82, OS_SIGNPOST_INTERVAL_BEGIN, v80, "SearchProcessor - extractSearchResults - processGroupResults", "", buf, 2u);
  }

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id spida = v24;
  uint64_t v155 = [spida countByEnumeratingWithState:&v171 objects:v198 count:16];
  if (!v155)
  {
    LODWORD(v84) = 0;
    LODWORD(v85) = 0;
    goto LABEL_110;
  }
  v126 = v82;
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  uint64_t v146 = *(void *)v172;
  do
  {
    uint64_t v86 = 0;
    do
    {
      uint64_t v162 = v84;
      if (*(void *)v172 != v146) {
        objc_enumerationMutation(spida);
      }
      v87 = *(void **)(*((void *)&v171 + 1) + 8 * v86);
      [v87 resolveObjectsWithAssetCache:v151 collectionCache:v149];
      uint64_t v164 = v85;
      uint64_t v160 = v86;
      if (v147)
      {
        int v88 = 1;
        goto LABEL_88;
      }
      if (v136)
      {
        int v88 = [v134 containsObject:v87];
        if (((v88 | !v133) & 1) == 0) {
          goto LABEL_86;
        }
      }
      else
      {
        if (v133)
        {
LABEL_86:
          int v88 = [v144 containsObject:v87];
          goto LABEL_88;
        }
        int v88 = 0;
      }
LABEL_88:
      v89 = [v87 assetUUIDs];
      uint64_t v90 = [v89 count];

      if (v90)
      {
        v91 = [(PLSearchResult *)[PLAssetSearchResult alloc] initWithGroupResult:v87];
        if (([v87 selectedForOCRCompletion] & 1) == 0) {
          [v153 addObject:v91];
        }
        if (([v87 isMergedOCRResult] & 1) == 0) {
          [v152 addObject:v91];
        }
      }
      v92 = [v87 assetUUIDs];
      uint64_t v158 = [v92 count];

      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      v93 = [v87 collectionResults];
      uint64_t v94 = [v93 countByEnumeratingWithState:&v167 objects:v197 count:16];
      if (v94)
      {
        uint64_t v95 = v94;
        uint64_t v96 = *(void *)v168;
        do
        {
          for (uint64_t n = 0; n != v95; ++n)
          {
            if (*(void *)v168 != v96) {
              objc_enumerationMutation(v93);
            }
            v98 = -[PLCollectionSearchResult initWithGroupResult:collectionResult:libraryScope:]([PLCollectionSearchResult alloc], "initWithGroupResult:collectionResult:libraryScope:", v87, *(void *)(*((void *)&v167 + 1) + 8 * n), [v166 libraryScope]);
            [v25 addObject:v98];
            if (v88 && [(PLCollectionSearchResult *)v98 collectionType] == 4) {
              [v165 addObject:v98];
            }
          }
          uint64_t v95 = [v93 countByEnumeratingWithState:&v167 objects:v197 count:16];
        }
        while (v95);
      }

      v99 = [v87 collectionResults];
      uint64_t v100 = [v99 count];

      if (v88)
      {
        -[__CFArray addObjectsFromArray:](Mutable, "addObjectsFromArray:", [v87 assetIds]);
        v101 = [v87 lookupIdentifiers];
        v102 = PFMap();

        [v140 addObjectsFromArray:v102];
        v103 = [v87 lookupIdentifiers];
        v104 = PFMap();

        [v139 addObjectsFromArray:v104];
        v105 = [v87 lookupIdentifiers];
        v106 = PFMap();

        [v138 addObjectsFromArray:v106];
        id v107 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        [v107 addIndex:1300];
        [v107 addIndex:1301];
        [v107 addIndex:1330];
        [v107 addIndex:1331];
        v108 = [v87 lookupIdentifiersForSearchIndexCategories:v107];
        [v137 addObjectsFromArray:v108];
      }
      v62 = v156;
      uint64_t v84 = v158 + v162;
      uint64_t v85 = v100 + v164;
      uint64_t v86 = v160 + 1;
    }
    while (v160 + 1 != v155);
    uint64_t v155 = [spida countByEnumeratingWithState:&v171 objects:v198 count:16];
  }
  while (v155);
  unint64_t v83 = v80 - 1;
  v82 = v126;
LABEL_110:

  v109 = v82;
  v110 = v109;
  if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v110, OS_SIGNPOST_INTERVAL_END, v80, "SearchProcessor - extractSearchResults - processGroupResults", "", buf, 2u);
  }

  v111 = v110;
  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v112 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134218496;
    CFAbsoluteTime v192 = v112 - v79;
    __int16 v193 = 1024;
    int v194 = v84;
    __int16 v195 = 1024;
    int v196 = v85;
    _os_log_impl(&dword_19B3C7000, v111, OS_LOG_TYPE_INFO, "extractSearchResults: gathering took %f seconds for %d asset results and %d collection results", buf, 0x18u);
  }

  double v113 = CFAbsoluteTimeGetCurrent();
  os_signpost_id_t v114 = os_signpost_id_generate(v111);
  v115 = v111;
  v116 = v115;
  if (v114 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v116, OS_SIGNPOST_INTERVAL_BEGIN, v114, "SearchProcessor - extractSearchResults - topAssetsSearchResults", "", buf, 2u);
  }

  if ([(__CFArray *)Mutable count])
  {
    v117 = objc_opt_new();
    [v117 setDelegate:v130->_searchIndex];
    [v117 setAssetIds:Mutable];
    v118 = [[PLTopAssetsSearchResult alloc] initWithTopAssetsResult:v117];
    [v166 setSceneIdentifiers:v140];
    [v166 setPersonIdentifiers:v137];
    [v166 setAudioIdentifiers:v139];
    [v166 setHumanActionIdentifiers:v138];
  }
  else
  {
    v118 = 0;
  }
  v119 = v116;
  v120 = v119;
  if (v114 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v120, OS_SIGNPOST_INTERVAL_END, v114, "SearchProcessor - extractSearchResults - topAssetsSearchResults", "", buf, 2u);
  }

  v121 = v120;
  CFMutableArrayRef v122 = Mutable;
  if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v123 = CFAbsoluteTimeGetCurrent() - v113;
    int v124 = [(__CFArray *)Mutable count];
    *(_DWORD *)buf = 134218240;
    CFAbsoluteTime v192 = v123;
    __int16 v193 = 1024;
    int v194 = v124;
    _os_log_impl(&dword_19B3C7000, v121, OS_LOG_TYPE_INFO, "extractSearchResults: creating top assets search results took %f seconds for %d asset results", buf, 0x12u);
  }

  if (v128)
  {
    v125 = [v165 allObjects];
    v128[2](v128, v153, v152, v25, v118, v125);

    CFMutableArrayRef v122 = Mutable;
  }
}

id __84__PLSearchProcessor__extractSearchResultsFromGroupResults_withQuery_resultsHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return PLSearchHumanActionIdentifierFromLookupIdentifier(a2);
}

id __84__PLSearchProcessor__extractSearchResultsFromGroupResults_withQuery_resultsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return PLSearchSceneIdentifierFromLookupIdentifier(a2);
}

id __84__PLSearchProcessor__extractSearchResultsFromGroupResults_withQuery_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  return PLSearchSceneIdentifierFromLookupIdentifier(a2);
}

- (id)_completionFilenameResultsForFilenameResults:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    id v27 = v5;
    v28 = v4;
    uint64_t v26 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      uint64_t v30 = v7;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 assetSearchResults];
          int v12 = [v11 firstObject];
          uint64_t v13 = objc_opt_class();
          long long v14 = [v11 lastObject];
          uint64_t v15 = objc_opt_class();

          if (v13 == v15)
          {
            uint64_t v17 = [v10 groupResult];
            os_signpost_id_t v18 = [v17 groups];
            CFAllocatorRef v16 = [v18 firstObject];

            uint64_t v19 = [v16 matchRanges];
            uint64_t v20 = [v19 firstObject];
            uint64_t v21 = [v20 rangeValue];
            CFMutableSetRef v22 = [v16 groupRanges];
            CFMutableSetRef v23 = [v22 lastObject];
            uint64_t v24 = [v23 rangeValue];

            if (v21 == v24)
            {
              id v4 = v28;
              [v28 addObject:v10];
            }
            else
            {
              id v4 = v28;
              [v28 addObjectsFromArray:v11];
            }
            uint64_t v8 = v26;
            id v5 = v27;
          }
          else
          {
            CFAllocatorRef v16 = [(PLSearchProcessor *)self _completionFilenameResultsForFilenameResults:v11];
            [v4 addObjectsFromArray:v16];
          }
          uint64_t v7 = v30;
        }
        else
        {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_combinedFilenameSearchResultsFromSearchResults:(id)a3 inQuery:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v36 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v37 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
  long long v39 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    long long v38 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v12 groupCount] == 1)
        {
          uint64_t v13 = [v12 groupResult];
          long long v14 = [v13 matchRangesAtIndex:0];

          if ([v14 count] == 1)
          {
            uint64_t v15 = [v12 groupResult];
            CFAllocatorRef v16 = [v15 groupRangesAtIndex:0];
            uint64_t v17 = [v16 lastObject];
            uint64_t v18 = [v17 rangeValue];
            uint64_t v20 = v19;

            uint64_t v21 = [v14 firstObject];
            uint64_t v22 = [v21 rangeValue];

            if (v18 == v22)
            {
              CFMutableSetRef v23 = [v12 groupResult];
              uint64_t v24 = [v23 normalizedStringAtIndex:0];

              uint64_t v25 = objc_msgSend(v24, "substringWithRange:", v18, v20);
              uint64_t v26 = [v37 objectForKeyedSubscript:v25];
              id v7 = v39;
              if (!v26)
              {
                uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v39, "count"));
                [v37 setObject:v26 forKeyedSubscript:v25];
              }
              [v26 addObject:v12];

              uint64_t v6 = v38;
            }
            else
            {
              uint64_t v6 = v38;
              [v38 addObject:v12];
              id v7 = v39;
            }
          }
          else
          {
            [v6 addObject:v12];
          }
        }
        else
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v9);
  }

  id v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count"));
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __77__PLSearchProcessor__combinedFilenameSearchResultsFromSearchResults_inQuery___block_invoke;
  v40[3] = &unk_1E586BDB8;
  id v28 = v27;
  id v41 = v28;
  [v37 enumerateKeysAndObjectsUsingBlock:v40];
  if ([v6 count])
  {
    v29 = [v6 arrayByAddingObjectsFromArray:v28];
    uint64_t v30 = [PLNamedCombinedAssetSearchResult alloc];
    long long v31 = v36;
    long long v32 = [v36 searchText];
    long long v33 = [(PLNamedCombinedAssetSearchResult *)v30 initWithName:v32 assetSearchResults:v29 canOverlap:0];

    NSUInteger v46 = v33;
    id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];

    id v7 = v39;
  }
  else
  {
    id v34 = v28;
    long long v31 = v36;
  }

  return v34;
}

void __77__PLSearchProcessor__combinedFilenameSearchResultsFromSearchResults_inQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[PLNamedCombinedAssetSearchResult alloc] initWithName:v6 assetSearchResults:v5 canOverlap:0];

  [*(id *)(a1 + 32) addObject:v7];
}

- (id)_searchResultsByCategoryMasksForSearchResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 categoryMask];
        unint64_t v11 = v10 | 0x40041;
        if ((v10 & 0x40041) == 0) {
          unint64_t v11 = v10;
        }
        if ((v11 & 0xC00) != 0) {
          v11 |= 0xC00uLL;
        }
        if ((v11 & 0x10000000000080) != 0) {
          v11 |= 0x10000000000080uLL;
        }
        if ((v11 & 0x3FC0000000000000) != 0) {
          v11 |= 0x3FC0000000000000uLL;
        }
        if ((v11 & 0xC000000000) != 0) {
          v11 |= 0xC000000000uLL;
        }
        if ((v11 & 0x207300000) != 0) {
          v11 |= 0x207300000uLL;
        }
        if ((v11 & 0x20004000) != 0) {
          v11 |= 0x20004000uLL;
        }
        if (v11 >> 62) {
          v11 |= 0xC000000000000000;
        }
        if ((v11 & 0x50008002) != 0) {
          v11 |= 0x50008002uLL;
        }
        if ((v11 & 0x80010000) != 0) {
          v11 |= 0x80010000uLL;
        }
        if ((v11 & 0x100020000) != 0) {
          v11 |= 0x100020000uLL;
        }
        if ((v11 & 0x800400000) != 0) {
          uint64_t v12 = v11 | 0x800400000;
        }
        else {
          uint64_t v12 = v11;
        }
        uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v12];
        long long v14 = [v4 objectForKeyedSubscript:v13];
        if (!v14)
        {
          long long v14 = [MEMORY[0x1E4F1CA48] array];
          [v4 setObject:v14 forKeyedSubscript:v13];
        }
        [v14 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_sortDescriptorsForCategoryMask:(unint64_t)a3
{
  if ((a3 & 0x3000) != 0)
  {
    id v3 = [(PLSearchProcessor *)self _dateSortDescriptors];
  }
  else
  {
    if ((a3 & 0x100) != 0) {
      [(PLSearchProcessor *)self _alphabeticalSortDescriptors];
    }
    else {
    id v3 = [(PLSearchProcessor *)self _numberOfAssetsSortDescriptors];
    }
  }
  return v3;
}

- (id)_numberOfAssetsSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assetCount" ascending:0];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"keyAssetUUID" ascending:1];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_dateSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortDate" ascending:0];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_alphabeticalSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (double)_scoreForSearchIndexCategory:(unint64_t)a3
{
  double result = 1.0;
  if ((uint64_t)a3 > 1519)
  {
    if ((uint64_t)a3 > 1899)
    {
      if ((uint64_t)a3 <= 1999)
      {
        if (a3 - 1900 <= 0x13) {
          return 0.3;
        }
        return result;
      }
      if ((uint64_t)a3 > 2499)
      {
        if ((uint64_t)a3 > 2600)
        {
          if (a3 == 2601) {
            return 0.5;
          }
          if (a3 == 2700 || a3 == 2800) {
            return 0.0;
          }
          return result;
        }
        double v4 = 0.5;
        if (a3 == 2600) {
          double result = 0.5;
        }
        if (a3 == 2501) {
          double result = 0.5;
        }
        BOOL v5 = a3 == 2500;
      }
      else
      {
        if ((uint64_t)a3 <= 2299)
        {
          if (a3 == 2000) {
            return 0.3;
          }
          if (a3 != 2100)
          {
            if (a3 != 2200) {
              return result;
            }
            return 0.4;
          }
          return 0.1;
        }
        double v4 = 0.0;
        if (a3 == 2401) {
          double result = 0.0;
        }
        if (a3 == 2400) {
          double result = 0.0;
        }
        BOOL v5 = a3 == 2300;
      }
      if (v5) {
        return v4;
      }
      return result;
    }
    if ((uint64_t)a3 > 1609)
    {
      if ((uint64_t)a3 > 1700)
      {
        switch(a3)
        {
          case 0x708uLL:
            return 0.62;
          case 0x709uLL:
            double result = 0.63;
            break;
          case 0x70AuLL:
          case 0x70BuLL:
            return 0.4;
          default:
            if (a3 == 1701) {
              return 0.4;
            }
            break;
        }
        return result;
      }
      if (a3 != 1610 && a3 != 1611)
      {
        if (a3 == 1700) {
          return 0.62;
        }
        return result;
      }
    }
    else
    {
      if ((uint64_t)a3 <= 1539)
      {
        if ((uint64_t)a3 > 1529)
        {
          if (a3 != 1530 && a3 != 1531) {
            return result;
          }
        }
        else if (a3 != 1520 && a3 != 1521)
        {
          return result;
        }
        return 0.55;
      }
      if ((uint64_t)a3 <= 1599)
      {
        if (a3 != 1540 && a3 != 1541) {
          return result;
        }
        return 0.55;
      }
      if (a3 != 1600 && a3 != 1601) {
        return result;
      }
    }
    return 0.7;
  }
  if ((uint64_t)a3 <= 1099)
  {
    if (a3 - 1 >= 0xE)
    {
      switch(a3)
      {
        case 0x3E8uLL:
        case 0x3E9uLL:
          double result = 0.91;
          break;
        case 0x3EAuLL:
          return 0.1;
        case 0x3EBuLL:
        case 0x3ECuLL:
        case 0x3EDuLL:
        case 0x3EEuLL:
          double result = 0.6;
          break;
        default:
          if (!a3) {
            return 0.0;
          }
          break;
      }
      return result;
    }
    return 0.9;
  }
  if ((uint64_t)a3 <= 1309)
  {
    switch(a3)
    {
      case 0x44CuLL:
      case 0x44DuLL:
      case 0x44EuLL:
        double result = 0.65;
        break;
      case 0x44FuLL:
      case 0x450uLL:
      case 0x451uLL:
        return 0.7;
      case 0x452uLL:
      case 0x453uLL:
        return 0.0;
      default:
        switch(a3)
        {
          case 0x4B0uLL:
          case 0x4B2uLL:
          case 0x4B4uLL:
          case 0x4B5uLL:
            return 0.1;
          case 0x4B1uLL:
            double result = 0.2;
            break;
          case 0x4B3uLL:
            return 0.4;
          default:
            return result;
        }
        break;
    }
    return result;
  }
  if ((uint64_t)a3 <= 1400)
  {
    if ((uint64_t)a3 <= 1329)
    {
      switch(a3)
      {
        case 0x51EuLL:
          return 0.95;
        case 0x528uLL:
          return 0.99;
        case 0x529uLL:
          return 0.1;
      }
      return result;
    }
    if (a3 - 1330 >= 2)
    {
      if (a3 != 1400) {
        return result;
      }
      return 0.4;
    }
    return 0.9;
  }
  if ((uint64_t)a3 > 1500)
  {
    if (a3 != 1501 && a3 != 1510 && a3 != 1511) {
      return result;
    }
    return 0.55;
  }
  if (a3 == 1401) {
    return 0.25;
  }
  if (a3 == 1500) {
    return 0.55;
  }
  return result;
}

- (id)completionSuggestionsForQuery:(id)a3 withSearchSections:(id)a4 numberOfSuggestions:(unint64_t)a5
{
  uint64_t v306 = *MEMORY[0x1E4F143B8];
  id v219 = a3;
  id v7 = a4;
  long long v173 = self;
  uint64_t v8 = [(id)objc_opt_class() searchProcessorLog];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v10 = v8;
  unint64_t v11 = v10;
  unint64_t v162 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SearchProcessor-CompletionSuggestions", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;
  uint64_t v161 = v11;

  uint64_t v163 = [MEMORY[0x1E4F1CA48] array];
  v293[0] = MEMORY[0x1E4F143A8];
  v293[1] = 3221225472;
  v293[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke;
  v293[3] = &unk_1E58737D0;
  v293[4] = v173;
  uint64_t v160 = (void *)MEMORY[0x19F38D650](v293);
  long long v289 = 0u;
  long long v290 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v289 objects:v305 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v290;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v290 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v289 + 1) + 8 * i);
        long long v285 = 0u;
        long long v286 = 0u;
        long long v287 = 0u;
        long long v288 = 0u;
        long long v19 = [v18 searchResults];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v285 objects:v304 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v286;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v286 != v22) {
                objc_enumerationMutation(v19);
              }
              unint64_t v24 = [*(id *)(*((void *)&v285 + 1) + 8 * j) assetCount];
              if (v15 <= v24) {
                unint64_t v15 = v24;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v285 objects:v304 count:16];
          }
          while (v21);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v289 objects:v305 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
  v200 = [MEMORY[0x1E4F1CA80] set];
  id v27 = [v219 searchText];
  id v28 = [v219 tokenizer];
  v29 = [v28 normalizeString:v27];

  unint64_t v178 = [v29 length];
  v283[0] = MEMORY[0x1E4F143A8];
  v283[1] = 3221225472;
  v283[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3;
  v283[3] = &unk_1E586BCC8;
  id v159 = v27;
  id v284 = v159;
  __int16 v193 = (void (**)(void, void))MEMORY[0x19F38D650](v283);
  v281[0] = MEMORY[0x1E4F143A8];
  v281[1] = 3221225472;
  v281[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4;
  v281[3] = &unk_1E586BCC8;
  id v180 = v29;
  id v282 = v180;
  __int16 v195 = (void (**)(void, void))MEMORY[0x19F38D650](v281);
  uint64_t v164 = [MEMORY[0x1E4F1CA60] dictionary];
  v165 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
  long long v31 = [v219 suggestionWhitelistedScenes];
  long long v171 = [v30 setWithArray:v31];

  long long v32 = (void *)v26;
  long long v181 = [MEMORY[0x1E4F1CA80] set];
  long long v190 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v176 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v277 = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  long long v280 = 0u;
  obuint64_t j = v12;
  long long v184 = (void *)v26;
  long long v185 = v25;
  uint64_t v168 = [obj countByEnumeratingWithState:&v277 objects:v303 count:16];
  if (v168)
  {
    int v33 = 0;
    uint64_t v167 = *(void *)v278;
    double v34 = (double)v15;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v278 != v167) {
          objc_enumerationMutation(obj);
        }
        uint64_t v169 = v35;
        id v36 = *(void **)(*((void *)&v277 + 1) + 8 * v35);
        if ([v36 categoryMask] == 0x400000000)
        {
          uint64_t v37 = [v36 searchResults];
          long long v38 = [(PLSearchProcessor *)v173 _completionFilenameResultsForFilenameResults:v37];
        }
        else
        {
          long long v39 = [v36 assetSearchResultsForCompletions];
          uint64_t v40 = [v39 count];

          if (v40) {
            [v36 assetSearchResultsForCompletions];
          }
          else {
          long long v38 = [v36 searchResults];
          }
        }
        long long v276 = 0u;
        long long v275 = 0u;
        long long v274 = 0u;
        long long v273 = 0u;
        CFAllocatorRef v41 = v38;
        uint64_t v42 = [(__CFAllocator *)v41 countByEnumeratingWithState:&v273 objects:v302 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          unint64_t v182 = 0;
          uint64_t v44 = *(void *)v274;
          CFAllocatorRef allocator = v41;
          uint64_t v197 = *(void *)v274;
          do
          {
            uint64_t v45 = 0;
            uint64_t v203 = v43;
            do
            {
              if (*(void *)v274 != v44) {
                objc_enumerationMutation(v41);
              }
              NSUInteger v46 = *(void **)(*((void *)&v273 + 1) + 8 * v45);
              long long v47 = [v46 groupResult];
              if (([v32 containsObject:v47] & 1) == 0)
              {
                [v32 addObject:v47];
                uint64_t v48 = [v47 fullSearchTextGroupSnapshot];
                if ([v48 category] == 1203)
                {
                  v214 = v46;
                  int v49 = 1;
                  if ((v33 & 1) == 0)
                  {
                    if (v48) {
                      goto LABEL_48;
                    }
LABEL_46:
                    if ([v47 isDateFilterPartiallyFromFullSearchText])
                    {
                      uint64_t v48 = [v47 dateFilterGroupSnapshot];
                      if (v48) {
                        goto LABEL_48;
                      }
                    }
                    else
                    {
                      uint64_t v48 = 0;
                    }
                  }
                }
                else
                {
                  BOOL v50 = [v48 category] == 1204;
                  if (v50 & v33)
                  {
                    int v49 = 1;
                  }
                  else
                  {
                    v214 = v46;
                    int v49 = v50 | v33;
                    if (!v48) {
                      goto LABEL_46;
                    }
LABEL_48:
                    v211 = ((void (**)(void, void *))v193)[2](v193, v48);
                    uint64_t v198 = [v211 length];
                    v220 = ((void (**)(void, void *))v195)[2](v195, v48);
                    uint64_t v205 = [v220 length];
                    uint64_t v51 = (int)[v48 category];
                    uint64_t v52 = PLSearchIndexCategoryMaskForCategory(v51);
                    int v201 = v51;
                    char v53 = PLSearchUserCategoryForCategory(v51);
                    char v54 = v53;
                    v217 = v48;
                    int v208 = v49;
                    if (v52 != 2) {
                      goto LABEL_61;
                    }
                    char v188 = v53;
                    long long v272 = 0u;
                    long long v271 = 0u;
                    long long v270 = 0u;
                    long long v269 = 0u;
                    id v55 = [v219 queryTokens];
                    uint64_t v56 = [v55 countByEnumeratingWithState:&v269 objects:v301 count:16];
                    if (!v56) {
                      goto LABEL_60;
                    }
                    uint64_t v57 = v56;
                    uint64_t v58 = *(void *)v270;
                    while (2)
                    {
                      for (uint64_t k = 0; k != v57; ++k)
                      {
                        if (*(void *)v270 != v58) {
                          objc_enumerationMutation(v55);
                        }
                        v60 = *(void **)(*((void *)&v269 + 1) + 8 * k);
                        if (([v60 belongsToSearchText] & 1) == 0
                          && ([v60 userCategory] == 8 || !objc_msgSend(v60, "userCategory")))
                        {
                          v61 = [v219 tokenizer];
                          v62 = [v60 text];
                          v63 = [v61 normalizeString:v62];
                          uint64_t v64 = [v63 compare:v220 options:10];

                          if (!v64)
                          {
                            long long v32 = v184;
                            uint64_t v25 = v185;
                            CFAllocatorRef v41 = allocator;
                            goto LABEL_68;
                          }
                        }
                      }
                      uint64_t v57 = [v55 countByEnumeratingWithState:&v269 objects:v301 count:16];
                      if (v57) {
                        continue;
                      }
                      break;
                    }
LABEL_60:

                    long long v32 = v184;
                    uint64_t v25 = v185;
                    CFAllocatorRef v41 = allocator;
                    char v54 = v188;
                    uint64_t v48 = v217;
LABEL_61:
                    [v190 setObject:v48 forKey:v47];
                    if ((0x7FFFFC10FEuLL >> v54)) {
                      [v181 addObject:v47];
                    }
                    id v55 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v48, "groupId"));
                    if (([v25 containsObject:v55] & 1) == 0)
                    {
                      [v25 addObject:v55];
                      [v220 rangeOfString:v180 options:2];
                      if (v65)
                      {
                        if (v205 == v178)
                        {
                          [v176 setObject:&unk_1EEBEEE38 forKey:v47];
                          ++v182;
                          goto LABEL_68;
                        }
                        if (v182 <= a5)
                        {
                          CFAbsoluteTime v66 = [v217 matchRanges];
                          int v67 = [v66 firstObject];
                          unint64_t v189 = [v67 rangeValue];

                          v206 = v66;
                          if (v201 != 2100) {
                            goto LABEL_79;
                          }
                          if ([v66 count] != 1) {
                            goto LABEL_79;
                          }
                          double v68 = [v217 groupRanges];
                          os_signpost_id_t v69 = [v68 lastObject];
                          uint64_t v70 = [v69 rangeValue];

                          if (v189 != v70) {
                            goto LABEL_79;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [v164 setObject:v214 forKeyedSubscript:v55];
                            v71 = [v219 tokenizer];
                            v72 = [v214 contentStrings];
                            v73 = [v72 firstObject];
                            v74 = [v71 normalizeString:v73];
                            [v165 setObject:v74 forKeyedSubscript:v55];

                            int v75 = 1;
                          }
                          else
                          {
LABEL_79:
                            int v75 = 0;
                          }
                          int v76 = [v217 tokens];
                          long long v265 = 0u;
                          long long v266 = 0u;
                          long long v267 = 0u;
                          long long v268 = 0u;
                          id v77 = v76;
                          uint64_t v78 = [v77 countByEnumeratingWithState:&v265 objects:v300 count:16];
                          if (v78)
                          {
                            uint64_t v79 = v78;
                            uint64_t v80 = *(void *)v266;
LABEL_82:
                            uint64_t v81 = 0;
                            while (1)
                            {
                              if (*(void *)v266 != v80) {
                                objc_enumerationMutation(v77);
                              }
                              if (![v200 containsObject:*(void *)(*((void *)&v265 + 1) + 8 * v81)])break; {
                              if (v79 == ++v81)
                              }
                              {
                                uint64_t v79 = [v77 countByEnumeratingWithState:&v265 objects:v300 count:16];
                                if (v79) {
                                  goto LABEL_82;
                                }
                                goto LABEL_88;
                              }
                            }

                            CFAllocatorRef v41 = allocator;
                            unsigned __int16 v82 = v201;
                            if (v178 <= 2 && (v201 & 0xFFFFFFFE) == 0x5DC)
                            {
                              unint64_t v83 = [v211 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
                              uint64_t v84 = [v83 capitalizedString];

                              if (([v171 containsObject:v84] & 1) == 0)
                              {
                                [v176 setObject:&unk_1EEBEEE50 forKey:v47];

                                goto LABEL_116;
                              }

                              unsigned __int16 v82 = v201;
                            }
                            int v85 = 1;
                            if (v82 <= 0x577u)
                            {
                              unint64_t v86 = v198;
                              if (v82 - 1200 >= 6) {
LABEL_103:
                              }
                                int v85 = 0;
LABEL_105:
                              double v88 = 1.0 - (double)v189 / (double)v86;
                              double v89 = v88 + -0.5;
                              if (v88 + -0.5 < 0.0) {
                                double v89 = 0.0;
                              }
                              if (v88 == 1.0) {
                                double v90 = 1.0 - (double)v189 / (double)v86;
                              }
                              else {
                                double v90 = v89;
                              }
                              -[PLSearchProcessor _scoreForSearchIndexCategory:](v173, "_scoreForSearchIndexCategory:");
                              double v92 = v91;
                              if (v75) {
                                unint64_t v93 = [v214 assetCount];
                              }
                              else {
                                unint64_t v93 = [v47 matchCount];
                              }
                              double v94 = v92 * 0.25
                                  + v90 * 0.3
                                  + (double)v93 / v34 * 0.25
                                  + (1.0 - (double)v182 / ((double)a5 + -1.0)) * 0.2;
                              if (v85) {
                                double v94 = v94 * 0.5;
                              }
                              uint64_t v95 = [NSNumber numberWithDouble:v94];
                              [v176 setObject:v95 forKey:v47];

                              v182 += v85 ^ 1u;
                              goto LABEL_116;
                            }
                            if (v82 > 0x897u)
                            {
                              if (v82 != 2200)
                              {
                                BOOL v87 = v82 == 2300;
LABEL_102:
                                unint64_t v86 = v198;
                                if (!v87) {
                                  goto LABEL_103;
                                }
                                goto LABEL_105;
                              }
                            }
                            else if (v82 - 1400 >= 2)
                            {
                              BOOL v87 = v82 == 2100;
                              goto LABEL_102;
                            }
                            unint64_t v86 = v198;
                            goto LABEL_105;
                          }
LABEL_88:

                          CFAllocatorRef v41 = allocator;
LABEL_116:
                        }
                      }
                    }
LABEL_68:

                    uint64_t v44 = v197;
                    uint64_t v43 = v203;
                    uint64_t v48 = v217;
                    int v49 = v208;
                  }
                }

                int v33 = v49;
              }

              ++v45;
            }
            while (v45 != v43);
            uint64_t v96 = [(__CFAllocator *)v41 countByEnumeratingWithState:&v273 objects:v302 count:16];
            uint64_t v43 = v96;
          }
          while (v96);
        }

        uint64_t v35 = v169 + 1;
      }
      while (v169 + 1 != v168);
      uint64_t v168 = [obj countByEnumeratingWithState:&v277 objects:v303 count:16];
    }
    while (v168);
  }

  v97 = [v176 keyEnumerator];
  v98 = [v97 allObjects];
  v263[0] = MEMORY[0x1E4F143A8];
  v263[1] = 3221225472;
  v263[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_23;
  v263[3] = &unk_1E586BCF0;
  id v170 = v176;
  id v264 = v170;
  v99 = [v98 sortedArrayUsingComparator:v263];

  v260[0] = MEMORY[0x1E4F143A8];
  v260[1] = 3221225472;
  v260[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2_25;
  v260[3] = &unk_1E586BD18;
  id v179 = v164;
  id v261 = v179;
  long long v177 = v193;
  id v262 = v177;
  int v194 = (void (**)(void, void))MEMORY[0x19F38D650](v260);
  v257[0] = MEMORY[0x1E4F143A8];
  v257[1] = 3221225472;
  v257[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3_26;
  v257[3] = &unk_1E586BD18;
  id v172 = v165;
  id v258 = v172;
  long long v174 = v195;
  id v259 = v174;
  uint64_t v100 = (void (**)(void, void))MEMORY[0x19F38D650](v257);
  CFAbsoluteTime v192 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v218 = [MEMORY[0x1E4F1CA60] dictionary];
  v101 = v163;
  int v196 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v163, "count"));
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  id v191 = v99;
  uint64_t v202 = [v191 countByEnumeratingWithState:&v253 objects:v299 count:16];
  if (v202)
  {
    uint64_t v199 = *(void *)v254;
    CFAllocatorRef allocatora = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v183 = v100;
LABEL_122:
    uint64_t v102 = 0;
    while (1)
    {
      if (*(void *)v254 != v199) {
        objc_enumerationMutation(v191);
      }
      v103 = *(void **)(*((void *)&v253 + 1) + 8 * v102);
      if ([v101 count] >= a5) {
        goto LABEL_153;
      }
      v104 = [v190 objectForKey:v103];
      v105 = ((void (**)(void, void *))v100)[2](v100, v104);
      int v106 = [v104 category];
      uint64_t v107 = PLSearchUserCategoryForCategory(v106);
      uint64_t v108 = PLSearchedCategoriesSpecificToUserCategory(v107);
      v109 = [v218 objectForKeyedSubscript:v105];
      v221 = (void *)v108;
      if (!v109) {
        break;
      }
      v110 = v109;
      if (([v109 containsIndexes:v108] & 1) == 0
        && (((0x7FFFFC10FEuLL >> v107) & 1) != 0
         || PLExclusiveCategoriesIsSupersetOfSearchedCategories(v110)))
      {
        goto LABEL_132;
      }
LABEL_151:

      if (++v102 == v202)
      {
        uint64_t v202 = [v191 countByEnumeratingWithState:&v253 objects:v299 count:16];
        if (v202) {
          goto LABEL_122;
        }
        goto LABEL_153;
      }
    }
    v110 = [MEMORY[0x1E4F28E60] indexSet];
    [v218 setObject:v110 forKeyedSubscript:v105];
LABEL_132:
    [v110 addIndexes:v108];
    if (v106 == 2100)
    {
      v111 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v104, "groupId"));
      CFAbsoluteTime v112 = [v179 objectForKeyedSubscript:v111];
    }
    else
    {
      CFAbsoluteTime v112 = 0;
    }
    v212 = v105;
    v215 = v104;
    if (v112) {
      uint64_t v113 = 1;
    }
    else {
      uint64_t v113 = 2;
    }
    uint64_t v114 = ((void (**)(void, void *))v194)[2](v194, v104);
    NSRange v204 = PLSearchedCategoriesForUserCategory(v107);
    v207 = (void *)v114;
    v115 = [[PSIQueryToken alloc] initWithText:v114 userCategory:v107 searchedCategories:v204 matchType:v113];
    v209 = v112;
    if (v112)
    {
      CFMutableSetRef Mutable = CFSetCreateMutable(allocatora, 0, 0);
      CFMutableSetRef v117 = CFSetCreateMutable(allocatora, 0, 0);
      long long v249 = 0u;
      long long v250 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      v118 = [v112 groupResults];
      uint64_t v119 = [v118 countByEnumeratingWithState:&v249 objects:v298 count:16];
      if (v119)
      {
        uint64_t v120 = v119;
        uint64_t v121 = *(void *)v250;
        do
        {
          for (uint64_t m = 0; m != v120; ++m)
          {
            if (*(void *)v250 != v121) {
              objc_enumerationMutation(v118);
            }
            -[__CFSet addObjectsFromArray:](Mutable, "addObjectsFromArray:", [*(id *)(*((void *)&v249 + 1) + 8 * m) assetIds]);
          }
          uint64_t v120 = [v118 countByEnumeratingWithState:&v249 objects:v298 count:16];
        }
        while (v120);
      }

      [(PSIQueryToken *)v115 setAssetIds:Mutable];
      v101 = v163;
      uint64_t v100 = v183;
    }
    else
    {
      CFArrayRef v123 = (const __CFArray *)[v103 assetIds];
      CFIndex Count = CFArrayGetCount(v123);
      CFMutableSetRef Mutable = CFSetCreateMutable(allocatora, Count, 0);
      [(__CFSet *)Mutable addObjectsFromArray:v123];
      [(PSIQueryToken *)v115 setAssetIds:Mutable];
      v125 = v100;
      CFArrayRef v126 = (const __CFArray *)[v103 collectionIds];
      CFIndex v127 = CFArrayGetCount(v126);
      v101 = v163;
      CFMutableSetRef v117 = CFSetCreateMutable(allocatora, v127, 0);
      CFArrayRef v128 = v126;
      uint64_t v100 = v125;
      [(__CFSet *)v117 addObjectsFromArray:v128];
    }
    [(PSIQueryToken *)v115 setCollectionIds:v117];

    [v101 addObject:v115];
    [v192 setObject:v103 forKey:v115];
    v105 = v212;
    v129 = [v196 objectForKeyedSubscript:v212];
    if (!v129)
    {
      v129 = [MEMORY[0x1E4F1CA48] array];
      [v196 setObject:v129 forKeyedSubscript:v212];
    }
    [v129 addObject:v115];

    v104 = v215;
    goto LABEL_151;
  }
LABEL_153:

  v241[0] = MEMORY[0x1E4F143A8];
  v241[1] = 3221225472;
  v241[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4_29;
  v241[3] = &unk_1E586BD90;
  id v130 = v190;
  id v242 = v130;
  id v216 = v179;
  id v243 = v216;
  v210 = v100;
  id v247 = v210;
  id v131 = v196;
  id v244 = v131;
  v213 = v194;
  id v248 = v213;
  id v222 = v159;
  id v245 = v222;
  id v132 = v192;
  id v246 = v132;
  BOOL v133 = (void (**)(void, void))MEMORY[0x19F38D650](v241);
  long long v237 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  v134 = [v130 keyEnumerator];
  uint64_t v135 = [v134 countByEnumeratingWithState:&v237 objects:v297 count:16];
  if (v135)
  {
    uint64_t v136 = v135;
    uint64_t v137 = *(void *)v238;
    do
    {
      for (uint64_t n = 0; n != v136; ++n)
      {
        if (*(void *)v238 != v137) {
          objc_enumerationMutation(v134);
        }
        uint64_t v139 = *(void *)(*((void *)&v237 + 1) + 8 * n);
        if (([v181 containsObject:v139] & 1) == 0) {
          v133[2](v133, v139);
        }
      }
      uint64_t v136 = [v134 countByEnumeratingWithState:&v237 objects:v297 count:16];
    }
    while (v136);
  }

  long long v235 = 0u;
  long long v236 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  id v140 = [v219 dedupedGroupResults];
  uint64_t v141 = [v140 countByEnumeratingWithState:&v233 objects:v296 count:16];
  if (v141)
  {
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v234;
    do
    {
      for (iuint64_t i = 0; ii != v142; ++ii)
      {
        if (*(void *)v234 != v143) {
          objc_enumerationMutation(v140);
        }
        v133[2](v133, *(void *)(*((void *)&v233 + 1) + 8 * ii));
      }
      uint64_t v142 = [v140 countByEnumeratingWithState:&v233 objects:v296 count:16];
    }
    while (v142);
  }

  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  id v145 = v181;
  uint64_t v146 = [v145 countByEnumeratingWithState:&v229 objects:v295 count:16];
  if (v146)
  {
    uint64_t v147 = v146;
    uint64_t v148 = *(void *)v230;
    do
    {
      for (juint64_t j = 0; jj != v147; ++jj)
      {
        if (*(void *)v230 != v148) {
          objc_enumerationMutation(v145);
        }
        v133[2](v133, *(void *)(*((void *)&v229 + 1) + 8 * jj));
      }
      uint64_t v147 = [v145 countByEnumeratingWithState:&v229 objects:v295 count:16];
    }
    while (v147);
  }

  v227[0] = MEMORY[0x1E4F143A8];
  v227[1] = 3221225472;
  v227[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_8;
  v227[3] = &unk_1E586BDB8;
  id v150 = v163;
  id v228 = v150;
  [v131 enumerateKeysAndObjectsUsingBlock:v227];
  v223[0] = MEMORY[0x1E4F143A8];
  v223[1] = 3221225472;
  v223[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_9;
  v223[3] = &unk_1E586BDE0;
  id v151 = v160;
  id v226 = v151;
  id v152 = v132;
  id v224 = v152;
  id v153 = v170;
  id v225 = v153;
  [v150 sortUsingComparator:v223];
  uint64_t v154 = v161;
  uint64_t v155 = v154;
  if (v162 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v155, OS_SIGNPOST_INTERVAL_END, spid, "SearchProcessor-CompletionSuggestions", "", buf, 2u);
  }

  id v156 = v150;
  return v156;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2;
  void v6[3] = &unk_1E58737A8;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = &v7;
  [v3 enumerateIndexesUsingBlock:v6];
  double v4 = [NSNumber numberWithDouble:v8[3]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 dateFilter];
  if (v4) {
    [*(id *)(a1 + 32) capitalizedString];
  }
  else {
  BOOL v5 = [v3 contentString];
  }

  return v5;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 dateFilter];
  if (v4)
  {
    id v5 = *(id *)(a1 + 32);
  }
  else
  {
    id v5 = [v3 normalizedString];
  }
  uint64_t v6 = v5;

  return v6;
}

uint64_t __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_23(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectForKey:a3];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 category] != 2100) {
    goto LABEL_3;
  }
  double v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "groupId"));
  id v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 contentStrings];
  uint64_t v8 = [v7 firstObject];

  if (!v8)
  {
LABEL_3:
    uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v8;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 category] != 2100
    || (double v4 = *(void **)(a1 + 32),
        objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "groupId")),
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:v5],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v6;
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4_29(uint64_t a1, void *a2)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) objectForKey:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [v3 fullSearchTextGroupSnapshot];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v3 dateFilterGroupSnapshot];
    }
    id v6 = v9;
  }
  int v10 = [v6 category];
  uint64_t v11 = v10;
  uint64_t v12 = PLSearchUserCategoryForCategory(v10);
  if (v10 != 2100) {
    goto LABEL_9;
  }
  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = NSNumber;
  unint64_t v15 = [v3 groups];
  uint64_t v16 = [v15 firstObject];
  long long v17 = objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v16, "groupId"));
  long long v18 = [v13 objectForKeyedSubscript:v17];

  if (!v18)
  {
LABEL_9:
    int IsUserControlled = PLSearchIndexCategoryIsUserControlled(v11);
    uint64_t v51 = (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    if (v51
      && ([*(id *)(a1 + 48) objectForKeyedSubscript:v51],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          v20,
          v20))
    {
LABEL_22:
      id v28 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_5;
      v64[3] = &unk_1E586BD68;
      id v21 = v28;
      id v65 = v21;
      id v66 = *(id *)(a1 + 56);
      id v67 = *(id *)(a1 + 64);
      uint64_t v69 = v11;
      uint64_t v70 = v12;
      id v68 = v3;
      v29 = (void (**)(void, void, void))MEMORY[0x19F38D650](v64);
      if (IsUserControlled)
      {
        long long v62 = 0uLL;
        long long v63 = 0uLL;
        long long v60 = 0uLL;
        long long v61 = 0uLL;
        obuint64_t j = *(id *)(a1 + 48);
        uint64_t v30 = [obj countByEnumeratingWithState:&v60 objects:v77 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          id v48 = v21;
          id v49 = v6;
          uint64_t v32 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v61 != v32) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = *(void *)(*((void *)&v60 + 1) + 8 * i);
              if ([v51 containsString:v34])
              {
                long long v58 = 0u;
                long long v59 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                uint64_t v35 = a1;
                id v36 = [*(id *)(a1 + 48) objectForKeyedSubscript:v34];
                uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v76 count:16];
                if (v37)
                {
                  uint64_t v38 = v37;
                  uint64_t v39 = *(void *)v57;
                  do
                  {
                    for (uint64_t j = 0; j != v38; ++j)
                    {
                      if (*(void *)v57 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      v29[2](v29, *(void *)(*((void *)&v56 + 1) + 8 * j), 0);
                    }
                    uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v76 count:16];
                  }
                  while (v38);
                }

                a1 = v35;
              }
            }
            uint64_t v31 = [obj countByEnumeratingWithState:&v60 objects:v77 count:16];
          }
          while (v31);
          id v6 = v49;
          id v21 = v48;
        }
        CFAllocatorRef v41 = obj;
      }
      else
      {
        long long v54 = 0uLL;
        long long v55 = 0uLL;
        long long v52 = 0uLL;
        long long v53 = 0uLL;
        CFAllocatorRef v41 = [*(id *)(a1 + 48) objectForKeyedSubscript:v51];
        uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v75 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          id v44 = v21;
          id v45 = v3;
          uint64_t v46 = *(void *)v53;
          do
          {
            for (uint64_t k = 0; k != v43; ++k)
            {
              if (*(void *)v53 != v46) {
                objc_enumerationMutation(v41);
              }
              v29[2](v29, *(void *)(*((void *)&v52 + 1) + 8 * k), 1);
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v52 objects:v75 count:16];
          }
          while (v43);
          id v3 = v45;
          id v21 = v44;
        }
      }
    }
    else
    {
      if (!IsUserControlled)
      {
LABEL_51:

        goto LABEL_52;
      }
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v21 = *(id *)(a1 + 48);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v71 objects:v78 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        id v24 = v6;
        id v25 = v3;
        uint64_t v26 = *(void *)v72;
        while (2)
        {
          for (uint64_t m = 0; m != v23; ++m)
          {
            if (*(void *)v72 != v26) {
              objc_enumerationMutation(v21);
            }
            if ([v51 containsString:*(void *)(*((void *)&v71 + 1) + 8 * m)])
            {

              id v3 = v25;
              id v6 = v24;
              goto LABEL_22;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v71 objects:v78 count:16];
          if (v23) {
            continue;
          }
          break;
        }
        id v3 = v25;
        id v6 = v24;
      }
    }

    goto LABEL_51;
  }
LABEL_52:
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v4;
    id v6 = (id)[v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (![v9 userCategory])
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v18 + 1) + 8 * j);
          if (v15 != v6)
          {
            uint64_t v16 = objc_msgSend(v6, "assetCount", (void)v18);
            if (v16 == [v15 assetCount])
            {
              uint64_t v17 = [v6 collectionCount];
              if (v17 == [v15 collectionCount])
              {
                [*(id *)(a1 + 32) removeObject:v6];
                goto LABEL_24;
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_24:
  }
}

uint64_t __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 userCategory];
  if (v7 == [v6 userCategory])
  {
LABEL_4:
    uint64_t v8 = [v5 searchedCategories];
    id v9 = [v6 searchedCategories];
    char v10 = [v8 isEqualToIndexSet:v9];

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) objectForKey:v5];
      uint64_t v12 = [*(id *)(a1 + 32) objectForKey:v6];
      uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
      uint64_t v14 = [*(id *)(a1 + 40) objectForKey:v11];
      uint64_t v15 = [v13 compare:v14];

      if (v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v16 = NSNumber;
      uint64_t v17 = [v5 text];
      long long v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
      long long v19 = NSNumber;
      long long v20 = [v6 text];
      long long v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "length"));
      uint64_t v15 = [v18 compare:v21];
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v11 = [v6 searchedCategories];
      uint64_t v12 = (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v11);
      uint64_t v23 = *(void *)(a1 + 48);
      uint64_t v17 = [v5 searchedCategories];
      long long v18 = (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v17);
      uint64_t v24 = [v12 compare:v18];
      if (v24)
      {
        uint64_t v15 = v24;
LABEL_13:

        goto LABEL_14;
      }
      long long v25 = NSNumber;
      uint64_t v30 = [v6 searchedCategories];
      long long v21 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
      uint64_t v26 = NSNumber;
      id v27 = [v5 searchedCategories];
      uint64_t v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
      uint64_t v15 = [v21 compare:v28];

      long long v20 = v30;
    }

    goto LABEL_13;
  }
  if ([v5 userCategory])
  {
    if ([v6 userCategory]) {
      goto LABEL_4;
    }
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = -1;
  }
LABEL_15:

  return v15;
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_5(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_6;
  v23[3] = &unk_1E586BE50;
  char v28 = a3;
  id v24 = *(id *)(a1 + 32);
  id v6 = v5;
  id v25 = v6;
  id v26 = *(id *)(a1 + 40);
  id v27 = *(id *)(a1 + 48);
  uint64_t v7 = (void (**)(void))MEMORY[0x19F38D650](v23);
  if (*(void *)(a1 + 64) != 2100 || [v6 matchType] != 1)
  {
    uint64_t v8 = [v6 userCategory];
    if (!v8 || (unint64_t v9 = v8, v10 = *(void *)(a1 + 72), v10 == v8))
    {
      uint64_t v15 = [v6 assetIds];
      objc_msgSend(v15, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 56), "assetIds"));

      uint64_t v16 = [v6 collectionIds];
      objc_msgSend(v16, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 56), "collectionIds"));

      v7[2](v7);
    }
    else if (v10 > 0x26 || ((0x7FFFFC10FEuLL >> v10) & 1) == 0)
    {
      uint64_t v11 = [v6 searchedCategories];
      uint64_t v12 = v11;
      unsigned int v13 = (v9 < 0x27) & (0x7FFFFC10FEuLL >> v9);
      if (v13 != 1 || [v11 containsIndex:*(void *)(a1 + 64)])
      {
        uint64_t v14 = PLSearchedCategoriesForUserCategory(*(void *)(a1 + 72));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_7;
        v17[3] = &unk_1E586BD40;
        id v18 = v12;
        char v22 = v13;
        long long v21 = v7;
        id v19 = v6;
        id v20 = *(id *)(a1 + 56);
        [v14 enumerateRangesUsingBlock:v17];
      }
    }
  }
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id v11 = [*(id *)(a1 + 32) lowercaseString];
    v2 = [*(id *)(a1 + 40) text];
    id v3 = [v2 lowercaseString];

    if (([v3 isEqualToString:v11] & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 48) lowercaseString];
      int v5 = [v11 containsString:v4];
      int v6 = [v3 containsString:v4];
      if (v5 && !v6
        || v5 == v6
        && (uint64_t v7 = *(void **)(a1 + 32),
            [*(id *)(a1 + 40) text],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            uint64_t v9 = [v7 compare:v8],
            v8,
            v9 == 1))
      {
        unint64_t v10 = [*(id *)(a1 + 56) objectForKey:*(void *)(a1 + 40)];
        [*(id *)(a1 + 56) removeObjectForKey:*(void *)(a1 + 40)];
        [*(id *)(a1 + 40) setText:*(void *)(a1 + 32)];
        [*(id *)(a1 + 56) setObject:v10 forKey:*(void *)(a1 + 40)];
      }
    }
  }
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", a2, a3))
  {
    if (!*(unsigned char *)(a1 + 64))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      [*(id *)(a1 + 40) setUserCategory:0];
      [*(id *)(a1 + 40) setSearchedCategories:0];
    }
    int v6 = [*(id *)(a1 + 40) assetIds];
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 48), "assetIds"));

    uint64_t v7 = [*(id *)(a1 + 40) collectionIds];
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 48), "collectionIds"));

    *a4 = 1;
  }
}

uint64_t __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _scoreForSearchIndexCategory:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v5 + 24) >= v4) {
    double v4 = *(double *)(v5 + 24);
  }
  *(double *)(v5 + 24) = v4;
  return result;
}

- (id)updatedSearchSections:(id)a3 withTopCollectionResults:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v13 categoryMask];
        if (([v13 resultTypes] & 2) != 0 && v14 == -1)
        {
          unint64_t v15 = [v6 count];
          uint64_t v16 = [v13 searchResults];
          unint64_t v17 = [v16 count];

          if (v15 < v17)
          {
            id v18 = [(PLSearchProcessor *)self _sortDescriptorsForCategoryMask:-1];
            id v19 = [v6 sortedArrayUsingDescriptors:v18];
            id v20 = [PLSearchResultSection alloc];
            uint64_t v21 = [v13 resultTypes];
            uint64_t v22 = [(PLSearchResultSection *)v20 initWithResultTypes:v21 categoryMask:-1 searchResults:v19 assetSearchResultsForCompletions:MEMORY[0x1E4F1CBF0]];

            id v13 = (id)v22;
          }
        }
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)searchResultSectionsForQuery:(id)a3 withAssetResults:(id)a4 assetResultsForCompletions:(id)a5 collectionResults:(id)a6 combineAssetSections:(BOOL)a7
{
  BOOL v55 = a7;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v53 = a6;
  long long v58 = self;
  uint64_t v14 = [(id)objc_opt_class() searchProcessorLog];
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  uint64_t v16 = v14;
  unint64_t v17 = v16;
  unint64_t v54 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SearchProcessor-ResultSections", "", buf, 2u);
  }
  os_signpost_id_t spid = v15;

  long long v57 = [MEMORY[0x1E4F1CA48] array];
  id v18 = [MEMORY[0x1E4F1CA48] array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v19 = v12;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v79 count:16];
  long long v60 = v18;
  long long v61 = v17;
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = 0;
    uint64_t v23 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v73 != v23) {
          objc_enumerationMutation(v19);
        }
        long long v25 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        if (objc_msgSend(v25, "categoryMask", spid, v53) == 0x800000)
        {
          if (v22)
          {
            long long v26 = v17;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              long long v27 = [v25 groupDescription];
              *(_DWORD *)buf = 138412290;
              uint64_t v78 = v27;
              _os_log_fault_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_FAULT, "Favorite asset search result has already been found for group result: %@", buf, 0xCu);

              id v18 = v60;
            }

            unint64_t v17 = v61;
          }
          else
          {
            id v22 = v25;
          }
        }
        else
        {
          [v18 addObject:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }
    while (v21);
  }
  else
  {
    id v22 = 0;
  }

  if ([v18 count])
  {
    if (v55)
    {
      long long v28 = [(PLSearchProcessor *)v58 _numberOfAssetsSortDescriptors];
      v29 = [v18 sortedArrayUsingDescriptors:v28];
      uint64_t v30 = [[PLSearchResultSection alloc] initWithResultTypes:1 categoryMask:0x8000000 searchResults:v29 assetSearchResultsForCompletions:v13];
      [v57 addObject:v30];
    }
    else
    {
      long long v28 = [(PLSearchProcessor *)v58 _searchResultsByCategoryMasksForSearchResults:v18];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke;
      v68[3] = &unk_1E586BC78;
      v68[4] = v58;
      id v69 = v11;
      id v70 = v13;
      id v71 = v57;
      [v28 enumerateKeysAndObjectsUsingBlock:v68];
    }
  }
  long long v56 = v13;
  long long v59 = v11;
  uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", spid);
  uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
  int v33 = [MEMORY[0x1E4F1CA48] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v34 = v53;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v64 objects:v76 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v65 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        uint64_t v40 = [v39 collectionType];
        CFAllocatorRef v41 = v31;
        if (v40 != 3)
        {
          if ([v39 collectionType] == 2) {
            CFAllocatorRef v41 = v32;
          }
          else {
            CFAllocatorRef v41 = v33;
          }
        }
        [v41 addObject:v39];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v64 objects:v76 count:16];
    }
    while (v36);
  }

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke_2;
  v62[3] = &unk_1E586BCA0;
  v62[4] = v58;
  id v42 = v57;
  id v63 = v42;
  uint64_t v43 = (void (**)(void, void, void, void))MEMORY[0x19F38D650](v62);
  if ([v31 count] || v22)
  {
    id v44 = [(PLSearchProcessor *)v58 _sortDescriptorsForCategoryMask:256];
    [v31 sortUsingDescriptors:v44];
    if (v22) {
      [v31 insertObject:v22 atIndex:0];
    }
    id v45 = [PLSearchResultSection alloc];
    uint64_t v46 = [(PLSearchResultSection *)v45 initWithResultTypes:2 categoryMask:256 searchResults:v31 assetSearchResultsForCompletions:MEMORY[0x1E4F1CBF0]];
    [v42 addObject:v46];
  }
  if ([v32 count]) {
    ((void (**)(void, uint64_t, uint64_t, void *))v43)[2](v43, 2, 4096, v32);
  }
  if ([v33 count]) {
    ((void (**)(void, uint64_t, uint64_t, void *))v43)[2](v43, 2, -1, v33);
  }
  long long v47 = v61;
  id v48 = v47;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v48, OS_SIGNPOST_INTERVAL_END, spida, "SearchProcessor-ResultSections", "", buf, 2u);
  }

  id v49 = v42;
  return v49;
}

void __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  if (([*(id *)(a1 + 32) _shouldOmitSectionForCategoryMask:v6] & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if ((v6 & 0x400000000) != 0)
    {
      uint64_t v19 = [v7 _combinedFilenameSearchResultsFromSearchResults:v5 inQuery:*(void *)(a1 + 40)];

      id v5 = (id)v19;
    }
    else if ([v7 _categoryMaskIsCombinable:v6])
    {
      uint64_t v23 = v6;
      id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            os_signpost_id_t v15 = [v14 contentStrings];
            uint64_t v16 = [v15 firstObject];

            unint64_t v17 = [v8 objectForKeyedSubscript:v16];
            if (v17)
            {
              id v18 = v17;
              [(PLCombinedAssetSearchResult *)v17 addAssetSearchResult:v14 isMainSearchResult:0];
            }
            else
            {
              id v18 = [[PLCombinedAssetSearchResult alloc] initWithAssetSearchResult:v14];
              [v8 setObject:v18 forKeyedSubscript:v16];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }

      id v5 = [v8 allValues];

      uint64_t v6 = v23;
    }
    uint64_t v20 = [*(id *)(a1 + 32) _sortDescriptorsForCategoryMask:v6];
    uint64_t v21 = [v5 sortedArrayUsingDescriptors:v20];
    id v22 = [[PLSearchResultSection alloc] initWithResultTypes:1 categoryMask:v6 searchResults:v21 assetSearchResultsForCompletions:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) addObject:v22];
  }
}

void __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v11 = [v7 _sortDescriptorsForCategoryMask:a3];
  [v8 sortUsingDescriptors:v11];
  id v9 = [PLSearchResultSection alloc];
  uint64_t v10 = [(PLSearchResultSection *)v9 initWithResultTypes:a2 categoryMask:a3 searchResults:v8 assetSearchResultsForCompletions:MEMORY[0x1E4F1CBF0]];

  [*(id *)(a1 + 40) addObject:v10];
}

- (void)performQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 withResultsHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PLSearchBackendQueryGetLog();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: will perform search query: %@", buf, 0xCu);
    }

    uint64_t v12 = [(id)objc_opt_class() searchProcessorLog];
    os_signpost_id_t v13 = os_signpost_id_generate(v12);
    uint64_t v14 = v12;
    os_signpost_id_t v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SearchProcessor-PerformQuery", "", buf, 2u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke;
    v18[3] = &unk_1E586BC50;
    id v19 = v8;
    uint64_t v20 = v15;
    os_signpost_id_t v23 = v13;
    uint64_t v21 = self;
    id v22 = v9;
    uint64_t v16 = v15;
    [v19 runWithResultsHandler:v18 disableWildcardMatchesForUserControlledCategories:v6];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Expected query.", buf, 2u);
    }

    if (v9)
    {
      (*((void (**)(id, void, void, void, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, MEMORY[0x1E4F1CBF0]);
    }
    else
    {
      unint64_t v17 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_FAULT, "Expected resultsHandler.", buf, 2u);
      }
    }
  }
}

void __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v5;
    __int16 v29 = 2048;
    uint64_t v30 = [v3 count];
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: did run search query: %@ and got %lu results", buf, 0x16u);
  }

  BOOL v6 = *(id *)(a1 + 40);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SearchProcessor-PerformQuery", "", buf, 2u);
  }

  os_signpost_id_t v9 = os_signpost_id_generate(*(os_log_t *)(a1 + 40));
  uint64_t v10 = *(id *)(a1 + 40);
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SearchProcessor-ExtractSearchResults", "", buf, 2u);
  }

  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    uint64_t v12 = v3;
  }
  id v13 = v12;
  if (![*(id *)(a1 + 32) legacyDisableTopAssetsAndTopCollections])
  {
    uint64_t v14 = *(void *)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke_1;
    v22[3] = &unk_1E586BC28;
    os_signpost_id_t v15 = *(void **)(a1 + 48);
    id v23 = *(id *)(a1 + 40);
    os_signpost_id_t v26 = v9;
    id v24 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 56);
    [v15 _extractSearchResultsFromGroupResults:v13 withQuery:v14 resultsHandler:v22];

    goto LABEL_23;
  }
  if ([*(id *)(a1 + 32) isCanceled])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_23;
  }
  char v16 = [*(id *)(a1 + 32) searchResultTypes];
  char v17 = [*(id *)(a1 + 32) searchResultTypes];
  char v18 = v17;
  if (v16)
  {
    id v19 = [*(id *)(a1 + 48) _topAssetSearchResultFromGroupResults:v13];
    if ((v18 & 2) != 0) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_20;
  }
  id v19 = 0;
  if ((v17 & 2) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v20 = [*(id *)(a1 + 48) _collectionSearchResultsFromGroupResults:v13 query:*(void *)(a1 + 32)];
LABEL_20:
  uint64_t v21 = *(void *)(a1 + 56);
  if (v21) {
    (*(void (**)(uint64_t, void, void, void *, void *, void))(v21 + 16))(v21, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v20, v19, MEMORY[0x1E4F1CBF0]);
  }

LABEL_23:
}

void __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke_1(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  char v16 = *(id *)(a1 + 32);
  char v17 = v16;
  os_signpost_id_t v18 = *(void *)(a1 + 56);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "SearchProcessor-ExtractSearchResults", "", buf, 2u);
  }

  int v19 = [*(id *)(a1 + 40) isCanceled];
  uint64_t v20 = PLSearchBackendQueryGetLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v22;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: query was cancelled: %@", buf, 0xCu);
    }
  }
  else if (v21)
  {
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v23 = [v11 count];
    uint64_t v24 = [v13 count];
    uint64_t v25 = [v14 assetCount];
    uint64_t v26 = [v15 count];
    *(_DWORD *)buf = 138413314;
    uint64_t v29 = v27;
    __int16 v30 = 2048;
    uint64_t v31 = v23;
    __int16 v32 = 2048;
    uint64_t v33 = v24;
    __int16 v34 = 2048;
    uint64_t v35 = v25;
    __int16 v36 = 2048;
    uint64_t v37 = v26;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: extracted results for search query: %@ and got %lu asset results, %lu collection results, %lu top asset results, %lu top collection results", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)performQuery:(id)a3 withResultsHandler:(id)a4
{
}

+ (id)searchProcessorLog
{
  if (searchProcessorLog_onceToken != -1) {
    dispatch_once(&searchProcessorLog_onceToken, &__block_literal_global_64);
  }
  v2 = (void *)searchProcessorLog_searchProcessorLog;
  return v2;
}

void __39__PLSearchProcessor_searchProcessorLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.search", "SearchProcessor");
  v1 = (void *)searchProcessorLog_searchProcessorLog;
  searchProcessorLog_searchProcessorLog = (uint64_t)v0;
}

+ (id)_groupResultFromCombinedGroupResults:(id)a3 query:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() searchProcessorLog];
  os_signpost_id_t v8 = [(id)objc_opt_class() searchProcessorLog];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = v7;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SearchProcessor-_groupResultFromCombinedGroupResults", "", buf, 2u);
  }

  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      id v12 = [v5 firstObject];
    }
    else
    {
      unint64_t v40 = v9 - 1;
      CFAllocatorRef v41 = v6;
      os_signpost_id_t spid = v9;
      id v13 = objc_opt_new();
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFArrayRef cf = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v42 = v5;
      id v15 = v5;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            BOOL v21 = [v20 groups];
            [v14 addObjectsFromArray:v21];

            CFArrayRef v22 = (const __CFArray *)[v20 assetIds];
            if (v22)
            {
              CFArrayRef v23 = v22;
              CFIndex Count = CFArrayGetCount(v22);
              if (Count)
              {
                CFIndex v25 = Count;
                for (CFIndex j = 0; j != v25; ++j)
                  objc_msgSend(v13, "addIndex:", CFArrayGetValueAtIndex(v23, j));
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v17);
      }

      CFMutableArrayRef Mutable = CFArrayCreateMutable(allocator, 0, 0);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __64__PLSearchProcessor__groupResultFromCombinedGroupResults_query___block_invoke;
      v44[3] = &__block_descriptor_40_e12_v24__0Q8_B16l;
      v44[4] = Mutable;
      [v13 enumerateIndexesUsingBlock:v44];
      uint64_t v28 = [v15 firstObject];
      uint64_t v29 = [v28 delegate];

      if (Mutable)
      {
        id v12 = [[PSIGroupResult alloc] initWithQueue:0];
        [(PSIGroupResult *)v12 setDelegate:v29];
        [(PSIGroupResult *)v12 setIsMergedOCRResult:1];
        [(PSIGroupResult *)v12 setGroups:v14];
        [(PSIGroupResult *)v12 setAssetIds:Mutable];
        [(PSIGroupResult *)v12 setCollectionIds:cf];
        id v6 = v41;
        __int16 v30 = [v41 searchText];
        if ([v30 length])
        {
          uint64_t v31 = [v41 searchText];
          BOOL v50 = v31;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
          uint64_t v33 = v32 = v29;
          [(PSIGroupResult *)v12 setContentStringsOverride:v33];

          uint64_t v29 = v32;
        }
        else
        {
          [(PSIGroupResult *)v12 setContentStringsOverride:0];
        }
        unint64_t v34 = v40;

        id v5 = v42;
      }
      else
      {
        id v12 = 0;
        id v6 = v41;
        id v5 = v42;
        unint64_t v34 = v40;
      }
      CFRelease(Mutable);
      CFRelease(cf);
      uint64_t v35 = v11;
      __int16 v36 = v35;
      if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v36, OS_SIGNPOST_INTERVAL_END, spid, "SearchProcessor-_groupResultFromCombinedGroupResults", "", buf, 2u);
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __64__PLSearchProcessor__groupResultFromCombinedGroupResults_query___block_invoke(uint64_t a1, const void *a2)
{
}

+ (id)_singleOCRGroupResultFromOCRGroupResults:(id)a3 query:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = a4;
  if ((unint64_t)[v5 count] >= 2)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v30 = v5;
    id v7 = v5;
    uint64_t v27 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    os_signpost_id_t v8 = 0;
    id v9 = 0;
    if (v27)
    {
      uint64_t v10 = *(void *)v37;
      uint64_t v29 = v7;
      uint64_t v26 = *(void *)v37;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v28 = v11;
          id v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v13 = objc_msgSend(v12, "groups", v26);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v33;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v33 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                if ([v18 category] == 1203
                  || [v18 category] == 1204)
                {
                  int v19 = [v18 contentString];
                  if ((unint64_t)[v19 length] >= 3)
                  {
                    uint64_t v20 = [v31 searchText];
                    char v21 = [v19 isEqualToString:v20];

                    if (v21)
                    {
                      [v12 setSelectedForOCRCompletion:1];
                      id v6 = v12;

                      goto LABEL_27;
                    }
                    if (!v9 || (unint64_t v22 = [v19 length], v22 < objc_msgSend(v8, "length")))
                    {
                      id v23 = v12;

                      id v24 = v19;
                      os_signpost_id_t v8 = v24;
                      id v9 = v23;
                    }
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v28 + 1;
          id v7 = v29;
          uint64_t v10 = v26;
        }
        while (v28 + 1 != v27);
        uint64_t v27 = [v29 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v27);
    }

    [v9 setSelectedForOCRCompletion:1];
    id v9 = v9;
    id v6 = v9;
LABEL_27:

    id v5 = v30;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_OCRProcessedGroupResultsFromGroupResults:(id)a3 query:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = (void *)[v6 mutableCopy];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "exclusivelyContainsOCRGroups", (void)v21))
        {
          [v9 addObject:v16];
          [v8 removeObject:v16];
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  uint64_t v17 = (void *)[v9 copy];
  uint64_t v18 = [a1 _groupResultFromCombinedGroupResults:v17 query:v7];

  if (v18) {
    [v8 addObject:v18];
  }
  int v19 = objc_msgSend(a1, "_singleOCRGroupResultFromOCRGroupResults:query:", v10, v7, (void)v21);
  if (v19) {
    [v8 addObject:v19];
  }

  return v8;
}

@end