@interface CompletionGroupListing
- (BOOL)hasParsecCompletions;
- (BOOL)isAwaitingCompletionDatabase;
- (BOOL)isAwaitingParsec;
- (BOOL)isAwaitingSearchProvider;
- (BOOL)isAwaitingTabCompletion;
- (BOOL)isEmpty;
- (BOOL)isSufficientlyComputedForDisplay;
- (BOOL)updateWithQuery:(id)a3;
- (CalculationResultCompletionItem)calculationResultItem;
- (CompletionGroup)_groupWithTitle:(void *)a3 completions:(uint64_t)a4 maximumCompletions:;
- (CompletionGroupListing)initWithQuery:(id)a3 titleProvider:(id)a4 options:(unint64_t)a5;
- (CompletionGroupTitleProviding)completionGroupTitleProvider;
- (CompletionItem)topHit;
- (FindOnPageCompletionItem)findOnPageCompletionItem;
- (NSArray)URLCompletionMatches;
- (NSArray)bottomParsecResults;
- (NSArray)groups;
- (NSArray)localTopHits;
- (NSArray)parsecTopHits;
- (NSArray)searchSuggestions;
- (NSArray)suggestedSites;
- (NSArray)topHits;
- (NSArray)topParsecResults;
- (NSSet)topHitAddresses;
- (PencilInputCompletionItem)pencilCompletionItem;
- (QuickWebsiteSearchCompletionItem)quickWebsiteSearchItem;
- (SFSearchResult)hiddenIgnoredSiriSuggestedSite;
- (WBSBrowserTabCompletionMatch)tabCompletionMatch;
- (WBSCompletionQuery)query;
- (WBSCompletionQuery)rewrittenQuery;
- (id)_bookmarksAndHistoryGroup:(uint64_t)a1;
- (id)_filteredURLCompletions;
- (id)_groupByAddingCompletions:(void *)a3 toGroup:;
- (id)_groupWithTitle:(void *)a3 completions:;
- (id)_parsecResultsGroupFromResults:(void *)a1;
- (id)_pencilScribbleGroup;
- (id)_quickWebsiteSearchGroup;
- (id)_searchSuggestionsGroup;
- (id)_titleForTabCompletionMatch:(void *)a1;
- (id)_titleForTopHits:(void *)a1;
- (id)_topParsecResultGroup;
- (id)groupAtIndex:(unint64_t)a3;
- (int64_t)searchSuggestionsSource;
- (uint64_t)_hasTopHitDuplicateInResults:(void *)a1;
- (uint64_t)_maximumNumberOfSearchSuggestionsToShow;
- (unint64_t)indexOfSearchSuggestionsGroup;
- (unint64_t)indexOfTopHitsGroup;
- (unint64_t)numberOfGroups;
- (void)_buildListIfNeeded;
- (void)_calculatePreviousSearchesWithSearchSuggestionsDictionary:(void *)a3 filteredURLCompletions:;
- (void)_calculationResultGroup;
- (void)_findOnPageGroup;
- (void)_mergeGroup:(void *)a3 toListing:;
- (void)_suggestedSitesGroup;
- (void)_switchToTabCompletionGroup;
- (void)_updateIconsForResultsIfNeeded:(void *)a1;
- (void)deleteTopHit:(id)a3 atIndex:(unint64_t)a4;
- (void)markDatabaseResultsReceived;
- (void)markParsecResultsReceived;
- (void)markSearchResultsReceived;
- (void)markTabCompletionReceived;
- (void)setBottomParsecResults:(id)a3;
- (void)setCalculationResultItem:(id)a3;
- (void)setCompletionGroupTitleProvider:(id)a3;
- (void)setFindOnPageCompletionItem:(id)a3;
- (void)setHiddenIgnoredSiriSuggestedSite:(id)a3;
- (void)setLocalTopHits:(id)a3;
- (void)setNeedsParsecDatabaseQueryRewrite;
- (void)setParsecTopHits:(id)a3;
- (void)setPencilCompletionItem:(id)a3;
- (void)setQuickWebsiteSearchItem:(id)a3;
- (void)setRewrittenQuery:(id)a3;
- (void)setSearchSuggestions:(id)a3 fromSource:(int64_t)a4;
- (void)setSuggestedSites:(id)a3;
- (void)setTabCompletionMatch:(id)a3;
- (void)setTopParsecResults:(id)a3;
- (void)setURLCompletionMatches:(id)a3;
@end

