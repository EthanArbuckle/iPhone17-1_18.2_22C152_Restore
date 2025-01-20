@interface PSIQuery
+ (BOOL)_shouldApplyFilterTokensForGroupArrays:(id)a3 searchTokens:(id)a4 filterGroupIds:(id)a5;
+ (BOOL)enumerateDatedParsesWithParse:(id)a3 currentTokenIndex:(unint64_t)a4 potentialComboAttributes:(id)a5 usingBlock:(id)a6;
+ (BOOL)tokenIsEligibleForDateParsing:(id)a3;
+ (_NSRange)searchTextExtendedRangeForParse:(id)a3;
+ (id)_indexesOfFilterTokensInSearchTokens:(id)a3;
+ (id)_indexesToRemoveForDuplicatedFilterGroupsinGroupArrays:(id)a3 searchTokens:(id)a4;
+ (id)dateAttributesFromToken:(id)a3;
+ (id)dateFilterByCombiningDateFilter:(id)a3 withDateFilter:(id)a4;
+ (id)dateFilterWithAttributes:(id)a3;
+ (id)dateFilterWithAttributes:(id)a3 andAttributes:(id)a4;
+ (id)datedParsesWithParses:(id)a3;
+ (id)parsedDatesFromText:(id)a3;
+ (id)searchResultFromArrayOfGroupArrays:(id)a3 searchTokens:(id)a4 searchResultTypes:(unint64_t)a5 suggestionType:(unint64_t)a6 scopedSearchIdentifiers:(id)a7 normalizedSearchText:(id)a8 enableExactMatchPrioritization:(BOOL)a9 includeAllQueryMatchedGroups:(BOOL)a10 includeAllFruitfulMatchedGroups:(BOOL)a11 suggestionLimit:(unint64_t)a12 query:(id)a13 delegate:(id)a14;
+ (void)_aggregateAssetIdsOnFilterGroupsInGroupArrays:(id)a3 searchTokens:(id)a4 groupIdToOriginalAssetIdsMap:(id *)a5;
+ (void)_restoreAssetIdsForGroupsInGroupArrays:(id)a3 atRemovalIndexes:(id)a4 groupIdToOriginalAssetIdsMap:(id)a5 searchTokens:(id)a6;
+ (void)bootstrap;
- (BOOL)_enumerateImplicitlyTokenizedParsesWithBaseParse:(id)a3 usingBlock:(id)a4;
- (BOOL)enableExactMatchPrioritization;
- (BOOL)implicitTokenizationIncludeBaseParseResults;
- (BOOL)includeAllFruitfulMatchedGroups;
- (BOOL)includeAllQueryMatchedGroups;
- (BOOL)isCanceled;
- (BOOL)legacyDisableTopAssetsAndTopCollections;
- (BOOL)recursiveAddToGroupResults:(id)a3 aggregate:(id)a4 atIndex:(unint64_t)a5 outOf:(unint64_t)a6 inGroupArrays:(id)a7 dateFilter:(id)a8 datedTokens:(id)a9 disableWildcardMatchesForUserControlledCategories:(BOOL)a10;
- (BOOL)useWildcardText;
- (NSArray)dedupedGroupResults;
- (NSArray)nextKeywordSuggestions;
- (NSArray)queryTokens;
- (NSDate)queryBeginParsingTime;
- (NSDate)queryBeginResultGenerationAndIntersectionsTime;
- (NSDictionary)substitutions;
- (NSIndexSet)modelTypes;
- (NSSet)audioIdentifiers;
- (NSSet)humanActionIdentifiers;
- (NSSet)personIdentifiers;
- (NSSet)sceneIdentifiers;
- (NSSet)scopedSearchIdentifiers;
- (NSSet)socialGroupExtendedAssetIds;
- (NSSet)socialGroupExtendedCollectionIds;
- (NSString)queryAssetUUID;
- (NSString)searchText;
- (PSIQuery)initWithEmbeddingModelTypes:(id)a3 assetUUID:(id)a4 delegate:(id)a5;
- (PSIQuery)initWithQueryText:(id)a3 suggestionType:(unint64_t)a4 suggestionLimit:(unint64_t)a5 resultTypes:(unint64_t)a6 delegate:(id)a7 libraryScope:(unint64_t)a8;
- (PSIQuery)initWithQueryTokens:(id)a3 searchText:(id)a4 useWildcardText:(BOOL)a5 delegate:(id)a6 libraryScope:(unint64_t)a7;
- (PSIQuery)initWithQueryTokensV2:(id)a3 searchText:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 searchSuggestionType:(unint64_t)a7 useWildcardText:(BOOL)a8 enableExactMatchPrioritization:(BOOL)a9 delegate:(id)a10 libraryScope:(unint64_t)a11 suggestionLimit:(unint64_t)a12;
- (PSIQueryDelegate)delegate;
- (PSITokenizer)tokenizer;
- (__CFSet)_idsOfGroupsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5 isFilterTypeToken:(BOOL)a6;
- (__CFSet)_idsOfGroupsMatchingToken:(id)a3;
- (double)elapsedTimeQueryParsing;
- (double)elapsedTimeResultGenerationAndIntersections;
- (id)description;
- (id)implicitlyTokenizedParsesWithBaseParse:(id)a3;
- (id)processParse:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4;
- (id)processParseV2:(id)a3;
- (id)runLookupIdentifierQuery;
- (id)suggestionWhitelistedScenes;
- (unint64_t)libraryScope;
- (unint64_t)mergeFilterTokenAssetIDsIntervalID;
- (unint64_t)numberOfNextKeywordSuggestionToProcess;
- (unint64_t)searchResultTypes;
- (unint64_t)searchSuggestionType;
- (unint64_t)suggestionLimit;
- (unint64_t)wordEmbeddingMode;
- (void)_postProcessPersonGroupsInGroupArrays:(id)a3;
- (void)bootstrap;
- (void)cancel;
- (void)computeSuggestions;
- (void)enumerateParsesWithMode:(unint64_t)a3 usingBlock:(id)a4;
- (void)processDates;
- (void)processImplicitTokenization;
- (void)processWordEmbeddings;
- (void)runFetchEmbeddingQueryWitBatchHandler:(id)a3;
- (void)runWithResultsHandler:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4;
- (void)runWithResultsHandlerV2:(id)a3;
- (void)setAudioIdentifiers:(id)a3;
- (void)setDedupedGroupResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElapsedTimeQueryParsing:(double)a3;
- (void)setElapsedTimeResultGenerationAndIntersections:(double)a3;
- (void)setHumanActionIdentifiers:(id)a3;
- (void)setIncludeAllFruitfulMatchedGroups:(BOOL)a3;
- (void)setIncludeAllQueryMatchedGroups:(BOOL)a3;
- (void)setLegacyDisableTopAssetsAndTopCollections:(BOOL)a3;
- (void)setLibraryScope:(unint64_t)a3;
- (void)setMergeFilterTokenAssetIDsIntervalID:(unint64_t)a3;
- (void)setNextKeywordSuggestions:(id)a3;
- (void)setNumberOfNextKeywordSuggestionToProcess:(unint64_t)a3;
- (void)setPersonIdentifiers:(id)a3;
- (void)setQueryBeginParsingTime:(id)a3;
- (void)setQueryBeginResultGenerationAndIntersectionsTime:(id)a3;
- (void)setSceneIdentifiers:(id)a3;
- (void)setSocialGroupExtendedAssetIds:(id)a3;
- (void)setSocialGroupExtendedCollectionIds:(id)a3;
- (void)setSubstitutions:(id)a3;
- (void)setWordEmbeddingMode:(unint64_t)a3;
@end

@implementation PSIQuery

- (id)runLookupIdentifierQuery
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_alloc_init(PLSearchResultV2);
  if (![(NSArray *)self->_socialGroupPersonIdentifiers count])
  {
    v19 = [(PSIQuery *)self queryTokens];
    uint64_t v20 = [v19 count];

    if (v20 != 1)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"PSIQuery.m", 1120, @"Invalid parameter not satisfying: %@", @"self.queryTokens.count == 1" object file lineNumber description];
    }
    v21 = [(PSIQuery *)self queryTokens];
    id v7 = [v21 firstObject];

    v22 = [v7 identifier];
    uint64_t v23 = [v22 length];

    if (!v23)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2, self, @"PSIQuery.m", 1124, @"Invalid parameter not satisfying: %@", @"queryToken.identifier.length > 0" object file lineNumber description];
    }
    id v24 = objc_loadWeakRetained((id *)p_delegate);
    v25 = [v7 identifier];
    v26 = objc_msgSend(v24, "groupForLookupIdentifier:searchResultTypes:", v25, -[PSIQuery searchResultTypes](self, "searchResultTypes"));

    if (!v26) {
      goto LABEL_23;
    }
    char v27 = [(PSIQuery *)self searchResultTypes];
    char v28 = [(PSIQuery *)self searchResultTypes];
    char v29 = v28;
    if (v27)
    {
      v30 = objc_msgSend(WeakRetained, "assetUUIDsForAssetIDs:", objc_msgSend(v26, "assetIds"));
      if ((v29 & 2) != 0) {
        goto LABEL_19;
      }
    }
    else
    {
      v30 = 0;
      if ((v28 & 2) != 0)
      {
LABEL_19:
        v31 = objc_msgSend(WeakRetained, "collectionUUIDsForCollectionIDs:", objc_msgSend(v26, "collectionIds"));
LABEL_22:
        v32 = [PLSearchResultV2 alloc];
        v33 = [v30 allObjects];
        v34 = [v31 allObjects];
        uint64_t v35 = [(PLSearchResultV2 *)v32 initWithAssetUUIDs:v33 collectionUUIDs:v34 suggestions:0];

        v6 = (PLSearchResultV2 *)v35;
LABEL_23:
        v18 = v6;

        goto LABEL_24;
      }
    }
    v31 = 0;
    goto LABEL_22;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v8 = [(PSIQuery *)self queryTokens];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = [(PSIQuery *)self _idsOfGroupsMatchingToken:*(void *)(*((void *)&v40 + 1) + 8 * v12)];
      if (!v13) {
        break;
      }
      [v7 addObject:v13];
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v10) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    v8 = objc_msgSend(WeakRetained, "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", v7, 0, -[PSIQuery searchResultTypes](self, "searchResultTypes"), &__block_literal_global_101);
    [(PSIQuery *)self _postProcessPersonGroupsInGroupArrays:v8];
    v14 = [(PSIQuery *)self queryTokens];
    unint64_t v15 = [(PSIQuery *)self searchResultTypes];
    id v16 = objc_loadWeakRetained((id *)p_delegate);
    BYTE2(v39) = 0;
    LOWORD(v39) = 1;
    uint64_t v17 = +[PSIQuery searchResultFromArrayOfGroupArrays:searchTokens:searchResultTypes:suggestionType:scopedSearchIdentifiers:normalizedSearchText:enableExactMatchPrioritization:includeAllQueryMatchedGroups:includeAllFruitfulMatchedGroups:suggestionLimit:query:delegate:](PSIQuery, "searchResultFromArrayOfGroupArrays:searchTokens:searchResultTypes:suggestionType:scopedSearchIdentifiers:normalizedSearchText:enableExactMatchPrioritization:includeAllQueryMatchedGroups:includeAllFruitfulMatchedGroups:suggestionLimit:query:delegate:", v8, v14, v15, 0, 0, 0, v39, 0, self, v16);

    v6 = (PLSearchResultV2 *)v17;
  }
  v18 = v6;

LABEL_24:
  return v18;
}

- (unint64_t)searchResultTypes
{
  return self->_searchResultTypes;
}

- (NSArray)queryTokens
{
  return self->_queryTokens;
}

- (PSIQuery)initWithQueryTokensV2:(id)a3 searchText:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 searchSuggestionType:(unint64_t)a7 useWildcardText:(BOOL)a8 enableExactMatchPrioritization:(BOOL)a9 delegate:(id)a10 libraryScope:(unint64_t)a11 suggestionLimit:(unint64_t)a12
{
  BOOL v12 = a8;
  id v19 = a5;
  uint64_t v20 = [(PSIQuery *)self initWithQueryTokens:a3 searchText:a4 useWildcardText:v12 delegate:a10 libraryScope:a11];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_scopedSearchIdentifiers, a5);
    v21->_searchResultTypes = a6;
    v21->_searchSuggestionType = a7;
    v21->_suggestionLimit = a12;
    v21->_enableExactMatchPrioritization = a9;
  }

  return v21;
}

- (PSIQuery)initWithQueryTokens:(id)a3 searchText:(id)a4 useWildcardText:(BOOL)a5 delegate:(id)a6 libraryScope:(unint64_t)a7
{
  BOOL v9 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v68.receiver = self;
  v68.super_class = (Class)PSIQuery;
  unint64_t v15 = [(PSIQuery *)&v68 init];
  id v16 = v15;
  if (!v15) {
    goto LABEL_39;
  }
  objc_storeWeak((id *)&v15->_delegate, v14);
  v59 = v13;
  BOOL v57 = v9;
  if ([v12 count] || objc_msgSend(v13, "length"))
  {
    v16->_libraryScope = a7;
    if (a7 == 2)
    {
      uint64_t v17 = PLServicesSharedLibraryLocalizedFrameworkString();
      v18 = [PSIQueryToken alloc];
      id v19 = v17;
      uint64_t v20 = 3;
      goto LABEL_9;
    }
    if (a7 == 1)
    {
      uint64_t v17 = PLServicesSharedLibraryLocalizedFrameworkString();
      v18 = [PSIQueryToken alloc];
      id v19 = v17;
      uint64_t v20 = 4;
LABEL_9:
      v22 = [(PSIQueryToken *)v18 initWithText:v19 userCategory:v20 matchType:2];
      v21 = v16;
      uint64_t v23 = [v12 arrayByAddingObject:v22];

      id v12 = (id)v23;
      goto LABEL_10;
    }
  }
  v21 = v16;
LABEL_10:
  id v58 = v14;
  id v24 = [v14 tokenizer];
  v25 = [MEMORY[0x1E4F1CA48] array];
  v26 = objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v27 = v12;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if ([v32 containsMarker])
        {
          v33 = [v32 identifier];
          uint64_t v34 = [v33 componentsSeparatedByString:@","];
          socialGroupPersonIdentifiers = v21->_socialGroupPersonIdentifiers;
          v21->_socialGroupPersonIdentifiers = (NSArray *)v34;

          v36 = +[PSIQueryToken personQueryTokensFromSocialGroupQueryToken:v32];
          [v26 addObjectsFromArray:v36];
        }
        else
        {
          [v26 addObject:v32];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v29);
  }

  id v37 = v26;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v12 = v37;
  uint64_t v38 = [v12 countByEnumeratingWithState:&v60 objects:v69 count:16];
  id v16 = v21;
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(v12);
        }
        id v42 = *(id *)(*((void *)&v60 + 1) + 8 * j);
        if (v42)
        {
          long long v43 = v42;
          do
          {
            if ([v43 isTextSearchable])
            {
              v44 = [v43 normalizedText];

              if (!v44) {
                [v43 normalizeTextWithTokenizer:v24];
              }
            }
            [(NSArray *)v25 addObject:v43];
            uint64_t v45 = [v43 parentToken];

            long long v43 = (void *)v45;
          }
          while (v45);
        }
      }
      uint64_t v39 = [v12 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v39);
  }

  id v13 = v59;
  if ([v59 length])
  {
    v46 = [v24 normalizeString:v59];
    if (v57) {
      uint64_t v47 = 0;
    }
    else {
      uint64_t v47 = 2;
    }
    v48 = [[PSIQueryToken alloc] initWithText:v59 normalizedText:v46 userCategory:0 matchType:v47];
    [(PSIQueryToken *)v48 setIsFullTextToken:1];
    [(PSIQueryToken *)v48 setBelongsToSearchText:1];
    -[PSIQueryToken setRangeInSearchText:](v48, "setRangeInSearchText:", 0, [v59 length]);
    [(PSIQueryToken *)v48 setUsesWordEmbeddings:1];
    [(NSArray *)v25 addObject:v48];
  }
  uint64_t v49 = [v59 copy];
  searchText = v16->_searchText;
  v16->_searchText = (NSString *)v49;

  queryTokens = v16->_queryTokens;
  v16->_queryTokens = v25;
  v52 = v25;

  v16->_useWildcardText = v57;
  v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  groupIdsByTokenKey = v16->_groupIdsByTokenKey;
  v16->_groupIdsByTokenKey = v53;

  v55 = PLPhotosSearchGetLog();
  v16->_mergeFilterTokenAssetIDsIntervalID = os_signpost_id_make_with_pointer(v55, v16);

  id v14 = v58;
