@interface ICSearchQueryOperation
+ (NSOperationQueue)searchSuggestionsQueue;
+ (id)exactMatchingQueryStringForTitleSearchString:(id)a3;
+ (id)fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs:(id)a3 context:(id)a4;
+ (id)fuzzyMatchingQueryStringForSearchString:(id)a3;
+ (id)highlightStringForAttributedInputs:(id)a3;
+ (id)newOperationQueueWithName:(id)a3;
+ (id)nlpSerialQueue;
+ (id)prefixMatchingQueryStringForSearchString:(id)a3;
+ (id)prefixMatchingQueryStringTitleForSearchString:(id)a3;
+ (id)searchableItemsFromSortableItems:(id)a3;
+ (id)substringMatchingQueryStringForSearchString:(id)a3;
+ (id)tokensQueryStringFromTokens:(id)a3;
+ (void)initialize;
+ (void)nlSearchQueryWithSearchString:(id)a3 queryString:(id *)a4 rankingQueries:(id *)a5 highlightString:(id *)a6;
+ (void)nlpParser;
+ (void)suggestionSearchResultsWithLinkSuggestionQuery:(ICLinkSuggestionQuery *)a3 completionHandler:(id)a4;
- (BOOL)allowEmptySearchString;
- (BOOL)modernResultsOnly;
- (BOOL)performNLSearch;
- (BOOL)performTopHitSearch;
- (BOOL)useSearchSuggestions;
- (ICSearchQuery)defaultQuery;
- (ICSearchQuery)fuzzyQuery;
- (ICSearchQuery)nlQuery;
- (ICSearchQuery)spellingQuery;
- (ICSearchQuery)substringQuery;
- (ICSearchQuery)topHitQuery;
- (ICSearchQueryOperation)init;
- (ICSearchQueryOperation)initWithLinkSuggestionQuery:(id)a3;
- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4;
- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 attributes:(id)a5;
- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 performTopHitSearch:(BOOL)a5 modernResultsOnly:(BOOL)a6;
- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 performTopHitSearch:(BOOL)a5 modernResultsOnly:(BOOL)a6 attributes:(id)a7;
- (ICSearchQueryOperation)initWithSearchSuggestionsResponder:(id)a3 searchString:(id)a4 performNLSearch:(BOOL)a5 performTopHitSearch:(BOOL)a6 tokens:(id)a7 modernResultsOnly:(BOOL)a8;
- (ICSearchSuggestionsResponder)searchSuggestionsResponder;
- (NSArray)searchTokens;
- (NSError)error;
- (NSMutableArray)relatedWordQueries;
- (NSMutableArray)results;
- (NSMutableDictionary)resultsDictionary;
- (NSMutableDictionary)uniqueIdentifiersOfAttachmentsFoundInNotes;
- (NSString)keyboardLanguage;
- (NSString)searchString;
- (NSString)tokensQueryString;
- (id)createPrefixMatchingQuery;
- (id)foundItemsHandler;
- (id)jointQueryWithSuggestions:(id)a3;
- (id)retrieveNotesOfFoundAttachmentsForSearchResults:(id)a3;
- (id)runICSearchQuery:(id)a3;
- (int64_t)requestIndex;
- (unint64_t)countOfNonSpaceCharsInSearchString;
- (unint64_t)rankingStrategy;
- (void)appendSortableSearchableItemsToResults:(id)a3;
- (void)cancel;
- (void)main;
- (void)performPrefixAndFuzzyAndSubstringQueries;
- (void)performRelatedWordQueriesIfNeeded;
- (void)performSpellCheckerAPIQueryIfNeeded;
- (void)performTopHitSearchQuery;
- (void)processTopHits:(id)a3;
- (void)setDefaultQuery:(id)a3;
- (void)setError:(id)a3;
- (void)setFoundItemsHandler:(id)a3;
- (void)setFuzzyQuery:(id)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setModernResultsOnly:(BOOL)a3;
- (void)setNlQuery:(id)a3;
- (void)setPerformNLSearch:(BOOL)a3;
- (void)setPerformTopHitSearch:(BOOL)a3;
- (void)setRankingStrategy:(unint64_t)a3;
- (void)setRelatedWordQueries:(id)a3;
- (void)setRequestIndex:(int64_t)a3;
- (void)setResults:(id)a3;
- (void)setResultsDictionary:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchSuggestionsResponder:(id)a3;
- (void)setSpellingQuery:(id)a3;
- (void)setSubstringQuery:(id)a3;
- (void)setTokensQueryString:(id)a3;
- (void)setTopHitQuery:(id)a3;
- (void)setUniqueIdentifiersOfAttachmentsFoundInNotes:(id)a3;
@end

@implementation ICSearchQueryOperation

- (ICSearchQueryOperation)init
{
  return 0;
}