@implementation CompletionGroupListing

- (CompletionGroupListing)initWithQuery:(id)a3 titleProvider:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CompletionGroupListing;
  v11 = [(CompletionGroupListing *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_query, a3);
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    displayedParsecResults = v12->_displayedParsecResults;
    v12->_displayedParsecResults = (NSMutableArray *)v13;

    *(_DWORD *)&v12->_awaitingParsec = 16843009;
    objc_storeWeak((id *)&v12->_completionGroupTitleProvider, v10);
    v12->_isForPrivateBrowsing = (v5 & 2) != 0;
    v12->_databaseResultsSufficientForDisplay = v5 & 1;
    v12->_indexOfSearchSuggestionsGroup = 0x7FFFFFFFFFFFFFFFLL;
    v12->_indexOfTopHitsGroup = 0x7FFFFFFFFFFFFFFFLL;
    v12->_needsRebuild = 1;
    v15 = v12;
  }

  return v12;
}

- (BOOL)updateWithQuery:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = WBSIsEqual();
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_query, a3);
    if ([(NSArray *)self->_groupListing count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v7 = self->_groupListing;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "setQuery:", v5, (void)v13);
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
  }

  return v6 ^ 1;
}

- (void)setURLCompletionMatches:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    URLCompletionMatches = self->_URLCompletionMatches;
    self->_URLCompletionMatches = v4;

    self->_needsRebuild = 1;
  }
}

- (void)setLocalTopHits:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    localTopHits = self->_localTopHits;
    self->_localTopHits = v4;

    self->_needsRebuild = 1;
  }
}

- (void)setParsecTopHits:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    p_parsecTopHits = &self->_parsecTopHits;
    id v23 = a3;
    id v24 = v5;
    v25 = self;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
          int v12 = objc_msgSend(MEMORY[0x1E4F97EA0], "isSearchEvaluationLoggingEnabled", p_parsecTopHits, v23);
          long long v13 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          long long v14 = v13;
          if (v12)
          {
            long long v15 = v13;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v18 = [v11 originalURLString];
              v19 = objc_msgSend(v18, "safari_urlHashesOfComponents");
              if (objc_opt_respondsToSelector()) {
                [v11 query];
              }
              else {
              v20 = [v11 completedQuery];
              }
              *(_DWORD *)buf = 138543618;
              v31 = v19;
              __int16 v32 = 2112;
              v33 = v20;
              _os_log_debug_impl(&dword_1E102C000, v15, OS_LOG_TYPE_DEBUG, "Parsec TopHit <%{public}@> query:\"%@\"", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            long long v16 = v14;
            objc_super v17 = [v11 originalURLString];
            *(_DWORD *)buf = 138739971;
            v31 = v17;
            _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_INFO, "Parsec TopHit %{sensitive}@", buf, 0xCu);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
        uint64_t v8 = v21;
      }
      while (v21);
    }

    objc_storeStrong((id *)p_parsecTopHits, v23);
    -[CompletionGroupListing _updateIconsForResultsIfNeeded:](v25, v6);
    v25->_needsRebuild = 1;
    id v5 = v24;
  }
}

- (void)_updateIconsForResultsIfNeeded:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v9 = v3;
    BOOL v4 = (unint64_t)[v3 count] > 1;
    id v3 = v9;
    if (!v4)
    {
      id v5 = [v9 firstObject];
      id v6 = [a1 topHit];
      uint64_t v7 = [v6 sfSearchResultValue];
      if (v5 == v7) {
        uint64_t v8 = 7;
      }
      else {
        uint64_t v8 = 5;
      }
      objc_msgSend(v5, "safari_setCompletionIconForCompactRow:", v8);

      id v3 = v9;
    }
  }
}

