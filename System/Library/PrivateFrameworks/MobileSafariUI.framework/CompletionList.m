@interface CompletionList
+ (id)_completionsByMergingRecentSearches:(id)a3 withSuggestions:(id)a4 andLiteralSearch:(id)a5 queryID:(int64_t)a6 topHits:(id)a7 forPrivateBrowsing:(BOOL)a8;
+ (id)completionBookmarkProvider;
- (BOOL)_canUseOfflineSearchSuggestions;
- (BOOL)_defaultSearchEngineIsGoogle;
- (BOOL)_isPegasusMapsCompositeResult:(id)a3;
- (BOOL)_isStreamlinedCompletionListEnabled;
- (BOOL)_searchRenderTimeoutHasElapsed;
- (BOOL)_shouldFetchSearchSuggestions;
- (BOOL)_shouldSearchUIHandleEngagementForURL:(id)a3;
- (BOOL)_topHitMatchesString:(id)a3;
- (BOOL)_urlString:(id)a3 isProbablyContainedIn:(id)a4;
- (BOOL)canPerformCommand:(id)a3;
- (BOOL)hasCompletions;
- (BOOL)hasParsecResults;
- (BOOL)isExecutingVoiceSearch;
- (BOOL)isTopHitReadyForString:(id)a3;
- (BOOL)isUsingPencilInput;
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (BOOL)shouldIncludeNetworkedSearchSuggestions;
- (BOOL)shouldOverrideBackgroundViewForItem:(id)a3;
- (BrowserController)browserController;
- (CalculationResultCompletionProvider)calculationResultProvider;
- (CompletionList)initWithParsecSearchSession:(id)a3 browserController:(id)a4;
- (CompletionListDelegate)delegate;
- (CompletionProvider)firstRemoteCompletionProviderToRespondToQuery;
- (FindOnPageCompletionProvider)findOnPageProvider;
- (LoadProgressObserver)loadProgressObserver;
- (NSArray)searchParametersList;
- (NSCache)faviconCache;
- (NSDate)minRenderTimeoutStartTime;
- (NSDate)otherRenderTimeoutStartTime;
- (NSDate)searchRenderTimeoutStartTime;
- (NSIndexPath)indexPathOfAsTypedSearchSuggestion;
- (NSString)titleForSearchSuggestionsCompletion;
- (OfflineSearchSuggestionsCompletionProvider)offlineSearchSuggestionsCompletionProvider;
- (PencilInputCompletionProvider)pencilInputCompletionProvider;
- (QuickWebsiteSearchCompletionProvider)quickWebsiteSearchProvider;
- (SearchSuggestionProvider)suggestionProvider;
- (TabCompletionProvider)tabCompletionProvider;
- (URLCompletionProvider)URLCompletionProvider;
- (UniversalSearchCompletionProvider)universalSearchProvider;
- (UniversalSearchSession)parsecSearchSession;
- (WBSCompletionQuery)query;
- (WBSCompletionQuery)rewrittenQuery;
- (id)_addTopHits:(id)a3 intoGroups:(id)a4;
- (id)_addTopHitsWithSwitchToTabSectionIfNecessary:(id)a3 intoGroups:(id)a4;
- (id)_bestTabCompletionItemWithTopHits:(id)a3;
- (id)_completionsRequiringFavicon;
- (id)_filteredURLCompletions:(id)a3 withTopHits:(id)a4 displayedUniversalSearchCompletions:(id)a5;
- (id)_groupByAddingCompletions:(id)a3 toGroup:(id)a4;
- (id)_groupOrNilAtIndex:(unint64_t)a3;
- (id)_groupWithTitle:(id)a3 completions:(id)a4;
- (id)_groupWithTitle:(id)a3 completions:(id)a4 maximumCompletions:(unint64_t)a5;
- (id)_indexPathForEquivalentCompletionItem:(id)a3;
- (id)_listingForQuery:(id)a3;
- (id)_recentSearchesForQuery:(id)a3;
- (id)_titleForFindOnPageHeaderWithMatchCount:(unint64_t)a3;
- (id)_titleForTopHits:(unint64_t)a3;
- (id)_urlFromCommand:(id)a3;
- (id)completionsForGroupAtIndex:(unint64_t)a3;
- (id)currentSearchEngineHostSuffixes;
- (id)currentWindowUUIDForTabCompletionProvider:(id)a3;
- (id)defaultSectionTitleForGroupAtIndex:(unint64_t)a3;
- (id)headerViewForGroupAtIndex:(unint64_t)a3;
- (id)headerViewReuseIdentifierForGroupAtIndex:(unint64_t)a3;
- (id)selectedTabDocumentForTabCompletionProvider:(id)a3;
- (id)swipeActionsForCompletionItemAtIndexPath:(id)a3;
- (id)tabDocumentForFindOnPageCompletionProvider:(id)a3;
- (id)tabGroupsForTabCompletionProvider:(id)a3;
- (id)titleForFindOnPageCompletion:(id)a3;
- (id)titleForGroupAtIndex:(unint64_t)a3;
- (id)topHitForString:(id)a3;
- (id)windowHostingCompletionProvider:(id)a3;
- (id)windowUUIDsToTabsForTabCompletionProvider:(id)a3;
- (unint64_t)numberOfGroups;
- (void)_addResult:(id)a3 intoGroup:(id)a4 unlessHiddenBy:(id)a5 topHit:(id)a6;
- (void)_addResults:(id)a3 intoGroups:(id)a4;
- (void)_addSearchProviderSuggestions:(id)a3 toListing:(id)a4;
- (void)_addSwitchToTabSectionIfNecessary:(id)a3 intoGroups:(id)a4;
- (void)_addSwitchToTabSectionWithTabCompletionMatch:(id)a3 intoGroups:(id)a4;
- (void)_addURLCompletions:(id)a3 toListing:(id)a4 isCFSearch:(BOOL)a5;
- (void)_addUniversalSearchCompletions:(id)a3 toCompletionListing:(id)a4;
- (void)_cacheResultsIfApplicable:(id)a3;
- (void)_deleteTopHitCompletionItem:(id)a3 atIndexPath:(id)a4;
- (void)_postFeedback:(id)a3;
- (void)_removeIgnoredSiriSuggestedSiteRecordsForHistoryItem:(id)a3;
- (void)_removeSearchURLsFromCompletions:(id)a3;
- (void)_removeTopHitsGroup:(id)a3;
- (void)_requestFavicons;
- (void)_searchForURLTopHits:(id)a3 intoTopHits:(id)a4;
- (void)_updateCompletionListing;
- (void)_updateIconsForSearchUIRowsInGroups:(id)a3 topHit:(id)a4;
- (void)_updateOfflineSearchSuggestionAvailability;
- (void)_updateProviders;
- (void)_updateQueryIDForGroups;
- (void)cacheCurrentCompletionsAfterAcceptanceOfCompletionItem:(id)a3;
- (void)clearCachedSearchQuery;
- (void)clearCachedSearches;
- (void)clearCachedTabCompletionData;
- (void)clearCompletionListings;
- (void)completionProvider:(id)a3 didFinishCompletingString:(id)a4;
- (void)configureHeaderView:(id)a3 forGroupAtIndex:(unint64_t)a4;
- (void)dealloc;
- (void)didEngageResult:(id)a3;
- (void)didResumeSearchWithQuery:(id)a3;
- (void)performCommand:(id)a3;
- (void)recordIgnoredSiriSuggestedSitesWithURL:(id)a3;
- (void)restoreCachedCompletions;
- (void)setCalculationResultProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExecutingVoiceSearch:(BOOL)a3;
- (void)setFindOnPageProvider:(id)a3;
- (void)setFirstRemoteCompletionProviderToRespondToQuery:(id)a3;
- (void)setLoadProgressObserver:(id)a3;
- (void)setMinRenderTimeoutStartTime:(id)a3;
- (void)setOfflineSearchSuggestionsCompletionProvider:(id)a3;
- (void)setOtherRenderTimeoutStartTime:(id)a3;
- (void)setParsecSearchSession:(id)a3;
- (void)setPencilInputCompletionProvider:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQuickWebsiteSearchProvider:(id)a3;
- (void)setRewrittenQuery:(id)a3;
- (void)setSearchParametersList:(id)a3;
- (void)setSearchRenderTimeoutStartTime:(id)a3;
- (void)setShouldIncludeNetworkedSearchSuggestions:(BOOL)a3;
- (void)setSuggestionProvider:(id)a3;
- (void)setTabCompletionProvider:(id)a3;
- (void)setURLCompletionProvider:(id)a3;
- (void)setUniversalSearchProvider:(id)a3;
- (void)setUsingPencilInput:(BOOL)a3;
- (void)stopCompleting;
- (void)updateRestorationCompletionItemForCompletionItem:(id)a3 isCF:(BOOL)a4;
- (void)willDismissViewController:(id)a3;
@end

@implementation CompletionList

- (CompletionList)initWithParsecSearchSession:(id)a3 browserController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CompletionList;
  v8 = [(CompletionList *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_browserController, v7);
    [(CompletionList *)v9 setParsecSearchSession:v6];
    [(CompletionList *)v9 _updateOfflineSearchSuggestionAvailability];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mobilesafari.IgnoredSiriSuggestedSites", v10);
    ignoredSiriSuggestedSitesQueue = v9->_ignoredSiriSuggestedSitesQueue;
    v9->_ignoredSiriSuggestedSitesQueue = (OS_dispatch_queue *)v11;

    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(NSMutableDictionary *)self->_urlStringToFaviconRequestTokens allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
        [v9 cancelRequestsWithTokens:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)CompletionList;
  [(CompletionList *)&v10 dealloc];
}

- (id)_recentSearchesForQuery:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[RecentWebSearchesController sharedController];
  uint64_t v6 = [v4 queryString];
  uint64_t v7 = [v5 recentSearchesMatchingPrefix:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    p_browserController = &self->_browserController;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_super v15 = [SearchSuggestion alloc];
        id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
        v17 = -[SearchSuggestion initWithRecentSearchString:userQuery:forPrivateBrowsing:](v15, "initWithRecentSearchString:userQuery:forPrivateBrowsing:", v14, v4, [WeakRetained isPrivateBrowsingEnabled]);
        [v8 addObject:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (id)_completionsByMergingRecentSearches:(id)a3 withSuggestions:(id)a4 andLiteralSearch:(id)a5 queryID:(int64_t)a6 topHits:(id)a7 forPrivateBrowsing:(BOOL)a8
{
  BOOL v52 = a8;
  int64_t v49 = a6;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  objc_super v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v65 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        long long v22 = objc_msgSend(v21, "string", v49);
        [v15 setObject:v21 forKeyedSubscript:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v18);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v23 = v11;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v61 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        v29 = objc_msgSend(v28, "string", v49);
        [v15 setObject:v28 forKeyedSubscript:v29];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v25);
  }

  v30 = (void *)MEMORY[0x1E4F98A50];
  v31 = objc_msgSend(v23, "safari_mapObjectsUsingBlock:", &__block_literal_global_67);
  v32 = objc_msgSend(v16, "safari_mapObjectsUsingBlock:", &__block_literal_global_67);
  v33 = [v30 recentAndSuggestedCompletionStringsByMergingRecentSearches:v31 withSuggestions:v32 literalSearch:v13];

  v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count") + objc_msgSend(v33, "count") + 1);
  v35 = [MEMORY[0x1E4F3B060] sharedInstance];
  v36 = [v35 defaultSearchEngineForPrivateBrowsing:v52];

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __122__CompletionList__completionsByMergingRecentSearches_withSuggestions_andLiteralSearch_queryID_topHits_forPrivateBrowsing___block_invoke_2;
  v58[3] = &unk_1E6D7E9D8;
  id v50 = v36;
  id v59 = v50;
  v51 = objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", v58);
  if (v13)
  {
    if ([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled])
    {
      v37 = objc_msgSend(v13, "safari_stringByTrimmingWhitespace");
      v38 = [v37 lowercaseString];
      if ([v51 containsObject:v38])
      {
        char v39 = [MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled];

        if (v39) {
          goto LABEL_24;
        }
      }
      else
      {
      }
LABEL_23:
      v40 = (void *)[objc_alloc(MEMORY[0x1E4F98A50]) initWithQueryString:v13 queryID:v49];
      v41 = [[SearchSuggestion alloc] initWithUserTypedQuery:v40 forPrivateBrowsing:v52];
      [v34 addObject:v41];

      goto LABEL_24;
    }
    if (([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled] & 1) == 0) {
      goto LABEL_23;
    }
  }
LABEL_24:
  v53 = v13;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v42 = v33;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = objc_msgSend(v15, "objectForKeyedSubscript:", *(void *)(*((void *)&v54 + 1) + 8 * k), v49);
        [v34 addObject:v47];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v44);
  }

  return v34;
}

uint64_t __122__CompletionList__completionsByMergingRecentSearches_withSuggestions_andLiteralSearch_queryID_topHits_forPrivateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 string];
}

id __122__CompletionList__completionsByMergingRecentSearches_withSuggestions_andLiteralSearch_queryID_topHits_forPrivateBrowsing___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [a2 originalURLString];
  uint64_t v5 = [v3 URLWithString:v4];
  uint64_t v6 = [v2 userVisibleQueryFromSearchURL:v5];
  uint64_t v7 = [v6 lowercaseString];

  return v7;
}