- (ICSearchQueryOperation)initWithSearchSuggestionsResponder:(id)a3 searchString:(id)a4 performNLSearch:(BOOL)a5 performTopHitSearch:(BOOL)a6 tokens:(id)a7 modernResultsOnly:(BOOL)a8
{
  id v15 = a3;
  v16 = (__CFString *)a4;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ICSearchQueryOperation;
  v18 = [(ICSearchQueryOperation *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchSuggestionsResponder, a3);
    if (v16) {
      v20 = v16;
    }
    else {
      v20 = &stru_1F1F2FFF8;
    }
    objc_storeStrong((id *)&v19->_searchString, v20);
    v19->_performNLSearch = a5;
    v19->_performTopHitSearch = a6;
    objc_storeStrong((id *)&v19->_searchTokens, a7);
    uint64_t v21 = +[ICSearchQueryOperation tokensQueryStringFromTokens:v17];
    tokensQueryString = v19->_tokensQueryString;
    v19->_tokensQueryString = (NSString *)v21;

    v19->_modernResultsOnly = a8;
  }

  return v19;
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 performTopHitSearch:(BOOL)a5 modernResultsOnly:(BOOL)a6
{
  return [(ICSearchQueryOperation *)self initWithQueryString:a3 rankingQueries:a4 performTopHitSearch:a5 modernResultsOnly:a6 attributes:0];
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 performTopHitSearch:(BOOL)a5 modernResultsOnly:(BOOL)a6 attributes:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ICSearchQueryOperation;
  id v15 = [(ICSearchQueryOperation *)&v22 init];
  v16 = v15;
  if (v15)
  {
    searchSuggestionsResponder = v15->_searchSuggestionsResponder;
    v15->_searchSuggestionsResponder = 0;

    v18 = [ICSearchResultsQuery alloc];
    if (v14) {
      uint64_t v19 = [(ICSearchResultsQuery *)v18 initWithQueryString:v12 externalRankingQueries:v13 modernResultsOnly:v8 attributes:v14];
    }
    else {
      uint64_t v19 = [(ICSearchResultsQuery *)v18 initWithQueryString:v12 externalRankingQueries:v13 modernResultsOnly:v8];
    }
    defaultQuery = v16->_defaultQuery;
    v16->_defaultQuery = (ICSearchQuery *)v19;

    v16->_allowEmptySearchString = 1;
    v16->_performTopHitSearch = a5;
  }

  return v16;
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4
{
  return [(ICSearchQueryOperation *)self initWithQueryString:a3 rankingQueries:a4 attributes:0];
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 attributes:(id)a5
{
  return [(ICSearchQueryOperation *)self initWithQueryString:a3 rankingQueries:a4 performTopHitSearch:0 modernResultsOnly:0 attributes:a5];
}

- (ICSearchQueryOperation)initWithLinkSuggestionQuery:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICSearchQueryOperation;
  v6 = [(ICSearchQueryOperation *)&v12 init];
  v7 = v6;
  if (v6)
  {
    searchSuggestionsResponder = v6->_searchSuggestionsResponder;
    v6->_searchSuggestionsResponder = 0;

    objc_storeStrong((id *)&v7->_defaultQuery, a3);
    uint64_t v9 = [v5 queryString];
    searchString = v7->_searchString;
    v7->_searchString = (NSString *)v9;

    v7->_allowEmptySearchString = 0;
    v7->_performTopHitSearch = 0;
    v7->_modernResultsOnly = 1;
  }

  return v7;
}

+ (void)initialize
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ICSearchQueryOperation;
  objc_msgSendSuper2(&v7, sel_initialize);
  if ((id)objc_opt_class() == a1)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v10 = *MEMORY[0x1E4F838B0];
    v11[0] = &unk_1F1F62DB8;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v3 registerDefaults:v4];

    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v8 = *MEMORY[0x1E4F838A8];
    uint64_t v9 = &unk_1F1F628C8;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v5 registerDefaults:v6];
  }
}

- (id)jointQueryWithSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSearchQueryOperation *)self tokensQueryString];
  id v6 = v5;
  if (v4)
  {

    if (v6)
    {
      id v7 = [NSString alloc];
      uint64_t v8 = [(ICSearchQueryOperation *)self tokensQueryString];
      id v6 = (id)[v7 initWithFormat:@"(%@) && (%@)", v8, v4];
    }
    else
    {
      id v6 = v4;
    }
  }

  return v6;
}

- (unint64_t)countOfNonSpaceCharsInSearchString
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(ICSearchQueryOperation *)self searchString];
  v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "length", (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)useSearchSuggestions
{
  if (!+[ICSearchSuggestionsContext supportsSearchSuggestions])return 0; {
  v3 = [(ICSearchQueryOperation *)self searchSuggestionsResponder];
  }
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)createPrefixMatchingQuery
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ICSearchQueryOperation *)self searchString];
  BOOL v4 = [(ICSearchQueryOperation *)self keyboardLanguage];
  id v17 = 0;
  id v5 = +[ICSearchQueryParser prefixMatchingQueryStringForSearchString:v3 enableSpellCheckSPI:1 languageForSpellchecking:v4 expandedTokens:&v17];
  id v6 = v17;

  uint64_t v7 = [(ICSearchQueryOperation *)self jointQueryWithSuggestions:v5];

  unint64_t v8 = [[ICRankingQueriesDefinition alloc] initWithExpandedTokens:v6 rankingQueryType:0 rankingQueryFlags:@"cwd"];
  if ([(ICSearchQueryOperation *)self useSearchSuggestions])
  {
    uint64_t v9 = [ICSearchSuggestionsQuery alloc];
    uint64_t v10 = [(ICSearchQueryOperation *)self searchString];
    v11 = [(ICSearchQueryOperation *)self searchTokens];
    v18[0] = v7;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    BOOL v13 = [(ICSearchQueryOperation *)self modernResultsOnly];
    long long v14 = [(ICSearchQueryOperation *)self searchSuggestionsResponder];
    long long v15 = [(ICSearchSuggestionsQuery *)v9 initWithSearchString:v10 searchTokens:v11 additionalQueries:v12 rankingQueriesDefinition:v8 modernResultsOnly:v13 suggestionsResponder:v14];
  }
  else
  {
    long long v15 = [[ICSearchResultsQuery alloc] initWithQueryString:v7 rankingQueriesDefinition:v8 modernResultsOnly:[(ICSearchQueryOperation *)self modernResultsOnly]];
  }

  return v15;
}

- (ICSearchQuery)defaultQuery
{
  defaultQuery = self->_defaultQuery;
  if (!defaultQuery)
  {
    BOOL v4 = [(ICSearchQueryOperation *)self createPrefixMatchingQuery];
    id v5 = self->_defaultQuery;
    self->_defaultQuery = v4;

    defaultQuery = self->_defaultQuery;
  }
  return defaultQuery;
}