- (void)deleteTopHit:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = (NSArray *)[(NSArray *)self->_localTopHits mutableCopy];
  if ([(NSArray *)v6 count] > a4) {
    [(NSArray *)v6 removeObjectAtIndex:a4];
  }
  self->_topHitRemoved = 1;
  uint64_t v7 = (NSArray *)[(NSArray *)self->_groupListing mutableCopy];
  if ([(NSArray *)v6 count])
  {
    uint64_t v8 = [(NSArray *)v7 firstObject];
    id v9 = [v8 completions];
    uint64_t v10 = (void *)[v9 mutableCopy];

    [v10 removeObjectAtIndex:a4];
    [(NSArray *)v6 count];
    uint64_t v11 = -[CompletionGroupListing _titleForTopHits:](self);
    int v12 = -[CompletionGroupListing _groupWithTitle:completions:](self, v11, v10);

    [(NSArray *)v7 replaceObjectAtIndex:0 withObject:v12];
  }
  else
  {
    [(NSArray *)v7 removeObjectAtIndex:0];
  }
  groupListing = self->_groupListing;
  self->_groupListing = v7;
  long long v15 = v7;

  localTopHits = self->_localTopHits;
  self->_localTopHits = v6;
}

- (id)_titleForTopHits:(void *)a1
{
  if (a1)
  {
    a1 = _WBSLocalizedString();
  }
  return a1;
}

- (id)_groupWithTitle:(void *)a3 completions:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    if ([v6 count])
    {
      a1 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)a1, v5, v7, 5);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)setTabCompletionMatch:(id)a3
{
  id v8 = a3;
  id v5 = [(WBSBrowserTabCompletionMatch *)self->_tabCompletionMatch tabUUID];
  id v6 = [v8 tabUUID];
  char v7 = WBSIsEqual();

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tabCompletionMatch, a3);
    self->_needsRebuild = 1;
  }
}

- (void)setTopParsecResults:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    BOOL v4 = (NSArray *)[v6 copy];
    topParsecResults = self->_topParsecResults;
    self->_topParsecResults = v4;

    -[CompletionGroupListing _updateIconsForResultsIfNeeded:](self, v6);
    [(NSMutableArray *)self->_displayedParsecResults addObjectsFromArray:v6];
    self->_needsRebuild = 1;
  }
}

- (void)setBottomParsecResults:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    BOOL v4 = (NSArray *)[v6 copy];
    bottomParsecResults = self->_bottomParsecResults;
    self->_bottomParsecResults = v4;

    -[CompletionGroupListing _updateIconsForResultsIfNeeded:](self, v6);
    [(NSMutableArray *)self->_displayedParsecResults addObjectsFromArray:v6];
    self->_needsRebuild = 1;
  }
}

- (void)setSearchSuggestions:(id)a3 fromSource:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchSuggestions, a3);
    self->_searchSuggestionsSource = a4;
    if (a4 == 2)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setQuery:", self->_query, (void)v13);
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
    self->_needsRebuild = 1;
  }
}

- (void)setSuggestedSites:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    BOOL v4 = (NSArray *)[v6 copy];
    suggestedSites = self->_suggestedSites;
    self->_suggestedSites = v4;

    self->_needsRebuild = 1;
  }
}

- (void)setCalculationResultItem:(id)a3
{
  id v8 = a3;
  id v5 = [(CalculationResultCompletionItem *)self->_calculationResultItem calculationResult];
  id v6 = [v8 calculationResult];
  char v7 = WBSIsEqual();

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_calculationResultItem, a3);
    self->_needsRebuild = 1;
  }
}

- (void)setFindOnPageCompletionItem:(id)a3
{
  id v5 = a3;
  if (!-[FindOnPageCompletionItem isEquivalentTo:](self->_findOnPageCompletionItem, "isEquivalentTo:"))
  {
    objc_storeStrong((id *)&self->_findOnPageCompletionItem, a3);
    self->_needsRebuild = 1;
  }
}

- (uint64_t)_maximumNumberOfSearchSuggestionsToShow
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 36)) {
      BOOL v2 = *(void *)(result + 96) == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if ([*(id *)(result + 176) numberOfMatches]) {
      return 5;
    }
    id v3 = -[CompletionGroupListing _filteredURLCompletions](v1);
    if ([v3 count])
    {

      return 5;
    }
    if ([*(id *)(v1 + 112) count]) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = v2;
    }

    if (v4) {
      return 10;
    }
    else {
      return 5;
    }
  }
  return result;
}