- (id)_titleForFindOnPageHeaderWithMatchCount:(unint64_t)a3
{
  uint64_t v5 = &stru_1F3C268E8;
  if ((_SFDeviceIsPad() & 1) == 0 && *MEMORY[0x1E4F78A00] != a3)
  {
    uint64_t v6 = *MEMORY[0x1E4F3B0D8];
    if (*MEMORY[0x1E4F3B0D8] >= a3)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
      [v9 localizedStringFromNumber:v8 numberStyle:1];
    }
    else
    {
      uint64_t v7 = NSString;
      uint64_t v8 = _WBSLocalizedString();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
    uint64_t v10 = };

    if (a3 < 2)
    {
      if (a3 != 1)
      {
        _WBSLocalizedString();
        uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      id v14 = NSString;
      id v12 = _WBSLocalizedString();
      uint64_t v13 = objc_msgSend(v14, "localizedStringWithFormat:", v12, 1);
    }
    else
    {
      id v11 = NSString;
      id v12 = _WBSLocalizedString();
      uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", v12, v10);
    }
    uint64_t v5 = (__CFString *)v13;

LABEL_12:
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v16 = [WeakRetained tabController];
  uint64_t v17 = [v16 activeTabDocument];
  [v17 isPDFDocument];

  uint64_t v18 = NSString;
  uint64_t v19 = _WBSLocalizedString();
  long long v20 = objc_msgSend(v18, "stringWithFormat:", v19, v5);

  return v20;
}

- (id)_groupWithTitle:(id)a3 completions:(id)a4 maximumCompletions:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[CompletionGroup alloc] initWithTitle:v8 completions:v7 maximumNumberOfCompletions:a5];

  return v9;
}

- (id)_groupWithTitle:(id)a3 completions:(id)a4
{
  return [(CompletionList *)self _groupWithTitle:a3 completions:a4 maximumCompletions:5];
}

- (id)_groupByAddingCompletions:(id)a3 toGroup:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 title];
  uint64_t v9 = [v6 completions];

  uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v7];

  id v11 = [(CompletionList *)self _groupWithTitle:v8 completions:v10];

  return v11;
}

- (void)_removeSearchURLsFromCompletions:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v5 = [WeakRetained activeSearchEngine];

  if ([v11 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v11 objectAtIndex:v6];
      id v8 = [v7 userVisibleURLString];
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v8);
      int v10 = [v5 urlIsValidSearch:v9];

      if (v10) {
        [v11 removeObjectAtIndex:v6];
      }
      else {
        ++v6;
      }
    }
    while (v6 < [v11 count]);
  }
}

- (BOOL)_canUseOfflineSearchSuggestions
{
  BOOL v3 = [(CompletionList *)self _defaultSearchEngineIsGoogle];
  if (v3)
  {
    BOOL v3 = [(OfflineSearchSuggestionsCompletionProvider *)self->_offlineSearchSuggestionsCompletionProvider areOfflineSearchSuggestionsAvailable];
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v5 = [v4 BOOLForKey:*MEMORY[0x1E4F98010]];

      LOBYTE(v3) = (v5 & 1) == 0 && !self->_haveReceivedNetworkedSuggestions;
    }
  }
  return v3;
}

- (BOOL)_defaultSearchEngineIsGoogle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v3 = [WeakRetained activeSearchEngine];
  id v4 = [v3 shortName];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F995F8]];

  return v5;
}

- (BOOL)_shouldFetchSearchSuggestions
{
  if (self->_shouldIncludeNetworkedSearchSuggestions
    || (BOOL v3 = [(CompletionList *)self _canUseOfflineSearchSuggestions]))
  {
    LOBYTE(v3) = self->_inputTypeOfStringToComplete - 3 < 0xFFFFFFFFFFFFFFFELL;
  }
  return v3;
}

- (BOOL)hasParsecResults
{
  return [(CompletionGroupListing *)self->_listingOnDisplay hasParsecCompletions];
}

- (void)_removeTopHitsGroup:(id)a3
{
  id v8 = a3;
  BOOL v3 = [v8 objectAtIndexedSubscript:0];
  id v4 = [v3 completions];
  char v5 = [v4 firstObject];
  objc_opt_class();
  uint64_t v6 = objc_opt_isKindOfClass() & 1;

  id v7 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
  [v8 setObject:v7 atIndexedSubscript:v6];

  objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v8, "count") - 1);
}

- (void)_addURLCompletions:(id)a3 toListing:(id)a4 isCFSearch:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  rewrittenQuery = self->_rewrittenQuery;
  if (rewrittenQuery)
  {
    id v11 = [(WBSCompletionQuery *)rewrittenQuery queryString];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v45 + 1) + 8 * i) sfSearchResultValue];
          [v17 setCorrectedQuery:v11];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v14);
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  long long v20 = [WeakRetained activeSearchEngine];
  query = self->_rewrittenQuery;
  if (!query) {
    query = self->_query;
  }
  id v22 = [MEMORY[0x1E4F98DB0] filterOutUnlikelyMatchesFromTopHits:v8 forQuery:query searchProvider:v20];

  [(CompletionList *)self _searchForURLTopHits:v22 intoTopHits:v18];
  id v23 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = v23;
    uint64_t v25 = [v18 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v51 = v25;
    _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_INFO, "Number of local TopHits: %lu", buf, 0xCu);
  }
  if (![v18 count] && self->_tryParsecRewritesIfNoTopHit)
  {
    self->_tryParsecRewritesIfNoTopHit = 0;
    v29 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider parsecSearchSession];
    v28 = [v29 rewrittenQueryStringFromParsec];

    v30 = (WBSCompletionQuery *)[objc_alloc(MEMORY[0x1E4F98A50]) initWithQueryString:v28];
    v31 = self->_rewrittenQuery;
    self->_rewrittenQuery = v30;

    v32 = [WeakRetained effectiveProfileIdentifier];
    [(WBSCompletionQuery *)self->_rewrittenQuery setProfileIdentifierToFilterResults:v32];

    [(WBSCompletionQuery *)self->_rewrittenQuery setTriggerEvent:18];
    v33 = [self->_URLCompletionProvider completionsForQuery:self->_rewrittenQuery isCFSearch:v5];

    if (!v33)
    {
      [v9 setNeedsParsecDatabaseQueryRewrite];
      goto LABEL_18;
    }
    v40 = v20;
    v34 = [MEMORY[0x1E4F98DB0] filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches:v33 forQuery:self->_rewrittenQuery searchProvider:v20];

    [(CompletionList *)self _searchForURLTopHits:v34 intoTopHits:v18];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v22 = v34;
    uint64_t v35 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v42 != v37) {
            objc_enumerationMutation(v22);
          }
          char v39 = [*(id *)(*((void *)&v41 + 1) + 8 * j) sfSearchResultValue];
          [v39 setCorrectedQuery:v28];
        }
        uint64_t v36 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v36);
    }

    long long v20 = v40;
  }
  uint64_t v26 = [v18 count];
  if (v26)
  {
    uint64_t v27 = objc_msgSend(v22, "subarrayWithRange:", v26, objc_msgSend(v22, "count") - v26);

    id v22 = (id)v27;
  }
  [v9 setURLCompletionMatches:v22];
  [v9 setLocalTopHits:v18];
  [v9 setRewrittenQuery:self->_rewrittenQuery];
  v28 = v22;
LABEL_18:
}

- (void)_addUniversalSearchCompletions:(id)a3 toCompletionListing:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CompletionList _addUniversalSearchCompletions:toCompletionListing:](v8);
    }
  }
  if ([v6 count])
  {
    id v9 = [v7 topHits];
    long long v54 = v7;
    int v10 = [v7 topHitAddresses];
    long long v62 = [MEMORY[0x1E4F1CA48] array];
    id v59 = [MEMORY[0x1E4F1CA48] array];
    v58 = [MEMORY[0x1E4F1CA48] array];
    long long v60 = v9;
    long long v64 = [v9 firstObject];
    BOOL v67 = [(CompletionList *)self _isPegasusMapsCompositeResult:v6];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v55 = v6;
    id obj = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    long long v61 = v10;
    if (v11)
    {
      uint64_t v12 = v11;
      long long v57 = 0;
      unint64_t v13 = 0;
      unint64_t v65 = 0;
      uint64_t v66 = *(void *)v74;
      uint64_t v14 = v9;
      while (1)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v74 != v66) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          if (v67 || [*(id *)(*((void *)&v73 + 1) + 8 * i) placement] == 2) {
            goto LABEL_28;
          }
          uint64_t v17 = [v16 resultType];
          if (!WBSIsEqual())
          {
LABEL_27:

            int v10 = v61;
            goto LABEL_28;
          }
          siriSuggestedSitesURLStringsToIgnore = self->_siriSuggestedSitesURLStringsToIgnore;
          uint64_t v19 = [v16 url];
          long long v20 = [v19 absoluteString];
          LODWORD(siriSuggestedSitesURLStringsToIgnore) = [(NSSet *)siriSuggestedSitesURLStringsToIgnore containsObject:v20];

          uint64_t v14 = v60;
          int v10 = v61;
          if (!siriSuggestedSitesURLStringsToIgnore) {
            goto LABEL_28;
          }
          id v21 = [MEMORY[0x1E4F98F50] shared];
          if ([v21 inExperiment])
          {
            id v22 = [(NSArray *)self->_searchParametersList firstObject];
            if ([v22 shouldEmitTriggerLoggingForHidingIgnoredSiriSuggestedWebsite])
            {
              id v23 = [MEMORY[0x1E4F98DB0] searchParameters];
              uint64_t v56 = [v23 thresholdForHidingIgnoredSiriSuggestedSites];

              uint64_t v14 = v60;
              if (!v56) {
                goto LABEL_20;
              }
              id v21 = objc_alloc_init(MEMORY[0x1E4F9A0A8]);
              objc_msgSend(v21, "setQueryId:", -[WBSCompletionQuery queryID](self->_query, "queryID"));
              uint64_t v24 = [MEMORY[0x1E4F98F58] codePathUUIDForHideIgnoredSiriSuggestedWebsites];
              [v21 setCodepathId:v24];

              uint64_t v14 = v60;
              id v22 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
              [v22 didHideRepeatedlyIgnoredSiriSuggestedSiteWithFeedbackEvent:v21];
            }
          }
LABEL_20:
          uint64_t v17 = [MEMORY[0x1E4F98DB0] searchParameters];
          if (![v17 thresholdForHidingIgnoredSiriSuggestedSites]) {
            goto LABEL_27;
          }
          uint64_t v25 = [MEMORY[0x1E4F98DB0] searchParameters];
          int v26 = [v25 shouldHideIgnoredSiriSuggestedSites];

          uint64_t v14 = v60;
          int v10 = v61;
          if (v26)
          {
            uint64_t v27 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              v28 = v27;
              v29 = [v16 url];
              v30 = [v29 absoluteString];
              *(_DWORD *)buf = 138739971;
              v79 = v30;
              _os_log_impl(&dword_1E102C000, v28, OS_LOG_TYPE_INFO, "Hiding repeatedly ignored Siri suggested site: %{sensitive}@", buf, 0xCu);
            }
            if (objc_opt_respondsToSelector())
            {
              id v31 = objc_alloc_init(MEMORY[0x1E4F9A398]);
              [v31 setHideReason:1];
              [v16 setSafariAttributes:v31];
            }
            id v32 = v16;

            long long v57 = v32;
            uint64_t v14 = v60;
            continue;
          }
LABEL_28:
          objc_msgSend(v16, "setQueryId:", -[WBSCompletionQuery queryID](self->_query, "queryID"));
          if (![v14 count] && objc_msgSend(v16, "topHit") && v13 <= 1)
          {
            uint64_t v35 = self;
            uint64_t v36 = v16;
            uint64_t v37 = v58;
LABEL_42:
            [(CompletionList *)v35 _addResult:v36 intoGroup:v37 unlessHiddenBy:v10 topHit:v64];
            ++v13;
            continue;
          }
          if ([v16 placement] != 2 && v13 <= 1)
          {
            uint64_t v35 = self;
            uint64_t v36 = v16;
            uint64_t v37 = v62;
            goto LABEL_42;
          }
          if (v65 > 1)
          {
            unint64_t v65 = 2;
          }
          else
          {
            [(CompletionList *)self _addResult:v16 intoGroup:v59 unlessHiddenBy:v10 topHit:v64];
            ++v65;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
        if (!v12) {
          goto LABEL_47;
        }
      }
    }
    long long v57 = 0;
    uint64_t v14 = v9;
LABEL_47:

    id v7 = v54;
    [v54 setHiddenIgnoredSiriSuggestedSite:v57];
    if (![v14 count] && objc_msgSend(v58, "count")) {
      [v54 setParsecTopHits:v58];
    }
    v38 = [v54 calculationResultItem];
    char v39 = v38;
    if (!v38
      || ([v38 calculationResult],
          v40 = objc_claimAutoreleasedReturnValue(),
          char v41 = [v40 isCurrencyConversion],
          v40,
          (v41 & 1) == 0))
    {
      [v54 setTopParsecResults:v62];
    }
    id v6 = v55;
    if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
    {
      v68 = v39;
      long long v42 = [MEMORY[0x1E4F28E78] string];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v43 = v62;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v70 != v46) {
              objc_enumerationMutation(v43);
            }
            long long v48 = *(void **)(*((void *)&v69 + 1) + 8 * j);
            int64_t v49 = [v48 uuidString];
            id v50 = [v48 url];
            uint64_t v51 = [v50 absoluteString];
            BOOL v52 = objc_msgSend(v51, "safari_urlHashesOfComponents");
            [v42 appendFormat:@" %@ <%@>,", v49, v52];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v69 objects:v77 count:16];
        }
        while (v45);
      }

      uint64_t v53 = WBS_LOG_CHANNEL_PREFIXParsec();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        -[CompletionList _addUniversalSearchCompletions:toCompletionListing:]((uint64_t)v42, v53);
      }

      id v7 = v54;
      id v6 = v55;
      int v10 = v61;
      char v39 = v68;
    }
    [v7 setBottomParsecResults:v59];
  }
}