- (ICSearchQuery)fuzzyQuery
{
  fuzzyQuery = self->_fuzzyQuery;
  if (!fuzzyQuery)
  {
    BOOL v4 = objc_opt_class();
    id v5 = [(ICSearchQueryOperation *)self searchString];
    id v6 = [v4 fuzzyMatchingQueryStringForSearchString:v5];

    uint64_t v7 = [(ICSearchQueryOperation *)self jointQueryWithSuggestions:v6];

    unint64_t v8 = [ICRankingQueriesDefinition alloc];
    uint64_t v9 = [(ICSearchQueryOperation *)self searchString];
    uint64_t v10 = [(ICRankingQueriesDefinition *)v8 initWithSearchString:v9 rankingQueryType:1 rankingQueryFlags:@"cwdt"];

    v11 = [[ICSearchResultsQuery alloc] initWithQueryString:v7 rankingQueriesDefinition:v10 modernResultsOnly:[(ICSearchQueryOperation *)self modernResultsOnly]];
    long long v12 = self->_fuzzyQuery;
    self->_fuzzyQuery = &v11->super;

    fuzzyQuery = self->_fuzzyQuery;
  }
  return fuzzyQuery;
}

- (void)performPrefixAndFuzzyAndSubstringQueries
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "%@ was cancelled while substring query is running, or the substring query is force stopped before completion", v2, v3, v4, v5, v6);
}

- (void)performSpellCheckerAPIQueryIfNeeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "%@ was cancelled while mispelling query is running, or the misspelling query is force stopped before completion", v2, v3, v4, v5, v6);
}

- (void)performRelatedWordQueriesIfNeeded
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [v3 BOOLForKey:*MEMORY[0x1E4F838A0]];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v26 = [v5 firstObject];

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    uint8_t v6 = (void *)getNLEmbeddingClass_softClass;
    uint64_t v38 = getNLEmbeddingClass_softClass;
    if (!getNLEmbeddingClass_softClass)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __getNLEmbeddingClass_block_invoke;
      v34[3] = &unk_1E64A45A0;
      v34[4] = &v35;
      __getNLEmbeddingClass_block_invoke((uint64_t)v34);
      uint8_t v6 = (void *)v36[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v35, 8);
    v28 = [v7 wordEmbeddingForLanguage:v26];
    unint64_t v8 = [(ICSearchQueryOperation *)self searchString];
    v27 = [v8 lowercaseString];

    if ([v28 containsString:v27])
    {
      uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v9 doubleForKey:*MEMORY[0x1E4F838B0]];
      double v11 = v10;

      long long v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v13 = [v12 integerForKey:*MEMORY[0x1E4F838A8]];

      long long v14 = [v28 neighborsForString:v27 maximumCount:v13 maximumDistance:0 distanceType:v11];
      long long v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13];
      [(ICSearchQueryOperation *)self setRelatedWordQueries:v15];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = v14;
      uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            v20 = +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", v19, 0, 0, v26);
            uint64_t v21 = [(ICSearchQueryOperation *)self jointQueryWithSuggestions:v20];

            objc_super v22 = [[ICRankingQueriesDefinition alloc] initWithSearchString:v19 rankingQueryType:0 rankingQueryFlags:@"cwdt"];
            v23 = [[ICSearchResultsQuery alloc] initWithQueryString:v21 rankingQueriesDefinition:v22 modernResultsOnly:[(ICSearchQueryOperation *)self modernResultsOnly]];
            objc_super v24 = [(ICSearchQueryOperation *)self relatedWordQueries];
            [v24 addObject:v23];

            id v25 = [(ICSearchQueryOperation *)self runICSearchQuery:v23];
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v16);
      }
    }
  }
}

- (void)performTopHitSearchQuery
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Top Hit Search Query error: %@", v1, 0xCu);
}

- (void)processTopHits:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v21 = v4;
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          double v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
          double v11 = (void *)MEMORY[0x1E4F1C9E8];
          long long v12 = [(ICSearchQueryOperation *)self searchString];
          uint64_t v13 = [(ICSearchQueryOperation *)self keyboardLanguage];
          long long v14 = [v11 highlightInfoForSearchStringWithPrefixMatchInAllFields:v12 language:v13];

          long long v15 = [[ICSortableSearchableItem alloc] initWithSearchableItem:v10 highlightInfo:v14 rankingScore:0 attachmentUniqueIdentifiers:0.0];
          [v5 addObject:v15];
          if ([(ICSortableSearchableItem *)v15 searchResultType] == 1)
          {
            [v22 addObject:v15];
          }
          else
          {
            uint64_t v16 = [(ICSearchQueryOperation *)self resultsDictionary];
            uint64_t v17 = [v10 uniqueIdentifier];
            [v16 setObject:v15 forKeyedSubscript:v17];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }

    v18 = [(ICSearchQueryOperation *)self retrieveNotesOfFoundAttachmentsForSearchResults:v22];
    if (v18) {
      [v5 addObjectsFromArray:v18];
    }
    [(ICSearchQueryOperation *)self appendSortableSearchableItemsToResults:v5];
    uint64_t v19 = [(ICSearchQueryOperation *)self foundItemsHandler];

    if (v19)
    {
      v20 = [(ICSearchQueryOperation *)self foundItemsHandler];
      ((void (**)(void, id, uint64_t))v20)[2](v20, v5, 1);
    }
    id v4 = v21;
  }
}

- (void)appendSortableSearchableItemsToResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        double v10 = [(ICSearchQueryOperation *)self results];
        double v11 = [v9 searchableItem];
        [v10 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)main
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "%@ search string has no non-space chars, and no suggestions is found. Not performing search", v2, v3, v4, v5, v6);
}