LABEL_39:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryAssetUUID, 0);
  objc_storeStrong((id *)&self->_modelTypes, 0);
  objc_storeStrong((id *)&self->_queryBeginResultGenerationAndIntersectionsTime, 0);
  objc_storeStrong((id *)&self->_queryBeginParsingTime, 0);
  objc_storeStrong((id *)&self->_scopedSearchIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dedupedGroupResults, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_personIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_nextKeywordSuggestions, 0);
  objc_storeStrong((id *)&self->_substitutions, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_queryTokens, 0);
  objc_storeStrong((id *)&self->_socialGroupExtendedCollectionIds, 0);
  objc_storeStrong((id *)&self->_socialGroupExtendedAssetIds, 0);
  objc_storeStrong((id *)&self->_socialGroupPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_substitutionsByStringToken, 0);
  objc_storeStrong((id *)&self->_groupIdsByTokenKey, 0);
  objc_storeStrong((id *)&self->_identifierTokens, 0);
  objc_storeStrong((id *)&self->_wordEmbeddingParses, 0);
  objc_storeStrong((id *)&self->_implicitlyTokenizedDatedParses, 0);
  objc_storeStrong((id *)&self->_datedParses, 0);
  objc_storeStrong((id *)&self->_implicitelyTokenizedParses, 0);
  objc_storeStrong((id *)&self->_baseParse, 0);
}

- (id)implicitlyTokenizedParsesWithBaseParse:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 numberOfTokens])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__PSIQuery_ImplicitTokenization__implicitlyTokenizedParsesWithBaseParse___block_invoke;
    v8[3] = &unk_1E5868250;
    id v9 = v5;
    [(PSIQuery *)self _enumerateImplicitlyTokenizedParsesWithBaseParse:v4 usingBlock:v8];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Found no implicitly tokenized parses for query with no text searchable token.", v7, 2u);
  }

  return v5;
}

void __73__PSIQuery_ImplicitTokenization__implicitlyTokenizedParsesWithBaseParse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) addObject:v3];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Found implicitly tokenized parse: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)_enumerateImplicitlyTokenizedParsesWithBaseParse:(id)a3 usingBlock:(id)a4
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v77 = a4;
  v76 = v6;
  if ([v6 numberOfTokens])
  {
    uint64_t v121 = 0;
    v122 = &v121;
    uint64_t v123 = 0x3032000000;
    v124 = __Block_byref_object_copy__25567;
    v125 = __Block_byref_object_dispose__25568;
    id v126 = 0;
    uint64_t v116 = 0;
    v117 = &v116;
    uint64_t v118 = 0x3010000000;
    v119 = &unk_19BBAE189;
    long long v120 = xmmword_19BA99FE0;
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke;
    v115[3] = &unk_1E58678B0;
    v115[4] = &v121;
    v115[5] = &v116;
    [v6 enumerateTokensUsingBlock:v115];
    if (v122[5])
    {
      v89 = [(PSIQuery *)self tokenizer];
      uint64_t v7 = [(id)v122[5] normalizedText];
      id v113 = 0;
      id v114 = 0;
      v8 = (void *)[v89 newTokensFromString:v7 withOptions:0 outCopyRanges:&v114 error:&v113];
      id v90 = v114;
      id v72 = v113;
      v73 = v8;
      v82 = (void *)v7;
      if (v8)
      {
        uint64_t v9 = [v8 count];
        uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v9];
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        obuint64_t j = v8;
        uint64_t v11 = [obj countByEnumeratingWithState:&v109 objects:v130 count:16];
        if (v11)
        {
          uint64_t v12 = 0;
          uint64_t v13 = *(void *)v110;
          uint64_t v14 = 1;
          uint64_t v83 = 1 - v9;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v110 != v13) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void *)(*((void *)&v109 + 1) + 8 * i);
              if (!(v83 + v12 + i)) {
                uint64_t v14 = 0;
              }
              uint64_t v17 = [v90 objectAtIndexedSubscript:v12 + i];
              v18 = [[PSIQueryToken alloc] initWithText:v16 userCategory:0 matchType:v14];
              uint64_t v19 = [v17 rangeValue];
              -[PSIQueryToken setRangeInSearchText:](v18, "setRangeInSearchText:", v19, v20);
              [(PSIQueryToken *)v18 setBelongsToSearchText:1];
              [(PSIQueryToken *)v18 setUserControlledCategoriesUseWildcard:0];
              [(PSIQueryToken *)v18 normalizeTextWithTokenizer:v89];
              [v10 setObject:v18 forKeyedSubscript:v17];
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v109 objects:v130 count:16];
            v12 += i;
          }
          while (v11);
        }

        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_3;
        v103[3] = &unk_1E5867900;
        id v104 = v89;
        id v21 = v10;
        id v105 = v21;
        id obja = v76;
        id v106 = obja;
        v108 = &v116;
        id v84 = v77;
        id v107 = v84;
        v78 = (uint64_t (**)(void, void, void, void, void, void, void))MEMORY[0x19F38D650](v103);
        [(id)objc_opt_class() parsedDatesFromText:v7];
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v22 countByEnumeratingWithState:&v99 objects:v129 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v100;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v100 != v24) {
                objc_enumerationMutation(v22);
              }
              v26 = *(void **)(*((void *)&v99 + 1) + 8 * j);
              [v26 extensionRange];
              if (!v27)
              {
                uint64_t v28 = (void *)MEMORY[0x1E4F29238];
                uint64_t v29 = [v26 range];
                v31 = objc_msgSend(v28, "valueWithRange:", v29, v30);
                v32 = [v21 objectForKeyedSubscript:v31];
                if (v32)
                {
                  v33 = [v26 attributes];
                  uint64_t v34 = (void *)[v33 mutableCopy];

                  uint64_t v35 = [v32 text];
                  [v34 setObject:v35 forKeyedSubscript:@"string"];

                  [v32 setDateAttributes:v34];
                }
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v99 objects:v129 count:16];
          }
          while (v23);
        }

        v36 = v117;
        id v37 = [v21 allValues];
        uint64_t v71 = objc_msgSend(obja, "parseByReplacingTokensInRange:withTokens:", v36[4], v36[5], v37);

        buf[0] = 0;
        (*((void (**)(id, void *, uint8_t *))v84 + 2))(v84, v71, buf);
        if (buf[0])
        {
          BOOL v38 = 0;
        }
        else
        {
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v74 = v22;
          uint64_t v39 = [v74 countByEnumeratingWithState:&v95 objects:v128 count:16];
          if (v39)
          {
            uint64_t v79 = *(void *)v96;
            while (2)
            {
              uint64_t v85 = 0;
              uint64_t v75 = v39;
              do
              {
                if (*(void *)v96 != v79) {
                  objc_enumerationMutation(v74);
                }
                uint64_t v40 = *(void **)(*((void *)&v95 + 1) + 8 * v85);
                uint64_t v41 = [v40 range];
                objb = v42;
                uint64_t v43 = v41;
                uint64_t v44 = [v40 extensionRange];
                uint64_t v46 = v45;
                v81 = v40;
                if (v45)
                {
                  uint64_t v47 = v44;
                  id v48 = v21;
                  long long v93 = 0u;
                  long long v94 = 0u;
                  long long v91 = 0u;
                  long long v92 = 0u;
                  id v49 = v90;
                  uint64_t v50 = [v49 countByEnumeratingWithState:&v91 objects:v127 count:16];
                  uint64_t v80 = v43;
                  v51 = &objb[v43];
                  unint64_t v52 = v47 - (void)&objb[v43];
                  if (v50)
                  {
                    uint64_t v53 = *(void *)v92;
LABEL_39:
                    uint64_t v54 = 0;
                    while (1)
                    {
                      if (*(void *)v92 != v53) {
                        objc_enumerationMutation(v49);
                      }
                      unint64_t v55 = [*(id *)(*((void *)&v91 + 1) + 8 * v54) rangeValue];
                      if (v55 >= (unint64_t)v51 && v55 - (unint64_t)v51 < v52) {
                        break;
                      }
                      if (v50 == ++v54)
                      {
                        uint64_t v50 = [v49 countByEnumeratingWithState:&v91 objects:v127 count:16];
                        if (v50) {
                          goto LABEL_39;
                        }
                        goto LABEL_49;
                      }
                    }
                    long long v60 = &stru_1EEB2EB80;
                    id v21 = v48;
                    uint64_t v39 = v75;
                    if ((char *)v55 != v51)
                    {
                      long long v60 = [v82 substringWithRange:v51];
                    }

                    long long v61 = objc_msgSend(v82, "substringWithRange:", v80, objb);
                    long long v62 = (void *)[v61 mutableCopy];

                    [v62 appendString:v60];
                    long long v63 = objc_msgSend(v82, "substringWithRange:", v47, v46);
                    [v62 appendString:v63];

                    long long v64 = [v81 attributes];
                    char v65 = ((uint64_t (**)(void, void *, void *, uint64_t, char *, uint64_t, uint64_t))v78)[2](v78, v62, v64, v80, objb, v47, v46);

                    if (v65) {
                      goto LABEL_58;
                    }
LABEL_61:

                    BOOL v38 = 0;
                    goto LABEL_62;
                  }
LABEL_49:

                  uint64_t v39 = v75;
                  id v21 = v48;
                  BOOL v57 = &objb[v46 + v52];
                  id v58 = objc_msgSend(v82, "substringWithRange:", v80, v57);
                  v59 = [v81 attributes];
                  LOBYTE(v57) = ((uint64_t (**)(void, void *, void *, uint64_t, char *, uint64_t, void))v78)[2](v78, v58, v59, v80, v57, 0x7FFFFFFFFFFFFFFFLL, 0);

                  long long v60 = 0;
                  if ((v57 & 1) == 0) {
                    goto LABEL_61;
                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v43, objb);
                  long long v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  long long v66 = [v21 objectForKeyedSubscript:v60];
                  if (!v66)
                  {
                    long long v67 = objc_msgSend(v82, "substringWithRange:", v43, objb);
                    objc_super v68 = [v81 attributes];
                    char v69 = ((uint64_t (**)(void, void *, void *, uint64_t, char *, uint64_t, void))v78)[2](v78, v67, v68, v43, objb, 0x7FFFFFFFFFFFFFFFLL, 0);

                    if ((v69 & 1) == 0) {
                      goto LABEL_61;
                    }
                  }
                }
LABEL_58:

                ++v85;
              }
              while (v85 != v39);
              uint64_t v39 = [v74 countByEnumeratingWithState:&v95 objects:v128 count:16];
              if (v39) {
                continue;
              }
              break;
            }
          }
          BOOL v38 = 1;
LABEL_62:
        }
      }
      else
      {
        BOOL v38 = 1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v132 = v72;
          _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Skipping implicit tokenization: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      BOOL v38 = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Found no implicitly tokenized parses for query with no full text token.", buf, 2u);
      }
    }
    _Block_object_dispose(&v116, 8);
    _Block_object_dispose(&v121, 8);
  }
  else
  {
    BOOL v38 = 1;
  }

  return v38;
}

void __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 isFullTextToken])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v8 + 32) = a3;
    *(void *)(v8 + 40) = 1;
    *a4 = 1;
  }
}

uint64_t __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, NSUInteger a4, NSUInteger a5, NSUInteger a6, NSUInteger a7)
{
  id v13 = a3;
  id v14 = a2;
  unint64_t v15 = [[PSIQueryToken alloc] initWithText:v14 userCategory:0 matchType:2];
  uint64_t v16 = (void *)[v13 mutableCopy];

  [v16 setObject:v14 forKeyedSubscript:@"string"];
  [(PSIQueryToken *)v15 setDateAttributes:v16];
  NSUInteger location = a4;
  NSUInteger length = a5;
  if (a7)
  {
    v31.NSUInteger location = a4;
    v31.NSUInteger length = a5;
    v32.NSUInteger location = a6;
    v32.NSUInteger length = a7;
    NSRange v19 = NSUnionRange(v31, v32);
    NSUInteger location = v19.location;
    NSUInteger length = v19.length;
  }
  -[PSIQueryToken setRangeInSearchText:](v15, "setRangeInSearchText:", location, length);
  [(PSIQueryToken *)v15 setBelongsToSearchText:1];
  [(PSIQueryToken *)v15 setUserControlledCategoriesUseWildcard:0];
  [(PSIQueryToken *)v15 normalizeTextWithTokenizer:*(void *)(a1 + 32)];
  uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithObject:v15];
  id v21 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_2;
  v25[3] = &unk_1E58678D8;
  NSUInteger v28 = a5;
  NSUInteger v29 = a6;
  NSUInteger v30 = a7;
  id v26 = v20;
  NSUInteger v27 = a4;
  id v22 = v20;
  [v21 enumerateKeysAndObjectsUsingBlock:v25];
  uint64_t v23 = objc_msgSend(*(id *)(a1 + 48), "parseByReplacingTokensInRange:withTokens:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v22);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  return 1;
}

void __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v10.NSUInteger location = [v8 rangeValue];
  v10.NSUInteger length = v6;
  if (!NSIntersectionRange(*(NSRange *)(a1 + 40), v10).length)
  {
    if (!*(void *)(a1 + 64)
      || (v11.NSUInteger location = [v8 rangeValue],
          v11.NSUInteger length = v7,
          !NSIntersectionRange(*(NSRange *)(a1 + 56), v11).length))
    {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

+ (_NSRange)searchTextExtendedRangeForParse:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  NSRange v10 = &v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v12 = &unk_19BBAE189;
  long long v13 = xmmword_19BA99FE0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PSIQuery_ImplicitTokenization__searchTextExtendedRangeForParse___block_invoke;
  v8[3] = &unk_1E58691B0;
  void v8[4] = &v9;
  [v3 enumerateTokensUsingBlock:v8];
  NSUInteger v4 = v10[4];
  NSUInteger v5 = v10[5];
  _Block_object_dispose(&v9, 8);

  NSUInteger v6 = v4;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

void __66__PSIQuery_ImplicitTokenization__searchTextExtendedRangeForParse___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 belongsToSearchText])
  {
    id v3 = *(NSRange **)(*(void *)(a1 + 32) + 8);
    if (v3[2].length)
    {
      v11.NSUInteger location = [v9 rangeInSearchText];
      v11.NSUInteger length = v4;
      NSRange v7 = NSUnionRange(v3[2], v11);
      NSUInteger length = v7.length;
      NSUInteger location = v7.location;
    }
    else
    {
      NSUInteger location = [v9 rangeInSearchText];
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v8 + 32) = location;
    *(void *)(v8 + 40) = length;
  }
}