- (void)_addSearchProviderSuggestions:(id)a3 toListing:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v7 = [(WBSCompletionQuery *)self->_query queryString];
  id v8 = v7;
  if (self->_inputTypeOfStringToComplete != 1 && [v7 length])
  {
    id v9 = [(CompletionProvider *)self->_quickWebsiteSearchProvider completionsForQuery:self->_query];
    int v10 = [v9 firstObject];
    [v6 setQuickWebsiteSearchItem:v10];

    uint64_t v11 = [(CompletionList *)self _recentSearchesForQuery:self->_query];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [(WBSCompletionQuery *)self->_query queryID];
    uint64_t v14 = [v6 topHits];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v16 = objc_msgSend(v12, "_completionsByMergingRecentSearches:withSuggestions:andLiteralSearch:queryID:topHits:forPrivateBrowsing:", v11, v26, v8, v13, v14, objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));

    uint64_t v25 = v11;
    if ([v26 count]) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = [v11 count] != 0;
    }
    uint64_t v24 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    if ([v16 count])
    {
      unint64_t v19 = 0;
      do
      {
        long long v20 = [v16 objectAtIndex:v19];
        if ([v20 goesToURL])
        {
          [v16 removeObjectAtIndex:v19];
          id v21 = [v20 string];
          id v22 = [v6 topHitAddresses];
          if ([(CompletionList *)self _urlString:v21 isProbablyContainedIn:v22])
          {
          }
          else
          {
            unint64_t v23 = [v18 count];

            if (v23 <= 2) {
              [v18 addObject:v20];
            }
          }
        }
        else
        {
          ++v19;
        }
      }
      while (v19 < [v16 count]);
    }
    [v6 setSuggestedSites:v18];
    [v6 setSearchSuggestions:v16 fromSource:v24];
  }
}

- (id)_listingForQuery:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = (WBSCompletionQuery *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v6 = [MEMORY[0x1E4F98DB0] searchParameters];
  uint64_t v7 = [v6 isCFSearch];

  uint64_t v8 = 112;
  if (v7) {
    uint64_t v8 = 120;
  }
  id v9 = (CompletionGroupListing *)*(id *)((char *)&self->super.isa + v8);
  int v10 = [(CompletionProvider *)self->_quickWebsiteSearchProvider completionsForQuery:v4];
  uint64_t v11 = [v10 firstObject];
  [(CompletionGroupListing *)v9 setQuickWebsiteSearchItem:v11];

  uint64_t v12 = [(CompletionProvider *)self->_calculationResultProvider completionsForQuery:v4];
  uint64_t v13 = [v12 firstObject];
  [(CompletionGroupListing *)v9 setCalculationResultItem:v13];

  if (self->_usingPencilInput)
  {
    uint64_t v14 = [self->_pencilInputCompletionProvider completionsForQuery:v4];
    uint64_t v15 = [v14 firstObject];
    [(CompletionGroupListing *)v9 setPencilCompletionItem:v15];
  }
  else
  {
    [(CompletionGroupListing *)v9 setPencilCompletionItem:0];
  }
  id v16 = [(FindOnPageCompletionProvider *)self->_findOnPageProvider completionsForQuery:v4];
  uint64_t v17 = [v16 firstObject];
  [(CompletionGroupListing *)v9 setFindOnPageCompletionItem:v17];

  if ([(CompletionGroupListing *)v9 isAwaitingCompletionDatabase]
    || self->_tryParsecRewritesIfNoTopHit)
  {
    if (self->_rewrittenQuery) {
      rewrittenQuery = self->_rewrittenQuery;
    }
    else {
      rewrittenQuery = v4;
    }
    unint64_t v19 = [self->_URLCompletionProvider completionsForQuery:rewrittenQuery isCFSearch:v7];
    if ([self->_URLCompletionProvider isFailing] || v19)
    {
      [(CompletionGroupListing *)v9 markDatabaseResultsReceived];
      if (v19) {
        [(CompletionList *)self _addURLCompletions:v19 toListing:v9 isCFSearch:v7];
      }
    }
  }
  BOOL v20 = [(CompletionGroupListing *)v9 isAwaitingCompletionDatabase];
  if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
  {
    id v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[CompletionList _listingForQuery:](!v20, v21);
    }
  }
  if ([(CompletionGroupListing *)v9 isAwaitingParsec] && !v20)
  {
    universalSearchProvider = self->_universalSearchProvider;
    if (universalSearchProvider) {
      char v23 = self->_parsecSearchSession != 0;
    }
    else {
      char v23 = 0;
    }
    uint64_t v24 = [(UniversalSearchCompletionProvider *)universalSearchProvider completionsForQuery:v4];
    if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
    {
      uint64_t v25 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        [(CompletionList *)v23 _listingForQuery:v24];
      }
    }
    if (v24) {
      char v26 = 0;
    }
    else {
      char v26 = v23;
    }
    if ((v26 & 1) == 0)
    {
      [(CompletionGroupListing *)v9 markParsecResultsReceived];
      [(CompletionList *)self _addUniversalSearchCompletions:v24 toCompletionListing:v9];
    }
  }
  uint64_t v27 = [self->_tabCompletionProvider completionsForQuery:v4];
  if (v27
    && [(CompletionGroupListing *)v9 isAwaitingTabCompletion]
    && ![(CompletionGroupListing *)v9 isAwaitingParsec])
  {

    if (v20) {
      goto LABEL_38;
    }
    [(CompletionGroupListing *)v9 markTabCompletionReceived];
    uint64_t v27 = [(CompletionGroupListing *)v9 topHits];
    v28 = [(CompletionList *)self _bestTabCompletionItemWithTopHits:v27];
    [(CompletionGroupListing *)v9 setTabCompletionMatch:v28];
  }
LABEL_38:
  if ([(CompletionGroupListing *)v9 isAwaitingSearchProvider])
  {
    BOOL v29 = [(CompletionList *)self _shouldFetchSearchSuggestions];
    if (v29 && self->_shouldIncludeNetworkedSearchSuggestions)
    {
      v30 = [(CompletionProvider *)self->_suggestionProvider completionsForQuery:v4];
    }
    else
    {
      v30 = 0;
    }
    uint64_t v31 = [v30 count];
    char v32 = !v29;
    if (v31) {
      char v32 = 1;
    }
    if ((v32 & 1) != 0 || ![(CompletionList *)self _canUseOfflineSearchSuggestions])
    {
      int v34 = 0;
    }
    else
    {
      uint64_t v33 = [self->_offlineSearchSuggestionsCompletionProvider completionsForQuery:v4];

      int v34 = 1;
      v30 = (void *)v33;
    }
    if (v30) {
      BOOL v35 = 0;
    }
    else {
      BOOL v35 = v29;
    }
    if (v35 && ![(CompletionProvider *)self->_suggestionProvider isFailing]
      || [(CompletionGroupListing *)v9 isAwaitingParsec])
    {
      listingOnDisplay = self->_listingOnDisplay;
      if (v9 != listingOnDisplay)
      {
        uint64_t v37 = [(CompletionGroupListing *)listingOnDisplay searchSuggestions];
        if (![v37 count])
        {
          v38 = -[SearchSuggestion initWithUserTypedQuery:forPrivateBrowsing:]([SearchSuggestion alloc], "initWithUserTypedQuery:forPrivateBrowsing:", v4, [WeakRetained isPrivateBrowsingEnabled]);
          v46[0] = v38;
          uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];

          uint64_t v37 = (void *)v39;
        }
        if ([(CompletionGroupListing *)self->_listingOnDisplay searchSuggestionsSource] == 1)
        {
          uint64_t v40 = 1;
        }
        else
        {
          id v43 = self->_listingOnDisplay;
          if (v43
            && (![(CompletionGroupListing *)v43 isAwaitingSearchProvider]
             || [(CompletionGroupListing *)self->_listingOnDisplay searchSuggestionsSource]))
          {
            uint64_t v40 = 2;
          }
          else
          {
            uint64_t v40 = 0;
          }
        }
        uint64_t v44 = [(CompletionGroupListing *)self->_listingOnDisplay suggestedSites];
        [(CompletionGroupListing *)v9 setSuggestedSites:v44];

        [(CompletionGroupListing *)v9 setSearchSuggestions:v37 fromSource:v40];
      }
    }
    else
    {
      if (!v34
        || !self->_shouldIncludeNetworkedSearchSuggestions
        || [(CompletionProvider *)self->_suggestionProvider isFailing])
      {
        suggestionProvider = self->_suggestionProvider;
        if (suggestionProvider) {
          BOOL v42 = ![(CompletionProvider *)suggestionProvider isFailing];
        }
        else {
          LOBYTE(v42) = 0;
        }
        self->_haveReceivedNetworkedSuggestions = v42;
        [(CompletionGroupListing *)v9 markSearchResultsReceived];
      }
      [(CompletionList *)self _addSearchProviderSuggestions:v30 toListing:v9];
    }
  }
  return v9;
}

- (id)titleForFindOnPageCompletion:(id)a3
{
  uint64_t v4 = [a3 numberOfMatches];
  return [(CompletionList *)self _titleForFindOnPageHeaderWithMatchCount:v4];
}

- (NSString)titleForSearchSuggestionsCompletion
{
  BOOL v3 = [MEMORY[0x1E4F3B060] sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v5 = objc_msgSend(v3, "defaultSearchEngineForPrivateBrowsing:", objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));

  id v6 = NSString;
  uint64_t v7 = _WBSLocalizedString();
  uint64_t v8 = [v5 displayName];
  id v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

  if (self->_shouldIncludeNetworkedSearchSuggestions
    || [(CompletionList *)self _canUseOfflineSearchSuggestions])
  {
    id v10 = v9;
LABEL_4:
    uint64_t v11 = v10;
    goto LABEL_5;
  }
  uint64_t v13 = [v5 shortName];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F99600]];

  if (v14)
  {
    id v10 = [v5 displayName];
    goto LABEL_4;
  }
  uint64_t v15 = NSString;
  id v16 = _WBSLocalizedString();
  uint64_t v17 = [v5 displayName];
  uint64_t v11 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

LABEL_5:
  return (NSString *)v11;
}

- (BOOL)_isStreamlinedCompletionListEnabled
{
  return [MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled];
}

- (id)_filteredURLCompletions:(id)a3 withTopHits:(id)a4 displayedUniversalSearchCompletions:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F98DB0];
  uint64_t v12 = [MEMORY[0x1E4F98DB0] searchParameters];
  LODWORD(v11) = [v11 includeBookmarksAndHistory:v12];

  if (v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F98DB0] filterOutUnlikelyMatchesFromMatches:v8 forQuery:self->_query rewrittenQuery:self->_rewrittenQuery];
    int v14 = [MEMORY[0x1E4F98DB0] searchParameters];
    int v15 = [v14 enableCompletionListHistoryDeduplicationValue];

    if (v15)
    {
      if (self->_switchToTabMatch)
      {
        v20[0] = self->_switchToTabMatch;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      }
      else
      {
        id v16 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v17 = [MEMORY[0x1E4F98DB0] dedupeSameTitleHistoryResults:v8 withMobile:1 withTophits:v9 withTabs:v16];

      if ([(CompletionList *)self _isStreamlinedCompletionListEnabled])
      {
        uint64_t v18 = [MEMORY[0x1E4F98DB0] dedupeSameURLResults:v17 withUniversalSearchResults:v10];

        uint64_t v17 = (void *)v18;
      }

      uint64_t v13 = v17;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_addResults:(id)a3 intoGroups:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v25 = self;
  id v26 = a4;
  [(CompletionList *)self _cacheResultsIfApplicable:v6];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        if ([v7 count])
        {
          int v14 = [v13 sectionHeader];
          int v15 = [v7 objectAtIndexedSubscript:0];
          id v16 = [v15 sectionHeader];
          char v17 = [v14 isEqualToString:v16];

          if ((v17 & 1) == 0)
          {
            uint64_t v18 = [v7 objectAtIndexedSubscript:0];
            unint64_t v19 = [v18 sectionHeader];
            BOOL v20 = [(CompletionList *)v25 _groupWithTitle:v19 completions:v7];
            [v26 addObject:v20];

            uint64_t v21 = [MEMORY[0x1E4F1CA48] array];

            uint64_t v7 = (void *)v21;
          }
        }
        [v7 addObject:v13];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  id v22 = [v7 objectAtIndexedSubscript:0];
  char v23 = [v22 sectionHeader];
  uint64_t v24 = [(CompletionList *)v25 _groupWithTitle:v23 completions:v7];
  [v26 addObject:v24];
}

- (void)_addResult:(id)a3 intoGroup:(id)a4 unlessHiddenBy:(id)a5 topHit:(id)a6
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v57[0] = v10;
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
  [(CompletionList *)self _cacheResultsIfApplicable:v14];

  id v15 = [v10 sectionBundleIdentifier];
  if ([v15 isEqualToString:@"com.apple.parsec.maps"])
  {
    int v16 = 0;
  }
  else
  {
    char v17 = [v10 url];

    if (!v17)
    {
      int v16 = 0;
      goto LABEL_21;
    }
    uint64_t v18 = [v10 url];
    uint64_t v56 = v18;
    unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];

    BOOL v20 = [MEMORY[0x1E4F98DB0] searchParameters];
    int v21 = [v20 isDedupeThroughAlternativeURLsEnabled];

    if (v21)
    {
      id v22 = [v10 alternativeURLs];
      uint64_t v23 = [v19 arrayByAddingObjectsFromArray:v22];

      unint64_t v19 = (void *)v23;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v15 = v19;
    uint64_t v24 = [v15 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      id v47 = v11;
      uint64_t v26 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v15);
          }
          uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "absoluteString", v47);
          long long v29 = objc_msgSend((id)v28, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 3, 0, 0);

          LOBYTE(v28) = [(CompletionList *)self _urlString:v29 isProbablyContainedIn:v12];
          if (v28)
          {
            int v16 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v25 = [v15 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v25) {
          continue;
        }
        break;
      }
      int v16 = 0;
LABEL_16:
      id v11 = v47;
    }
    else
    {
      int v16 = 0;
    }
  }