- (id)_filteredURLCompletions
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    goto LABEL_8;
  }
  BOOL v2 = (void *)MEMORY[0x1E4F98DB0];
  id v3 = [MEMORY[0x1E4F98DB0] searchParameters];
  if (![v2 includeBookmarksAndHistory:v3])
  {

    goto LABEL_8;
  }
  uint64_t v4 = *(void *)(a1 + 64);

  if (!v4)
  {
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  id v5 = [MEMORY[0x1E4F98DB0] filterOutUnlikelyMatchesFromMatches:*(void *)(a1 + 64) forQuery:*(void *)(a1 + 48) rewrittenQuery:*(void *)(a1 + 56)];
  id v6 = [MEMORY[0x1E4F98DB0] searchParameters];
  int v7 = [v6 enableCompletionListHistoryDeduplicationValue];

  if (v7)
  {
    if (*(void *)(a1 + 96))
    {
      v29[0] = *(void *)(a1 + 96);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v10 = [MEMORY[0x1E4F98DB0] dedupeSameTitleHistoryResults:*(void *)(a1 + 64) withMobile:1 withTophits:*(void *)(a1 + 88) withTabs:v8];

    if ([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled])
    {
      uint64_t v11 = [MEMORY[0x1E4F98DB0] dedupeSameURLResults:v10 withUniversalSearchResults:*(void *)(a1 + 24)];

      uint64_t v10 = (void *)v11;
    }

    id v5 = v10;
  }
  if ([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled])
  {
    uint64_t v12 = *(void **)(a1 + 136);
    if ((unint64_t)[v12 count] > 4) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = [*(id *)(a1 + 136) count];
    }
    long long v14 = objc_msgSend(v12, "subarrayWithRange:", 0, v13);
    long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49__CompletionGroupListing__filteredURLCompletions__block_invoke;
    v27[3] = &unk_1E6D7E2C8;
    id v16 = v15;
    id v28 = v16;
    objc_super v17 = objc_msgSend(v14, "safari_setByApplyingBlock:", v27);
    uint64_t v18 = [*(id *)(a1 + 48) queryString];

    if (v18)
    {
      v19 = [*(id *)(a1 + 48) queryString];
      v20 = objc_msgSend(v19, "safari_stringByTrimmingWhitespace");
      uint64_t v21 = [v20 lowercaseString];
      id v22 = (id)[v17 setByAddingObject:v21];
    }
    id v23 = (void *)MEMORY[0x1E4F98DB0];
    id v24 = [MEMORY[0x1E4F3B060] sharedInstance];
    v25 = [v24 defaultSearchEngineForPrivateBrowsing:*(unsigned __int8 *)(a1 + 35)];
    long long v26 = [v23 dedupeResults:v5 withSearchSuggestionStrings:v17 searchProvider:v25];

    -[CompletionGroupListing _calculatePreviousSearchesWithSearchSuggestionsDictionary:filteredURLCompletions:](a1, v16, v26);
    id v5 = v26;
  }
LABEL_9:
  return v5;
}

- (id)_titleForTabCompletionMatch:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 tabGroupTitle];

    if (v5)
    {
      id v6 = NSString;
      int v7 = _WBSLocalizedString();
      id v8 = [v4 tabGroupTitle];
      a1 = objc_msgSend(v6, "stringWithFormat:", v7, v8);
    }
    else
    {
      a1 = _WBSLocalizedString();
    }
  }

  return a1;
}

id __49__CompletionGroupListing__filteredURLCompletions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F97EA0] isLabelPreviousSearchesInCompletionListEnabled])
  {
    uint64_t v4 = [v3 string];
    id v5 = objc_msgSend(v4, "safari_stringByTrimmingWhitespace");
    id v6 = [v5 lowercaseString];

    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v6];
  }
  int v7 = [v3 string];
  id v8 = objc_msgSend(v7, "safari_stringByTrimmingWhitespace");
  uint64_t v9 = [v8 lowercaseString];

  return v9;
}