- (id)retrieveNotesOfFoundAttachmentsForSearchResults:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  v64 = v4;
  v74 = self;
  if ([v4 count])
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v84 != v8) {
            objc_enumerationMutation(obj);
          }
          double v10 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          double v11 = [v10 searchableItem];
          long long v12 = [v11 attributeSet];

          if (objc_msgSend(v12, "ic_searchResultType") == 1)
          {
            long long v13 = objc_msgSend(v12, "ic_relatedModernNoteUniqueIdentifier");
            objc_msgSend(v5, "ic_addNonNilObject:", v13);
            long long v14 = [v10 searchableItem];
            long long v15 = [v14 uniqueIdentifier];

            if (v13)
            {
              [(ICSearchQueryOperation *)self uniqueIdentifiersOfAttachmentsFoundInNotes];
              uint64_t v17 = v16 = self;
              v18 = [v17 objectForKeyedSubscript:v13];

              if (v18)
              {
                objc_msgSend(v18, "ic_addNonNilObject:", v15);
              }
              else
              {
                v18 = [MEMORY[0x1E4F1CA48] array];
                objc_msgSend(v18, "ic_addNonNilObject:", v15);
                uint64_t v19 = [(ICSearchQueryOperation *)v16 uniqueIdentifiersOfAttachmentsFoundInNotes];
                objc_msgSend(v19, "ic_setNonNilObject:forNonNilKey:", v18, v13);
              }
              self = v74;
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v7);
    }
  }
  v65 = v5;
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  id v21 = [(ICSearchQueryOperation *)self resultsDictionary];
  id v22 = [v21 allKeys];
  v23 = [v20 setWithArray:v22];
  [v65 minusSet:v23];

  long long v24 = v65;
  if ([v65 count])
  {
    long long v25 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchQueryOperation retrieveNotesOfFoundAttachmentsForSearchResults:]();
    }

    long long v26 = +[ICNoteContext sharedContext];
    uint64_t v27 = [v26 workerManagedObjectContext];

    v28 = [v65 array];
    v63 = (void *)v27;
    uint64_t v29 = +[ICSearchQueryOperation fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs:v28 context:v27];

    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v29 count])
    {
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v62 = v29;
      id v68 = v29;
      uint64_t v70 = [v68 countByEnumeratingWithState:&v79 objects:v88 count:16];
      if (!v70) {
        goto LABEL_42;
      }
      uint64_t v31 = *(void *)v80;
      long long v32 = &off_1E64A3000;
      uint64_t v66 = *(void *)v80;
      id v67 = v30;
      while (1)
      {
        for (uint64_t j = 0; j != v70; ++j)
        {
          if (*(void *)v80 != v31) {
            objc_enumerationMutation(v68);
          }
          v34 = *(void **)(*((void *)&v79 + 1) + 8 * j);
          uint64_t v35 = [(ICSearchQueryOperation *)self uniqueIdentifiersOfAttachmentsFoundInNotes];
          v36 = [v34 uniqueIdentifier];
          uint64_t v37 = [v35 objectForKeyedSubscript:v36];

          double v38 = 0.0;
          id obja = v37;
          if (!v37) {
            goto LABEL_39;
          }
          uint64_t v71 = j;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v39 = v37;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v75 objects:v87 count:16];
          if (!v40)
          {

LABEL_39:
            v55 = (void *)MEMORY[0x1E4F1C9E8];
            v56 = [(ICSearchQueryOperation *)self searchString];
            v57 = [(ICSearchQueryOperation *)self keyboardLanguage];
            v42 = [v55 highlightInfoForSearchStringWithPrefixMatchInAllFields:v56 language:v57];

            goto LABEL_40;
          }
          uint64_t v41 = v40;
          v69 = v34;
          v42 = 0;
          uint64_t v43 = *(void *)v76;
          do
          {
            uint64_t v44 = 0;
            v45 = v42;
            do
            {
              if (*(void *)v76 != v43) {
                objc_enumerationMutation(v39);
              }
              uint64_t v46 = *(void *)(*((void *)&v75 + 1) + 8 * v44);
              v47 = [(ICSearchQueryOperation *)self resultsDictionary];
              v48 = [v47 objectForKeyedSubscript:v46];
              [v48 rankingScore];
              double v50 = v49;

              if (v38 < v50) {
                double v38 = v50;
              }
              v51 = (void *)MEMORY[0x1E4F1C9E8];
              v52 = [(ICSearchQueryOperation *)self resultsDictionary];
              v53 = [v52 objectForKeyedSubscript:v46];
              v54 = [v53 highlightInfo];
              v42 = [v51 mergeHighlightInfo:v45 withHighlighInfo:v54];

              self = v74;
              ++v44;
              v45 = v42;
            }
            while (v41 != v44);
            uint64_t v41 = [v39 countByEnumeratingWithState:&v75 objects:v87 count:16];
          }
          while (v41);

          uint64_t v31 = v66;
          id v30 = v67;
          long long v32 = &off_1E64A3000;
          uint64_t j = v71;
          v34 = v69;
          if (!v42) {
            goto LABEL_39;
          }
LABEL_40:
          v58 = (void *)[objc_alloc((Class)v32[297]) initWithSearchableItem:v34 highlightInfo:v42 rankingScore:obja attachmentUniqueIdentifiers:v38];
          v59 = [(ICSearchQueryOperation *)self resultsDictionary];
          v60 = [v34 uniqueIdentifier];
          [v59 setObject:v58 forKeyedSubscript:v60];

          [v30 addObject:v58];
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v79 objects:v88 count:16];
        if (!v70)
        {
LABEL_42:

          uint64_t v29 = v62;
          break;
        }
      }
    }

    long long v24 = v65;
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (id)runICSearchQuery:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchQueryOperation runICSearchQuery:]();
    }
    goto LABEL_11;
  }
  if ([(ICSearchQueryOperation *)self isCancelled])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchQueryOperation runICSearchQuery:]();
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  [v4 run:0];
  if (([v4 wasForceStopped] & 1) != 0
    || [(ICSearchQueryOperation *)self isCancelled])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchQueryOperation runICSearchQuery:]();
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    uint64_t v8 = ICDynamicCast();
    uint64_t v9 = [v8 topHits];
    [(ICSearchQueryOperation *)self processTopHits:v9];
  }
  double v10 = [v4 queryResults];
  double v11 = (void *)MEMORY[0x1E4F1CA80];
  long long v12 = [v10 allKeys];
  long long v13 = [v11 setWithArray:v12];

  long long v14 = (void *)MEMORY[0x1E4F1CAD0];
  long long v15 = [(ICSearchQueryOperation *)self resultsDictionary];
  uint64_t v16 = [v15 allKeys];
  uint64_t v17 = [v14 setWithArray:v16];

  [v13 minusSet:v17];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __43__ICSearchQueryOperation_runICSearchQuery___block_invoke;
  uint64_t v29 = &unk_1E64A7270;
  uint64_t v5 = v10;
  id v30 = v5;
  id v31 = v4;
  long long v32 = self;
  id v19 = v18;
  id v33 = v19;
  [v13 enumerateObjectsUsingBlock:&v26];
  if (objc_msgSend(v19, "count", v26, v27, v28, v29))
  {
    v20 = [(ICSearchQueryOperation *)self retrieveNotesOfFoundAttachmentsForSearchResults:v19];
    [v19 addObjectsFromArray:v20];
  }
  id v21 = +[ICSortableSearchableItem sortDescriptorsForRankingStrategy:[(ICSearchQueryOperation *)self rankingStrategy]];
  id v22 = [v19 sortedArrayUsingDescriptors:v21];

  [(ICSearchQueryOperation *)self appendSortableSearchableItemsToResults:v22];
  if ([(ICSearchQueryOperation *)self isCancelled])
  {
    v23 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchQueryOperation runICSearchQuery:].cold.4();
    }

    uint64_t v6 = 0;
  }
  else
  {
    long long v24 = [(ICSearchQueryOperation *)self foundItemsHandler];

    if (v24)
    {
      long long v25 = [(ICSearchQueryOperation *)self foundItemsHandler];
      ((void (**)(void, void *, void))v25)[2](v25, v22, 0);
    }
    uint64_t v6 = (void *)[v19 copy];
  }