LABEL_21:
  uint64_t v48 = 0;
  BOOL v30 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider shouldHideParsecResult:v10 basedOnHideRankGivenTopHit:v13 indexOfTopHitInFrequentlyVisitedSites:&v48];
  uint64_t v31 = [v13 sfSearchResultValue];
  uint64_t v32 = [v31 identifier];
  uint64_t v33 = [v32 length];

  if (v33)
  {
    if (v16)
    {
LABEL_23:
      id v34 = objc_alloc(MEMORY[0x1E4F9A360]);
      id v54 = v10;
      BOOL v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
      uint64_t v36 = [v11 count] - 1;
      uint64_t v37 = v34;
      v38 = v31;
      uint64_t v39 = v35;
      uint64_t v40 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    char v41 = [MEMORY[0x1E4F29128] UUID];
    BOOL v42 = [v41 UUIDString];
    [v31 setIdentifier:v42];

    if (v16) {
      goto LABEL_23;
    }
  }
  if (!v30)
  {
    [v11 addObject:v10];
    goto LABEL_29;
  }
  id v43 = objc_alloc(MEMORY[0x1E4F9A360]);
  id v53 = v10;
  BOOL v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  uint64_t v36 = [v11 count] - 1;
  uint64_t v37 = v43;
  v38 = v31;
  uint64_t v39 = 0;
  uint64_t v40 = v35;
LABEL_27:
  uint64_t v44 = (void *)[v37 initWithResult:v38 hiddenResults:v39 duplicateResults:v40 localResultPosition:v36];
  rankingFeedbackForHiddenOrDuplicateResults = self->_rankingFeedbackForHiddenOrDuplicateResults;
  uint64_t v46 = [v31 identifier];
  [(NSMutableDictionary *)rankingFeedbackForHiddenOrDuplicateResults setObject:v44 forKeyedSubscript:v46];

LABEL_29:
}

- (void)_cacheResultsIfApplicable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[Application sharedApplication];
  id v5 = [v4 forYouRecentParsecResultsManager];

  [v5 appendResultsIfApplicable:v3];
}

- (id)_addTopHitsWithSwitchToTabSectionIfNecessary:(id)a3 intoGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(CompletionList *)self _addTopHits:v6 intoGroups:v7];
  }
  else
  {
    id v8 = 0;
  }
  [(CompletionList *)self _addSwitchToTabSectionIfNecessary:v6 intoGroups:v7];

  return v8;
}

- (void)_addSwitchToTabSectionIfNecessary:(id)a3 intoGroups:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![v8 count])
  {
    id v7 = [(CompletionList *)self _bestTabCompletionItemWithTopHits:v8];
    if (v7) {
      [(CompletionList *)self _addSwitchToTabSectionWithTabCompletionMatch:v7 intoGroups:v6];
    }
  }
}

- (id)_bestTabCompletionItemWithTopHits:(id)a3
{
  id v4 = a3;
  id v5 = [(CompletionList *)self tabCompletionProvider];
  char v6 = [v5 isFailing];

  if (v6)
  {
    id v7 = 0;
    goto LABEL_10;
  }
  id v8 = [v4 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 firstObject];

    if (!v9)
    {
      id v11 = 0;
      goto LABEL_9;
    }
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = [v9 userVisibleURLString];
    id v11 = objc_msgSend(v10, "safari_URLWithUserTypedString:", v8);
  }
  else
  {
    id v11 = 0;
    uint64_t v9 = 0;
  }

LABEL_9:
  id v12 = [(CompletionList *)self tabCompletionProvider];
  id v13 = [(CompletionList *)self query];
  id v7 = [v12 bestTabCompletionMatchForQuery:v13 withTopHitURL:v11];

LABEL_10:
  return v7;
}

- (void)_addSwitchToTabSectionWithTabCompletionMatch:(id)a3 intoGroups:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 tabGroupTitle];

  if (v8)
  {
    uint64_t v9 = NSString;
    id v10 = _WBSLocalizedString();
    id v11 = [v6 tabGroupTitle];
    id v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);
  }
  else
  {
    id v12 = _WBSLocalizedString();
  }
  v16[0] = v6;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  int v14 = [(CompletionList *)self _groupWithTitle:v12 completions:v13 maximumCompletions:1];
  [v7 addObject:v14];

  switchToTabMatch = self->_switchToTabMatch;
  self->_switchToTabMatch = (WBSBrowserTabCompletionMatch *)v6;
}

- (id)_titleForTopHits:(unint64_t)a3
{
  id v4 = _WBSLocalizedString();
  return v4;
}

- (id)_addTopHits:(id)a3 intoGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[CompletionList _titleForTopHits:](self, "_titleForTopHits:", [v6 count]);
  if ([v6 count])
  {
    uint64_t v9 = [(CompletionList *)self _bestTabCompletionItemWithTopHits:v6];
    if (v9)
    {
      uint64_t v10 = [v6 arrayByAddingObject:v9];

      if ([(CompletionList *)self _isStreamlinedCompletionListEnabled]) {
        objc_storeStrong((id *)&self->_switchToTabMatch, v9);
      }
    }
    else
    {
      uint64_t v10 = (uint64_t)v6;
    }

    id v6 = (id)v10;
  }
  id v11 = [(CompletionList *)self _groupWithTitle:v8 completions:v6];
  [v7 addObject:v11];

  id v12 = [v6 firstObject];

  return v12;
}

- (void)_searchForURLTopHits:(id)a3 intoTopHits:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
      if (!objc_msgSend(v12, "isTopHit", (void)v13)) {
        break;
      }
      [v6 addObject:v12];
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)_urlString:(id)a3 isProbablyContainedIn:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v7 = (void *)MEMORY[0x1E4F1CB10];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__CompletionList__urlString_isProbablyContainedIn___block_invoke;
    v10[3] = &unk_1E6D7EA00;
    id v11 = v6;
    id v12 = &v13;
    objc_msgSend(v7, "safari_enumeratePossibleURLsForUserTypedString:withBlock:", v5, v10);
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __51__CompletionList__urlString_isProbablyContainedIn___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = objc_msgSend(a2, "safari_userVisibleString");
  objc_msgSend(v5, "safari_urlStringForCompletionDeduplication");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_updateIconsForSearchUIRowsInGroups:(id)a3 topHit:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v5);
        }
        BOOL v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v9 = [v8 completions];
        if ((unint64_t)[v9 count] < 2
          || ([v9 lastObject],
              uint64_t v10 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v10,
              (isKindOfClass & 1) != 0))
        {
          id v22 = v9;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v12 = [v8 results];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v12);
                }
                char v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                uint64_t v18 = [v6 sfSearchResultValue];
                if (v17 == v18) {
                  uint64_t v19 = 7;
                }
                else {
                  uint64_t v19 = 5;
                }
                objc_msgSend(v17, "safari_setCompletionIconForCompactRow:", v19);
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v14);
          }

          uint64_t v9 = v22;
        }
      }
      uint64_t v21 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
}

- (void)_updateCompletionListing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained completionListHasScheduledDismissal:self];
  id v4 = WeakRetained;
  if ((v3 & 1) == 0)
  {
    id v5 = [(WBSCompletionQuery *)self->_query queryString];
    uint64_t v6 = [v5 length];

    if (!v6)
    {
      [(CompletionList *)self clearCompletionListings];
      [WeakRetained completionListDidUpdate:self forQuery:self->_query];
LABEL_51:
      id v4 = WeakRetained;
      goto LABEL_52;
    }
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    rankingFeedbackForHiddenOrDuplicateResults = self->_rankingFeedbackForHiddenOrDuplicateResults;
    self->_rankingFeedbackForHiddenOrDuplicateResults = v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v10 = [(NSArray *)self->_searchParametersList firstObject];
    int v11 = [v10 isCFSearch];

    if (v11)
    {
      id v12 = [(NSArray *)self->_searchParametersList firstObject];
      [MEMORY[0x1E4F98DB0] setSearchParameters:v12];

      unint64_t v13 = [self->_URLCompletionProvider cfErrorForQuery:self->_query];
      if (!v13)
      {
        uint64_t v14 = [(CompletionList *)self _listingForQuery:self->_query];
LABEL_9:
        uint64_t v15 = [(NSArray *)self->_searchParametersList lastObject];
        [MEMORY[0x1E4F98DB0] setSearchParameters:v15];

        char v16 = [(CompletionList *)self _listingForQuery:self->_query];
        char v17 = [v16 topHit];
        char v18 = [v16 isAwaitingCompletionDatabase];
        if (([v16 isAwaitingParsec] & 1) == 0 && (v18 & 1) == 0)
        {
          uint64_t v19 = [(WBSCompletionQuery *)self->_query queryString];
          uint64_t v20 = (NSString *)[v19 copy];
          stringMatchedByTopHit = self->_stringMatchedByTopHit;
          self->_stringMatchedByTopHit = v20;

          id v22 = [(WBSCompletionQuery *)self->_rewrittenQuery queryString];
          long long v23 = v22;
          long long v24 = v9;
          if (v22)
          {
            id v25 = v22;
          }
          else
          {
            id v25 = [(WBSCompletionQuery *)self->_query queryString];
          }
          long long v26 = v25;

          if ([(NSString *)self->_stringMatchedByTopHit length])
          {
            long long v27 = [v17 reflectedStringForUserTypedString:v26];
            p_matchingStringInTopHit = &self->_matchingStringInTopHit;
            matchingStringInTopHit = self->_matchingStringInTopHit;
            self->_matchingStringInTopHit = v27;
          }
          else
          {
            p_matchingStringInTopHit = &self->_matchingStringInTopHit;
            matchingStringInTopHit = self->_matchingStringInTopHit;
            self->_matchingStringInTopHit = 0;
          }

          if (!*p_matchingStringInTopHit
            && [(CompletionItem *)self->_topHit isEquivalentTo:v17])
          {
            objc_storeStrong((id *)p_matchingStringInTopHit, v26);
          }
          if ([(NSString *)self->_matchingStringInTopHit length]) {
            long long v30 = v17;
          }
          else {
            long long v30 = 0;
          }
          objc_storeStrong((id *)&self->_topHit, v30);
          if ([(NSString *)self->_stringMatchedByTopHit length]) {
            [WeakRetained completionList:self topHitDidBecomeReadyForString:self->_matchingStringInTopHit];
          }

          uint64_t v9 = v24;
        }
        if (([v16 isSufficientlyComputedForDisplay] & 1) == 0)
        {
          if ([(CompletionGroupListing *)self->_listingOnDisplay updateWithQuery:self->_query]) {
            [WeakRetained completionListDidUpdate:self forQuery:self->_query];
          }
          goto LABEL_50;
        }
        unint64_t v72 = v13;
        long long v73 = v16;
        objc_storeStrong((id *)&self->_listingOnDisplay, v16);
        long long v75 = v14;
        objc_storeStrong((id *)&self->_cfListingOnDisplay, v14);
        uint64_t v31 = [(CompletionGroupListing *)self->_listingOnDisplay groups];
        int v32 = v11;
        uint64_t v33 = v17;
        uint64_t v34 = [(NSMutableDictionary *)self->_rankingFeedbackForHiddenOrDuplicateResults copy];
        BOOL v35 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
        long long v76 = v9;
        [v9 timeIntervalSinceNow];
        double v37 = -v36;
        uint64_t v38 = [(WBSCompletionQuery *)self->_query queryID];
        uint64_t v39 = [(CompletionGroupListing *)self->_listingOnDisplay hiddenIgnoredSiriSuggestedSite];
        long long v74 = (void *)v31;
        uint64_t v40 = v31;
        char v41 = (void *)v34;
        char v17 = v33;
        [v35 didRankSections:v40 blendingDuration:v41 feedbackForHiddenAndDuplicateResults:v38 forQueryID:v39 hiddenIgnoredSiriSuggestedSite:v37];

        if (!v32)
        {
LABEL_49:
          [WeakRetained completionListDidUpdate:self forQuery:self->_query];
          [(CompletionList *)self _requestFavicons];

          uint64_t v14 = v75;
          uint64_t v9 = v76;
          char v16 = v73;
LABEL_50:

          goto LABEL_51;
        }
        if (v72)
        {
          uint64_t v42 = 0;
          unint64_t v43 = v72;
LABEL_48:
          BOOL v67 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
          objc_msgSend(v67, "triggeredExperimentWithTreatmentId:withQueryID:cfDiffered:cfUsed:cfError:", self->_treatmentId, -[WBSCompletionQuery queryID](self->_query, "queryID"), v42, 1, v43);

          goto LABEL_49;
        }
        uint64_t v44 = [(CompletionGroupListing *)self->_cfListingOnDisplay groups];
        uint64_t v45 = [(CompletionGroupListing *)self->_listingOnDisplay groups];
        id v46 = v44;
        id v47 = v45;
        uint64_t v48 = [v46 count];
        uint64_t v49 = [v47 count];
        BOOL v50 = v48 == v49;
        uint64_t v42 = v48 != v49;
        if (v50)
        {
          if ([v46 count])
          {
            unint64_t v51 = 0;
            v68 = v46;
            id v69 = v47;
            while (1)
            {
              long long v70 = [v46 objectAtIndexedSubscript:v51];
              long long v52 = [v70 title];
              id v53 = [v47 objectAtIndexedSubscript:v51];
              id v54 = [v53 title];
              int v55 = WBSIsEqual();

              int v71 = v55;
              if (!v55)
              {
LABEL_43:
                uint64_t v42 = v71 ^ 1u;
                goto LABEL_46;
              }
              uint64_t v56 = [v46 objectAtIndexedSubscript:v51];
              [v56 completions];
              v58 = unint64_t v57 = v51;

              unint64_t v59 = v57;
              long long v60 = [v47 objectAtIndexedSubscript:v57];
              long long v61 = [v60 completions];

              uint64_t v62 = [v58 count];
              if (v62 != [v61 count]) {
                goto LABEL_44;
              }
              if ([v58 count]) {
                break;
              }
LABEL_42:

              unint64_t v51 = v59 + 1;
              id v46 = v68;
              id v47 = v69;
              if (v51 >= [v68 count]) {
                goto LABEL_43;
              }
            }
            uint64_t v63 = 0;
            while (1)
            {
              long long v64 = [v58 objectAtIndexedSubscript:v63];
              unint64_t v65 = [v61 objectAtIndexedSubscript:v63];
              char v66 = [v64 isEquivalentTo:v65];

              if ((v66 & 1) == 0) {
                break;
              }
              if (++v63 >= (unint64_t)[v58 count]) {
                goto LABEL_42;
              }
            }
LABEL_44:

            uint64_t v42 = 1;
            unint64_t v43 = 0;
            id v46 = v68;
            id v47 = v69;
            goto LABEL_47;
          }
          uint64_t v42 = 0;
        }
LABEL_46:
        unint64_t v43 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      unint64_t v13 = 0;
    }
    uint64_t v14 = 0;
    goto LABEL_9;
  }
LABEL_52:
}