- (void)_calculatePreviousSearchesWithSearchSuggestionsDictionary:(void *)a3 filteredURLCompletions:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v37 = a1;
  if (a1 && [MEMORY[0x1E4F97EA0] isLabelPreviousSearchesInCompletionListEnabled])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = *(id *)(a1 + 64);
    uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v45;
      do
      {
        uint64_t v10 = 0;
        uint64_t v38 = v8;
        do
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
          if (([v6 containsObject:v11] & 1) == 0)
          {
            id v12 = v6;
            uint64_t v13 = [MEMORY[0x1E4F3B060] sharedInstance];
            long long v14 = [v13 defaultSearchEngineForPrivateBrowsing:*(unsigned __int8 *)(v37 + 35)];
            long long v15 = (void *)MEMORY[0x1E4F1CB10];
            [v11 originalURLString];
            objc_super v17 = v16 = v5;
            uint64_t v18 = [v15 URLWithString:v17];
            v19 = [v14 userVisibleQueryFromSearchURL:v18];

            id v5 = v16;
            v20 = [v16 objectForKeyedSubscript:v19];
            if (![v20 hasBeenSearchedBefore]
              || ([v20 lastVisitTimeInterval],
                  double v22 = v21,
                  [v11 lastVisitTimeInterval],
                  v22 <= v23))
            {
              [v20 setHasBeenSearchedBefore:1];
              [v11 lastVisitTimeInterval];
              objc_msgSend(v20, "setLastVisitTimeInterval:");
            }

            id v6 = v12;
            uint64_t v8 = v38;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v8);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v24 = +[RecentWebSearchesController sharedController];
    v25 = [v24 recentWebSearcheEntries];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v31 = [v30 searchString];
          __int16 v32 = [v5 objectForKeyedSubscript:v31];
          v33 = [v30 date];
          [v33 timeIntervalSinceReferenceDate];
          double v35 = v34;

          if (![v32 hasBeenSearchedBefore]
            || ([v32 lastVisitTimeInterval], v36 <= v35))
          {
            [v32 setHasBeenSearchedBefore:1];
            [v32 setLastVisitTimeInterval:v35];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v27);
    }
  }
}

- (void)markDatabaseResultsReceived
{
  self->_awaitingCompletionDatabase = 0;
}

- (void)markSearchResultsReceived
{
  self->_awaitingSearchProvider = 0;
}

- (void)markParsecResultsReceived
{
  self->_awaitingParsec = 0;
}

- (void)markTabCompletionReceived
{
  self->_awaitingTabCompletion = 0;
}

- (void)setNeedsParsecDatabaseQueryRewrite
{
  self->_awaitingCompletionDatabase = 1;
}

- (BOOL)isSufficientlyComputedForDisplay
{
  BOOL awaitingCompletionDatabase = self->_awaitingCompletionDatabase;
  BOOL result = !self->_awaitingCompletionDatabase;
  if (!self->_databaseResultsSufficientForDisplay) {
    return !self->_awaitingParsec && !awaitingCompletionDatabase && !self->_awaitingTabCompletion;
  }
  return result;
}

- (CompletionGroup)_groupWithTitle:(void *)a3 completions:(uint64_t)a4 maximumCompletions:
{
  uint64_t v4 = 0;
  if (a1 && a3)
  {
    id v8 = a3;
    id v9 = a2;
    uint64_t v4 = [[CompletionGroup alloc] initWithTitle:v9 completions:v8 query:*(void *)(a1 + 48) maximumNumberOfCompletions:a4];
  }
  return v4;
}

- (id)_groupByAddingCompletions:(void *)a3 toGroup:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    uint64_t v7 = [v5 title];
    id v8 = [v5 completions];
    id v9 = [v8 arrayByAddingObjectsFromArray:v6];

    uint64_t v10 = [v5 maxInitiallyVisibleResults];
    -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v3, v7, v9, v10);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_bookmarksAndHistoryGroup:(uint64_t)a1
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if (*(unsigned char *)(a1 + 36) && *(void *)(a1 + 96))
    {
      v11[0] = *(void *)(a1 + 96);
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v5];

      uint64_t v8 = 6;
      id v5 = (id)v7;
    }
    else
    {
      uint64_t v8 = 5;
    }
    if ([v5 count])
    {
      id v9 = _WBSLocalizedString();
      a1 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:](a1, v9, v5, v8);
    }
    else
    {
      a1 = 0;
    }
  }
  return (id)a1;
}