+ (id)datedParsesWithParses:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        NSRange v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 numberOfTokens])
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __47__PSIQuery_DateParsing__datedParsesWithParses___block_invoke;
          v13[3] = &unk_1E5868250;
          id v14 = v5;
          [a1 enumerateDatedParsesWithParse:v11 currentTokenIndex:0 potentialComboAttributes:0 usingBlock:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: Found dated parses: %@", buf, 0xCu);
  }

  return v5;
}

uint64_t __47__PSIQuery_DateParsing__datedParsesWithParses___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (BOOL)enumerateDatedParsesWithParse:(id)a3 currentTokenIndex:(unint64_t)a4 potentialComboAttributes:(id)a5 usingBlock:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, id, uint8_t *))a6;
  if ([v10 numberOfTokens] <= a4)
  {
    NSUInteger v30 = [v10 dateFilter];

    if (v30)
    {
      buf[0] = 0;
      v12[2](v12, v10, buf);
      char v29 = buf[0] == 0;
    }
    else
    {
      char v29 = 1;
    }
  }
  else
  {
    unint64_t v13 = a4 + 1;
    if ([a1 enumerateDatedParsesWithParse:v10 currentTokenIndex:a4 + 1 potentialComboAttributes:v11 usingBlock:v12])
    {
      id v14 = [v10 tokenAtIndex:a4];
      if (![a1 tokenIsEligibleForDateParsing:v14]
        || ([a1 dateAttributesFromToken:v14], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        char v29 = 1;
LABEL_21:

        goto LABEL_22;
      }
      long long v16 = (void *)v15;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v11;
          _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: have potential combo attributes: %@", buf, 0xCu);
        }
        uint64_t v17 = [a1 dateFilterWithAttributes:v11 andAttributes:v16];
        if (v17)
        {
          uint64_t v46 = (void *)v17;
          id v48 = v16;
          id v18 = v16;
          id v44 = v10;
          id v42 = [v44 tokenAtIndex:a4];
          uint64_t v50 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F79B70]];

          NSRange v19 = [PSIQueryToken alloc];
          uint64_t v20 = [v42 text];
          id v21 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1102];
          uint64_t v22 = [(PSIQueryToken *)v19 initWithText:v20 normalizedText:v50 userCategory:8 searchedCategories:v21 matchType:3];

          -[PSIQueryToken setBelongsToSearchText:](v22, "setBelongsToSearchText:", [v42 belongsToSearchText]);
          -[PSIQueryToken setIsFullTextToken:](v22, "setIsFullTextToken:", [v42 isFullTextToken]);
          uint64_t v23 = [v44 parseByReplacingTokenAtIndex:a4 withToken:v22];

          uint64_t v24 = v46;
          [v23 setDateFilter:v46];

          long long v16 = v48;
          id v25 = a1;
          id v26 = v23;
          unint64_t v27 = v13;
          id v28 = 0;
LABEL_10:
          char v29 = [v25 enumerateDatedParsesWithParse:v26 currentTokenIndex:v27 potentialComboAttributes:v28 usingBlock:v12];

LABEL_20:
          goto LABEL_21;
        }
      }
      else
      {
        NSRange v31 = [v10 dateFilter];

        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            BOOL v38 = [v14 text];
            uint64_t v39 = [v10 dateFilter];
            uint64_t v40 = [v39 displayString];
            *(_DWORD *)buf = 138412546;
            id v53 = v38;
            __int16 v54 = 2112;
            unint64_t v55 = v40;
            _os_log_debug_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Photos Search PSIQuery: Ignoring token \"%@\" because two attributes have already been combined into dateFilter: %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: parse.dateFilter is nil", buf, 2u);
          }
          uint64_t v33 = [a1 dateFilterWithAttributes:v16];
          if (v33)
          {
            uint64_t v47 = (void *)v33;
            id v45 = v16;
            id v43 = v10;
            uint64_t v41 = [v43 tokenAtIndex:a4];
            v51 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F79B70]];

            id v49 = v16;
            uint64_t v34 = [PSIQueryToken alloc];
            uint64_t v35 = [v41 text];
            v36 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1102];
            id v37 = [(PSIQueryToken *)v34 initWithText:v35 normalizedText:v51 userCategory:8 searchedCategories:v36 matchType:3];

            -[PSIQueryToken setBelongsToSearchText:](v37, "setBelongsToSearchText:", [v41 belongsToSearchText]);
            -[PSIQueryToken setIsFullTextToken:](v37, "setIsFullTextToken:", [v41 isFullTextToken]);
            uint64_t v23 = [v43 parseByReplacingTokenAtIndex:a4 withToken:v37];

            uint64_t v24 = v47;
            [v23 setDateFilter:v47];

            long long v16 = v49;
            id v25 = a1;
            id v26 = v23;
            unint64_t v27 = v13;
            id v28 = v45;
            goto LABEL_10;
          }
        }
      }
      char v29 = 1;
      goto LABEL_20;
    }
    char v29 = 0;
  }
LABEL_22:

  return v29;
}

+ (BOOL)tokenIsEligibleForDateParsing:(id)a3
{
  id v3 = a3;
  if ([v3 userCategory]) {
    BOOL v4 = [v3 userCategory] == 8;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

+ (id)dateAttributesFromToken:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 dateAttributes];

  if (v4)
  {
    id v5 = [v3 dateAttributes];
  }
  else
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__29992;
    id v21 = __Block_byref_object_dispose__29993;
    id v22 = 0;
    id v6 = [MEMORY[0x1E4F79BC0] defaultManager];
    uint64_t v7 = [v3 text];
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v9 = [v7 stringByTrimmingCharactersInSet:v8];

    uint64_t v10 = [v9 length];
    if (v10)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke;
      v13[3] = &unk_1E5868228;
      uint64_t v16 = v10;
      id v14 = v9;
      uint64_t v15 = &v17;
      id v11 = (id)[v6 tokenizeAndEnumerateAttributedParsesForQuery:v14 options:MEMORY[0x1E4F1CC08] withBlock:v13];
    }
    id v5 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  return v5;
}

void __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3010000000;
  uint64_t v39 = &unk_19BBAE189;
  long long v40 = xmmword_19BA99FE0;
  uint64_t v31 = 0;
  NSRange v32 = &v31;
  uint64_t v33 = 0x3010000000;
  uint64_t v34 = &unk_19BBAE189;
  long long v35 = xmmword_19BA99FE0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__29992;
  char v29 = __Block_byref_object_dispose__29993;
  id v30 = 0;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke_2;
  uint64_t v20 = &unk_1E5868200;
  id v22 = &v36;
  id v21 = *(id *)(a1 + 32);
  uint64_t v23 = &v25;
  uint64_t v24 = &v31;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, &v17);
  unint64_t v7 = v32[4];
  uint64_t v8 = v37;
  unint64_t v9 = v37[4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v9 && v37[5] == *(void *)(a1 + 48))
    {
LABEL_4:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (id)v26[5]);
      *a3 = 1;
    }
  }
  else if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = v9 >= v7;
    if (v9 >= v7)
    {
      unint64_t v9 = v32[4];
      uint64_t v8 = v32;
    }
    uint64_t v11 = v8[5];
    uint64_t v12 = v11;
    if (!v10) {
      uint64_t v12 = v32[5];
    }
    if (!v9 && v12 + v7 == *(void *)(a1 + 48))
    {
      unint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v11, v7 - v11, v17, v18, v19, v20);
      id v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v15 = [v13 stringByTrimmingCharactersInSet:v14];
      uint64_t v16 = [v15 length];

      if (!v16) {
        goto LABEL_4;
      }
    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);
}

void __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke_2(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  uint64_t v7 = [v16 count];
  uint64_t v8 = v16;
  if (v7)
  {
    unint64_t v9 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F79B80]];
    int v10 = [v9 integerValue];

    if (v10 == 42)
    {
      uint64_t v11 = *(void *)(a1[7] + 8);
      *(void *)(v11 + 32) = a3;
      *(void *)(v11 + 40) = a4;
    }
    else
    {
      uint64_t v12 = *(void *)(a1[5] + 8);
      *(void *)(v12 + 32) = a3;
      *(void *)(v12 + 40) = a4;
      unint64_t v13 = (void *)[v16 mutableCopy];
      [v13 setObject:a1[4] forKeyedSubscript:@"string"];
      uint64_t v14 = *(void *)(a1[6] + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    uint64_t v8 = v16;
  }
}

+ (id)parsedDatesFromText:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F79BC0] defaultManager];
  uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v8 = [v4 stringByTrimmingCharactersInSet:v7];

  uint64_t v9 = [v8 length];
  if (v9)
  {
    uint64_t v10 = v9;
    if ([v4 length] == v9) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = [v4 rangeOfString:v8 options:2];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke;
    v14[3] = &unk_1E58681D8;
    uint64_t v17 = v10;
    uint64_t v18 = v11;
    id v15 = v8;
    id v16 = v5;
    id v12 = (id)[v6 tokenizeAndEnumerateAttributedParsesForQuery:v15 options:MEMORY[0x1E4F1CC08] withBlock:v14];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    id v24 = a1;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Generated parsed dates: %@, from text: %@, for query: %@", buf, 0x20u);
  }

  return v5;
}

void __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3010000000;
  uint64_t v27 = &unk_19BBAE189;
  long long v28 = xmmword_19BA99FE0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3010000000;
  id v22 = &unk_19BBAE189;
  long long v23 = xmmword_19BA99FE0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__29992;
  uint64_t v17 = __Block_byref_object_dispose__29993;
  id v18 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke_2;
  v7[3] = &unk_1E58681B0;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v9 = &v24;
  id v8 = *(id *)(a1 + 32);
  uint64_t v10 = &v13;
  uint64_t v11 = &v19;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  if (v25[4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [PSIParsedDate alloc];
    uint64_t v6 = -[PSIParsedDate initWithAttributes:range:extensionRange:](v5, "initWithAttributes:range:extensionRange:", v14[5], v25[4], v25[5], v20[4], v20[5]);
    [*(id *)(a1 + 40) addObject:v6];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);
}

void __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke_2(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v17 = a2;
  uint64_t v7 = [v17 count];
  id v8 = v17;
  if (v7)
  {
    uint64_t v9 = a1[8] + a3;
    uint64_t v10 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F79B80]];
    int v11 = [v10 integerValue];

    if (v11 == 42)
    {
      uint64_t v12 = *(void *)(a1[7] + 8);
      *(void *)(v12 + 32) = v9;
      *(void *)(v12 + 40) = a4;
    }
    else
    {
      uint64_t v13 = *(void *)(a1[5] + 8);
      *(void *)(v13 + 32) = v9;
      *(void *)(v13 + 40) = a4;
      uint64_t v14 = (void *)[v17 mutableCopy];
      [v14 setObject:a1[4] forKeyedSubscript:@"string"];
      uint64_t v15 = *(void *)(a1[6] + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    id v8 = v17;
  }
}

+ (id)dateFilterWithAttributes:(id)a3 andAttributes:(id)a4
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__29992;
  uint64_t v24 = __Block_byref_object_dispose__29993;
  id v25 = 0;
  v26[0] = *MEMORY[0x1E4F79BB8];
  id v8 = [v6 objectForKeyedSubscript:@"string"];
  v27[0] = v8;
  v26[1] = *MEMORY[0x1E4F79BB0];
  uint64_t v9 = *MEMORY[0x1E4F79B78];
  uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F79B78]];
  v27[1] = v10;
  v26[2] = *MEMORY[0x1E4F79BA8];
  int v11 = [v7 objectForKeyedSubscript:@"string"];
  v27[2] = v11;
  v26[3] = *MEMORY[0x1E4F79BA0];
  uint64_t v12 = [v7 objectForKeyedSubscript:v9];
  v27[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  uint64_t v14 = [MEMORY[0x1E4F79BC0] defaultManager];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: NLSearchParserManager created, will tokenize and enumerate attributed parses for query", buf, 2u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__PSIQuery_DateParsing__dateFilterWithAttributes_andAttributes___block_invoke;
  v18[3] = &unk_1E5868188;
  v18[4] = &v20;
  v18[5] = a1;
  id v15 = (id)[v14 tokenizeAndEnumerateAttributedParsesForQuery:0 options:v13 withBlock:v18];
  id v16 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v16;
}

void __64__PSIQuery_DateParsing__dateFilterWithAttributes_andAttributes___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = xmmword_19BA99FE0;
  id v5 = [a2 attributesAtIndex:0 effectiveRange:&v17];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F79B80]];
    int v8 = [v7 unsignedIntegerValue];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 1024;
      int v23 = v8;
      _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: NLSearchParserManager found date parse attributes: %@ for query: %@ with date type: %d", buf, 0x1Cu);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) || v8 != 41)
    {
      uint64_t v10 = [*(id *)(a1 + 40) dateFilterWithAttributes:v6];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(void *)(a1 + 32);
      if (!*(void *)(*(void *)(v13 + 8) + 40) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v6;
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Photos Search PSIQuery: Attributes %@ didn't produce a dateFilter", buf, 0xCu);
        uint64_t v13 = *(void *)(a1 + 32);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void **)(*(void *)(v13 + 8) + 40);
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        uint64_t v21 = v15;
        __int16 v22 = 1024;
        int v23 = v8;
        _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: Generated date filter: %@ for query: %@ with date type: %d", buf, 0x1Cu);
        uint64_t v13 = *(void *)(a1 + 32);
      }
      if (*(void *)(*(void *)(v13 + 8) + 40) && v8 != 41) {
        *a3 = 1;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v16;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: NLSearchParserManager found no date parse attributes for query: %@", buf, 0xCu);
  }
}