- (void)clearCompletionListings
{
  query = self->_query;
  self->_query = 0;

  currentListing = self->_currentListing;
  self->_currentListing = 0;

  listingOnDisplay = self->_listingOnDisplay;
  self->_listingOnDisplay = 0;

  cfListingOnDisplay = self->_cfListingOnDisplay;
  self->_cfListingOnDisplay = 0;

  currentCFListing = self->_currentCFListing;
  self->_currentCFListing = 0;

  self->_haveReceivedNetworkedSuggestions = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completionListDidUpdate:self forQuery:self->_query];
}

- (BOOL)_searchRenderTimeoutHasElapsed
{
  [(NSDate *)self->_searchRenderTimeoutStartTime timeIntervalSinceNow];
  double v4 = -v3;
  id v5 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider searchRenderTimeout];
  [v5 doubleValue];
  if (v6 / 1000.0 >= v4)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(NSDate *)self->_minRenderTimeoutStartTime timeIntervalSinceNow];
    double v8 = -v7;
    uint64_t v9 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider minRenderTimeout];
    [v9 doubleValue];
    BOOL v11 = v10 / 1000.0 < v8;
  }
  return v11;
}

+ (id)completionBookmarkProvider
{
  if (completionBookmarkProvider_onceToken != -1) {
    dispatch_once(&completionBookmarkProvider_onceToken, &__block_literal_global_89);
  }
  v2 = (void *)completionBookmarkProvider_bookmarkProvider;
  return v2;
}

void __44__CompletionList_completionBookmarkProvider__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4FB60F0]) initReadonlySafariBookmarkCollection];
  v1 = (void *)completionBookmarkProvider_bookmarkProvider;
  completionBookmarkProvider_bookmarkProvider = v0;
}

- (void)_updateProviders
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v3 = [WeakRetained tabController];
  double v4 = [v3 activeTabDocument];
  id v5 = +[Application sharedApplication];
  char v6 = [v5 isRunningPPT];

  if ((v6 & 1) == 0)
  {
    double v7 = [MEMORY[0x1E4F98F58] searchParameters];
    searchParametersList = self->_searchParametersList;
    self->_searchParametersList = v7;

    uint64_t v9 = [MEMORY[0x1E4F98F50] shared];
    if (v9)
    {
      double v10 = (void *)v9;
      BOOL v11 = [MEMORY[0x1E4F98F50] shared];
      id v12 = [v11 identifiers];

      if (v12)
      {
        unint64_t v13 = [v12 treatmentId];
        treatmentId = self->_treatmentId;
        self->_treatmentId = v13;
      }
    }
  }
  URLCompletionProvider = self->_URLCompletionProvider;
  if (!URLCompletionProvider)
  {
    char v16 = [v3 profileCloudTabStore];
    char v17 = [URLCompletionProvider alloc];
    char v18 = [(id)objc_opt_class() completionBookmarkProvider];
    uint64_t v19 = [v3 activeProfileIdentifier];
    uint64_t v20 = [(URLCompletionProvider *)v17 initWithBookmarkProvider:v18 cloudTabStore:v16 profileIdentifier:v19 maxResults:16 searchableCollectionsMask:7];
    uint64_t v21 = self->_URLCompletionProvider;
    self->_URLCompletionProvider = v20;

    [self->_URLCompletionProvider setDelegate:self];
    [self->_URLCompletionProvider setProvidesTopHits:1];

    URLCompletionProvider = self->_URLCompletionProvider;
  }
  [URLCompletionProvider setSearchParametersList:self->_searchParametersList];
  if (!self->_universalSearchProvider && self->_parsecSearchSession)
  {
    id v22 = +[Application sharedApplication];
    long long v23 = [v22 historyController];
    uint64_t v24 = [v3 activeProfileIdentifier];
    id v25 = (void *)v24;
    if (v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = *MEMORY[0x1E4F980C8];
    }
    long long v27 = [v23 frequentlyVisitedSitesControllerForProfileIdentifier:v26 loadIfNeeded:1];

    long long v28 = [[UniversalSearchCompletionProvider alloc] initWithFrequentlyVisitedSitesController:v27];
    universalSearchProvider = self->_universalSearchProvider;
    self->_universalSearchProvider = v28;

    [(CompletionProvider *)self->_universalSearchProvider setDelegate:self];
  }
  if (!self->_parsecSearchSession)
  {
    [(CompletionProvider *)self->_universalSearchProvider setDelegate:0];
    long long v30 = self->_universalSearchProvider;
    self->_universalSearchProvider = 0;
  }
  if (!self->_pencilInputCompletionProvider)
  {
    uint64_t v31 = objc_alloc_init(PencilInputCompletionProvider);
    pencilInputCompletionProvider = self->_pencilInputCompletionProvider;
    self->_pencilInputCompletionProvider = v31;

    [self->_pencilInputCompletionProvider setDelegate:self];
  }
  suggestionProvider = self->_suggestionProvider;
  if (self->_shouldIncludeNetworkedSearchSuggestions)
  {
    if (!suggestionProvider)
    {
      uint64_t v34 = -[SearchSuggestionProvider initForPrivateBrowsing:]([SearchSuggestionProvider alloc], "initForPrivateBrowsing:", [WeakRetained isPrivateBrowsingEnabled]);
      BOOL v35 = self->_suggestionProvider;
      self->_suggestionProvider = v34;

      [(CompletionProvider *)self->_suggestionProvider setDelegate:self];
      double v36 = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
      [(SearchSuggestionProvider *)self->_suggestionProvider setLoadProgressObserver:v36];
LABEL_22:
    }
  }
  else if (suggestionProvider)
  {
    [(SearchSuggestionProvider *)suggestionProvider stop];
    [(CompletionProvider *)self->_suggestionProvider setDelegate:0];
    [(SearchSuggestionProvider *)self->_suggestionProvider setLoadProgressObserver:0];
    double v36 = self->_suggestionProvider;
    self->_suggestionProvider = 0;
    goto LABEL_22;
  }
  if ([(CompletionList *)self _shouldFetchSearchSuggestions]
    && [(CompletionList *)self _canUseOfflineSearchSuggestions])
  {
    id v37 = [self->_offlineSearchSuggestionsCompletionProvider completionsForQuery:self->_query];
  }
  [self->_URLCompletionProvider setParsecSearchSession:self->_parsecSearchSession];
  [(UniversalSearchCompletionProvider *)self->_universalSearchProvider setParsecSearchSession:self->_parsecSearchSession];
  [(SearchSuggestionProvider *)self->_suggestionProvider setUniversalSearchSession:self->_parsecSearchSession];
  uint64_t v38 = self->_URLCompletionProvider;
  rewrittenQuery = self->_rewrittenQuery;
  if (!rewrittenQuery) {
    rewrittenQuery = self->_query;
  }
  uint64_t v40 = [(NSArray *)self->_searchParametersList firstObject];
  char v41 = -[URLCompletionProvider completionsForQuery:isCFSearch:](v38, "completionsForQuery:isCFSearch:", rewrittenQuery, [v40 isCFSearch]);

  id v42 = [(CompletionProvider *)self->_suggestionProvider completionsForQuery:self->_query];
  id v43 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider completionsForQuery:self->_query];
  searchRenderTimeoutStartTime = self->_searchRenderTimeoutStartTime;
  self->_searchRenderTimeoutStartTime = 0;

  otherRenderTimeoutStartTime = self->_otherRenderTimeoutStartTime;
  self->_otherRenderTimeoutStartTime = 0;

  id v46 = [MEMORY[0x1E4F1C9C8] date];
  minRenderTimeoutStartTime = self->_minRenderTimeoutStartTime;
  self->_minRenderTimeoutStartTime = v46;

  if (self->_findOnPageProvider || ([v4 isBlank] & 1) != 0)
  {
    if ([v4 isBlank])
    {
      findOnPageProvider = self->_findOnPageProvider;
      self->_findOnPageProvider = 0;
    }
  }
  else
  {
    uint64_t v49 = objc_alloc_init(FindOnPageCompletionProvider);
    BOOL v50 = self->_findOnPageProvider;
    self->_findOnPageProvider = v49;

    [(CompletionProvider *)self->_findOnPageProvider setDelegate:self];
    [(FindOnPageCompletionProvider *)self->_findOnPageProvider setDataSource:self];
  }
  id v51 = [(FindOnPageCompletionProvider *)self->_findOnPageProvider completionsForQuery:self->_query];
  quickWebsiteSearchProvider = self->_quickWebsiteSearchProvider;
  if (!quickWebsiteSearchProvider)
  {
    id v53 = objc_alloc_init(QuickWebsiteSearchCompletionProvider);
    id v54 = self->_quickWebsiteSearchProvider;
    self->_quickWebsiteSearchProvider = v53;

    [(CompletionProvider *)self->_quickWebsiteSearchProvider setDelegate:self];
    quickWebsiteSearchProvider = self->_quickWebsiteSearchProvider;
  }
  id v55 = [(CompletionProvider *)quickWebsiteSearchProvider completionsForQuery:self->_query];
  tabCompletionProvider = self->_tabCompletionProvider;
  if (!tabCompletionProvider)
  {
    unint64_t v57 = objc_alloc_init(TabCompletionProvider);
    v58 = self->_tabCompletionProvider;
    self->_tabCompletionProvider = v57;

    [self->_tabCompletionProvider setDelegate:self];
    [(TabCompletionProvider *)self->_tabCompletionProvider setTabCompletionProviderDataSource:self];
    tabCompletionProvider = self->_tabCompletionProvider;
  }
  id v59 = [tabCompletionProvider completionsForQuery:self->_query];
  calculationResultProvider = self->_calculationResultProvider;
  if (!calculationResultProvider)
  {
    long long v61 = objc_alloc_init(CalculationResultCompletionProvider);
    uint64_t v62 = self->_calculationResultProvider;
    self->_calculationResultProvider = v61;

    [(CompletionProvider *)self->_calculationResultProvider setDelegate:self];
    calculationResultProvider = self->_calculationResultProvider;
  }
  id v63 = [(CompletionProvider *)calculationResultProvider completionsForQuery:self->_query];
}

- (void)setQuery:(id)a3
{
  id v5 = (WBSCompletionQuery *)a3;
  if (self->_query != v5)
  {
    objc_storeStrong((id *)&self->_query, a3);
    char v6 = [(WBSCompletionQuery *)v5 queryString];
    self->_inputTypeOfStringToComplete = WBSUnifiedFieldInputTypeForString();

    [(CompletionList *)self _updateProviders];
    firstRemoteCompletionProviderToRespondToQuery = self->_firstRemoteCompletionProviderToRespondToQuery;
    self->_firstRemoteCompletionProviderToRespondToQuery = 0;

    self->_tryParsecRewritesIfNoTopHit = 0;
    rewrittenQuery = self->_rewrittenQuery;
    self->_rewrittenQuery = 0;

    [(CompletionList *)self clearCachedSearchQuery];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    siriSuggestedSitesURLStringsToIgnore = self->_siriSuggestedSitesURLStringsToIgnore;
    self->_siriSuggestedSitesURLStringsToIgnore = 0;

    objc_initWeak(&location, self);
    BOOL v11 = [MEMORY[0x1E4F98BB8] sharedController];
    id v12 = [WeakRetained tabController];
    unint64_t v13 = [v12 activeProfileIdentifier];
    uint64_t v14 = [(WBSCompletionQuery *)v5 queryString];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __27__CompletionList_setQuery___block_invoke;
    v32[3] = &unk_1E6D7EA28;
    objc_copyWeak(&v33, &location);
    [v11 getIgnoredSiriSuggestedSitesURLStringsInProfile:v13 withQuery:v14 completionHandler:v32];

    listingOnDisplay = self->_listingOnDisplay;
    uint64_t v16 = (!listingOnDisplay || [(CompletionGroupListing *)listingOnDisplay isEmpty])
       && !self->_executingVoiceSearch;
    if ([WeakRetained isPrivateBrowsingEnabled]) {
      v16 |= 2uLL;
    }
    char v17 = [MEMORY[0x1E4F98F58] searchParameters];
    char v18 = [v17 firstObject];
    int v19 = [v18 isCFSearch];

    if (v19)
    {
      uint64_t v20 = [[CompletionGroupListing alloc] initWithQuery:self->_query titleProvider:self options:v16];
      currentCFListing = self->_currentCFListing;
      self->_currentCFListing = v20;
    }
    id v22 = [[CompletionGroupListing alloc] initWithQuery:self->_query titleProvider:self options:v16];
    currentListing = self->_currentListing;
    self->_currentListing = v22;

    [(CompletionList *)self _updateCompletionListing];
    [(NSTimer *)self->_parsecTimeout invalidate];
    uint64_t v24 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider minRenderTimeout];
    uint64_t v25 = [v24 integerValue];

    if (v25 < *MEMORY[0x1E4F99330] || v25 > *MEMORY[0x1E4F99338])
    {
      long long v27 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      uint64_t v26 = *MEMORY[0x1E4F99300];
      if (v28) {
        [(CompletionList *)v25 setQuery:v27];
      }
    }
    else
    {
      uint64_t v26 = v25;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __27__CompletionList_setQuery___block_invoke_103;
    v31[3] = &unk_1E6D7C010;
    v31[4] = self;
    long long v29 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v31 block:(double)v26 / 1000.0];
    parsecTimeout = self->_parsecTimeout;
    self->_parsecTimeout = v29;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
}

