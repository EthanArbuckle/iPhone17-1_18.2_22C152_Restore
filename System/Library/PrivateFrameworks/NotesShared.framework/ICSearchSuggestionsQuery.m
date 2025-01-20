@interface ICSearchSuggestionsQuery
- (BOOL)modernResultsOnly;
- (ICSearchSuggestionsQuery)initWithSearchString:(id)a3 searchTokens:(id)a4 additionalQueries:(id)a5 rankingQueriesDefinition:(id)a6 modernResultsOnly:(BOOL)a7 suggestionsResponder:(id)a8;
- (ICSearchSuggestionsResponder)suggestionsResponder;
- (NSArray)additionalQueries;
- (NSArray)searchTokens;
- (NSArray)topHits;
- (NSMutableArray)foundSuggestions;
- (NSString)searchString;
- (id)newSearchQueryContext;
- (id)newSearchQueryWithContext:(id)a3;
- (id)queryResultsToAddFromBatch:(id)a3;
- (void)queryFinishedRunningWithError:(id)a3;
- (void)setAdditionalQueries:(id)a3;
- (void)setFoundSuggestions:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchTokens:(id)a3;
- (void)setSuggestionsResponder:(id)a3;
- (void)setTopHits:(id)a3;
@end

@implementation ICSearchSuggestionsQuery

- (ICSearchSuggestionsQuery)initWithSearchString:(id)a3 searchTokens:(id)a4 additionalQueries:(id)a5 rankingQueriesDefinition:(id)a6 modernResultsOnly:(BOOL)a7 suggestionsResponder:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v33 = a8;
  if (!+[ICSearchSuggestionsContext supportsSearchSuggestions])
  {
    v32 = self;
    id v19 = a4;
    id v20 = a5;
    id v21 = a8;
    id v22 = v17;
    BOOL v23 = a7;
    id v24 = v16;
    id v25 = v15;
    v26 = (void *)MEMORY[0x1E4F836F8];
    uint64_t v31 = objc_opt_class();
    v27 = v26;
    id v15 = v25;
    id v16 = v24;
    a7 = v23;
    id v17 = v22;
    a8 = v21;
    a5 = v20;
    a4 = v19;
    self = v32;
    [v27 handleFailedAssertWithCondition:"ICSearchSuggestionsContext.supportsSearchSuggestions", "-[ICSearchSuggestionsQuery initWithSearchString:searchTokens:additionalQueries:rankingQueriesDefinition:modernResultsOnly:suggestionsResponder:]", 1, 0, @"%@ is only supported to use if search suggestions are supported.", v31 functionName simulateCrash showAlert format];
  }
  v34.receiver = self;
  v34.super_class = (Class)ICSearchSuggestionsQuery;
  v28 = [(ICSearchQuery *)&v34 initWithRankingQueriesDefinition:v18];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_searchString, a3);
    objc_storeStrong((id *)&v29->_searchTokens, a4);
    objc_storeStrong((id *)&v29->_additionalQueries, a5);
    v29->_modernResultsOnly = a7;
    objc_storeStrong((id *)&v29->_suggestionsResponder, a8);
  }

  return v29;
}

- (NSMutableArray)foundSuggestions
{
  foundSuggestions = self->_foundSuggestions;
  if (!foundSuggestions)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = self->_foundSuggestions;
    self->_foundSuggestions = v4;

    foundSuggestions = self->_foundSuggestions;
  }
  return foundSuggestions;
}

- (id)newSearchQueryContext
{
  v3 = [(ICSearchSuggestionsQuery *)self suggestionsResponder];
  v4 = [v3 searchContext];
  v5 = [v4 searchSuggestion];

  v6 = [(ICSearchSuggestionsQuery *)self searchTokens];
  v7 = objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_65);

  v8 = (void *)MEMORY[0x1E4F23870];
  v9 = [(ICSearchSuggestionsQuery *)self searchString];
  v10 = [v8 updatedSuggestionWithCurrentSuggestion:v5 userString:v9 tokens:v7];

  v11 = [MEMORY[0x1E4F23898] userQueryContextWithCurrentSuggestion:v10];
  uint64_t v12 = [(ICSearchSuggestionsQuery *)self additionalQueries];
  v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = MEMORY[0x1E4F1CBF0];
  }
  [v11 setFilterQueries:v14];

  [v11 setEnableRankedResults:1];
  [v11 setEnableSuggestionTokens:1];
  [v11 setEnableResultCountsPerSuggestion:1];
  [v11 setMaxSuggestionCount:5];
  [v11 setDisableBlockingOnIndex:1];

  return v11;
}