+ (id)dateFilterByCombiningDateFilter:(id)a3 withDateFilter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 int64RepresentationMask];
  if (([v6 int64RepresentationMask] & v7) != 0) {
    goto LABEL_2;
  }
  uint64_t v9 = [v5 singleDate];
  uint64_t v10 = [v6 singleDate];
  uint64_t v11 = v10;
  if (!v9)
  {
    uint64_t v13 = v5;
    if (!v10)
    {
LABEL_2:
      int v8 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (!v10)
  {
    uint64_t v13 = v6;
    uint64_t v11 = v9;
LABEL_9:
    uint64_t v9 = v11;
    uint64_t v11 = [v13 startDate];
    uint64_t v12 = [v13 endDate];
    uint64_t v14 = [v9 int64Representation];
    uint64_t v15 = [v11 int64Representation] | v14;
    uint64_t v16 = [v9 int64Representation];
    uint64_t v17 = [(PSIDate *)v12 int64Representation] | v16;
    id v18 = [[PSIDate alloc] initWithInt64Representation:v15];
    uint64_t v19 = [[PSIDate alloc] initWithInt64Representation:v17];
    int v8 = [[PSIDateFilter alloc] initWithStartDate:v18 endDate:v19];

    goto LABEL_10;
  }
  uint64_t v12 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", [v10 int64Representation] | objc_msgSend(v9, "int64Representation"));
  int v8 = [[PSIDateFilter alloc] initWithSingleDate:v12];
LABEL_10:

  __int16 v20 = NSString;
  uint64_t v21 = [v5 displayString];
  __int16 v22 = [v6 displayString];
  int v23 = [v20 stringWithFormat:@"%@, %@", v21, v22];
  [(PSIDateFilter *)v8 setDisplayString:v23];

LABEL_11:
  return v8;
}

+ (id)dateFilterWithAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F79B68]];
  if (!v4)
  {
    uint64_t v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F79B90]];
    uint64_t v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F79B88]];
    if (v10) {
      goto LABEL_38;
    }
    goto LABEL_8;
  }
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F79B80]];
  int v7 = [v6 unsignedIntegerValue];

  int v8 = 0;
  if (v7 > 23)
  {
    if (v7 == 24)
    {
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v18 = [v5 component:512 fromDate:v17];

      [v4 setWeekday:v18];
      uint64_t v13 = [v5 dateFromComponents:v4];
      int v8 = [v5 dateByAddingUnit:16 value:-1 toDate:v13 options:0];
      uint64_t v19 = v5;
      uint64_t v20 = 1;
    }
    else
    {
      if (v7 != 25)
      {
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        if (v7 != 26) {
          goto LABEL_26;
        }
        uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v13 = [v5 components:24 fromDate:v12];

        objc_msgSend(v4, "setMonth:", objc_msgSend(v13, "month"));
        objc_msgSend(v4, "setDay:", objc_msgSend(v13, "day"));
        uint64_t v14 = [v5 dateFromComponents:v4];
        int v8 = [v5 dateByAddingUnit:16 value:-3 toDate:v14 options:0];
        uint64_t v9 = [v5 dateByAddingUnit:16 value:3 toDate:v14 options:0];

LABEL_23:
        if (v8)
        {
LABEL_24:
          uint64_t v10 = [v5 components:28 fromDate:v8];
          if (v9) {
            goto LABEL_25;
          }
          goto LABEL_17;
        }
LABEL_16:
        uint64_t v10 = 0;
        if (v9)
        {
LABEL_25:
          uint64_t v11 = [v5 components:28 fromDate:v9];
          goto LABEL_26;
        }
LABEL_17:
        uint64_t v11 = 0;
        goto LABEL_26;
      }
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v22 = [v5 component:16 fromDate:v21];

      [v4 setDay:v22];
      uint64_t v13 = [v5 dateFromComponents:v4];
      int v8 = [v5 dateByAddingUnit:16 value:-3 toDate:v13 options:0];
      uint64_t v19 = v5;
      uint64_t v20 = 3;
    }
    uint64_t v9 = [v19 dateByAddingUnit:16 value:v20 toDate:v13 options:0];
    goto LABEL_23;
  }
  BOOL v16 = v7 == 3 || v7 == 8;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (v16)
  {
    int v8 = [v5 dateFromComponents:v4];
    uint64_t v9 = [v5 dateByAddingUnit:16 value:6 toDate:v8 options:0];
    if (v8) {
      goto LABEL_24;
    }
    goto LABEL_16;
  }
LABEL_26:
  int v23 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F79B78]];
  int v24 = [v23 unsignedIntegerValue];

  if (v24 == 2)
  {
    if (v10) {
      uint64_t v27 = v10;
    }
    else {
      uint64_t v27 = v4;
    }
    id v28 = v27;

    id v26 = 0;
    uint64_t v10 = v28;
  }
  else
  {
    if (v24 != 1) {
      goto LABEL_37;
    }

    if (v11) {
      id v25 = v11;
    }
    else {
      id v25 = v4;
    }
    id v26 = v25;
    uint64_t v10 = 0;
  }

  uint64_t v11 = v26;
LABEL_37:

  if (v10)
  {
LABEL_38:
    char v29 = [PSIDateFilter alloc];
    if (v11) {
      uint64_t v15 = [(PSIDateFilter *)v29 initWithStartDateComponents:v10 endDateComponents:v11];
    }
    else {
      uint64_t v15 = [(PSIDateFilter *)v29 initWithStartDateComponents:v10];
    }
    goto LABEL_41;
  }
LABEL_8:
  if (v11)
  {
    uint64_t v15 = [[PSIDateFilter alloc] initWithEndDateComponents:v11];
LABEL_41:
    id v30 = v15;
    goto LABEL_42;
  }
  if (v4)
  {
    uint64_t v15 = [[PSIDateFilter alloc] initWithSingleDateComponents:v4];
    goto LABEL_41;
  }
  id v30 = 0;
LABEL_42:
  uint64_t v31 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F79B70]];
  [(PSIDateFilter *)v30 setDisplayString:v31];

  return v30;
}

- (BOOL)useWildcardText
{
  return self->_useWildcardText;
}

- (void)setMergeFilterTokenAssetIDsIntervalID:(unint64_t)a3
{
  self->_mergeFilterTokenAssetIDsIntervalID = a3;
}

- (unint64_t)mergeFilterTokenAssetIDsIntervalID
{
  return self->_mergeFilterTokenAssetIDsIntervalID;
}

- (NSString)queryAssetUUID
{
  return self->_queryAssetUUID;
}

- (NSIndexSet)modelTypes
{
  return self->_modelTypes;
}

- (void)setElapsedTimeResultGenerationAndIntersections:(double)a3
{
  self->_elapsedTimeResultGenerationAndIntersections = a3;
}

- (double)elapsedTimeResultGenerationAndIntersections
{
  return self->_elapsedTimeResultGenerationAndIntersections;
}

- (void)setQueryBeginResultGenerationAndIntersectionsTime:(id)a3
{
}

- (NSDate)queryBeginResultGenerationAndIntersectionsTime
{
  return self->_queryBeginResultGenerationAndIntersectionsTime;
}

- (void)setElapsedTimeQueryParsing:(double)a3
{
  self->_elapsedTimeQueryParsing = a3;
}

- (double)elapsedTimeQueryParsing
{
  return self->_elapsedTimeQueryParsing;
}

- (void)setQueryBeginParsingTime:(id)a3
{
}

- (NSDate)queryBeginParsingTime
{
  return self->_queryBeginParsingTime;
}

- (void)setIncludeAllQueryMatchedGroups:(BOOL)a3
{
  self->_includeAllQueryMatchedGroups = a3;
}

- (BOOL)includeAllQueryMatchedGroups
{
  return self->_includeAllQueryMatchedGroups;
}

- (void)setIncludeAllFruitfulMatchedGroups:(BOOL)a3
{
  self->_includeAllFruitfulMatchedGroups = a3;
}

- (BOOL)includeAllFruitfulMatchedGroups
{
  return self->_includeAllFruitfulMatchedGroups;
}

- (BOOL)enableExactMatchPrioritization
{
  return self->_enableExactMatchPrioritization;
}

- (unint64_t)suggestionLimit
{
  return self->_suggestionLimit;
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (NSSet)scopedSearchIdentifiers
{
  return self->_scopedSearchIdentifiers;
}

- (void)setDelegate:(id)a3
{
}

- (PSIQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSIQueryDelegate *)WeakRetained;
}

- (void)setLibraryScope:(unint64_t)a3
{
  self->_libraryScope = a3;
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (void)setSocialGroupExtendedCollectionIds:(id)a3
{
}

- (NSSet)socialGroupExtendedCollectionIds
{
  return &self->_socialGroupExtendedCollectionIds->super;
}

- (void)setSocialGroupExtendedAssetIds:(id)a3
{
}

- (NSSet)socialGroupExtendedAssetIds
{
  return &self->_socialGroupExtendedAssetIds->super;
}

- (void)setDedupedGroupResults:(id)a3
{
}

- (NSArray)dedupedGroupResults
{
  return self->_dedupedGroupResults;
}

- (void)setHumanActionIdentifiers:(id)a3
{
}

- (NSSet)humanActionIdentifiers
{
  return self->_humanActionIdentifiers;
}

- (void)setAudioIdentifiers:(id)a3
{
}

- (NSSet)audioIdentifiers
{
  return self->_audioIdentifiers;
}

- (void)setPersonIdentifiers:(id)a3
{
}

- (NSSet)personIdentifiers
{
  return self->_personIdentifiers;
}

- (void)setSceneIdentifiers:(id)a3
{
}

- (NSSet)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (void)setNextKeywordSuggestions:(id)a3
{
}

- (NSArray)nextKeywordSuggestions
{
  return self->_nextKeywordSuggestions;
}

- (void)setNumberOfNextKeywordSuggestionToProcess:(unint64_t)a3
{
  self->_numberOfNextKeywordSuggestionToProcess = a3;
}

- (unint64_t)numberOfNextKeywordSuggestionToProcess
{
  return self->_numberOfNextKeywordSuggestionToProcess;
}

- (void)setSubstitutions:(id)a3
{
}

- (NSDictionary)substitutions
{
  return self->_substitutions;
}

- (void)setWordEmbeddingMode:(unint64_t)a3
{
  self->_wordEmbeddingMode = a3;
}

- (unint64_t)wordEmbeddingMode
{
  return self->_wordEmbeddingMode;
}

- (void)setLegacyDisableTopAssetsAndTopCollections:(BOOL)a3
{
  self->_legacyDisableTopAssetsAndTopCollections = a3;
}

- (BOOL)legacyDisableTopAssetsAndTopCollections
{
  return self->_legacyDisableTopAssetsAndTopCollections;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)runFetchEmbeddingQueryWitBatchHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v6 = atomic_exchange((atomic_uchar *volatile)&self->_didStart, 1u);
  if ((v6 & 1) != 0 || [(PSIQuery *)self isCanceled] || !WeakRetained)
  {
    int v7 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v6) {
        int v8 = @"yes";
      }
      else {
        int v8 = @"no";
      }
      int v10 = 138413058;
      if ([(PSIQuery *)self isCanceled]) {
        uint64_t v9 = @"yes";
      }
      else {
        uint64_t v9 = @"no";
      }
      uint64_t v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = WeakRetained;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Will not execute search query: %@, hadAlreadyStarted = %@, isCancelled = %@, delegate = %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    [WeakRetained executeFetchEmbeddingQuery:self batchHandler:v4];
  }
}

- (PSIQuery)initWithEmbeddingModelTypes:(id)a3 assetUUID:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSIQuery;
  __int16 v12 = [(PSIQuery *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_queryAssetUUID, a4);
    objc_storeStrong((id *)&v13->_modelTypes, a3);
  }

  return v13;
}

- (PSIQuery)initWithQueryText:(id)a3 suggestionType:(unint64_t)a4 suggestionLimit:(unint64_t)a5 resultTypes:(unint64_t)a6 delegate:(id)a7 libraryScope:(unint64_t)a8
{
  _NSRange result = [(PSIQuery *)self initWithQueryTokens:MEMORY[0x1E4F1CBF0] searchText:a3 useWildcardText:1 delegate:a7 libraryScope:a8];
  if (result)
  {
    result->_searchSuggestionType = a4;
    result->_suggestionLimit = a5;
    result->_searchResultTypes = a6;
  }
  return result;
}

- (id)processParseV2:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = PLSearchBackendQueryGetLog();
  unsigned __int8 v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Process parse: %@ for query: %@", buf, 0x16u);
    }

    uint64_t v7 = [v4 numberOfTokens];
    uint64_t v56 = 0;
    BOOL v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 1;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __27__PSIQuery_processParseV2___block_invoke;
    v55[3] = &unk_1E58691B0;
    v55[4] = &v56;
    [v4 enumerateTokensUsingBlock:v55];
    int v8 = [v4 dateFilter];
    if (v8) {
      BOOL v9 = [(NSArray *)self->_identifierTokens count] == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (!*((unsigned char *)v57 + 24)) {
      BOOL v9 = 0;
    }
    *((unsigned char *)v57 + 24) = v9;

    if (*((unsigned char *)v57 + 24))
    {
      PLPhotosSearchGetLog();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v12 = os_signpost_id_generate(v11);

      uint64_t v13 = v11;
      __int16 v14 = v13;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLSearchDateQuerySignpost", "", buf, 2u);
      }

      objc_super v15 = [v4 dateFilter];
      __int16 v16 = [(PSIQuery *)self scopedSearchIdentifiers];
      objc_msgSend(WeakRetained, "searchResultV2WithDateFilter:scopedSearchIdentifiers:searchResultTypes:suggestionType:", v15, v16, -[PSIQuery searchResultTypes](self, "searchResultTypes"), -[PSIQuery searchSuggestionType](self, "searchSuggestionType"));
      id v10 = (PLSearchResultV2 *)objc_claimAutoreleasedReturnValue();

      id v17 = v14;
      uint64_t v18 = v17;
      if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v12, "PLSearchDateQuerySignpost", "", buf, 2u);
      }

      uint64_t v19 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [v4 dateFilter];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2112;
        long long v62 = v20;
        __int16 v63 = 2112;
        long long v64 = self;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "Generated search result: %@ for parse: %@ with date filter %@ for query: %@", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v21 = self->_identifierTokens;
      uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v52 != v23) {
              objc_enumerationMutation(v21);
            }
            uint64_t v25 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            id v26 = [(PSIQuery *)self _idsOfGroupsMatchingToken:v25];
            if (!v26)
            {
              uint64_t v27 = PLSearchBackendQueryGetLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v25;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = self;
                _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "Token: %@ has no matching group ids for query: %@, returning nil for query", buf, 0x16u);
              }

              id v10 = 0;
              goto LABEL_36;
            }
            [v18 addObject:v25];
            [v19 addObject:v26];
          }
          uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v62) = 0;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __27__PSIQuery_processParseV2___block_invoke_108;
      v47[3] = &unk_1E58692B8;
      v47[4] = self;
      uint64_t v18 = v18;
      id v48 = v18;
      uint64_t v19 = v19;
      id v49 = v19;
      uint64_t v50 = buf;
      [v4 enumerateTokensUsingBlock:v47];
      if (*(unsigned char *)(*(void *)&buf[8] + 24) || [(PSIQuery *)self isCanceled])
      {
        id v10 = 0;
      }
      else
      {
        char v29 = [v4 dateFilter];
        unint64_t v30 = [(PSIQuery *)self searchResultTypes];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __27__PSIQuery_processParseV2___block_invoke_109;
        v46[3] = &unk_1E5869200;
        v46[4] = self;
        uint64_t v31 = [WeakRetained groupArraysFromGroupIdSets:v19 dateFilter:v29 searchResultTypes:v30 progressBlock:v46];
        if ([(PSIQuery *)self isCanceled])
        {
          id v10 = 0;
        }
        else if ([v31 count])
        {
          if ([v4 isImplicitlyTokenizedParse]) {
            self->_searchSuggestionType = 0;
          }
          NSRange v32 = [(PSIQuery *)self searchText];
          if ([v32 length])
          {
            uint64_t v33 = [v18 lastObject];
            id v44 = [v33 normalizedText];
          }
          else
          {
            id v44 = 0;
          }

          [(PSIQuery *)self _postProcessPersonGroupsInGroupArrays:v31];
          id v42 = objc_opt_class();
          unint64_t v41 = [(PSIQuery *)self searchResultTypes];
          unint64_t v40 = [(PSIQuery *)self searchSuggestionType];
          id v43 = [(PSIQuery *)self scopedSearchIdentifiers];
          BOOL v39 = [(PSIQuery *)self enableExactMatchPrioritization];
          BOOL v38 = [(PSIQuery *)self includeAllQueryMatchedGroups];
          BOOL v34 = [(PSIQuery *)self includeAllFruitfulMatchedGroups];
          unint64_t v35 = [(PSIQuery *)self suggestionLimit];
          id v36 = objc_loadWeakRetained((id *)&self->_delegate);
          BYTE2(v37) = v34;
          BYTE1(v37) = v38;
          LOBYTE(v37) = v39;
          objc_msgSend(v42, "searchResultFromArrayOfGroupArrays:searchTokens:searchResultTypes:suggestionType:scopedSearchIdentifiers:normalizedSearchText:enableExactMatchPrioritization:includeAllQueryMatchedGroups:includeAllFruitfulMatchedGroups:suggestionLimit:query:delegate:", v31, v18, v41, v40, v43, v44, v37, v35, self, v36);
          id v10 = (PLSearchResultV2 *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v10 = objc_alloc_init(PLSearchResultV2);
        }
      }
      _Block_object_dispose(buf, 8);
    }