void __27__CompletionList_setQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v7 = WeakRetained;
  if (WeakRetained)
  {
    double v8 = [WeakRetained[28] queryString];
    int v9 = WBSIsEqual();

    if (v9) {
      objc_storeStrong(v7 + 22, a3);
    }
  }
}

uint64_t __27__CompletionList_setQuery___block_invoke_103(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) isAwaitingParsec];
  if (result)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Timed out waiting for Parsec results", v6, 2u);
    }
    [*(id *)(*(void *)(a1 + 32) + 112) markParsecResultsReceived];
    return [*(id *)(a1 + 32) _updateCompletionListing];
  }
  return result;
}

- (void)setParsecSearchSession:(id)a3
{
  id v5 = (UniversalSearchSession *)a3;
  if (self->_parsecSearchSession != v5)
  {
    objc_storeStrong((id *)&self->_parsecSearchSession, a3);
    [(CompletionList *)self _updateProviders];
    if (!self->_parsecSearchSession)
    {
      if ([(CompletionGroupListing *)self->_listingOnDisplay numberOfGroups]) {
        [(CompletionList *)self _updateCompletionListing];
      }
    }
  }
}

- (void)setLoadProgressObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_loadProgressObserver, obj);
    [(SearchSuggestionProvider *)self->_suggestionProvider setLoadProgressObserver:obj];
  }
}

- (BOOL)_topHitMatchesString:(id)a3
{
  id v4 = a3;
  stringMatchedByTopHit = self->_stringMatchedByTopHit;
  if (!stringMatchedByTopHit) {
    goto LABEL_8;
  }
  if ([(NSString *)stringMatchedByTopHit isEqualToString:v4])
  {
    char v6 = 1;
    goto LABEL_13;
  }
  if (!self->_topHit)
  {
LABEL_8:
    char v6 = 0;
    goto LABEL_13;
  }
  double v7 = [(CompletionGroupListing *)self->_currentListing topHit];
  if ([(CompletionItem *)self->_topHit isEquivalentTo:v7])
  {
    double v8 = [(WBSCompletionQuery *)self->_rewrittenQuery queryString];
    if (v8)
    {
      char v6 = 1;
    }
    else
    {
      int v9 = [(WBSCompletionQuery *)self->_query queryString];
      char v6 = v9 != 0;
    }
  }
  else
  {
    char v6 = [(NSString *)self->_matchingStringInTopHit safari_hasCaseInsensitivePrefix:v4];
  }

LABEL_13:
  return v6;
}

- (id)topHitForString:(id)a3
{
  if ([(CompletionList *)self _topHitMatchesString:a3]) {
    id v4 = self->_topHit;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)isTopHitReadyForString:(id)a3
{
  return !self->_query || [(CompletionList *)self _topHitMatchesString:a3];
}

- (void)completionProvider:(id)a3 didFinishCompletingString:(id)a4
{
  long long v27 = (SearchSuggestionProvider *)a3;
  id v7 = a4;
  double v8 = [(WBSCompletionQuery *)self->_query queryString];
  if ([v7 isEqualToString:v8])
  {
  }
  else
  {
    int v9 = [(WBSCompletionQuery *)self->_rewrittenQuery queryString];
    int v10 = [v7 isEqualToString:v9];

    if (!v10) {
      goto LABEL_29;
    }
  }
  if (!self->_queryRestorationCompletionItem)
  {
    BOOL v11 = (UniversalSearchCompletionProvider *)v27;
    if (self->_suggestionProvider == v27 && !self->_firstRemoteCompletionProviderToRespondToQuery)
    {
      id v12 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider searchRenderTimeout];
      uint64_t v13 = [v12 integerValue];

      BOOL v11 = (UniversalSearchCompletionProvider *)v27;
      if (v13)
      {
        objc_storeStrong((id *)&self->_firstRemoteCompletionProviderToRespondToQuery, a3);
        uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
        searchRenderTimeoutStartTime = self->_searchRenderTimeoutStartTime;
        self->_searchRenderTimeoutStartTime = v14;

        BOOL v11 = (UniversalSearchCompletionProvider *)v27;
      }
    }
    if (self->_universalSearchProvider == v11)
    {
      uint64_t v16 = [(SearchSuggestionProvider *)v27 parsecSearchSession];
      char v17 = [v16 rewrittenQueryStringFromParsec];

      if (v17) {
        self->_tryParsecRewritesIfNoTopHit = 1;
      }
      if (!self->_firstRemoteCompletionProviderToRespondToQuery)
      {
        id v22 = [(UniversalSearchCompletionProvider *)self->_universalSearchProvider otherRenderTimeout];
        uint64_t v23 = [v22 integerValue];

        if (v23 >= 1)
        {
          objc_storeStrong((id *)&self->_firstRemoteCompletionProviderToRespondToQuery, a3);
          uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
          otherRenderTimeoutStartTime = self->_otherRenderTimeoutStartTime;
          self->_otherRenderTimeoutStartTime = v24;
          goto LABEL_18;
        }
      }
      if (self->_searchRenderTimeoutStartTime
        && [(CompletionList *)self _searchRenderTimeoutHasElapsed])
      {
        otherRenderTimeoutStartTime = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
        id v19 = objc_alloc(MEMORY[0x1E4F9A370]);
        uint64_t v20 = [(CompletionProvider *)v27 completionsForQuery:self->_query];
        uint64_t v21 = (void *)[v19 initWithResults:v20];
        objc_msgSend(otherRenderTimeoutStartTime, "postFeedback:forQueryID:", v21, -[WBSCompletionQuery queryID](self->_query, "queryID"));

LABEL_18:
      }
    }
    if ([(CompletionGroupListing *)self->_currentListing isAwaitingParsec]
      || [(CompletionGroupListing *)self->_currentListing isAwaitingCompletionDatabase])
    {
      int v25 = 0;
    }
    else
    {
      int v25 = ![(CompletionGroupListing *)self->_currentListing isAwaitingTabCompletion];
    }
    if (self->_suggestionProvider == v27)
    {
      BOOL v26 = 1;
      if (!v25)
      {
LABEL_28:
        [(CompletionList *)self _updateCompletionListing];
        goto LABEL_29;
      }
    }
    else
    {
      BOOL v26 = self->_offlineSearchSuggestionsCompletionProvider == (OfflineSearchSuggestionsCompletionProvider *)v27;
      if (!v25) {
        goto LABEL_28;
      }
    }
    if ([(CompletionGroupListing *)self->_currentListing isAwaitingSearchProvider] && !v26) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_29:
}

- (id)windowHostingCompletionProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = [WeakRetained window];

  return v4;
}

- (id)currentSearchEngineHostSuffixes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v3 = [WeakRetained activeSearchEngine];
  id v4 = [v3 hostSuffixes];

  return v4;
}

- (unint64_t)numberOfGroups
{
  return [(CompletionGroupListing *)self->_listingOnDisplay numberOfGroups];
}

- (id)_groupOrNilAtIndex:(unint64_t)a3
{
  return [(CompletionGroupListing *)self->_listingOnDisplay groupAtIndex:a3];
}

- (id)defaultSectionTitleForGroupAtIndex:(unint64_t)a3
{
  double v3 = [(CompletionList *)self _groupOrNilAtIndex:a3];
  id v4 = [v3 defaultHeaderTitle];

  return v4;
}

- (id)titleForGroupAtIndex:(unint64_t)a3
{
  double v3 = [(CompletionList *)self _groupOrNilAtIndex:a3];
  id v4 = [v3 title];

  return v4;
}

- (id)completionsForGroupAtIndex:(unint64_t)a3
{
  double v3 = [(CompletionList *)self _groupOrNilAtIndex:a3];
  id v4 = [v3 completions];

  return v4;
}

- (id)headerViewReuseIdentifierForGroupAtIndex:(unint64_t)a3
{
  double v3 = [(CompletionList *)self _groupOrNilAtIndex:a3];
  id v4 = [v3 headerViewReuseIdentifier];

  return v4;
}

- (id)headerViewForGroupAtIndex:(unint64_t)a3
{
  double v3 = [(CompletionList *)self _groupOrNilAtIndex:a3];
  id v4 = [v3 headerView];

  return v4;
}

- (void)configureHeaderView:(id)a3 forGroupAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CompletionList *)self _groupOrNilAtIndex:a4];
  [v7 configureHeaderView:v6 forCompletionList:self];
}

- (BOOL)hasCompletions
{
  listingOnDisplay = self->_listingOnDisplay;
  if (listingOnDisplay) {
    LOBYTE(listingOnDisplay) = ![(CompletionGroupListing *)listingOnDisplay isEmpty];
  }
  return (char)listingOnDisplay;
}

- (void)setShouldIncludeNetworkedSearchSuggestions:(BOOL)a3
{
  if (self->_shouldIncludeNetworkedSearchSuggestions != a3)
  {
    self->_shouldIncludeNetworkedSearchSuggestions = a3;
    [(CompletionList *)self _updateProviders];
    [(CompletionList *)self _updateCompletionListing];
  }
}

- (void)stopCompleting
{
  [(SearchSuggestionProvider *)self->_suggestionProvider stop];
  [(CompletionProvider *)self->_suggestionProvider setDelegate:0];
  suggestionProvider = self->_suggestionProvider;
  self->_suggestionProvider = 0;

  [(CompletionProvider *)self->_findOnPageProvider setDelegate:0];
  findOnPageProvider = self->_findOnPageProvider;
  self->_findOnPageProvider = 0;

  [self->_URLCompletionProvider clearCachedCompletions];
  [(CompletionProvider *)self->_universalSearchProvider setDelegate:0];
  universalSearchProvider = self->_universalSearchProvider;
  self->_universalSearchProvider = 0;

  [self->_tabCompletionProvider setDelegate:0];
  [(TabCompletionProvider *)self->_tabCompletionProvider setTabCompletionProviderDataSource:0];
  tabCompletionProvider = self->_tabCompletionProvider;
  self->_tabCompletionProvider = 0;

  [(CompletionProvider *)self->_calculationResultProvider setDelegate:0];
  calculationResultProvider = self->_calculationResultProvider;
  self->_calculationResultProvider = 0;

  listingOnDisplay = self->_listingOnDisplay;
  self->_listingOnDisplay = 0;

  query = self->_query;
  self->_query = 0;
}

- (void)updateRestorationCompletionItemForCompletionItem:(id)a3 isCF:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 24;
  }
  else {
    uint64_t v5 = 32;
  }
  id v6 = (SearchQueryRestorationCompletionItem *)*(id *)((char *)&self->super.isa + v5);
  listingOnDisplay = self->_listingOnDisplay;
  double v8 = [(SearchQueryRestorationCompletionItem *)v6 listingToRestore];

  if (listingOnDisplay != v8)
  {
    int v9 = [[SearchQueryRestorationCompletionItem alloc] initWithQuery:self->_query];

    [(SearchQueryRestorationCompletionItem *)v9 setListingToRestore:self->_listingOnDisplay];
    id v6 = v9;
  }
  int v10 = *(Class *)((char *)&self->super.isa + v5);
  *(Class *)((char *)&self->super.isa + v5) = (Class)v6;
}

- (void)cacheCurrentCompletionsAfterAcceptanceOfCompletionItem:(id)a3
{
  id v6 = a3;
  -[CompletionList updateRestorationCompletionItemForCompletionItem:isCF:](self, "updateRestorationCompletionItemForCompletionItem:isCF:");
  id v4 = [(NSArray *)self->_searchParametersList firstObject];
  int v5 = [v4 isCFSearch];

  if (v5) {
    [(CompletionList *)self updateRestorationCompletionItemForCompletionItem:v6 isCF:1];
  }
}

- (void)restoreCachedCompletions
{
  double v3 = [(SearchQueryRestorationCompletionItem *)self->_queryRestorationCompletionItem listingToRestore];
  listingOnDisplay = self->_listingOnDisplay;
  self->_listingOnDisplay = v3;

  int v5 = [(NSArray *)self->_searchParametersList firstObject];
  int v6 = [v5 isCFSearch];

  if (v6)
  {
    id v7 = [(SearchQueryRestorationCompletionItem *)self->_cfQueryRestorationCompletionItem listingToRestore];
    cfListingOnDisplay = self->_cfListingOnDisplay;
    self->_cfListingOnDisplay = v7;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F98A50]);
  int v10 = [(SearchQueryRestorationCompletionItem *)self->_queryRestorationCompletionItem queryToRestore];
  BOOL v11 = [v10 queryString];
  id v12 = (WBSCompletionQuery *)[v9 initWithQueryString:v11 triggerEvent:26];
  query = self->_query;
  self->_query = v12;

  [(CompletionList *)self _updateQueryIDForGroups];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completionListDidRestoreCachedCompletions:self];
}

- (void)_updateQueryIDForGroups
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v3 = [(CompletionGroupListing *)self->_listingOnDisplay groups];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v9 = objc_msgSend(v8, "completions", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "setParsecQueryID:", -[WBSCompletionQuery queryID](self->_query, "queryID"));
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
}