- (void)_switchToTabCompletionGroup
{
  uint64_t v1 = a1;
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v2 = (void *)a1[12];
    if (v2)
    {
      id v3 = -[CompletionGroupListing _titleForTabCompletionMatch:](a1, v2);
      v6[0] = v1[12];
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
      uint64_t v1 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v3, v4, 1);
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)_suggestedSitesGroup
{
  uint64_t v1 = a1;
  if (a1)
  {
    if ([a1[19] count])
    {
      BOOL v2 = _WBSLocalizedString();
      -[CompletionGroupListing _groupWithTitle:completions:](v1, v2, v1[19]);
      uint64_t v1 = (void **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)_calculationResultGroup
{
  uint64_t v1 = a1;
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v2 = (void *)a1[20];
    if (v2)
    {
      id v3 = [v2 calculationResult];
      uint64_t v4 = [v3 sectionTitle];
      v7[0] = v1[20];
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      uint64_t v1 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v4, v5, 1);
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (id)_pencilScribbleGroup
{
  id v1 = a1;
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a1[21])
    {
      v4[0] = a1[21];
      BOOL v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, &stru_1F3C268E8, v2, 1);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v1 = 0;
    }
  }
  return v1;
}

- (id)_searchSuggestionsGroup
{
  id v1 = a1;
  if (a1)
  {
    if ([a1[17] count])
    {
      id WeakRetained = objc_loadWeakRetained(v1 + 23);
      id v3 = [WeakRetained titleForSearchSuggestionsCompletion];
      id v4 = v1[17];
      uint64_t v5 = -[CompletionGroupListing _maximumNumberOfSearchSuggestionsToShow]((uint64_t)v1);
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v3, v4, v5);
      id v1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v1 = 0;
    }
  }
  return v1;
}

- (id)_quickWebsiteSearchGroup
{
  id v1 = a1;
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a1[15])
    {
      BOOL v2 = NSString;
      id v3 = _WBSLocalizedString();
      id v4 = [v1[15] searchProvider];
      uint64_t v5 = [v4 displayName];
      id v6 = objc_msgSend(v2, "stringWithFormat:", v3, v5);

      v9[0] = v1[15];
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      -[CompletionGroupListing _groupWithTitle:completions:](v1, v6, v7);
      id v1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v1 = 0;
    }
  }
  return v1;
}

- (id)_topParsecResultGroup
{
  if (a1)
  {
    BOOL v2 = a1;
    a1 = (id *)[a1[13] count];
    if (a1)
    {
      if (-[CompletionGroupListing _hasTopHitDuplicateInResults:](v2, v2[13]))
      {
        a1 = 0;
      }
      else
      {
        -[CompletionGroupListing _parsecResultsGroupFromResults:](v2, v2[13]);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
      }
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)_hasTopHitDuplicateInResults:(void *)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1
    && ([a1 topHits],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    id v6 = [a1 topHits];
    uint64_t v7 = [v6 firstObject];

    uint64_t v8 = [v7 originalURLString];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F29088];
      uint64_t v11 = [v7 originalURLString];
      id v12 = [v10 componentsWithString:v11];
      uint64_t v13 = [v12 host];

      if ([v13 length])
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v14 = v3;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v35;
          id v33 = v3;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v35 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              v20 = [v7 userVisibleURLString];
              double v21 = [v19 userVisibleURLString];
              char v22 = [v20 isEqualToString:v21];

              if (v22) {
                goto LABEL_21;
              }
              double v23 = [v19 originalURLString];
              uint64_t v24 = [v23 rangeOfString:v13];

              if (v24 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (!v24) {
                  goto LABEL_21;
                }
                v25 = (void *)MEMORY[0x1E4F29088];
                uint64_t v26 = [v19 originalURLString];
                uint64_t v27 = [v25 componentsWithString:v26];
                uint64_t v28 = [v27 host];
                char v29 = [v28 isEqualToString:v13];

                if (v29)
                {
LABEL_21:
                  uint64_t v30 = 1;
                  id v3 = v33;
                  goto LABEL_24;
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
            uint64_t v30 = 0;
            id v3 = v33;
            if (v16) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v30 = 0;
        }
LABEL_24:
      }
      else
      {
        uint64_t v30 = 0;
      }
    }
    else
    {
      v31 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CompletionGroupListing _hasTopHitDuplicateInResults:](v31);
      }
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (id)_parsecResultsGroupFromResults:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 count])
    {
      uint64_t v5 = [v4 firstObject];
      id v6 = [v5 sectionHeader];
      a1 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)a1, v6, v4, 5);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_findOnPageGroup
{
  uint64_t v1 = a1;
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a1[22])
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 23);
      id v3 = [WeakRetained titleForFindOnPageCompletion:v1[22]];
      v6[0] = v1[22];
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
      uint64_t v1 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v3, v4, 1);
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)_buildListIfNeeded
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Rebuilding completion list.", v1, 2u);
}