LABEL_36:

    _Block_object_dispose(&v56, 8);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Cannot process parse: %@ for query: %@ because delegate is nil", buf, 0x16u);
    }

    id v10 = 0;
  }

  return v10;
}

uint64_t __27__PSIQuery_processParseV2___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 matchType];
  if (result != 3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void __27__PSIQuery_processParseV2___block_invoke_108(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 matchType] != 3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _idsOfGroupsMatchingToken:v6];
    if (v7)
    {
      uint64_t v8 = v7;
      [*(id *)(a1 + 40) addObject:v6];
      [*(id *)(a1 + 48) addObject:v8];
    }
    else
    {
      BOOL v9 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 138412546;
        id v12 = v6;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Token: %@ has no matching group ids for query: %@, returning nil for query", (uint8_t *)&v11, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

uint64_t __27__PSIQuery_processParseV2___block_invoke_109(uint64_t a1, unsigned char *a2)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  *a2 = result;
  return result;
}

- (void)runWithResultsHandlerV2:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a3;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PSIQuery.m", 1077, @"Invalid parameter not satisfying: %@", @"searchResultsHandler" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v7 = atomic_exchange((atomic_uchar *volatile)&self->_didStart, 1u);
  if ((v7 & 1) != 0 || [(PSIQuery *)self isCanceled] || !WeakRetained)
  {
    uint64_t v8 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v7) {
        BOOL v9 = @"yes";
      }
      else {
        BOOL v9 = @"no";
      }
      *(_DWORD *)buf = 138413058;
      if ([(PSIQuery *)self isCanceled]) {
        uint64_t v10 = @"yes";
      }
      else {
        uint64_t v10 = @"no";
      }
      __int16 v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = WeakRetained;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Will not execute search query: %@, hadAlreadyStarted = %@, isCancelled = %@, delegate = %@", buf, 0x2Au);
    }

    v5[2](v5, 0);
  }
  else
  {
    [WeakRetained executeQueryV2:self resultsHandler:v5];
  }
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@:%p\n", v5, self];

  [v3 appendFormat:@"tokens: %@\n", self->_queryTokens];
  if ([(PSIQuery *)self isCanceled]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  [v3 appendFormat:@"canceled: %@\n", v6];
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_didStart);
  if (v7) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v3 appendFormat:@"didStart: %@\n", v8];
  if (self->_useWildcardText) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  [v3 appendFormat:@"useWildcardText: %@\n", v9];
  [v3 appendFormat:@"matchedSceneIdentifiers: %@\n", self->_sceneIdentifiers];
  [v3 appendFormat:@"matchedPersonIdentifiers: %@\n", self->_personIdentifiers];
  [v3 appendFormat:@"matchedAudioIdentifiers: %@\n", self->_audioIdentifiers];
  [v3 appendFormat:@"matchedHumanActionIdentifiers: %@\n", self->_humanActionIdentifiers];
  return v3;
}

- (void)_postProcessPersonGroupsInGroupArrays:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v41 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v42 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v40 = [MEMORY[0x1E4F1CA80] set];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          char v13 = 0;
          __int16 v14 = 0;
          uint64_t v15 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v55 != v15) {
                objc_enumerationMutation(v10);
              }
              id v17 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              if ([v17 category] == 1300)
              {
                if (v13) {
                  goto LABEL_20;
                }
                id v18 = v17;

                char v13 = 1;
                __int16 v14 = v18;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v63 count:16];
          }
          while (v12);

          if (v13)
          {
            [v42 addObject:v14];
            socialGroupPersonIdentifiers = v41->_socialGroupPersonIdentifiers;
            uint64_t v20 = [v14 lookupIdentifier];
            LODWORD(socialGroupPersonIdentifiers) = [(NSArray *)socialGroupPersonIdentifiers containsObject:v20];

            if (socialGroupPersonIdentifiers) {
              [v40 addObject:v14];
            }
          }
        }
        else
        {
          __int16 v14 = 0;
LABEL_20:
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v6);
  }

  if ((unint64_t)[v42 count] >= 2)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke_3;
    v48[3] = &unk_1E5869290;
    id v21 = WeakRetained;
    id v49 = v21;
    id v22 = v40;
    id v52 = &__block_literal_global_48;
    id v53 = &__block_literal_global_51;
    id v50 = v22;
    long long v51 = v41;
    uint64_t v23 = (void (**)(void, void, void, void))MEMORY[0x19F38D650](v48);
    int v24 = v41->_socialGroupPersonIdentifiers;
    if (v24)
    {
      uint64_t v25 = PLSearchSocialGroupLookupIdentifier(v24);
      ((void (**)(void, void *, id, void))v23)[2](v23, v25, v22, 0);
    }
    if (([v42 isEqualToSet:v22] & 1) == 0)
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v27 = [v42 count];
      if (v27 >= 3)
      {
        id v28 = [v21 meNodeIdentifier];
      }
      else
      {
        id v28 = 0;
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v29 = v42;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v62 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v45;
        BOOL v34 = v27 < 3 || v28 == 0;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v45 != v32) {
              objc_enumerationMutation(v29);
            }
            id v36 = [*(id *)(*((void *)&v44 + 1) + 8 * k) lookupIdentifier];
            uint64_t v37 = v36;
            if (v36 && (v34 || ([v36 isEqualToString:v28] & 1) == 0)) {
              [v26 addObject:v37];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v62 count:16];
        }
        while (v31);
      }

      BOOL v38 = PLSearchSocialGroupLookupIdentifier(v26);
      ((void (**)(void, void *, id, uint64_t))v23)[2](v23, v38, v29, 1);
    }
  }
}

void __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = [*(id *)(a1 + 32) groupIdsMatchingString:v7 categories:0 textIsSearchable:0];
  memset(v32, 0, sizeof(v32));
  if ([v9 countByEnumeratingWithState:v32 objects:v34 count:16])
  {
    id v22 = v9;
    id v23 = v8;
    id v24 = v7;
    id v10 = [*(id *)(a1 + 32) groupWithMatchingGroupId:**((void **)&v32[0] + 1) dateFilter:0 searchResultTypes:3];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = 0;
      __int16 v14 = 0;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        id v17 = v13;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
          if ((a4 & 1) == 0)
          {
            uint64_t v19 = *(void *)(a1 + 56);
            id v27 = v14;
            (*(void (**)(uint64_t, id *, uint64_t))(v19 + 16))(v19, &v27, [v18 assetIds]);
            id v20 = v27;

            __int16 v14 = v20;
          }
          uint64_t v21 = *(void *)(a1 + 56);
          id v26 = v17;
          (*(void (**)(uint64_t, id *, uint64_t))(v21 + 16))(v21, &v26, [v18 collectionIds]);
          id v13 = v26;

          if (a4) {
            [v18 unionCollectionIdsWithGroup:v10];
          }
          else {
            [v18 unionIdsWithGroup:v10];
          }
          ++v16;
          id v17 = v13;
        }
        while (v12 != v16);
        uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }
    else
    {
      id v13 = 0;
      __int16 v14 = 0;
    }

    id v7 = v24;
    if ((a4 & 1) == 0) {
      (*(void (**)(void, uint64_t, uint64_t, void *))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 48) + 104, [v10 assetIds], v14);
    }
    (*(void (**)(void, uint64_t, uint64_t, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 48) + 112, [v10 collectionIds], v13);

    BOOL v9 = v22;
    id v8 = v23;
  }
}

void __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke_2(uint64_t a1, id *a2, uint64_t a3, void *a4)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v7 = a4;
  obuint64_t j = CFSetCreateMutable(v6, 0, 0);
  [(__CFSet *)obj addObjectsFromArray:a3];
  [(__CFSet *)obj minusSet:v7];

  if (*a2) {
    [*a2 intersectSet:obj];
  }
  else {
    objc_storeStrong(a2, obj);
  }
}

void __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke(uint64_t a1, id *a2, uint64_t a3)
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  [(__CFSet *)Mutable addObjectsFromArray:a3];
  if (*a2) {
    [*a2 intersectSet:Mutable];
  }
  else {
    *a2 = Mutable;
  }
}

- (id)suggestionWhitelistedScenes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained suggestionWhitelistedScenes];

  return v3;
}

- (void)enumerateParsesWithMode:(unint64_t)a3 usingBlock:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v33[0] = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  if ((v4 & 1) == 0
    || !self->_baseParseCouldHaveResults
    || (baseParse = self->_baseParse,
        uint64_t v29 = 1,
        (*((void (**)(id, PSIParse *, void, unsigned char *))v6 + 2))(v6, baseParse, 0, v33),
        !*((unsigned char *)v31 + 24)))
  {
    if ((v4 & 2) != 0
      && self->_implicitlyTokenizedParsesCouldHaveResults
      && [(NSArray *)self->_implicitelyTokenizedParses count])
    {
      BOOL v9 = [(NSArray *)self->_implicitelyTokenizedParses firstObject];
      ++v27[3];
      ((void (**)(void, void *))v7)[2](v7, v9);
    }
    if (!*((unsigned char *)v31 + 24))
    {
      if ((v4 & 4) == 0) {
        goto LABEL_12;
      }
      datedParses = self->_datedParses;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke;
      v22[3] = &unk_1E5869228;
      id v23 = v7;
      id v24 = &v26;
      uint64_t v25 = &v30;
      [(NSArray *)datedParses enumerateObjectsUsingBlock:v22];

      if (!*((unsigned char *)v31 + 24))
      {
LABEL_12:
        if ((~v4 & 6) != 0)
        {
          BOOL v12 = 0;
          if ((v4 & 8) == 0) {
            goto LABEL_9;
          }
        }
        else
        {
          implicitlyTokenizedDatedParses = self->_implicitlyTokenizedDatedParses;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_2;
          v18[3] = &unk_1E5869228;
          uint64_t v19 = v7;
          id v20 = &v26;
          uint64_t v21 = &v30;
          [(NSArray *)implicitlyTokenizedDatedParses enumerateObjectsUsingBlock:v18];

          BOOL v12 = *((unsigned char *)v31 + 24) != 0;
          if ((v4 & 8) == 0) {
            goto LABEL_9;
          }
        }
        if (!v12)
        {
          wordEmbeddingParses = self->_wordEmbeddingParses;
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_3;
          v14[3] = &unk_1E5869228;
          uint64_t v15 = v7;
          uint64_t v16 = &v26;
          id v17 = &v30;
          [(NSArray *)wordEmbeddingParses enumerateObjectsUsingBlock:v14];
        }
      }
    }
  }
LABEL_9:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

uint64_t __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a1[4];
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t result = (*(uint64_t (**)(void))(v6 + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *a4;
  return result;
}

uint64_t __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a1[4];
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t result = (*(uint64_t (**)(void))(v6 + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *a4;
  return result;
}

uint64_t __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a1[4];
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t result = (*(uint64_t (**)(void))(v6 + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *a4;
  return result;
}

- (void)computeSuggestions
{
  if (self->_substitutionsByStringToken)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    substitutionsByStringToken = self->_substitutionsByStringToken;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__PSIQuery_computeSuggestions__block_invoke;
    v8[3] = &unk_1E586BDB8;
    uint64_t v5 = (NSDictionary *)v3;
    BOOL v9 = v5;
    [(NSDictionary *)substitutionsByStringToken enumerateKeysAndObjectsUsingBlock:v8];
    substitutions = self->_substitutions;
    self->_substitutions = v5;
    id v7 = v5;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PSIQuery computeSuggestions called before processWordEmbeddings", buf, 2u);
  }
}

void __30__PSIQuery_computeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        v23[0] = @"PLSearchWordEmbeddingsTextKey";
        uint64_t v11 = [v10 word];
        v24[0] = v11;
        v23[1] = @"PLSearchWordEmbeddingsPathKey";
        BOOL v12 = [v10 extendedWord];
        v24[1] = v12;
        v23[2] = @"PLSearchWordEmbeddingsScoreKey";
        id v13 = NSNumber;
        [v10 score];
        __int16 v14 = objc_msgSend(v13, "numberWithDouble:");
        v24[2] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

        [v5 addObject:v15];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v17];
}