- (void)didResumeSearchWithQuery:(id)a3
{
  listingOnDisplay = self->_listingOnDisplay;
  id v5 = a3;
  id v15 = [(CompletionGroupListing *)listingOnDisplay groups];
  id v6 = objc_alloc(MEMORY[0x1E4F98A50]);
  uint64_t v7 = [v5 queryString];

  double v8 = (WBSCompletionQuery *)[v6 initWithQueryString:v7];
  query = self->_query;
  self->_query = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v11 = [WeakRetained effectiveProfileIdentifier];
  [(WBSCompletionQuery *)self->_query setProfileIdentifierToFilterResults:v11];

  [(CompletionList *)self _updateQueryIDForGroups];
  uint64_t v12 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  uint64_t v13 = [(WBSCompletionQuery *)self->_query queryID];
  long long v14 = [(CompletionGroupListing *)self->_listingOnDisplay hiddenIgnoredSiriSuggestedSite];
  [v12 didRankSections:v15 blendingDuration:0 feedbackForHiddenAndDuplicateResults:v13 forQueryID:v14 hiddenIgnoredSiriSuggestedSite:0.0];
}

- (void)clearCachedSearchQuery
{
  queryRestorationCompletionItem = self->_queryRestorationCompletionItem;
  self->_queryRestorationCompletionItem = 0;
}

- (void)clearCachedSearches
{
}

- (void)clearCachedTabCompletionData
{
}

- (id)swipeActionsForCompletionItemAtIndexPath:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 section];
  unint64_t v6 = [v4 row];
  if (v5 == [(CompletionGroupListing *)self->_listingOnDisplay indexOfTopHitsGroup])
  {
    uint64_t v7 = [(CompletionGroupListing *)self->_listingOnDisplay parsecTopHits];
    if ([v7 count])
    {
    }
    else
    {
      double v8 = [(CompletionGroupListing *)self->_listingOnDisplay localTopHits];
      unint64_t v9 = [v8 count];

      if (v6 < v9)
      {
        uint64_t v10 = [(CompletionGroupListing *)self->_listingOnDisplay localTopHits];
        uint64_t v11 = [v10 objectAtIndexedSubscript:v6];

        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v11 isTopHit])
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
          uint64_t v13 = [WeakRetained tabController];
          long long v14 = [v13 activeTabDocument];
          id v15 = [v14 history];

          long long v16 = [v11 originalURLString];
          long long v17 = [v15 itemForURLString:v16];

          if (v17)
          {
            objc_initWeak(&location, self);
            long long v18 = (void *)MEMORY[0x1E4FB1688];
            long long v19 = _WBSLocalizedString();
            uint64_t v23 = MEMORY[0x1E4F143A8];
            uint64_t v24 = 3221225472;
            int v25 = __59__CompletionList_swipeActionsForCompletionItemAtIndexPath___block_invoke;
            BOOL v26 = &unk_1E6D7EA50;
            objc_copyWeak(&v31, &location);
            id v27 = v15;
            id v28 = v17;
            id v29 = v11;
            id v30 = v4;
            long long v20 = [v18 contextualActionWithStyle:1 title:v19 handler:&v23];

            v33[0] = v20;
            long long v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 1, v23, v24, v25, v26);

            objc_destroyWeak(&v31);
            objc_destroyWeak(&location);
          }
          else
          {
            long long v21 = (void *)MEMORY[0x1E4F1CBF0];
          }

          goto LABEL_11;
        }
      }
    }
  }
  long long v21 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_11:

  return v21;
}

void __59__CompletionList_swipeActionsForCompletionItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) removeItem:*(void *)(a1 + 40)];
    [WeakRetained _removeIgnoredSiriSuggestedSiteRecordsForHistoryItem:*(void *)(a1 + 40)];
    [WeakRetained _deleteTopHitCompletionItem:*(void *)(a1 + 48) atIndexPath:*(void *)(a1 + 56)];
    unint64_t v6 = [WeakRetained[12] localTopHits];
    uint64_t v7 = [v6 count];

    id v8 = WeakRetained[9];
    if (v8 == *(id *)(a1 + 48))
    {
      WeakRetained[9] = 0;
    }
    [WeakRetained[32] clearCachedCompletions];
    id v9 = objc_loadWeakRetained(WeakRetained + 26);
    [v9 completionList:WeakRetained didRemoveItem:*(void *)(a1 + 48) wasLastInSection:v7 == 0 atIndexPath:*(void *)(a1 + 56) withCompletionHandler:v10];
  }
}

- (void)_deleteTopHitCompletionItem:(id)a3 atIndexPath:(id)a4
{
  listingOnDisplay = self->_listingOnDisplay;
  id v6 = a3;
  -[CompletionGroupListing deleteTopHit:atIndex:](listingOnDisplay, "deleteTopHit:atIndex:", v6, [a4 row]);
}

- (void)_requestFavicons
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!self->_faviconCache)
  {
    double v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    faviconCache = self->_faviconCache;
    self->_faviconCache = v3;
  }
  if (!self->_urlStringToFaviconRequestTokens)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    urlStringToFaviconRequestTokens = self->_urlStringToFaviconRequestTokens;
    self->_urlStringToFaviconRequestTokens = v5;
  }
  uint64_t v7 = [(CompletionList *)self _completionsRequiringFavicon];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_115);
  id v30 = [v8 setWithArray:v9];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = [(NSMutableDictionary *)self->_urlStringToFaviconRequestTokens allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if (([v30 containsObject:v14] & 1) == 0)
        {
          id v15 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
          long long v16 = [(NSMutableDictionary *)self->_urlStringToFaviconRequestTokens objectForKeyedSubscript:v14];
          [v15 cancelRequestsWithTokens:v16];

          [(NSMutableDictionary *)self->_urlStringToFaviconRequestTokens setObject:0 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v11);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v7;
  uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v17)
  {
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        long long v20 = [v19 originalURLString];
        id v21 = objc_alloc(MEMORY[0x1E4F98AE8]);
        id v22 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
        uint64_t v23 = objc_msgSend(v21, "initWithURL:iconSize:fallbackType:", v22, 0, 24.0, 24.0);

        uint64_t v34 = 0;
        BOOL v35 = &v34;
        uint64_t v36 = 0x2020000000;
        char v37 = 1;
        objc_initWeak(&location, self);
        uint64_t v24 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __34__CompletionList__requestFavicons__block_invoke_2;
        v31[3] = &unk_1E6D7EA78;
        objc_copyWeak(&v32, &location);
        v31[4] = v19;
        void v31[5] = &v34;
        int v25 = [v24 registerRequest:v23 priority:2 responseHandler:v31];

        *((unsigned char *)v35 + 24) = 0;
        BOOL v26 = [(NSMutableDictionary *)self->_urlStringToFaviconRequestTokens objectForKeyedSubscript:v20];

        if (v26)
        {
          id v27 = [(NSMutableDictionary *)self->_urlStringToFaviconRequestTokens objectForKeyedSubscript:v20];
          [v27 addObject:v25];
        }
        else
        {
          id v27 = [MEMORY[0x1E4F1CA48] arrayWithObject:v25];
          [(NSMutableDictionary *)self->_urlStringToFaviconRequestTokens setObject:v27 forKeyedSubscript:v20];
        }

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
        _Block_object_dispose(&v34, 8);
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v17);
  }
}

uint64_t __34__CompletionList__requestFavicons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 originalURLString];
}

void __34__CompletionList__requestFavicons__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 favicon];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F98BC8], "resizedImage:withSize:", v5, 24.0, 24.0);

      objc_msgSend(v7, "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 24.0, 24.0);
      id v8 = [*(id *)(a1 + 32) originalURLString];
      if ([v8 length])
      {
        id v9 = (void *)*((void *)WeakRetained + 31);
        id v10 = [*(id *)(a1 + 32) originalURLString];
        [v9 setObject:v7 forKey:v10];
      }
      else
      {
        uint64_t v11 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __34__CompletionList__requestFavicons__block_invoke_2_cold_1(v11);
        }
      }
      uint64_t v12 = [WeakRetained _indexPathForEquivalentCompletionItem:*(void *)(a1 + 32)];
      uint64_t v13 = (void *)v12;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v12 == 0;
      }
      if (!v14)
      {
        id v15 = objc_loadWeakRetained((id *)WeakRetained + 26);
        [v15 completionList:WeakRetained didFetchFavicon:v7 forRowAtIndexPath:v13];
      }
    }
  }
}

- (id)_completionsRequiringFavicon
{
  id v3 = [(CompletionGroupListing *)self->_listingOnDisplay parsecTopHits];
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(CompletionGroupListing *)self->_listingOnDisplay localTopHits];
  }

  return v4;
}

- (id)_indexPathForEquivalentCompletionItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CompletionGroupListing *)self->_listingOnDisplay groups];
  if ([v5 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
      id v8 = [v7 completions];
      uint64_t v9 = [v8 count];

      if (v9) {
        break;
      }
LABEL_9:

      if (++v6 >= (unint64_t)[v5 count]) {
        goto LABEL_10;
      }
    }
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [v7 completions];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

      if (([v4 isEqual:v12] & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0 && [v4 isEquivalentTo:v12])
      {
        break;
      }

      ++v10;
      uint64_t v13 = [v7 completions];
      unint64_t v14 = [v13 count];

      if (v10 >= v14) {
        goto LABEL_9;
      }
    }
    id v15 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:v6];
  }
  else
  {
LABEL_10:
    id v15 = 0;
  }

  return v15;
}

- (NSIndexPath)indexPathOfAsTypedSearchSuggestion
{
  unint64_t v3 = [(CompletionGroupListing *)self->_listingOnDisplay indexOfSearchSuggestionsGroup];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    unint64_t v5 = v3;
    uint64_t v6 = [(CompletionGroupListing *)self->_listingOnDisplay searchSuggestions];
    uint64_t v7 = [v6 firstObject];

    id v8 = [v7 string];
    uint64_t v9 = [(WBSCompletionQuery *)self->_query queryString];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v5];
    }
    else
    {
      id v4 = 0;
    }
  }
  return (NSIndexPath *)v4;
}

- (BOOL)shouldOverrideBackgroundViewForItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CompletionList *)self completionsForGroupAtIndex:0];
  if ([v5 count] == 1)
  {
    uint64_t v6 = [v5 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v5 firstObject];
      id v8 = [v7 resultType];
      char v9 = [v8 isEqualToString:@"maps"];

      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  if ((unint64_t)[v5 count] > 1)
  {
LABEL_8:
    BOOL v11 = 1;
    goto LABEL_9;
  }
  id v10 = [v5 firstObject];
  BOOL v11 = v10 != v4;

LABEL_9:
  return v11;
}

- (void)_updateOfflineSearchSuggestionAvailability
{
  if ([(CompletionList *)self _defaultSearchEngineIsGoogle])
  {
    offlineSearchSuggestionsCompletionProvider = self->_offlineSearchSuggestionsCompletionProvider;
    if (offlineSearchSuggestionsCompletionProvider)
    {
      [(OfflineSearchSuggestionsCompletionProvider *)offlineSearchSuggestionsCompletionProvider updateOfflineSearchSuggestionAvailability];
    }
    else
    {
      id v4 = [OfflineSearchSuggestionsCompletionProvider alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      uint64_t v6 = -[OfflineSearchSuggestionsCompletionProvider initWithMaximumNumberOfSuggestions:forPrivateBrowsing:](v4, "initWithMaximumNumberOfSuggestions:forPrivateBrowsing:", 9, [WeakRetained isPrivateBrowsingEnabled]);
      uint64_t v7 = self->_offlineSearchSuggestionsCompletionProvider;
      self->_offlineSearchSuggestionsCompletionProvider = v6;

      id v8 = self->_offlineSearchSuggestionsCompletionProvider;
      [(CompletionProvider *)v8 setDelegate:self];
    }
  }
}

- (void)recordIgnoredSiriSuggestedSitesWithURL:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CompletionGroupListing *)self->_listingOnDisplay query];
  uint64_t v6 = [v5 queryString];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v8 = [WeakRetained tabController];
  char v9 = [v8 activeProfileIdentifier];

  uint64_t v10 = [(CompletionGroupListing *)self->_listingOnDisplay parsecTopHits];
  BOOL v11 = (void *)v10;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    uint64_t v13 = (void *)v10;
  }
  else {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  uint64_t v15 = [(CompletionGroupListing *)self->_listingOnDisplay topParsecResults];
  long long v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = v12;
  }
  id v18 = v17;

  ignoredSiriSuggestedSitesQueue = self->_ignoredSiriSuggestedSitesQueue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__CompletionList_recordIgnoredSiriSuggestedSitesWithURL___block_invoke;
  v25[3] = &unk_1E6D7A7F8;
  id v26 = v14;
  id v27 = v18;
  id v28 = self;
  id v29 = v4;
  id v30 = v9;
  id v31 = v6;
  id v20 = v6;
  id v21 = v9;
  id v22 = v4;
  id v23 = v18;
  id v24 = v14;
  dispatch_async(ignoredSiriSuggestedSitesQueue, v25);
}