LABEL_12:
  return v6;
}

void __43__ICSearchQueryOperation_runICSearchQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v14 = [v3 objectForKeyedSubscript:v4];
  uint64_t v5 = [*(id *)(a1 + 40) rankingQueriesDefinition];
  [v5 rankingScoreForSearchableItem:v14];
  double v7 = v6;

  uint64_t v8 = [ICSortableSearchableItem alloc];
  uint64_t v9 = [*(id *)(a1 + 48) searchString];
  double v10 = [*(id *)(a1 + 40) rankingQueriesDefinition];
  double v11 = [*(id *)(a1 + 48) keyboardLanguage];
  long long v12 = [(ICSortableSearchableItem *)v8 initWithSearchableItem:v14 searchString:v9 rankingQueriesDefinition:v10 rankingScore:0 attachmentUniqueIdentifiers:v11 language:v7];

  long long v13 = [*(id *)(a1 + 48) resultsDictionary];
  [v13 setValue:v12 forKey:v4];

  [*(id *)(a1 + 56) addObject:v12];
}

- (void)cancel
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "%@ cancelling search query", v2, v3, v4, v5, v6);
}

+ (id)prefixMatchingQueryStringForSearchString:(id)a3
{
  return +[ICSearchQueryParser prefixMatchingQueryStringForSearchString:a3 enableSpellCheckSPI:0 languageForSpellchecking:0 expandedTokens:0];
}

+ (id)fuzzyMatchingQueryStringForSearchString:(id)a3
{
  return +[ICSearchQueryParser queryStringForSearchString:a3 queryFields:0 matchType:2];
}

+ (id)substringMatchingQueryStringForSearchString:(id)a3
{
  return +[ICSearchQueryParser queryStringForSearchString:a3 queryFields:0 matchType:3];
}

+ (id)exactMatchingQueryStringForTitleSearchString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = @"_ICItemDisplayName";
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];
  uint8_t v6 = +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", v4, v5, 0, v8, v9);

  return v6;
}

+ (id)prefixMatchingQueryStringTitleForSearchString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = @"_ICItemDisplayName";
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];
  uint8_t v6 = +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", v4, v5, 1, v8, v9);

  return v6;
}

+ (id)nlpSerialQueue
{
  if (nlpSerialQueue_createSerialQueueToken != -1) {
    dispatch_once(&nlpSerialQueue_createSerialQueueToken, &__block_literal_global_38);
  }
  uint64_t v2 = (void *)nlpSerialQueue_nlpQueue;
  return v2;
}

void __40__ICSearchQueryOperation_nlpSerialQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.nlpParser", v2);
  uint64_t v1 = (void *)nlpSerialQueue_nlpQueue;
  nlpSerialQueue_nlpQueue = (uint64_t)v0;
}

+ (void)nlpParser
{
  if (nlpParser_createParserToken != -1) {
    dispatch_once(&nlpParser_createParserToken, &__block_literal_global_84);
  }
  return (void *)nlpParser_nlpParser;
}