- (id)processParse:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4
{
  v114[1] = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = MEMORY[0x1E4F148E0];
    *(_WORD *)long long v111 = 2112;
    *(void *)&v111[2] = v70;
    *(_WORD *)&v111[10] = 2112;
    *(void *)&v111[12] = self;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: process parse %d: %@ for query: %@", buf, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = [v70 numberOfTokens];
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x2020000000;
    char v105 = 1;
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke;
    v101[3] = &unk_1E58691B0;
    v101[4] = &v102;
    [v70 enumerateTokensUsingBlock:v101];
    uint64_t v6 = [v70 dateFilter];
    if (v6) {
      BOOL v7 = [(NSArray *)self->_identifierTokens count] == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (!*((unsigned char *)v103 + 24)) {
      BOOL v7 = 0;
    }
    *((unsigned char *)v103 + 24) = v7;

    if (*((unsigned char *)v103 + 24))
    {
      uint64_t v9 = [v70 dateFilter];
      id v10 = [v70 datedTokens];
      uint64_t v11 = [WeakRetained groupResultWithDateFilter:v9 datedTokens:v10];

      if (v11)
      {
        v114[0] = v11;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:1];
      }
      else
      {
        id v8 = (id)MEMORY[0x1E4F1CBF0];
      }
LABEL_92:

      _Block_object_dispose(&v102, 8);
      goto LABEL_93;
    }
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    objc_super v68 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    id v69 = v12;
    long long v66 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v5];
    *(void *)buf = 0;
    *(void *)long long v111 = buf;
    *(void *)&v111[8] = 0x3032000000;
    *(void *)&v111[16] = __Block_byref_object_copy__37280;
    long long v112 = __Block_byref_object_dispose__37281;
    id v113 = 0;
    uint64_t v95 = 0;
    long long v96 = &v95;
    uint64_t v97 = 0x3032000000;
    long long v98 = __Block_byref_object_copy__37280;
    long long v99 = __Block_byref_object_dispose__37281;
    id v100 = 0;
    uint64_t v91 = 0;
    long long v92 = &v91;
    uint64_t v93 = 0x2020000000;
    char v94 = 0;
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x2020000000;
    char v90 = 0;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v13 = self->_identifierTokens;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v83 objects:v109 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v84;
      uint64_t v16 = MEMORY[0x1E4F14500];
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v84 != v15) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          long long v19 = [(PSIQuery *)self _idsOfGroupsMatchingToken:v18];
          int v20 = [v18 isFilterTypeToken];
          if (v20) {
            *((unsigned char *)v92 + 24) = 1;
          }
          if (!v19)
          {

            id v27 = 0;
            id v8 = (id)MEMORY[0x1E4F1CBF0];
            goto LABEL_91;
          }
          [v12 addObject:v18];
          if (v20)
          {
            *((unsigned char *)v88 + 24) = 1;
            if (CFSetGetCount(v19) != 1) {
              goto LABEL_29;
            }
            *(void *)values = 0;
            CFSetGetValues(v19, (const void **)values);
            long long v21 = [NSNumber numberWithUnsignedLongLong:*(void *)values];
            [v66 addObject:v21];

            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)id v107 = 138412546;
              *(void *)&v107[4] = v18;
              *(_WORD *)&v107[12] = 2112;
              *(void *)&v107[14] = self;
              _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Filter token: %@ submitted for query:%@", v107, 0x16u);
            }
          }
          [v68 addObject:v19];
        }
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v83 objects:v109 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_29:

    *(void *)id v107 = 0;
    *(void *)&v107[8] = v107;
    *(void *)&v107[16] = 0x2020000000;
    char v108 = 0;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_38;
    v73[3] = &unk_1E58691D8;
    id v22 = v12;
    id v74 = v22;
    uint64_t v75 = self;
    v78 = &v91;
    uint64_t v79 = &v87;
    id v23 = v66;
    id v76 = v23;
    id v24 = v68;
    id v77 = v24;
    uint64_t v80 = buf;
    v81 = &v95;
    v82 = v107;
    [v70 enumerateTokensUsingBlock:v73];
    id v69 = v22;
    if (*(unsigned char *)(*(void *)&v107[8] + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_33:
        id v27 = 0;
        id v8 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_90;
      }
      *(_DWORD *)values = 138412290;
      *(void *)&values[4] = self;
      uint64_t v25 = MEMORY[0x1E4F14500];
      uint64_t v26 = "Photos Search PSIQuery: Some tokens have no result for query: %@";
LABEL_32:
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, v26, values, 0xCu);
      goto LABEL_33;
    }
    if (*((unsigned char *)v92 + 24) && !*((unsigned char *)v88 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_DWORD *)values = 138412290;
      *(void *)&values[4] = self;
      uint64_t v25 = MEMORY[0x1E4F14500];
      uint64_t v26 = "Photos Search PSIQuery: GroupIds not found for any filter tokens; there will be no result for query: %@";
      goto LABEL_32;
    }
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(PSIQuery *)self isCanceled])
    {
      id v27 = 0;
    }
    else
    {
      uint64_t v29 = [v70 dateFilter];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_39;
      v72[3] = &unk_1E5869200;
      v72[4] = self;
      long long v64 = [WeakRetained groupArraysFromGroupIdSets:v24 dateFilter:v29 searchResultTypes:3 progressBlock:v72];
      HIDWORD(v63) = [(PSIQuery *)self isCanceled];
      if ((v63 & 0x100000000) != 0)
      {
        id v27 = 0;
      }
      else
      {
        if ([v23 count])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)values = 138412290;
            *(void *)&values[4] = self;
            _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Filter tokens submitted for query:%@", values, 0xCu);
          }
          BOOL v30 = +[PSIQuery _shouldApplyFilterTokensForGroupArrays:v64 searchTokens:v22 filterGroupIds:v23];
          BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
          if (v30)
          {
            if (v31)
            {
              *(_DWORD *)values = 138412290;
              *(void *)&values[4] = self;
              _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Applying filter tokens; merging assetIDs for query:%@",
                values,
                0xCu);
            }
            uint64_t v32 = PLPhotosSearchGetLog();
            os_signpost_id_t v33 = [(PSIQuery *)self mergeFilterTokenAssetIDsIntervalID];
            if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
            {
              *(_WORD *)values = 0;
              _os_signpost_emit_with_name_impl(&dword_19B3C7000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "MergeFilterTokenAssetIDs", "", values, 2u);
            }

            BOOL v34 = PLPhotosSearchGetLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v35 = [(PSIQuery *)self mergeFilterTokenAssetIDsIntervalID];
              *(_DWORD *)values = 134217984;
              *(void *)&values[4] = v35;
              _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Signpost interval begin with ID: %llu", values, 0xCu);
            }

            id v71 = 0;
            +[PSIQuery _aggregateAssetIdsOnFilterGroupsInGroupArrays:v64 searchTokens:v22 groupIdToOriginalAssetIdsMap:&v71];
            id v27 = v71;
            id v36 = PLPhotosSearchGetLog();
            os_signpost_id_t v37 = [(PSIQuery *)self mergeFilterTokenAssetIDsIntervalID];
            if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
            {
              *(_WORD *)values = 0;
              _os_signpost_emit_with_name_impl(&dword_19B3C7000, v36, OS_SIGNPOST_INTERVAL_END, v37, "MergeFilterTokenAssetIDs", "", values, 2u);
            }

            BOOL v38 = PLPhotosSearchGetLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v39 = [(PSIQuery *)self mergeFilterTokenAssetIDsIntervalID];
              *(_DWORD *)values = 134217984;
              *(void *)&values[4] = v39;
              _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Signpost interval end with ID: %llu", values, 0xCu);
            }

            unint64_t v40 = +[PSIQuery _indexesToRemoveForDuplicatedFilterGroupsinGroupArrays:v64 searchTokens:v22];
            uint64_t v41 = [v40 count];
            BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
            if (v41)
            {
              if (v42)
              {
                *(_DWORD *)values = 138412290;
                *(void *)&values[4] = self;
                _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Removing a subset of filter tokens for query:%@", values, 0xCu);
              }
              +[PSIQuery _restoreAssetIdsForGroupsInGroupArrays:v64 atRemovalIndexes:v40 groupIdToOriginalAssetIdsMap:v27 searchTokens:v22];
            }
            else if (v42)
            {
              *(_DWORD *)values = 138412290;
              *(void *)&values[4] = self;
              _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: All filter tokens applied for query:%@", values, 0xCu);
            }
          }
          else
          {
            if (v31)
            {
              *(_DWORD *)values = 138412290;
              *(void *)&values[4] = self;
              _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Removing filter tokens for query:%@", values, 0xCu);
            }
            unint64_t v40 = +[PSIQuery _indexesOfFilterTokensInSearchTokens:v22];
            id v27 = 0;
          }
          if ([v40 count])
          {
            id v43 = (void *)[v64 mutableCopy];
            long long v44 = (void *)[v22 mutableCopy];
            [v44 removeObjectsAtIndexes:v40];
            [v43 removeObjectsAtIndexes:v40];
            uint64_t v45 = [v44 copy];

            uint64_t v46 = [v43 copy];
            long long v64 = (void *)v46;
            id v69 = (id)v45;
          }
        }
        else
        {
          id v27 = 0;
        }
        [(PSIQuery *)self _postProcessPersonGroupsInGroupArrays:v64];
        long long v47 = [PSIGroupAggregate alloc];
        id v48 = [WeakRetained groupResultsQueue];
        id v49 = [(PSIGroupAggregate *)v47 initWithSearchTokens:v69 groupResultsQueue:v48];

        id v50 = [*(id *)(*(void *)v111 + 40) extendedWord];
        BOOL v51 = [v50 length] == 0;

        if (!v51)
        {
          id v52 = [*(id *)(*(void *)v111 + 40) extendedWord];
          [(PSIGroupAggregate *)v49 setTransientToken:v52];
        }
        uint64_t v53 = [v64 count];
        unint64_t v54 = self->_wordEmbeddingMode & 3;
        BOOL v55 = v54 == 3 || *(void *)(*(void *)v111 + 40) == 0;
        uint64_t v56 = [v70 datedTokens];
        long long v57 = (void *)v56;
        if (v55) {
          id v58 = v28;
        }
        else {
          id v58 = 0;
        }
        LOBYTE(v63) = a4;
        BOOL v59 = [(PSIQuery *)self recursiveAddToGroupResults:v58 aggregate:v49 atIndex:0 outOf:v53 inGroupArrays:v64 dateFilter:v29 datedTokens:v56 disableWildcardMatchesForUserControlledCategories:v63];

        char v60 = v54 < 2 || v59;
        if ((v60 & 1) == 0 && *(void *)(*(void *)v111 + 40))
        {
          long long v61 = [(NSDictionary *)self->_substitutionsByStringToken objectForKeyedSubscript:v96[5]];
          [v61 removeObject:*(void *)(*(void *)v111 + 40)];
        }
      }

      if ((v63 & 0x100000000) != 0)
      {
        id v8 = (id)MEMORY[0x1E4F1CBF0];
LABEL_89:

LABEL_90:
        _Block_object_dispose(v107, 8);
LABEL_91:
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(&v91, 8);
        _Block_object_dispose(&v95, 8);

        _Block_object_dispose(buf, 8);
        uint64_t v11 = v69;
        goto LABEL_92;
      }
    }
    id v8 = v28;
    goto LABEL_89;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = MEMORY[0x1E4F148E0];
    *(_WORD *)long long v111 = 2112;
    *(void *)&v111[2] = v70;
    *(_WORD *)&v111[10] = 2112;
    *(void *)&v111[12] = self;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: cannot process parse %d: %@ for query: %@ because the delegate is nil", buf, 0x1Cu);
  }
  id v8 = (id)MEMORY[0x1E4F1CBF0];
LABEL_93:

  return v8;
}

uint64_t __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 matchType];
  if (result != 3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_38(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  values[1] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 matchType] == 3) {
    goto LABEL_15;
  }
  [*(id *)(a1 + 32) addObject:v6];
  CFSetRef v7 = (const __CFSet *)[*(id *)(a1 + 40) _idsOfGroupsMatchingToken:v6];
  if ([v6 isFilterTypeToken])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      if (CFSetGetCount(v7) != 1) {
        *a4 = 1;
      }
      values[0] = 0;
      CFSetGetValues(v7, (const void **)values);
      id v8 = *(void **)(a1 + 48);
      uint64_t v9 = [NSNumber numberWithUnsignedLongLong:values[0]];
      [v8 addObject:v9];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v18 = 138412546;
        id v19 = v6;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Filter token: %@ submitted for query:%@", (uint8_t *)&v18, 0x16u);
      }
      goto LABEL_9;
    }
LABEL_12:
    if ([v6 isFilterTypeToken])
    {
      [*(id *)(a1 + 32) removeObject:v6];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      *a4 = 1;
    }
    goto LABEL_15;
  }
  if (!v7) {
    goto LABEL_12;
  }
LABEL_9:
  [*(id *)(a1 + 56) addObject:v7];
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    uint64_t v11 = [v6 wordEmbeddingMatch];

    if (v11)
    {
      uint64_t v12 = [v6 wordEmbeddingMatch];
      uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v15 = [v6 text];
      uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
  }
LABEL_15:
}

uint64_t __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_39(uint64_t a1, unsigned char *a2)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  *a2 = result;
  return result;
}

- (BOOL)recursiveAddToGroupResults:(id)a3 aggregate:(id)a4 atIndex:(unint64_t)a5 outOf:(unint64_t)a6 inGroupArrays:(id)a7 dateFilter:(id)a8 datedTokens:(id)a9 disableWildcardMatchesForUserControlledCategories:(BOOL)a10
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v16 = a4;
  id v34 = a7;
  id v33 = a8;
  BOOL v31 = self;
  id v32 = a9;
  if ([(PSIQuery *)self isCanceled])
  {
    LOBYTE(v17) = 0;
    goto LABEL_26;
  }
  if (a5 != a6)
  {
    [v34 objectAtIndex:a5];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (!v21)
    {
      LOBYTE(v17) = 0;
      goto LABEL_25;
    }
    uint64_t v22 = v21;
    int v17 = 0;
    uint64_t v23 = *(void *)v38;
    unint64_t v30 = a5 + 1;
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v25 category] == 2100)
        {
          uint64_t v26 = [v16 filenameGroupInAggregate];
          if (v26)
          {
            uint64_t v27 = [v25 groupId];
            if (v27 != [v26 groupId])
            {

              continue;
            }
          }
        }
        if ([v16 pushGroup:v25 disableWildcardMatchesForUserControlledCategories:a10])
        {
          LOBYTE(v29) = a10;
          v17 |= [(PSIQuery *)v31 recursiveAddToGroupResults:v35 aggregate:v16 atIndex:v30 outOf:a6 inGroupArrays:v34 dateFilter:v33 datedTokens:v32 disableWildcardMatchesForUserControlledCategories:v29];
          [v16 pop];
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (!v22)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
  }
  if (v35)
  {
    int v18 = (void *)[v16 newGroupResultWithDateFilter:v33 datedTokens:v32];
    if (v18)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 setDelegate:WeakRetained];

      __int16 v20 = [v16 transientToken];
      [v18 setTransientToken:v20];

      [v35 addObject:v18];
    }
  }
  LOBYTE(v17) = 1;
LABEL_26:

  return v17 & 1;
}

- (void)processWordEmbeddings
{
  if (!self->_baseParse)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v3 = MEMORY[0x1E4F14500];
    id v4 = "Photos Search PSIQuery: processWordEmbeddings called before bootstrap";
    goto LABEL_7;
  }
  if (self->_wordEmbeddingParses)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v3 = MEMORY[0x1E4F14500];
    id v4 = "Photos Search PSIQuery: processWordEmbeddings already called";
LABEL_7:
    _os_log_error_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, v4, buf, 2u);
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unint64_t v8 = self->_wordEmbeddingMode & 3;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __33__PSIQuery_processWordEmbeddings__block_invoke;
    v20[3] = &unk_1E5869138;
    id v21 = WeakRetained;
    uint64_t v22 = self;
    unint64_t v25 = v8;
    uint64_t v9 = (NSArray *)v6;
    uint64_t v23 = v9;
    uint64_t v10 = (NSDictionary *)v7;
    id v24 = v10;
    uint64_t v11 = (void *)MEMORY[0x19F38D650](v20);
    baseParse = self->_baseParse;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __33__PSIQuery_processWordEmbeddings__block_invoke_3;
    v18[3] = &unk_1E5869188;
    void v18[4] = self;
    id v19 = v11;
    id v13 = v11;
    [(PSIParse *)baseParse enumerateTokensUsingBlock:v18];
    wordEmbeddingParses = self->_wordEmbeddingParses;
    self->_wordEmbeddingParses = v9;
    uint64_t v15 = v9;

    substitutionsByStringToken = self->_substitutionsByStringToken;
    self->_substitutionsByStringToken = v10;
    int v17 = v10;
  }
}