uint64_t __49__ICSearchSuggestionsQuery_newSearchQueryContext__block_invoke(uint64_t a1, void *a2)
{
  return [a2 csToken];
}

- (id)newSearchQueryWithContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICCheckedDynamicCast();
  id v6 = objc_alloc(MEMORY[0x1E4F23890]);
  v7 = [(ICSearchSuggestionsQuery *)self searchString];
  v8 = (void *)[v6 initWithUserQueryString:v7 userQueryContext:v5];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke;
  v10[3] = &unk_1E64A7CC0;
  objc_copyWeak(&v11, &location);
  [v8 setFoundSuggestionsHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

void __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained wasForceStopped];
  id v6 = os_log_create("com.apple.notes", "SearchIndexer");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_1((uint64_t)WeakRetained, v7);
    }
  }
  else
  {
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_2((uint64_t)WeakRetained, v3, v8);
    }

    v7 = objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_14_0);
    v9 = [WeakRetained foundSuggestions];
    [v9 addObjectsFromArray:v7];
  }
}

ICSearchSuggestion *__54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ICSearchSuggestion alloc] initWithSuggestion:v2];

  return v3;
}

- (id)queryResultsToAddFromBatch:(id)a3
{
  id v4 = a3;
  int v5 = [(ICSearchSuggestionsQuery *)self topHits];

  if (v5)
  {
    id v6 = v4;
  }
  else if ((unint64_t)[v4 count] > 2)
  {
    v7 = objc_msgSend(v4, "ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:prefixMatchingPredicate:", 2, &__block_literal_global_19);
    v8 = [v7 firstObject];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [v7 firstObject];
      [(ICSearchSuggestionsQuery *)self setTopHits:v10];
    }
    id v6 = [v7 secondObject];
  }
  else
  {
    [(ICSearchSuggestionsQuery *)self setTopHits:v4];
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

BOOL __55__ICSearchSuggestionsQuery_queryResultsToAddFromBatch___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 attributeSet];
  BOOL v3 = objc_msgSend(v2, "ic_searchResultType") == 0;

  return v3;
}

- (void)queryFinishedRunningWithError:(id)a3
{
  if (a3)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = [(ICSearchSuggestionsQuery *)self foundSuggestions];
    BOOL v3 = (void *)[v4 copy];
  }
  id v5 = v3;
  performBlockOnMainThread();
}

void __58__ICSearchSuggestionsQuery_queryFinishedRunningWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) suggestionsResponder];
  [v2 setVisibleSearchSuggestions:*(void *)(a1 + 40)];
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (NSArray)topHits
{
  return self->_topHits;
}

- (void)setTopHits:(id)a3
{
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

- (void)setSearchTokens:(id)a3
{
}

- (NSArray)additionalQueries
{
  return self->_additionalQueries;
}

- (void)setAdditionalQueries:(id)a3
{
}

- (void)setFoundSuggestions:(id)a3
{
}

- (ICSearchSuggestionsResponder)suggestionsResponder
{
  return self->_suggestionsResponder;
}

- (void)setSuggestionsResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsResponder, 0);
  objc_storeStrong((id *)&self->_foundSuggestions, 0);
  objc_storeStrong((id *)&self->_additionalQueries, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_topHits, 0);
}

void __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "FoundSuggestionsHandler of search query called, but search query was force stopped earlier: %@", (uint8_t *)&v2, 0xCu);
}

void __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = [a2 count];
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "%@ found %d suggestions", (uint8_t *)&v4, 0x12u);
}

@end