void __35__ICSearchQueryOperation_nlpParser__block_invoke()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint8_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  dispatch_queue_t v0 = (uint64_t *)getkNLSearchParserContextIdentifierKeySymbolLoc_ptr;
  uint64_t v8 = (void *)getkNLSearchParserContextIdentifierKeySymbolLoc_ptr;
  if (!getkNLSearchParserContextIdentifierKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)NLPLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kNLSearchParserContextIdentifierKey");
    getkNLSearchParserContextIdentifierKeySymbolLoc_ptr = v6[3];
    dispatch_queue_t v0 = (uint64_t *)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0) {
    goto LABEL_8;
  }
  uint64_t v9 = *v0;
  v10[0] = @"com.apple.Notes";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v5 = 0;
  uint8_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v3 = (uint64_t (*)(void *))getNLSearchParserCreateSymbolLoc_ptr;
  uint64_t v8 = getNLSearchParserCreateSymbolLoc_ptr;
  if (!getNLSearchParserCreateSymbolLoc_ptr)
  {
    id v4 = (void *)NLPLibrary();
    v6[3] = (uint64_t)dlsym(v4, "NLSearchParserCreate");
    getNLSearchParserCreateSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v3 = (uint64_t (*)(void *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v3)
  {
LABEL_8:
    __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
    __break(1u);
  }
  nlpParser_nlpParser = v3(v2);
}

+ (void)nlSearchQueryWithSearchString:(id)a3 queryString:(id *)a4 rankingQueries:(id *)a5 highlightString:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a4) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"queryStringResult != ((void *)0)" functionName:"+[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:]" simulateCrash:1 showAlert:0 format:@"queryStringResult is NULL. It cannot be NULL otherwise we don't have the result returned."];
  }
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__34;
  uint64_t v46 = __Block_byref_object_dispose__34;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__34;
  uint64_t v40 = __Block_byref_object_dispose__34;
  id v41 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__34;
  v34 = __Block_byref_object_dispose__34;
  id v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  double v10 = +[ICSearchQueryOperation nlpSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__ICSearchQueryOperation_nlSearchQueryWithSearchString_queryString_rankingQueries_highlightString___block_invoke;
  block[3] = &unk_1E64A7298;
  id v11 = v9;
  BOOL v25 = a5 != 0;
  id v20 = v11;
  id v21 = &v42;
  id v22 = &v36;
  v23 = &v30;
  long long v24 = &v26;
  dispatch_sync(v10, block);

  if (*((_DWORD *)v27 + 6))
  {
    id v12 = (id)v43[5];
    if (a5)
    {
      long long v13 = [(id)v37[5] keysSortedByValueUsingComparator:&__block_literal_global_95];
      id v14 = (void *)[v13 mutableCopy];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
    id v12 = 0;
  }
  id v15 = v12;
  *a4 = v15;
  *a6 = [a1 highlightStringForAttributedInputs:v31[5]];
  if (a5) {
    *a5 = v14;
  }
  uint64_t v16 = os_log_create("com.apple.notes", "NLP");
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17) {
      +[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:]((uint64_t)v48, [v11 hash], objc_msgSend(v11, "length"));
    }
  }
  else if (v17)
  {
    +[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:]((uint64_t)v48, [v11 hash], objc_msgSend(v11, "length"));
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

void __99__ICSearchQueryOperation_nlSearchQueryWithSearchString_queryString_rankingQueries_highlightString___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[ICSearchQueryOperation nlpParser];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v5 = (void (*)(void *, uint64_t))getNLSearchParserSetStringSymbolLoc_ptr;
    id v33 = getNLSearchParserSetStringSymbolLoc_ptr;
    if (!getNLSearchParserSetStringSymbolLoc_ptr)
    {
      uint8_t v6 = (void *)NLPLibrary();
      v31[3] = (uint64_t)dlsym(v6, "NLSearchParserSetString");
      getNLSearchParserSetStringSymbolLoc_ptr = (_UNKNOWN *)v31[3];
      uint64_t v5 = (void (*)(void *, uint64_t))v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (v5)
    {
      v5(v3, v4);
      if (*(unsigned char *)(a1 + 72)) {
        uint64_t v7 = 14;
      }
      else {
        uint64_t v7 = 12;
      }
      uint64_t v30 = 0;
      id v31 = &v30;
      uint64_t v32 = 0x2020000000;
      uint64_t v8 = (uint64_t (*)(void *, uint64_t, uint64_t))getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr;
      id v33 = getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr;
      if (!getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr)
      {
        id v9 = (void *)NLPLibrary();
        v31[3] = (uint64_t)dlsym(v9, "NLSearchParserCopyParseWithOptions");
        getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr = (_UNKNOWN *)v31[3];
        uint64_t v8 = (uint64_t (*)(void *, uint64_t, uint64_t))v31[3];
      }
      _Block_object_dispose(&v30, 8);
      if (v8)
      {
        uint64_t v10 = v8(v3, 1, v7);
        if (!v10) {
          return;
        }
        id v11 = (const void *)v10;
        uint64_t v30 = 0;
        id v31 = &v30;
        uint64_t v32 = 0x2020000000;
        id v12 = (uint64_t (*)(const void *))getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr;
        id v33 = getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr;
        if (!getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr)
        {
          long long v13 = (void *)NLPLibrary();
          v31[3] = (uint64_t)dlsym(v13, "NLSearchParseCandidateCopyDescription");
          getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr = (_UNKNOWN *)v31[3];
          id v12 = (uint64_t (*)(const void *))v31[3];
        }
        _Block_object_dispose(&v30, 8);
        if (v12)
        {
          uint64_t v14 = v12(v11);
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          uint64_t v30 = 0;
          id v31 = &v30;
          uint64_t v32 = 0x2020000000;
          BOOL v17 = (uint64_t (*)(const void *))getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr;
          id v33 = getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr;
          if (!getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr)
          {
            id v18 = (void *)NLPLibrary();
            v31[3] = (uint64_t)dlsym(v18, "NLSearchParseCandidateCopyRankTerms");
            getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr = (_UNKNOWN *)v31[3];
            BOOL v17 = (uint64_t (*)(const void *))v31[3];
          }
          _Block_object_dispose(&v30, 8);
          if (v17)
          {
            uint64_t v19 = v17(v11);
            uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
            id v21 = *(void **)(v20 + 40);
            *(void *)(v20 + 40) = v19;

            uint64_t v30 = 0;
            id v31 = &v30;
            uint64_t v32 = 0x2020000000;
            id v22 = (uint64_t (*)(const void *))getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr;
            id v33 = getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr;
            if (!getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr)
            {
              v23 = (void *)NLPLibrary();
              v31[3] = (uint64_t)dlsym(v23, "NLSearchParseCandidateCopyAttributedInput");
              getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr = (_UNKNOWN *)v31[3];
              id v22 = (uint64_t (*)(const void *))v31[3];
            }
            _Block_object_dispose(&v30, 8);
            if (v22)
            {
              uint64_t v24 = v22(v11);
              uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
              uint64_t v26 = *(void **)(v25 + 40);
              *(void *)(v25 + 40) = v24;

              uint64_t v30 = 0;
              id v31 = &v30;
              uint64_t v32 = 0x2020000000;
              uint64_t v27 = (uint64_t (*)(const void *))getNLSearchParseGetConfidenceSymbolLoc_ptr;
              id v33 = getNLSearchParseGetConfidenceSymbolLoc_ptr;
              if (!getNLSearchParseGetConfidenceSymbolLoc_ptr)
              {
                uint64_t v28 = (void *)NLPLibrary();
                v31[3] = (uint64_t)dlsym(v28, "NLSearchParseGetConfidence");
                getNLSearchParseGetConfidenceSymbolLoc_ptr = (_UNKNOWN *)v31[3];
                uint64_t v27 = (uint64_t (*)(const void *))v31[3];
              }
              _Block_object_dispose(&v30, 8);
              if (v27)
              {
                *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v27(v11);
                CFRelease(v11);
                return;
              }
LABEL_31:
              int v29 = (_Unwind_Exception *)__35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
              _Block_object_dispose(&v30, 8);
              _Unwind_Resume(v29);
            }
LABEL_30:
            __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
            goto LABEL_31;
          }
LABEL_29:
          __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
          goto LABEL_30;
        }
LABEL_28:
        __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
        goto LABEL_29;
      }
    }
    else
    {
      __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
    }
    __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
    goto LABEL_28;
  }
}