void __33__PSIQuery_processWordEmbeddings__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) wordEmbeddingMatchesForToken:a2];
  if ([v9 count])
  {
    unint64_t v30 = v8;
    BOOL v31 = v7;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          objc_msgSend(v16, "score", v30);
          double v18 = v17;
          id v19 = [v16 word];
          __int16 v20 = [v10 objectForKeyedSubscript:v19];
          [v20 score];
          double v22 = v21;

          if (v18 > v22)
          {
            uint64_t v23 = [v16 word];
            [v10 setObject:v16 forKeyedSubscript:v23];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v13);
    }

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __33__PSIQuery_processWordEmbeddings__block_invoke_2;
    v32[3] = &unk_1E5869110;
    _OWORD v32[4] = *(void *)(a1 + 40);
    id v7 = v31;
    id v25 = v31;
    uint64_t v26 = *(void *)(a1 + 64);
    id v33 = v25;
    uint64_t v37 = v26;
    id v8 = v30;
    id v36 = v30;
    id v34 = *(id *)(a1 + 48);
    id v35 = v24;
    id v27 = v24;
    [v10 enumerateKeysAndObjectsUsingBlock:v32];
    id v28 = *(void **)(a1 + 56);
    uint64_t v29 = [v25 text];
    [v28 setObject:v27 forKeyedSubscript:v29];
  }
}

void __33__PSIQuery_processWordEmbeddings__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 usesWordEmbeddings])
  {
    id v6 = [v5 wildcardResolvedText];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__PSIQuery_processWordEmbeddings__block_invoke_4;
    v10[3] = &unk_1E5869160;
    uint64_t v7 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    v10[5] = a3;
    (*(void (**)(uint64_t, void *, id, void *, uint64_t, uint64_t))(v7 + 16))(v7, v6, v5, v10, v8, v9);
  }
}

uint64_t __33__PSIQuery_processWordEmbeddings__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) parseByReplacingTokenAtIndex:*(void *)(a1 + 40) withToken:a2];
}

void __33__PSIQuery_processWordEmbeddings__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a2;
  uint64_t v8 = objc_msgSend(v5, "_idsOfGroupsMatchingString:categories:textIsSearchable:isFilterTypeToken:", v7, 0, 1, objc_msgSend(v6, "isFilterTypeToken"));

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) tokenByWordEmbeddingWithMatch:v13];
    id v10 = v9;
    if (v9)
    {
      [v9 setWordEmbeddingMatch:v13];
      id v11 = v13;
      if (*(void *)(a1 + 72) >= 2uLL)
      {
        uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        if (v12) {
          [*(id *)(a1 + 48) addObject:v12];
        }

        id v11 = v13;
      }
      [*(id *)(a1 + 56) addObject:v11];
    }
  }
}

- (void)processDates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_baseParse)
  {
    datedParses = self->_datedParses;
    id v4 = PLSearchBackendQueryGetLog();
    p_super = v4;
    if (datedParses)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v6 = "Photos Search PSIQuery: processDatedParses already called";
LABEL_7:
        _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_ERROR, v6, buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = self;
        _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_INFO, "Photos Search PSIQuery: processing dates: %@", buf, 0xCu);
      }

      id v7 = objc_opt_class();
      baseParse = self->_baseParse;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&baseParse count:1];
      uint64_t v9 = [v7 datedParsesWithParses:v8];
      id v10 = self->_datedParses;
      self->_datedParses = v9;

      id v11 = [(id)objc_opt_class() datedParsesWithParses:self->_implicitelyTokenizedParses];
      p_super = &self->_implicitlyTokenizedDatedParses->super;
      self->_implicitlyTokenizedDatedParses = v11;
    }
  }
  else
  {
    p_super = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v6 = "Photos Search PSIQuery: processDatedParses called before bootstrap";
      goto LABEL_7;
    }
  }
}

- (void)processImplicitTokenization
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Process implicit tokenization for query: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_baseParse)
  {
    id v4 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "PSIQuery processImplicitTokenization called before bootstrap", (uint8_t *)&buf, 2u);
    }
    goto LABEL_7;
  }
  if (self->_implicitelyTokenizedParses)
  {
    id v4 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "PSIQuery processImplicitTokenization already called", (uint8_t *)&buf, 2u);
    }
LABEL_7:

    return;
  }
  -[PSIQuery implicitlyTokenizedParsesWithBaseParse:](self, "implicitlyTokenizedParsesWithBaseParse:");
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  implicitelyTokenizedParses = self->_implicitelyTokenizedParses;
  self->_implicitelyTokenizedParses = v5;

  BOOL baseParseCouldHaveResults = self->_baseParseCouldHaveResults;
  self->_implicitlyTokenizedParsesCouldHaveResults = baseParseCouldHaveResults;
  if (!baseParseCouldHaveResults)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    uint64_t v8 = [(NSArray *)self->_implicitelyTokenizedParses firstObject];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__PSIQuery_processImplicitTokenization__block_invoke;
    v9[3] = &unk_1E58690E8;
    v9[4] = self;
    v9[5] = &buf;
    [v8 enumerateTokensUsingBlock:v9];

    self->_implicitlyTokenizedParsesCouldHaveResults = *(unsigned char *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
}

void __39__PSIQuery_processImplicitTokenization__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 belongsToSearchText]
    && ![*(id *)(a1 + 32) _idsOfGroupsMatchingToken:v6])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)bootstrap
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_queryTokens;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v12 = -[PSIQuery _idsOfGroupsMatchingToken:](self, "_idsOfGroupsMatchingToken:", v11, (void)v16);
        if ([v11 isTextSearchable])
        {
          [v3 addObject:v11];
          if (!v12) {
            v9 &= [v11 isFilterTypeToken];
          }
        }
        else if (v12)
        {
          [(NSArray *)v4 addObject:v11];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  uint64_t v13 = [[PSIParse alloc] initWithTokens:v3 fromString:self->_searchText];
  baseParse = self->_baseParse;
  self->_baseParse = v13;

  self->_BOOL baseParseCouldHaveResults = v9 & 1;
  identifierTokens = self->_identifierTokens;
  self->_identifierTokens = v4;
}

- (PSITokenizer)tokenizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained tokenizer];

  return (PSITokenizer *)v3;
}

- (__CFSet)_idsOfGroupsMatchingToken:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 wordEmbeddingMatch];
    int v9 = [v8 word];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v4 resolvedText];
    }
    id v7 = v11;
  }
  char v12 = [v4 searchedCategories];
  uint64_t v13 = -[PSIQuery _idsOfGroupsMatchingString:categories:textIsSearchable:isFilterTypeToken:](self, "_idsOfGroupsMatchingString:categories:textIsSearchable:isFilterTypeToken:", v7, v12, v6 == 0, [v4 isFilterTypeToken]);

  return v13;
}

- (__CFSet)_idsOfGroupsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5 isFilterTypeToken:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  char v12 = @"ID::%@";
  if (v7) {
    char v12 = @"TEXT::%@";
  }
  if (v6) {
    uint64_t v13 = @"FILTER TOKEN::%@";
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v10);
  uint64_t v15 = [(NSMutableDictionary *)self->_groupIdsByTokenKey objectForKeyedSubscript:v14];

  if (!v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v15 = (void *)[WeakRetained groupIdsMatchingString:v10 categories:v11 textIsSearchable:v7];

    if (!v15) {
      goto LABEL_12;
    }
    [(NSMutableDictionary *)self->_groupIdsByTokenKey setObject:v15 forKeyedSubscript:v14];
  }
  if (!CFSetGetCount((CFSetRef)v15) || [(PSIQuery *)self isCanceled]) {
    uint64_t v15 = 0;
  }
LABEL_12:

  return (__CFSet *)v15;
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCanceled);
  return v2 & 1;
}

- (void)cancel
{
}

- (void)runWithResultsHandler:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v6 = a3;
  }
  else {
    id v6 = &__block_literal_global_37320;
  }
  BOOL v7 = (void (**)(void, void))MEMORY[0x19F38D650](v6, a2);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v9 = atomic_exchange((atomic_uchar *volatile)&self->_didStart, 1u);
  if ((v9 & 1) != 0 || [(PSIQuery *)self isCanceled] || !WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      if (v9) {
        id v10 = @"yes";
      }
      else {
        id v10 = @"no";
      }
      int v12 = 138413058;
      if ([(PSIQuery *)self isCanceled]) {
        id v11 = @"yes";
      }
      else {
        id v11 = @"no";
      }
      uint64_t v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      long long v17 = v11;
      __int16 v18 = 2112;
      id v19 = WeakRetained;
      _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search Query: will NOT execute search query: %@, hadAlreadyStarted = %@, isCancelled = %@, delegate = %@", (uint8_t *)&v12, 0x2Au);
    }
    v7[2](v7, MEMORY[0x1E4F1CBF0]);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = self;
      _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Photos Search Query: will execute search query: %@", (uint8_t *)&v12, 0xCu);
    }
    [WeakRetained executeQuery:self disableWildcardMatchesForUserControlledCategories:v4 resultsHandler:v7];
  }
}

- (BOOL)implicitTokenizationIncludeBaseParseResults
{
  return [(NSArray *)self->_implicitelyTokenizedParses count] != 0;
}

+ (id)searchResultFromArrayOfGroupArrays:(id)a3 searchTokens:(id)a4 searchResultTypes:(unint64_t)a5 suggestionType:(unint64_t)a6 scopedSearchIdentifiers:(id)a7 normalizedSearchText:(id)a8 enableExactMatchPrioritization:(BOOL)a9 includeAllQueryMatchedGroups:(BOOL)a10 includeAllFruitfulMatchedGroups:(BOOL)a11 suggestionLimit:(unint64_t)a12 query:(id)a13 delegate:(id)a14
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v82 = a4;
  id v83 = a7;
  id v81 = a8;
  id v21 = a13;
  id v22 = a14;
  if ([v20 count])
  {
    if (v22) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v75 = [MEMORY[0x1E4F28B00] currentHandler];
    [v75 handleFailureInMethod:a2, a1, @"PSIQuery.m", 1253, @"Invalid parameter not satisfying: %@", @"arrayOfGroupArrays.count > 0" object file lineNumber description];

    if (v22) {
      goto LABEL_3;
    }
  }
  id v76 = [MEMORY[0x1E4F28B00] currentHandler];
  [v76 handleFailureInMethod:a2, a1, @"PSIQuery.m", 1254, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  uint64_t v23 = +[PLScopedSearchUtilities filterArrayOfGroupsArraysForEqualMatchType:v20 searchTokens:v82];
  if (![v23 count])
  {
    id v24 = objc_alloc_init(PLSearchResultV2);
    goto LABEL_105;
  }
  uint64_t v117 = 0;
  uint64_t v118 = &v117;
  uint64_t v119 = 0x2020000000;
  uint64_t v120 = 0;
  uint64_t v113 = 0;
  id v114 = &v113;
  uint64_t v115 = 0x2020000000;
  uint64_t v116 = 0;
  uint64_t v107 = 0;
  char v108 = &v107;
  uint64_t v109 = 0x3032000000;
  long long v110 = __Block_byref_object_copy__37280;
  long long v111 = __Block_byref_object_dispose__37281;
  id v112 = 0;
  uint64_t v101 = 0;
  uint64_t v102 = &v101;
  uint64_t v103 = 0x3032000000;
  uint64_t v104 = __Block_byref_object_copy__37280;
  char v105 = __Block_byref_object_dispose__37281;
  id v106 = 0;
  if (![v83 count])
  {
LABEL_9:
    if ((~(_BYTE)a5 & 3) != 0) {
      id v25 = @"assets";
    }
    else {
      id v25 = @"assets & collections";
    }
    uint64_t v26 = @"collections";
    if ((a5 & 2) == 0) {
      uint64_t v26 = &stru_1EEB2EB80;
    }
    if (a5) {
      id v27 = v25;
    }
    else {
      id v27 = v26;
    }
    if (a6 == 2) {
      id v28 = @"next term";
    }
    else {
      id v28 = @"none";
    }
    uint64_t v29 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v83 count];
      BOOL v31 = @"completion";
      *(_DWORD *)long long buf = 138413314;
      if (a6 != 1) {
        BOOL v31 = v28;
      }
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      id v126 = v27;
      __int16 v127 = 2112;
      v128 = v31;
      __int16 v129 = 2048;
      uint64_t v130 = v30;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_INFO, "Generating search result from group arrays: %@ for query: %@ with search result types:%@ suggestion type: %@ and %llu scoped identifiers", buf, 0x34u);
    }

    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    id v126 = 0;
    uint64_t v96 = 0;
    uint64_t v97 = &v96;
    uint64_t v98 = 0x2020000000;
    uint64_t v99 = 0;
    if (a6) {
      BOOL v32 = a12 == 0;
    }
    else {
      BOOL v32 = 1;
    }
    uint64_t v33 = !v32;
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v78 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if ((a5 & 1) != 0 && ([v21 isCanceled] & 1) == 0)
    {
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_136;
      v90[3] = &unk_1E5869358;
      BOOL v95 = a9;
      uint64_t v93 = &v117;
      char v94 = buf;
      id v91 = v77;
      id v92 = v78;
      +[PLScopedSearchUtilities intersectGroups:v23 searchResultTypes:1 shouldGenerateCompletionCandidates:v33 query:v21 completion:v90];
    }
    if ((a5 & 2) != 0 && ([v21 isCanceled] & 1) == 0)
    {
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_2;
      v84[3] = &unk_1E5869358;
      BOOL v89 = a9;
      uint64_t v87 = &v113;
      v88 = &v96;
      id v85 = v77;
      id v86 = v78;
      +[PLScopedSearchUtilities intersectGroups:v23 searchResultTypes:2 shouldGenerateCompletionCandidates:v33 query:v21 completion:v84];
    }
    if (a6 == 1)
    {
      if (([v21 isCanceled] & 1) == 0)
      {
        PLPhotosSearchGetLog();
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v35 = os_signpost_id_generate(v34);

        id v36 = v34;
        uint64_t v37 = v36;
        unint64_t v38 = v35 - 1;
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
        {
          *(_WORD *)uint64_t v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "PLSearchCompletionSuggestionsSignpost", "", v121, 2u);
        }

        uint64_t v39 = [v81 length];
        if (a12 && v39)
        {
          uint64_t v80 = +[PLScopedSearchSuggestionGeneration generateCompletionSuggestionsFromGroups:v77 queryMatchedScopedAssetIds:*(void *)(*(void *)&buf[8] + 24) queryMatchedScopedCollectionIds:v97[3] searchResultTypes:a5 normalizedSearchText:v81 delegate:v22];
          os_signpost_id_t v40 = v35;
        }
        else
        {
          BOOL v51 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v121 = 138412546;
            uint64_t v122 = (uint64_t)a1;
            __int16 v123 = 2048;
            unint64_t v124 = a12;
            _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_INFO, "No completions generated for query: %@ with maximum suggestion count: %lu, will not attempt to generate completion candidates", v121, 0x16u);
          }

          os_signpost_id_t v40 = v35;
          uint64_t v80 = (void *)MEMORY[0x1E4F1CC08];
        }
        id v52 = v37;
        long long v47 = v52;
        if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
        {
          *(_WORD *)uint64_t v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v47, OS_SIGNPOST_INTERVAL_END, v40, "PLSearchCompletionSuggestionsSignpost", "", v121, 2u);
        }

        id v48 = PLSearchBackendQueryGetLog();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
          goto LABEL_65;
        }
        uint64_t v53 = [v80 count];
        *(_DWORD *)uint64_t v121 = 134218242;
        uint64_t v122 = v53;
        __int16 v123 = 2112;
        unint64_t v124 = (unint64_t)a1;
        id v50 = "Generated %llu completion suggestions for query: %@";