void __57__CompletionList_recordIgnoredSiriSuggestedSitesWithURL___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", *(void *)(a1 + 40));
  if (([*(id *)(a1 + 48) _isPegasusMapsCompositeResult:v2] & 1) == 0)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v27 = v2;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (!v4) {
      goto LABEL_15;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    id v28 = v3;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v9 = [v8 resultType];
        if (WBSIsEqual())
        {
          uint64_t v10 = [v8 url];
          char v11 = WBSIsEqual();

          if (v11) {
            continue;
          }
          uint64_t v12 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v13 = v12;
            id v14 = [v8 url];
            uint64_t v15 = [v14 absoluteString];
            uint64_t v16 = *(void *)(a1 + 64);
            uint64_t v17 = *(void *)(a1 + 72);
            *(_DWORD *)buf = 138740483;
            uint64_t v34 = v15;
            __int16 v35 = 2117;
            uint64_t v36 = v16;
            __int16 v37 = 2117;
            uint64_t v38 = v17;
            _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_INFO, "Recording an ignored Siri suggested site with URL: %{sensitive}@ profile: %{sensitive}@ query: %{sensitive}@.", buf, 0x20u);
          }
          char v9 = [MEMORY[0x1E4F98BB8] sharedController];
          id v18 = [v8 url];
          long long v19 = [v18 absoluteString];
          uint64_t v20 = *(void *)(a1 + 64);
          uint64_t v21 = *(void *)(a1 + 72);
          id v22 = [*(id *)(a1 + 56) absoluteString];
          [v9 addIgnoredSiriSuggestedSiteWithURLString:v19 inProfile:v20 withQuery:v21 visitedURLString:v22];

          id v3 = v28;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (!v5)
      {
LABEL_15:

        id v23 = [MEMORY[0x1E4F98BB8] sharedController];
        uint64_t v25 = *(void *)(a1 + 64);
        uint64_t v24 = *(void *)(a1 + 72);
        id v26 = [*(id *)(a1 + 56) absoluteString];
        [v23 updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:v25 query:v24 visitedURLString:v26];

        uint64_t v2 = v27;
        break;
      }
    }
  }
}

- (void)_removeIgnoredSiriSuggestedSiteRecordsForHistoryItem:(id)a3
{
  id v12 = [a3 url];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v5 = [WeakRetained tabController];
  uint64_t v6 = [v5 activeProfileIdentifier];

  uint64_t v7 = [MEMORY[0x1E4F3B060] sharedInstance];
  id v8 = [v7 userVisibleQueryFromSearchURL:v12];

  char v9 = [MEMORY[0x1E4F98BB8] sharedController];
  uint64_t v10 = v9;
  if (v8)
  {
    [v9 removeIgnoredSiriSuggestedSitesInProfile:v6 query:v8];
  }
  else
  {
    char v11 = [v12 host];
    [v10 removeIgnoredSiriSuggestedSitesInProfile:v6 visitedURLHost:v11];
  }
}

- (BOOL)_isPegasusMapsCompositeResult:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] < 2)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F98C80];
    uint64_t v5 = [v3 objectAtIndexedSubscript:0];
    if ([v4 typeForSFSearchResult:v5] == 2)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F98C80];
      uint64_t v7 = [v3 objectAtIndexedSubscript:1];
      BOOL v8 = [v6 typeForSFSearchResult:v7] == 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)tabDocumentForFindOnPageCompletionProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v4 = [WeakRetained tabController];
  uint64_t v5 = [v4 activeTabDocument];

  return v5;
}

- (id)windowUUIDsToTabsForTabCompletionProvider:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v4 = [WeakRetained isPrivateBrowsingEnabled];
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [WeakRetained browserWindowController];
  uint64_t v6 = [v5 browserControllers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v4 == [v11 isPrivateBrowsingEnabled])
        {
          id v12 = [WeakRetained activeProfileIdentifier];
          uint64_t v13 = [v11 activeProfileIdentifier];
          int v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            uint64_t v15 = [v11 tabController];
            uint64_t v16 = [v15 currentTabs];
            uint64_t v17 = [v11 UUID];
            [v19 setObject:v16 forKeyedSubscript:v17];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v19;
}

- (id)selectedTabDocumentForTabCompletionProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v4 = [WeakRetained tabController];
  uint64_t v5 = [v4 activeTabDocument];

  return v5;
}

- (id)tabGroupsForTabCompletionProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v4 = [WeakRetained tabController];
  uint64_t v5 = [v4 nonActiveTabGroupsInCurrentBrowsingMode];

  return v5;
}

- (id)currentWindowUUIDForTabCompletionProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v4 = [WeakRetained UUID];

  return v4;
}

- (BOOL)canPerformCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(CompletionList *)self _urlFromCommand:v4];
    BOOL v6 = ![(CompletionList *)self _shouldSearchUIHandleEngagementForURL:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)performCommand:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = v12;
  if (isKindOfClass)
  {
    id v6 = v12;
    uint64_t v7 = [(CompletionList *)self _urlFromCommand:v6];
    uint64_t v8 = [v6 punchout];
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [v8 forceOpenInBrowser];
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [(CompletionList *)self delegate];
    [v10 completionList:self willGoToURL:v7 fromPegasusSearchResult:self->_pegasusSearchResult forImageAttribution:v9];

    pegasusSearchResult = self->_pegasusSearchResult;
    self->_pegasusSearchResult = 0;

    self->_safariShouldHandleCardSectionEngagement = 0;
    uint64_t v5 = v12;
  }
}

- (id)_urlFromCommand:(id)a3
{
  id v3 = [a3 punchout];
  id v4 = [v3 preferredOpenableURL];

  return v4;
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 destination];
  id v6 = [v5 preferredOpenableURL];

  BOOL v7 = [(CompletionList *)self _shouldSearchUIHandleEngagementForURL:v6];
  if (!v7)
  {
    uint64_t v8 = [v4 destination];
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [v8 forceOpenInBrowser];
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [(CompletionList *)self delegate];
    [v10 completionList:self willGoToURL:v6 fromPegasusSearchResult:self->_pegasusSearchResult forImageAttribution:v9];

    pegasusSearchResult = self->_pegasusSearchResult;
    self->_pegasusSearchResult = 0;

    self->_safariShouldHandleCardSectionEngagement = 0;
  }

  return v7;
}

- (BOOL)_shouldSearchUIHandleEngagementForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  BOOL v8 = 1;
  if (self->_safariShouldHandleCardSectionEngagement)
  {
    id v6 = [v4 host];
    char v7 = [v6 isEqualToString:@"weather.apple.com"];

    if ((v7 & 1) == 0
      && ((objc_msgSend(v5, "safari_isHTTPURL") & 1) != 0 || objc_msgSend(v5, "safari_isHTTPSURL")))
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)willDismissViewController:(id)a3
{
  id v4 = [(CompletionList *)self delegate];
  [v4 completionListDidDismissSearchUIViewController:self];
}

- (void)didEngageResult:(id)a3
{
  id v9 = a3;
  -[CompletionList _postFeedback:](self, "_postFeedback:");
  if (([MEMORY[0x1E4F97EA0] isSMARTParsecResultsEnabled] & 1) != 0
    || ([v9 result],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 domainName],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"web_answer"],
        v5,
        v4,
        v6))
  {
    self->_safariShouldHandleCardSectionEngagement = 1;
    char v7 = [v9 result];
    pegasusSearchResult = self->_pegasusSearchResult;
    self->_pegasusSearchResult = v7;
  }
}

- (void)_postFeedback:(id)a3
{
  id v8 = a3;
  id v4 = +[UniversalSearchSession sharedSession];
  uint64_t v5 = [v4 feedbackDispatcher];
  int v6 = [(CompletionList *)self query];
  uint64_t v7 = [v6 queryID];
  if (!v7) {
    uint64_t v7 = [MEMORY[0x1E4F98A50] currentQueryID];
  }
  [v5 postFeedback:v8 forQueryID:v7];
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (UniversalSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (CompletionListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CompletionListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LoadProgressObserver)loadProgressObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
  return (LoadProgressObserver *)WeakRetained;
}

- (BOOL)shouldIncludeNetworkedSearchSuggestions
{
  return self->_shouldIncludeNetworkedSearchSuggestions;
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

- (BOOL)isUsingPencilInput
{
  return self->_usingPencilInput;
}

- (void)setUsingPencilInput:(BOOL)a3
{
  self->_usingPencilInput = a3;
}

- (BOOL)isExecutingVoiceSearch
{
  return self->_executingVoiceSearch;
}

- (void)setExecutingVoiceSearch:(BOOL)a3
{
  self->_executingVoiceSearch = a3;
}

- (NSArray)searchParametersList
{
  return self->_searchParametersList;
}

- (void)setSearchParametersList:(id)a3
{
}

- (NSCache)faviconCache
{
  return self->_faviconCache;
}

- (URLCompletionProvider)URLCompletionProvider
{
  return self->_URLCompletionProvider;
}

- (void)setURLCompletionProvider:(id)a3
{
}

- (SearchSuggestionProvider)suggestionProvider
{
  return self->_suggestionProvider;
}

- (void)setSuggestionProvider:(id)a3
{
}

- (FindOnPageCompletionProvider)findOnPageProvider
{
  return self->_findOnPageProvider;
}

- (void)setFindOnPageProvider:(id)a3
{
}

- (QuickWebsiteSearchCompletionProvider)quickWebsiteSearchProvider
{
  return self->_quickWebsiteSearchProvider;
}

- (void)setQuickWebsiteSearchProvider:(id)a3
{
}

- (CompletionProvider)firstRemoteCompletionProviderToRespondToQuery
{
  return self->_firstRemoteCompletionProviderToRespondToQuery;
}

- (void)setFirstRemoteCompletionProviderToRespondToQuery:(id)a3
{
}

- (UniversalSearchCompletionProvider)universalSearchProvider
{
  return self->_universalSearchProvider;
}

- (void)setUniversalSearchProvider:(id)a3
{
}

- (TabCompletionProvider)tabCompletionProvider
{
  return self->_tabCompletionProvider;
}

- (void)setTabCompletionProvider:(id)a3
{
}

- (PencilInputCompletionProvider)pencilInputCompletionProvider
{
  return self->_pencilInputCompletionProvider;
}

- (void)setPencilInputCompletionProvider:(id)a3
{
}

- (OfflineSearchSuggestionsCompletionProvider)offlineSearchSuggestionsCompletionProvider
{
  return self->_offlineSearchSuggestionsCompletionProvider;
}

- (void)setOfflineSearchSuggestionsCompletionProvider:(id)a3
{
}

- (CalculationResultCompletionProvider)calculationResultProvider
{
  return self->_calculationResultProvider;
}

- (void)setCalculationResultProvider:(id)a3
{
}

- (NSDate)otherRenderTimeoutStartTime
{
  return self->_otherRenderTimeoutStartTime;
}

- (void)setOtherRenderTimeoutStartTime:(id)a3
{
}

- (NSDate)searchRenderTimeoutStartTime
{
  return self->_searchRenderTimeoutStartTime;
}

- (void)setSearchRenderTimeoutStartTime:(id)a3
{
}

- (NSDate)minRenderTimeoutStartTime
{
  return self->_minRenderTimeoutStartTime;
}

- (void)setMinRenderTimeoutStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minRenderTimeoutStartTime, 0);
  objc_storeStrong((id *)&self->_searchRenderTimeoutStartTime, 0);
  objc_storeStrong((id *)&self->_otherRenderTimeoutStartTime, 0);
  objc_storeStrong((id *)&self->_calculationResultProvider, 0);
  objc_storeStrong((id *)&self->_offlineSearchSuggestionsCompletionProvider, 0);
  objc_storeStrong((id *)&self->_pencilInputCompletionProvider, 0);
  objc_storeStrong((id *)&self->_tabCompletionProvider, 0);
  objc_storeStrong((id *)&self->_universalSearchProvider, 0);
  objc_storeStrong((id *)&self->_firstRemoteCompletionProviderToRespondToQuery, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchProvider, 0);
  objc_storeStrong((id *)&self->_findOnPageProvider, 0);
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_URLCompletionProvider, 0);
  objc_storeStrong((id *)&self->_faviconCache, 0);
  objc_storeStrong((id *)&self->_searchParametersList, 0);
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_siriSuggestedSitesURLStringsToIgnore, 0);
  objc_storeStrong((id *)&self->_ignoredSiriSuggestedSitesQueue, 0);
  objc_storeStrong((id *)&self->_pegasusSearchResult, 0);
  objc_storeStrong((id *)&self->_urlStringToFaviconRequestTokens, 0);
  objc_storeStrong((id *)&self->_parsecTimeout, 0);
  objc_storeStrong((id *)&self->_currentCFListing, 0);
  objc_storeStrong((id *)&self->_currentListing, 0);
  objc_storeStrong((id *)&self->_cfListingOnDisplay, 0);
  objc_storeStrong((id *)&self->_listingOnDisplay, 0);
  objc_storeStrong((id *)&self->_switchToTabMatch, 0);
  objc_storeStrong((id *)&self->_topHit, 0);
  objc_storeStrong((id *)&self->_matchingStringInTopHit, 0);
  objc_storeStrong((id *)&self->_stringMatchedByTopHit, 0);
  objc_storeStrong((id *)&self->_findOnPageGroup, 0);
  objc_storeStrong((id *)&self->_rankingFeedbackForHiddenOrDuplicateResults, 0);
  objc_storeStrong((id *)&self->_queryRestorationCompletionItem, 0);
  objc_storeStrong((id *)&self->_cfQueryRestorationCompletionItem, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
}

- (void)_addUniversalSearchCompletions:(uint64_t)a1 toCompletionListing:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E102C000, a2, OS_LOG_TYPE_DEBUG, "Top Pegasus' results set for Completion List: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)_addUniversalSearchCompletions:(os_log_t)log toCompletionListing:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Starting to add universal search completions.", v1, 2u);
}

- (void)_listingForQuery:(void *)a3 .cold.1(char a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = a1 & 1;
  uint64_t v5 = a2;
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 1024;
  int v8 = [a3 count];
  _os_log_debug_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEBUG, "Universal search provider is valid: (%i) and universal search completions count: (%d)", (uint8_t *)v6, 0xEu);
}

- (void)_listingForQuery:(char)a1 .cold.2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E102C000, a2, OS_LOG_TYPE_DEBUG, "URL Completions  have Arrived: (%d)", (uint8_t *)v2, 8u);
}

- (void)setQuery:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Parsec returned an invalid minRenderTimeout value of %lu ms. Using default value of %lu ms.", (uint8_t *)&v3, 0x16u);
}

void __34__CompletionList__requestFavicons__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Attempting to add favicon to cache with nil url.", v1, 2u);
}

@end