uint64_t __99__ICSearchQueryOperation_nlSearchQueryWithSearchString_queryString_rankingQueries_highlightString___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 intValue];
  if (v6 == [v5 intValue])
  {
    uint64_t v7 = 0;
  }
  else
  {
    int v8 = [v4 intValue];
    if (v8 < (int)[v5 intValue]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

+ (id)highlightStringForAttributedInputs:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke;
  v10[3] = &unk_1E64A7308;
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateObjectsUsingBlock:v10];

  if ([v6 count])
  {
    uint64_t v7 = [v6 allObjects];
    int v8 = [v7 componentsJoinedByString:@" "];
  }
  else
  {
    int v8 = &stru_1F1F2FFF8;
  }

  return v8;
}

void __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();

  uint64_t v5 = [v4 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_2;
  v9[3] = &unk_1E64A72E0;
  id v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", @"kMDUserQueryTopicKey", 0, v5, 0, v9);
  uint64_t v6 = [v4 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_3;
  v7[3] = &unk_1E64A72E0;
  id v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", @"kMDUserQueryTitleKey", 0, v6, 0, v7);
}

void __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

void __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

+ (id)newOperationQueueWithName:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28F08];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setName:v4];

  [v5 setMaxConcurrentOperationCount:1];
  [v5 setQualityOfService:25];
  return v5;
}

+ (id)searchableItemsFromSortableItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "searchableItem", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

+ (id)tokensQueryStringFromTokens:(id)a3
{
  id v3 = objc_msgSend(a3, "ic_compactMap:", &__block_literal_global_112);
  if ([v3 count])
  {
    id v4 = [v3 componentsJoinedByString:@" && "];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __54__ICSearchQueryOperation_tokensQueryStringFromTokens___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 subQueryString];

  if (v3)
  {
    id v4 = NSString;
    id v5 = [v2 subQueryString];
    id v3 = [v4 stringWithFormat:@"(%@)", v5];
  }
  return v3;
}

+ (id)fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke;
  v18[3] = &unk_1E64A7350;
  id v8 = v6;
  id v19 = v8;
  id v9 = objc_msgSend(v5, "ic_compactMap:", v18);
  if ([v9 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2;
    v13[3] = &unk_1E64A5260;
    id v14 = v9;
    id v15 = v8;
    id v16 = v5;
    id v10 = v7;
    id v17 = v10;
    [v15 performBlockAndWait:v13];
    id v11 = (void *)[v10 copy];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

id __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 persistentStoreCoordinator];
  id v5 = objc_msgSend(v4, "ic_managedObjectIDForURIString:", v3);

  return v5;
}

void __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"ICNote"];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  [v2 setResultType:2];
  [v2 setPropertiesToFetch:&unk_1F1F62C88];
  uint64_t v25 = a1;
  id v4 = *(void **)(a1 + 40);
  id v31 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v31];
  id v6 = v31;
  if (v6)
  {
    id obj = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2_cold_1(v25, obj);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v23 = v5;
      uint64_t v24 = v2;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          id v12 = [v11 objectForKeyedSubscript:@"objectID"];
          long long v13 = ICCheckedDynamicCast();
          id v14 = [v13 URIRepresentation];
          id v15 = [v14 absoluteString];

          objc_opt_class();
          id v16 = [v11 objectForKeyedSubscript:@"modificationDate"];
          id v17 = ICCheckedDynamicCast();

          if (v15) {
            BOOL v18 = v17 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            id v19 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
            objc_msgSend(v19, "setIc_dataSourceIdentifier:", @"Modern");
            objc_msgSend(v19, "setIc_searchResultType:", 0);
            [v19 setContentModificationDate:v17];
            objc_opt_class();
            uint64_t v20 = [v11 objectForKeyedSubscript:@"folder.account.identifier"];
            id v21 = ICDynamicCast();
            [v19 setDomainIdentifier:v21];

            id v22 = objc_alloc_init(MEMORY[0x1E4F23840]);
            [v22 setAttributeSet:v19];
            [v22 setUniqueIdentifier:v15];
            [*(id *)(v25 + 56) addObject:v22];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
      id v5 = v23;
      id v2 = v24;
      id v6 = 0;
    }
  }
}