LABEL_64:
        _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_INFO, v50, v121, 0x16u);
LABEL_65:

LABEL_66:
        uint64_t v41 = [v80 count];
        goto LABEL_67;
      }
    }
    else
    {
      uint64_t v80 = 0;
      if (a6 != 2 || !a12) {
        goto LABEL_66;
      }
      if (([v21 isCanceled] & 1) == 0)
      {
        PLPhotosSearchGetLog();
        uint64_t v42 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v43 = os_signpost_id_generate(v42);

        long long v44 = v42;
        uint64_t v45 = v44;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
        {
          *(_WORD *)uint64_t v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v43, "PLSearchNextTokenSuggestionsSignpost", "", v121, 2u);
        }

        uint64_t v80 = +[PLScopedSearchSuggestionGeneration generateNextTermSuggestionsForQueryMatchedScopedAssetIds:*(void *)(*(void *)&buf[8] + 24) queryMatchedScopedCollectionIds:v97[3] searchResultTypes:a5 delegate:v22];
        uint64_t v46 = v45;
        long long v47 = v46;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          *(_WORD *)uint64_t v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v47, OS_SIGNPOST_INTERVAL_END, v43, "PLSearchNextTokenSuggestionsSignpost", "", v121, 2u);
        }

        id v48 = PLSearchBackendQueryGetLog();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
          goto LABEL_65;
        }
        uint64_t v49 = [v80 count];
        *(_DWORD *)uint64_t v121 = 134218242;
        uint64_t v122 = v49;
        __int16 v123 = 2112;
        unint64_t v124 = (unint64_t)a1;
        id v50 = "Generated %llu next term suggestions for query: %@";
        goto LABEL_64;
      }
    }
    uint64_t v80 = 0;
    uint64_t v41 = [0 count];
LABEL_67:
    if (v41 && ([v21 isCanceled] & 1) == 0)
    {
      PLPhotosSearchGetLog();
      BOOL v55 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v56 = os_signpost_id_generate(v55);

      long long v57 = v55;
      id v58 = v57;
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)uint64_t v121 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PLSearchSuggestionRankingSignpost", "", v121, 2u);
      }

      CFArrayRef v59 = *(const __CFArray **)(*(void *)&buf[8] + 24);
      if (v59) {
        CFIndex Count = CFArrayGetCount(v59);
      }
      else {
        CFIndex Count = 0;
      }
      CFArrayRef v61 = (const __CFArray *)v97[3];
      if (v61) {
        CFIndex v62 = CFArrayGetCount(v61);
      }
      else {
        CFIndex v62 = 0;
      }
      unint64_t v54 = +[PLScopedSearchSuggestionGeneration rankedSuggestionsFromSuggestionCandidates:v80 suggestionType:a6 queryAssetCount:Count queryCollectionCount:v62 suggestionLimit:a12];
      uint64_t v63 = v58;
      long long v64 = v63;
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        *(_WORD *)uint64_t v121 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v64, OS_SIGNPOST_INTERVAL_END, v56, "PLSearchSuggestionRankingSignpost", "", v121, 2u);
      }
    }
    else
    {
      unint64_t v54 = 0;
    }
    uint64_t v65 = objc_alloc_init(PLSearchResultV2);
    if ([v21 isCanceled])
    {
      id v24 = v65;
LABEL_95:
      id v70 = *(const void **)(*(void *)&buf[8] + 24);
      if (v70)
      {
        CFRelease(v70);
        *(void *)(*(void *)&buf[8] + 24) = 0;
      }
      id v71 = (const void *)v118[3];
      if (v71)
      {
        CFRelease(v71);
        v118[3] = 0;
      }
      id v72 = (const void *)v97[3];
      if (v72)
      {
        CFRelease(v72);
        v97[3] = 0;
      }
      v73 = (const void *)v114[3];
      if (v73)
      {
        CFRelease(v73);
        v114[3] = 0;
      }

      _Block_object_dispose(&v96, 8);
      _Block_object_dispose(buf, 8);
      goto LABEL_104;
    }
    if (a5)
    {
      long long v66 = +[PLScopedSearchUtilities UUIDsFromSearchIndexIds:*(void *)(*(void *)&buf[8] + 24) searchIndexIdsToUUIDs:v108[5] searchResultType:1 delegate:v22];
      if ((a5 & 2) == 0) {
        goto LABEL_87;
      }
    }
    else
    {
      long long v66 = (void *)MEMORY[0x1E4F1CBF0];
      if ((a5 & 2) == 0)
      {
LABEL_87:
        long long v67 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_90:
        id v24 = [[PLSearchResultV2 alloc] initWithAssetUUIDs:v66 collectionUUIDs:v67 suggestions:v54];

        if (a11)
        {
          objc_super v68 = +[PLScopedSearchUtilities generateFruitfulMatchedGroupsFromAllMatchedGroups:v78 queryMatchedScopedAssetUUIDs:v66 queryMatchedScopedCollectionUUIDs:v67 searchResultTypes:a5 delegate:v22];
          [(PLSearchResultV2 *)v24 setAllFruitfulScopedQueryMatchedGroups:v68];
        }
        if (a10)
        {
          id v69 = +[PLScopedSearchUtilities groupDictionariesFromArrayOfGroupsArrays:v23];
          [(PLSearchResultV2 *)v24 setAllQueryMatchedGroups:v69];
        }
        goto LABEL_95;
      }
    }
    long long v67 = +[PLScopedSearchUtilities UUIDsFromSearchIndexIds:v97[3] searchIndexIdsToUUIDs:v102[5] searchResultType:2 delegate:v22];
    goto LABEL_90;
  }
  if (![v21 isCanceled])
  {
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke;
    v100[3] = &unk_1E5869330;
    v100[4] = &v117;
    v100[5] = &v113;
    v100[6] = &v107;
    v100[7] = &v101;
    +[PLScopedSearchUtilities searchIndexIdsFromUUIDs:v83 searchResultTypes:a5 psiDatabase:v22 completion:v100];
    goto LABEL_9;
  }
  id v24 = objc_alloc_init(PLSearchResultV2);
LABEL_104:
  _Block_object_dispose(&v101, 8);

  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v117, 8);
LABEL_105:

  return v24;
}

void __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  uint64_t v11 = *(void *)(a1[6] + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v15 = v9;

  uint64_t v13 = *(void *)(a1[7] + 8);
  __int16 v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
}

void __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_136(uint64_t a1, const void *a2, const __CFArray *a3, void *a4, void *a5)
{
  CFArrayRef v6 = a3;
  BOOL v7 = a2;
  CFArrayRef v13 = a3;
  __int16 v14 = a2;
  id v9 = a4;
  id v10 = a5;
  if (v6)
  {
    CFIndex Count = CFArrayGetCount(v6);
    LOBYTE(v12) = 1;
    if (*(unsigned char *)(a1 + 64) && Count) {
      int v12 = !+[PLScopedSearchUtilities shouldUseExactMatchResultsForGroups:v10];
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (v12)
    {
      +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v14);
      BOOL v7 = v14;
      goto LABEL_10;
    }
    +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v13);
    CFArrayRef v6 = v13;
  }
  else if (v12)
  {
LABEL_10:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
    if (v6)
    {
      CFRelease(v6);
      CFArrayRef v13 = 0;
    }
    goto LABEL_15;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
  if (v7)
  {
    CFRelease(v7);
    __int16 v14 = 0;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", v9, v13, v14);
  [*(id *)(a1 + 40) unionSet:v10];
}

void __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_2(uint64_t a1, const void *a2, const __CFArray *a3, void *a4, void *a5)
{
  CFArrayRef v6 = a3;
  BOOL v7 = a2;
  CFArrayRef v13 = a3;
  __int16 v14 = a2;
  id v9 = a4;
  id v10 = a5;
  if (v6)
  {
    CFIndex Count = CFArrayGetCount(v6);
    LOBYTE(v12) = 1;
    if (*(unsigned char *)(a1 + 64) && Count) {
      int v12 = !+[PLScopedSearchUtilities shouldUseExactMatchResultsForGroups:v10];
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (v12)
    {
      +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v14);
      BOOL v7 = v14;
      goto LABEL_10;
    }
    +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v13);
    CFArrayRef v6 = v13;
  }
  else if (v12)
  {
LABEL_10:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
    if (v6)
    {
      CFRelease(v6);
      CFArrayRef v13 = 0;
    }
    goto LABEL_15;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
  if (v7)
  {
    CFRelease(v7);
    __int16 v14 = 0;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", v9, v13, v14);
  [*(id *)(a1 + 40) unionSet:v10];
}

+ (void)_restoreAssetIdsForGroupsInGroupArrays:(id)a3 atRemovalIndexes:(id)a4 groupIdToOriginalAssetIdsMap:(id)a5 searchTokens:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__PSIQuery__restoreAssetIdsForGroupsInGroupArrays_atRemovalIndexes_groupIdToOriginalAssetIdsMap_searchTokens___block_invoke;
  v12[3] = &unk_1E5873A00;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a4 enumerateIndexesUsingBlock:v12];
}

void __110__PSIQuery__restoreAssetIdsForGroupsInGroupArrays_atRemovalIndexes_groupIdToOriginalAssetIdsMap_searchTokens___block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if ([*(id *)(a1 + 32) count] <= a2) {
    *a3 = 1;
  }
  id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  if ([v10 count] != 1) {
    *a3 = 1;
  }
  CFArrayRef v6 = [v10 objectAtIndexedSubscript:0];
  BOOL v7 = *(void **)(a1 + 40);
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "groupId"));
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9) {
    *a3 = 1;
  }
  [v6 setAssetIds:v9];
}

+ (id)_indexesOfFilterTokensInSearchTokens:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __49__PSIQuery__indexesOfFilterTokensInSearchTokens___block_invoke;
  int v12 = &unk_1E5869308;
  id v13 = v3;
  id v14 = v4;
  id v5 = v4;
  id v6 = v3;
  [v6 enumerateObjectsUsingBlock:&v9];
  BOOL v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

void __49__PSIQuery__indexesOfFilterTokensInSearchTokens___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 isFilterTypeToken]) {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

+ (id)_indexesToRemoveForDuplicatedFilterGroupsinGroupArrays:(id)a3 searchTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (![v6 count]) {
    goto LABEL_15;
  }
  unint64_t v8 = 0;
  do
  {
    if (![v6 count]) {
      goto LABEL_14;
    }
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      id v11 = [v6 objectAtIndexedSubscript:v9];
      if ([v10 isFilterTypeToken])
      {
        if (([v11 isFilterTypeToken] & 1) == 0) {
          break;
        }
      }
LABEL_11:

      if (++v9 >= (unint64_t)[v6 count]) {
        goto LABEL_14;
      }
    }
    int v12 = [v5 objectAtIndexedSubscript:v9];
    id v13 = [v5 objectAtIndexedSubscript:v8];
    if ([v13 count] == 1)
    {
      id v14 = [v13 firstObject];
      if ([v12 containsObject:v14]) {
        [v7 addIndex:v8];
      }

      goto LABEL_11;
    }

LABEL_14:
    ++v8;
  }
  while (v8 < [v6 count]);
LABEL_15:
  id v15 = (void *)[v7 copy];

  return v15;
}

+ (void)_aggregateAssetIdsOnFilterGroupsInGroupArrays:(id)a3 searchTokens:(id)a4 groupIdToOriginalAssetIdsMap:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    CFArrayRef Mutable = CFArrayCreateMutable(0, 0, 0);
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __100__PSIQuery__aggregateAssetIdsOnFilterGroupsInGroupArrays_searchTokens_groupIdToOriginalAssetIdsMap___block_invoke;
    v29[3] = &unk_1E58692E0;
    id v23 = v8;
    id v30 = v8;
    id v24 = v7;
    id v31 = v7;
    CFArrayRef v33 = Mutable;
    id v12 = v10;
    id v32 = v12;
    [v30 enumerateObjectsUsingBlock:v29];
    v36.NSUInteger length = CFArrayGetCount(Mutable);
    v36.NSUInteger location = 0;
    CFArraySortValues(Mutable, v36, (CFComparatorFunction)PSIRowIDCompare_37396, 0);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
          id v20 = [v11 objectForKeyedSubscript:v19];

          if (!v20)
          {
            id v21 = objc_msgSend((id)objc_msgSend(v18, "assetIds"), "copy");
            id v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
            [v11 setObject:v21 forKeyedSubscript:v22];
          }
          [v18 setAssetIds:Mutable];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v15);
    }

    *a5 = (id)[v11 copy];
    CFRelease(Mutable);

    id v8 = v23;
    id v7 = v24;
  }
}

void __100__PSIQuery__aggregateAssetIdsOnFilterGroupsInGroupArrays_searchTokens_groupIdToOriginalAssetIdsMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if ([v12 isFilterTypeToken])
  {
    id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    if ([v7 count] != 1) {
      *a4 = 1;
    }
    id v8 = [v7 firstObject];
    CFIndex Count = CFArrayGetCount((CFArrayRef)[v8 assetIds]);
    uint64_t v10 = *(__CFArray **)(a1 + 56);
    CFArrayRef v11 = (const __CFArray *)[v8 assetIds];
    v14.NSUInteger location = 0;
    v14.NSUInteger length = Count;
    CFArrayAppendArray(v10, v11, v14);
    [*(id *)(a1 + 48) addObject:v8];
  }
}

+ (BOOL)_shouldApplyFilterTokensForGroupArrays:(id)a3 searchTokens:(id)a4 filterGroupIds:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PSIQuery__shouldApplyFilterTokensForGroupArrays_searchTokens_filterGroupIds___block_invoke;
  v14[3] = &unk_1E58692B8;
  id v10 = v7;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  __int16 v18 = &v19;
  [v11 enumerateObjectsUsingBlock:v14];
  LOBYTE(v9) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v9;
}

void __79__PSIQuery__shouldApplyFilterTokensForGroupArrays_searchTokens_filterGroupIds___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (([a2 isFilterTypeToken] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) count] <= a3)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 134218498;
        unint64_t v15 = a3;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempted to access a group at out of bounds index: %lu from group arrays: %@, for search: %@", buf, 0x20u);
      }
      *a4 = 1;
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
      if ([v13 count] == 1)
      {
        id v7 = [v13 firstObject];
        uint64_t v8 = [v7 groupId];

        id v9 = *(void **)(a1 + 48);
        id v10 = [NSNumber numberWithUnsignedLongLong:v8];
        LODWORD(v9) = [v9 containsObject:v10];

        if (v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }
}

+ (void)bootstrap
{
  id v2 = (id)[MEMORY[0x1E4F79BC0] defaultManager];
}

@end