- (void)_mergeGroup:(void *)a3 toListing:
{
  id v11 = a2;
  id v5 = a3;
  if (a1 && v11)
  {
    if ([v5 count])
    {
      id v6 = [v5 lastObject];
      uint64_t v7 = [v6 completions];
      uint64_t v8 = [v11 completions];
      uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];

      uint64_t v10 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:](a1, 0, v9, 0);
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", objc_msgSend(v5, "count") - 1, v10);
    }
    else
    {
      uint64_t v9 = [v11 completions];
      uint64_t v10 = -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:](a1, 0, v9, 0);
      [v5 addObject:v10];
    }
  }
}

uint64_t __44__CompletionGroupListing__buildListIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasBeenSearchedBefore])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 string];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 48) queryString];
    uint64_t v4 = [v5 isEqualToString:v6] ^ 1;
  }
  return v4;
}

void __44__CompletionGroupListing__buildListIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
  {
    BOOL v2 = [MEMORY[0x1E4F28E78] string];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v15 = a1;
    id obj = *(id *)(a1 + 32);
    uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v18)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = v3;
          uint64_t v4 = *(void **)(*((void *)&v24 + 1) + 8 * v3);
          id v5 = [v4 title];
          [v2 appendFormat:@"%@: ", v5];

          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v6 = [v4 completions];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v21;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v21 != v9) {
                  objc_enumerationMutation(v6);
                }
                id v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
                uint64_t v12 = objc_opt_class();
                if (objc_opt_respondsToSelector())
                {
                  uint64_t v13 = [v11 uuidString];
                  [v2 appendFormat:@"%@[%@], ", v12, v13];
                }
                else
                {
                  [v2 appendFormat:@"%@[%@], ", v12, &stru_1F3C268E8];
                }
                ++v10;
              }
              while (v8 != v10);
              uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v8);
          }

          [v2 appendString:@"\n"];
          uint64_t v3 = v19 + 1;
        }
        while (v19 + 1 != v18);
        uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v18);
    }

    id v14 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __44__CompletionGroupListing__buildListIfNeeded__block_invoke_2_cold_1(v15, v14, (uint64_t)v2);
    }
  }
}

- (id)groupAtIndex:(unint64_t)a3
{
  if ([(CompletionGroupListing *)self numberOfGroups] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(CompletionGroupListing *)self groups];
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }
  return v6;
}

- (NSArray)topHits
{
  NSUInteger v3 = [(NSArray *)self->_parsecTopHits count];
  uint64_t v4 = 80;
  if (!v3) {
    uint64_t v4 = 88;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);
  return (NSArray *)v5;
}

- (CompletionItem)topHit
{
  BOOL v2 = [(CompletionGroupListing *)self topHits];
  NSUInteger v3 = [v2 firstObject];

  return (CompletionItem *)v3;
}

- (BOOL)isEmpty
{
  if ([(NSMutableArray *)self->_displayedParsecResults count]
    || [(NSArray *)self->_searchSuggestions count])
  {
    return 0;
  }
  id v5 = -[CompletionGroupListing _filteredURLCompletions]((uint64_t)self);
  BOOL v3 = [v5 count] == 0;

  return v3;
}

- (unint64_t)numberOfGroups
{
  BOOL v2 = [(CompletionGroupListing *)self groups];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSSet)topHitAddresses
{
  BOOL v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(CompletionGroupListing *)self topHits];
  uint64_t v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_60);
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

id __41__CompletionGroupListing_topHitAddresses__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 originalURLString];
  unint64_t v3 = objc_msgSend(v2, "safari_urlStringForCompletionDeduplication");

  return v3;
}

- (BOOL)hasParsecCompletions
{
  return [(NSMutableArray *)self->_displayedParsecResults count] != 0;
}

- (NSArray)groups
{
  -[CompletionGroupListing _buildListIfNeeded]((uint64_t)self);
  unint64_t v3 = (void *)[(NSArray *)self->_groupListing copy];
  return (NSArray *)v3;
}