- (id)foundItemsHandler
{
  return self->_foundItemsHandler;
}

- (void)setFoundItemsHandler:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)requestIndex
{
  return self->_requestIndex;
}

- (void)setRequestIndex:(int64_t)a3
{
  self->_requestIndex = a3;
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (void)setModernResultsOnly:(BOOL)a3
{
  self->_modernResultsOnly = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (ICSearchSuggestionsResponder)searchSuggestionsResponder
{
  return self->_searchSuggestionsResponder;
}

- (void)setSearchSuggestionsResponder:(id)a3
{
}

- (void)setDefaultQuery:(id)a3
{
}

- (void)setFuzzyQuery:(id)a3
{
}

- (ICSearchQuery)substringQuery
{
  return self->_substringQuery;
}

- (void)setSubstringQuery:(id)a3
{
}

- (ICSearchQuery)nlQuery
{
  return self->_nlQuery;
}

- (void)setNlQuery:(id)a3
{
}

- (ICSearchQuery)spellingQuery
{
  return self->_spellingQuery;
}

- (void)setSpellingQuery:(id)a3
{
}

- (ICSearchQuery)topHitQuery
{
  return self->_topHitQuery;
}

- (void)setTopHitQuery:(id)a3
{
}

- (NSMutableArray)relatedWordQueries
{
  return self->_relatedWordQueries;
}

- (void)setRelatedWordQueries:(id)a3
{
}

- (NSMutableDictionary)resultsDictionary
{
  return self->_resultsDictionary;
}

- (void)setResultsDictionary:(id)a3
{
}

- (NSMutableDictionary)uniqueIdentifiersOfAttachmentsFoundInNotes
{
  return self->_uniqueIdentifiersOfAttachmentsFoundInNotes;
}

- (void)setUniqueIdentifiersOfAttachmentsFoundInNotes:(id)a3
{
}

- (NSString)tokensQueryString
{
  return self->_tokensQueryString;
}

- (void)setTokensQueryString:(id)a3
{
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setKeyboardLanguage:(id)a3
{
}

- (BOOL)performTopHitSearch
{
  return self->_performTopHitSearch;
}

- (void)setPerformTopHitSearch:(BOOL)a3
{
  self->_performTopHitSearch = a3;
}

- (BOOL)performNLSearch
{
  return self->_performNLSearch;
}

- (void)setPerformNLSearch:(BOOL)a3
{
  self->_performNLSearch = a3;
}

- (BOOL)allowEmptySearchString
{
  return self->_allowEmptySearchString;
}

- (unint64_t)rankingStrategy
{
  return self->_rankingStrategy;
}

- (void)setRankingStrategy:(unint64_t)a3
{
  self->_rankingStrategy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_tokensQueryString, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfAttachmentsFoundInNotes, 0);
  objc_storeStrong((id *)&self->_resultsDictionary, 0);
  objc_storeStrong((id *)&self->_relatedWordQueries, 0);
  objc_storeStrong((id *)&self->_topHitQuery, 0);
  objc_storeStrong((id *)&self->_spellingQuery, 0);
  objc_storeStrong((id *)&self->_nlQuery, 0);
  objc_storeStrong((id *)&self->_substringQuery, 0);
  objc_storeStrong((id *)&self->_fuzzyQuery, 0);
  objc_storeStrong((id *)&self->_defaultQuery, 0);
  objc_storeStrong((id *)&self->_searchSuggestionsResponder, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_foundItemsHandler, 0);
}

+ (NSOperationQueue)searchSuggestionsQueue
{
  if (qword_1EA385918 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_1EA3885D8;
  return (NSOperationQueue *)v2;
}

+ (void)suggestionSearchResultsWithLinkSuggestionQuery:(ICLinkSuggestionQuery *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FBAE0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  void v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1C3DBA278();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  long long v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  void v13[4] = &unk_1EA3885F8;
  v13[5] = v11;
  id v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA388210;
  v14[5] = v13;
  id v15 = a3;
  sub_1C3D53940((uint64_t)v9, (uint64_t)&unk_1EA388218, (uint64_t)v14);
  swift_release();
}

- (void)retrieveNotesOfFoundAttachmentsForSearchResults:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_28(&dword_1C3A61000, v0, v1, "%@ About to retrieve notes that are found through attachments: %@");
}

- (void)runICSearchQuery:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "%@ query is not ran because it is nil", v2, v3, v4, v5, v6);
}

- (void)runICSearchQuery:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_28(&dword_1C3A61000, v0, v1, "%@ was cancelled before starting to run query: %@");
}

- (void)runICSearchQuery:.cold.3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_28(&dword_1C3A61000, v0, v1, "%@ was canceled and query was force stopped: %@");
}

- (void)runICSearchQuery:.cold.4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_28(&dword_1C3A61000, v0, v1, "%@ was cancelled when about to call foundItemsHandler for query: %@");
}

uint64_t __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:](v0);
}

+ (void)nlSearchQueryWithSearchString:(uint64_t)a3 queryString:rankingQueries:highlightString:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4_5(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "NLP algorithm doesn't recognize searchString: hash=%lu, length=%lu", v3, 0x16u);
}

+ (void)nlSearchQueryWithSearchString:(uint64_t)a3 queryString:rankingQueries:highlightString:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4_5(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "NLP algorithm has recognized searchString: hash=%lu, length=%lu", v3, 0x16u);
}

void __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "error fetching attributes for identifiers:%@", (uint8_t *)&v3, 0xCu);
}

@end