- (WBSCompletionQuery)query
{
  return self->_query;
}

- (WBSCompletionQuery)rewrittenQuery
{
  return self->_rewrittenQuery;
}

- (void)setRewrittenQuery:(id)a3
{
}

- (BOOL)isAwaitingParsec
{
  return self->_awaitingParsec;
}

- (BOOL)isAwaitingSearchProvider
{
  return self->_awaitingSearchProvider;
}

- (BOOL)isAwaitingCompletionDatabase
{
  return self->_awaitingCompletionDatabase;
}

- (BOOL)isAwaitingTabCompletion
{
  return self->_awaitingTabCompletion;
}

- (NSArray)URLCompletionMatches
{
  return self->_URLCompletionMatches;
}

- (unint64_t)indexOfTopHitsGroup
{
  return self->_indexOfTopHitsGroup;
}

- (NSArray)parsecTopHits
{
  return self->_parsecTopHits;
}

- (NSArray)localTopHits
{
  return self->_localTopHits;
}

- (WBSBrowserTabCompletionMatch)tabCompletionMatch
{
  return self->_tabCompletionMatch;
}

- (NSArray)topParsecResults
{
  return self->_topParsecResults;
}

- (NSArray)bottomParsecResults
{
  return self->_bottomParsecResults;
}

- (QuickWebsiteSearchCompletionItem)quickWebsiteSearchItem
{
  return self->_quickWebsiteSearchItem;
}

- (void)setQuickWebsiteSearchItem:(id)a3
{
}

- (int64_t)searchSuggestionsSource
{
  return self->_searchSuggestionsSource;
}

- (NSArray)searchSuggestions
{
  return self->_searchSuggestions;
}

- (unint64_t)indexOfSearchSuggestionsGroup
{
  return self->_indexOfSearchSuggestionsGroup;
}

- (NSArray)suggestedSites
{
  return self->_suggestedSites;
}

- (CalculationResultCompletionItem)calculationResultItem
{
  return self->_calculationResultItem;
}

- (PencilInputCompletionItem)pencilCompletionItem
{
  return self->_pencilCompletionItem;
}

- (void)setPencilCompletionItem:(id)a3
{
}

- (FindOnPageCompletionItem)findOnPageCompletionItem
{
  return self->_findOnPageCompletionItem;
}

- (CompletionGroupTitleProviding)completionGroupTitleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_completionGroupTitleProvider);
  return (CompletionGroupTitleProviding *)WeakRetained;
}

- (void)setCompletionGroupTitleProvider:(id)a3
{
}

- (SFSearchResult)hiddenIgnoredSiriSuggestedSite
{
  return self->_hiddenIgnoredSiriSuggestedSite;
}

- (void)setHiddenIgnoredSiriSuggestedSite:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenIgnoredSiriSuggestedSite, 0);
  objc_destroyWeak((id *)&self->_completionGroupTitleProvider);
  objc_storeStrong((id *)&self->_findOnPageCompletionItem, 0);
  objc_storeStrong((id *)&self->_pencilCompletionItem, 0);
  objc_storeStrong((id *)&self->_calculationResultItem, 0);
  objc_storeStrong((id *)&self->_suggestedSites, 0);
  objc_storeStrong((id *)&self->_searchSuggestions, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchItem, 0);
  objc_storeStrong((id *)&self->_bottomParsecResults, 0);
  objc_storeStrong((id *)&self->_topParsecResults, 0);
  objc_storeStrong((id *)&self->_tabCompletionMatch, 0);
  objc_storeStrong((id *)&self->_localTopHits, 0);
  objc_storeStrong((id *)&self->_parsecTopHits, 0);
  objc_storeStrong((id *)&self->_URLCompletionMatches, 0);
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_displayedParsecResults, 0);
  objc_storeStrong((id *)&self->_groupListing, 0);
}

- (void)_hasTopHitDuplicateInResults:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Primary TopHit originalURLString is nil.", v1, 2u);
}

void __44__CompletionGroupListing__buildListIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 48);
  id v5 = a2;
  id v6 = [v4 queryString];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_debug_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEBUG, "Built Completion List for query \"%@\": %@", (uint8_t *)&v7, 0x16u);
}

@end