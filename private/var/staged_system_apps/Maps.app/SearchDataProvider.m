@interface SearchDataProvider
- (AutocompleteContext)autocompleteContext;
- (AutocompleteContext)autocompleteInputContext;
- (AutocompleteItemSource)localCompletionsItemSource;
- (AutocompleteItemSource)serverCompletionsItemSource;
- (BOOL)_shouldShowResults;
- (BOOL)enableStructuredRAPAffordance;
- (BOOL)hasResults;
- (BOOL)hasShowAutocompleteClientSource;
- (BOOL)isActive;
- (BOOL)isContentUpdatedOnNoResults;
- (BOOL)lastRequestIsRetainQuery;
- (BOOL)shouldEnableGrayscaleHighlighting;
- (BOOL)shouldEnableRAPForNoResults;
- (BOOL)shouldEnableRAPIfAvailable;
- (BOOL)shouldShowRapCellWithResultsCount:(unint64_t)a3;
- (BOOL)showAutocompleteClientSource;
- (GEOAutocompleteSessionData)_recentAutocompleteSessionData;
- (GEOMapServiceCompletionTicket)lastTicket;
- (GEORetainedSearchMetadata)retainedSearchMetadata;
- (NSArray)sections;
- (PersonalizedItemManager)mapPersonalizedItems;
- (SearchDataProvider)init;
- (SearchDataProviderDelegate)delegate;
- (UserLocationSearchResult)userLocationSearchResult;
- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata;
- (double)retainSearchTime;
- (id)autocompleteAnalyticsSuggestionsFromSections:(id)a3 context:(id)a4;
- (id)autocompleteAnalyticsSuggestionsFromSections:(id)a3 context:(id)a4 selectedChildItemIndexPath:(id)a5 indexOfResultWithSelectedChildItem:(id)a6;
- (id)buildContent;
- (int)autocompleteChangeCounter;
- (int)exclusiveIncrementAutocompleteChangeCounter;
- (int64_t)highlightType;
- (unint64_t)resultTypes;
- (unsigned)searchMode;
- (unsigned)searchRequestAnalyticsSequenceNumber;
- (void)_completerWasThrottled:(id)a3 queryFragment:(id)a4;
- (void)_dataChanged;
- (void)_processNewAutocompleteItems:(id)a3 itemGroups:(id)a4;
- (void)autocompleteContext:(id)a3 didUpdateMatchInfo:(id)a4;
- (void)clearAutocompleteResults;
- (void)clearMKLocalSearchCompleterQueryState;
- (void)completer:(id)a3 didFailWithError:(id)a4 forQueryFragment:(id)a5;
- (void)completer:(id)a3 didUpdateResultsWithSections:(id)a4 forQueryFragment:(id)a5;
- (void)ensureTraitsHaveDefaultValues:(id)a3;
- (void)incrementAutocompleteChangeCounter;
- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5;
- (void)populateContext;
- (void)receivedSearchResults:(id)a3 forContext:(id)a4;
- (void)refreshAnalyticsState;
- (void)reset;
- (void)setActive:(BOOL)a3;
- (void)setContentUpdatedOnNoResults:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableRAPIfAvailable:(BOOL)a3;
- (void)setFinishedLocalCompletions:(BOOL)a3;
- (void)setFinishedServerCompletions:(BOOL)a3;
- (void)setInputText:(id)a3 tappedQuerySuggestionCompletion:(id)a4 isRetainQuery:(BOOL)a5 traits:(id)a6 source:(int)a7;
- (void)setInputText:(id)a3 traits:(id)a4 source:(int)a5;
- (void)setLastTicket:(id)a3;
- (void)setLocalCompletionsItemSource:(id)a3;
- (void)setMapPersonalizedItems:(id)a3;
- (void)setResultTypes:(unint64_t)a3;
- (void)setRetainedSearchMetadata:(id)a3;
- (void)setSearchCompletionFilterType:(int64_t)a3;
- (void)setSearchMode:(unsigned int)a3;
- (void)setServerCompletionsItemSource:(id)a3;
- (void)setUserLocationSearchResult:(id)a3;
- (void)updateAnalyticsStateWithContext:(id)a3 suggestionEntries:(id)a4;
- (void)updateDeduper;
@end

@implementation SearchDataProvider

- (SearchDataProvider)init
{
  v15.receiver = self;
  v15.super_class = (Class)SearchDataProvider;
  v2 = [(SearchDataProvider *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_searchMode = 1;
    v2->_enableRAPIfAvailable = 1;
    v4 = [[SearchBarSearchManager alloc] initWithDelegate:v2];
    localSearchManager = v3->_localSearchManager;
    v3->_localSearchManager = v4;

    v6 = (MKLocalSearchCompleter *)objc_alloc_init((Class)MKLocalSearchCompleter);
    searchCompleter = v3->_searchCompleter;
    v3->_searchCompleter = v6;

    [(MKLocalSearchCompleter *)v3->_searchCompleter _setPrivateFilterType:1001];
    [(MKLocalSearchCompleter *)v3->_searchCompleter _setShouldPreloadTransitInfo:1];
    [(MKLocalSearchCompleter *)v3->_searchCompleter setDelegate:v3];
    [(MKLocalSearchCompleter *)v3->_searchCompleter setStatefulQueriesEnabled:1];
    v8 = (MKAutocompleteAnalyticsProvider *)objc_alloc_init((Class)MKAutocompleteAnalyticsProvider);
    autocompleteAnalyticsState = v3->_autocompleteAnalyticsState;
    v3->_autocompleteAnalyticsState = v8;

    [(MKLocalSearchCompleter *)v3->_searchCompleter setAnalyticsProvider:v3->_autocompleteAnalyticsState];
    v10 = objc_alloc_init(AutocompleteItemManager);
    deduplicator = v3->_deduplicator;
    v3->_deduplicator = v10;

    v12 = objc_alloc_init(PersonalizedItemAutocompleteFilter);
    personalizedItemsFilter = v3->_personalizedItemsFilter;
    v3->_personalizedItemsFilter = v12;

    v3->_highlightType = 0;
    v3->_shouldEnableGrayscaleHighlighting = 0;
    [(PersonalizedItemManager *)v3->_deduplicator addItemSource:v3->_personalizedItemsFilter];
    [(PersonalizedItemManager *)v3->_deduplicator addObserver:v3];
  }
  return v3;
}

- (void)setSearchMode:(unsigned int)a3
{
  if (self->_searchMode != a3)
  {
    self->_searchMode = a3;
    [(PersonalizedItemAutocompleteFilter *)self->_personalizedItemsFilter setHasItemsWhenSearchStringIsEmpty:a3 == 2];
  }
}

- (void)setSearchCompletionFilterType:(int64_t)a3
{
}

- (void)setResultTypes:(unint64_t)a3
{
  if (self->_resultTypes != a3)
  {
    self->_resultTypes = a3;
    -[MKLocalSearchCompleter setResultTypes:](self->_searchCompleter, "setResultTypes:");
  }
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
  if ([(SearchDataProvider *)self isActive])
  {
    [(SearchDataProvider *)self _dataChanged];
  }
  else
  {
    [(SearchDataProvider *)self setLastTicket:0];
    [(SearchDataProvider *)self setFinishedLocalCompletions:0];
    [(SearchDataProvider *)self setFinishedServerCompletions:0];
    autocompleteInputContext = self->_autocompleteInputContext;
    self->_autocompleteInputContext = 0;

    autocompleteContext = self->_autocompleteContext;
    self->_autocompleteContext = 0;

    [(AutocompleteItemManager *)self->_deduplicator setAutocompleteContext:0];
    [(AutocompleteItemManager *)self->_deduplicator autocompleteSessionDidEnd];
    [(AutocompleteItemManager *)self->_deduplicator setTraits:0];
    [(SearchDataProvider *)self updateAnalyticsStateWithContext:0 suggestionEntries:&__NSArray0__struct];
  }
}

- (void)setMapPersonalizedItems:(id)a3
{
  v5 = (PersonalizedItemManager *)a3;
  if (self->_mapPersonalizedItems != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapPersonalizedItems, a3);
    [(PersonalizedItemAutocompleteFilter *)self->_personalizedItemsFilter setInputItems:self->_mapPersonalizedItems];
    v5 = v6;
  }
}

- (void)setUserLocationSearchResult:(id)a3
{
  v5 = (UserLocationSearchResult *)a3;
  if (self->_userLocationSearchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userLocationSearchResult, a3);
    [(SearchDataProvider *)self _dataChanged];
    v5 = v6;
  }
}

- (BOOL)hasResults
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_sections;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) items:v9];
        id v7 = [v6 count];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)populateContext
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"EnableSearchDebug"];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_sortedCombinedResults;
  id v20 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v5;
        v6 = *(void **)(*((void *)&v26 + 1) + 8 * v5);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v7 = [v6 items];
        id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              v13 = [v12 autocompleteObject];
              if (v13)
              {
                v14 = [v12 matchInfo];
                id v15 = [v14 copy];

                [v15 setShownToUser:0];
                if (v4)
                {
                  v16 = [(PersonalizedItemManager *)self->_deduplicator _priorityFunction];

                  if (v16)
                  {
                    v17 = [(PersonalizedItemManager *)self->_deduplicator _priorityFunction];
                    [v15 setSortPriorityDebug:[v17 priorityForPersonalizedAutocompleteItem:v12]];
                  }
                }
                if (v15) {
                  [(AutocompleteContext *)self->_autocompleteContext setMatchInfo:v15 forObject:v13];
                }
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v21 + 1;
      }
      while ((id)(v21 + 1) != v20);
      id v20 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }
}

- (id)buildContent
{
  [(SearchDataProvider *)self populateContext];
  id v27 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_sortedCombinedResults count]];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v25 = self;
  obj = self->_sortedCombinedResults;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v9 = [v8 items];
        uint64_t v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v11 = [v8 items];
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              if (*(void *)(*((void *)&v28 + 1) + 8 * (void)j))
              {
                [v10 addObject:];
                ++v5;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v13);
        }

        if ([v10 count])
        {
          v16 = [v8 title];
          id v17 = [v10 copy];
          v18 = +[AutocompleteSection sectionWithTitle:items:isQuerySuggestionsSection:](AutocompleteSection, "sectionWithTitle:items:isQuerySuggestionsSection:", v16, v17, [v8 isQuerySuggestionsSection]);
          [v27 addObject:v18];
        }
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  if ([(SearchDataProvider *)v25 shouldShowRapCellWithResultsCount:v5])
  {
    uint64_t v19 = [ReportASearchAutocompleteResult alloc];
    id v20 = [(AutocompleteContext *)v25->_autocompleteContext queryString];
    uint64_t v21 = [(ReportASearchAutocompleteResult *)v19 initWithTitle:v20];
    v36 = v21;
    long long v22 = +[NSArray arrayWithObjects:&v36 count:1];

    long long v23 = +[AutocompleteSection sectionWithTitle:0 items:v22 isQuerySuggestionsSection:0];
    [v27 addObject:v23];
  }

  return v27;
}

- (BOOL)_shouldShowResults
{
  if (self->_finishedLocalCompletions && self->_finishedServerCompletions)
  {
    id v3 = sub_100109E50();
    BOOL v4 = 1;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SearchDataProvider - Client and Server results are done", (uint8_t *)&v8, 2u);
    }
  }
  else if (GEOConfigGetBOOL() {
         && self->_finishedLocalCompletions
  }
         && (id)[(NSString *)self->_trimmedInputText length] == (id)1)
  {
    uint64_t v5 = [(SearchDataProvider *)self localCompletionsItemSource];
    BOOL v4 = [v5 count] != 0;

    id v3 = sub_100109E50();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSStringFromBOOL();
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SearchDataProvider - Should show results: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v3 = sub_100109E50();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SearchDataProvider - Not showing autocomplete results since we are still processing or showing search results.", (uint8_t *)&v8, 2u);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_dataChanged
{
  id v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SearchDataProvider - Data changed", buf, 2u);
  }

  if ([(SearchDataProvider *)self _shouldShowResults])
  {
    BOOL v4 = [(SearchDataProvider *)self buildContent];
    sections = self->_sections;
    self->_sections = v4;

    [(SearchDataProvider *)self refreshAnalyticsState];
    if (self->_hasShowAutocompleteClientSource)
    {
      uint64_t v6 = +[NSNumber numberWithBool:[(SearchDataProvider *)self showAutocompleteClientSource]];
    }
    else
    {
      uint64_t v6 = 0;
    }
    if (self->_inputTextTimestamp <= 0.0)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = +[NSNumber numberWithDouble:(CFAbsoluteTimeGetCurrent() - self->_inputTextTimestamp) * 1000.0];
    }
    int v8 = [(AutocompleteContext *)self->_autocompleteContext queryString];
    id v9 = [(AutocompleteContext *)self->_autocompleteContext query];
    uint64_t v10 = [v9 queryTerms];
    autocompleteAnalyticsSuggestions = self->_autocompleteAnalyticsSuggestions;
    id v12 = +[NSNumber numberWithBool:[(AutocompleteItemManager *)self->_deduplicator clientRankingScoreInfluencedResults]];
    id v13 = +[NSNumber numberWithBool:self->_lastRequestIsRetainQuery];
    +[GEOAPPortal captureClientACResponseWithQuery:v8 queryTokens:v10 entries:autocompleteAnalyticsSuggestions shouldDifferentiateClientAndServerResults:v6 overallLatencyInMs:v7 isRerankerTriggered:v12 isRetainedQuery:v13];

    uint64_t v14 = sub_100109E50();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [(AutocompleteContext *)self->_autocompleteContext queryString];
      *(_DWORD *)buf = 138412290;
      long long v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "SearchDataProvider - Notify SearchDataSource of updated AC list for query %@", buf, 0xCu);
    }
    v16 = [(SearchDataProvider *)self delegate];
    [v16 searchDataProviderDidUpdate:self];

    if (self->_inputText)
    {
      sortedCombinedResults = self->_sortedCombinedResults;
      if (!sortedCombinedResults) {
        sortedCombinedResults = (NSArray *)&__NSArray0__struct;
      }
      v18 = sortedCombinedResults;
      uint64_t v19 = +[NSNotificationCenter defaultCenter];
      inputText = self->_inputText;
      v22[0] = @"SearchDataProviderQueryKey";
      v22[1] = @"SearchDataProviderQueryResultGroupsKey";
      v23[0] = inputText;
      v23[1] = v18;
      uint64_t v21 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      [v19 postNotificationName:@"SearchDataProviderDidChangeDataNotification" object:self userInfo:v21];
    }
  }
}

- (id)autocompleteAnalyticsSuggestionsFromSections:(id)a3 context:(id)a4
{
  return [(SearchDataProvider *)self autocompleteAnalyticsSuggestionsFromSections:a3 context:a4 selectedChildItemIndexPath:0 indexOfResultWithSelectedChildItem:0];
}

- (id)autocompleteAnalyticsSuggestionsFromSections:(id)a3 context:(id)a4 selectedChildItemIndexPath:(id)a5 indexOfResultWithSelectedChildItem:(id)a6
{
  int v8 = &__NSArray0__struct;
  if (a3 && a4)
  {
    LOWORD(v10) = 1;
    int v8 = +[MapsAnalyticsHelper acSuggestionEntriesFromSections:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:traits:usedForLogging:shouldUseDistanceFeatureServerResults:placeSummaryMetadata:](MapsAnalyticsHelper, "acSuggestionEntriesFromSections:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:traits:usedForLogging:shouldUseDistanceFeatureServerResults:placeSummaryMetadata:", a6, self->_traits, v10, self->_placeSummaryMetadata);
    uint64_t v6 = vars8;
  }
  return v8;
}

- (void)refreshAnalyticsState
{
  id v3 = [(SearchDataProvider *)self autocompleteAnalyticsSuggestionsFromSections:self->_sections context:self->_autocompleteContext];
  autocompleteAnalyticsSuggestions = self->_autocompleteAnalyticsSuggestions;
  self->_autocompleteAnalyticsSuggestions = v3;

  autocompleteContext = self->_autocompleteContext;
  uint64_t v6 = self->_autocompleteAnalyticsSuggestions;

  [(SearchDataProvider *)self updateAnalyticsStateWithContext:autocompleteContext suggestionEntries:v6];
}

- (void)autocompleteContext:(id)a3 didUpdateMatchInfo:(id)a4
{
  if (self->_autocompleteContext == a3) {
    [(SearchDataProvider *)self refreshAnalyticsState];
  }
}

- (void)clearAutocompleteResults
{
  sections = self->_sections;
  self->_sections = (NSArray *)&__NSArray0__struct;

  sortedCombinedResults = self->_sortedCombinedResults;
  self->_sortedCombinedResults = (NSArray *)&__NSArray0__struct;

  autocompleteContext = self->_autocompleteContext;
  self->_autocompleteContext = 0;

  autocompleteInputContext = self->_autocompleteInputContext;
  self->_autocompleteInputContext = 0;

  *(_WORD *)&self->_showAutocompleteClientSource = 0;
  self->_shouldEnableRAPForNoResults = 0;
  self->_shouldEnableGrayscaleHighlighting = 0;
  [(SearchDataProvider *)self setLocalCompletionsItemSource:0];
  [(SearchDataProvider *)self setServerCompletionsItemSource:0];
  [(PersonalizedItemManager *)self->_deduplicator setClientRankingFunction:0];
  [(AutocompleteItemManager *)self->_deduplicator setPriorityFunction:0];
  [(AutocompleteItemManager *)self->_deduplicator setCompletionSections:0];
  [(AutocompleteItemManager *)self->_deduplicator setTopSectionIsQuerySuggestions:0];
  [(AutocompleteItemManager *)self->_deduplicator setShouldUseDistanceFeatureServerResults:0];
  [(AutocompleteItemManager *)self->_deduplicator setAutocompleteContext:0];
  [(AutocompleteItemManager *)self->_deduplicator setTraits:0];
  self->_enableStructuredRAPAffordance = 0;
  id v7 = [(SearchDataProvider *)self delegate];
  [v7 searchDataProviderDidUpdate:self];

  [(SearchDataProvider *)self updateAnalyticsStateWithContext:0 suggestionEntries:&__NSArray0__struct];
}

- (void)incrementAutocompleteChangeCounter
{
}

- (int)exclusiveIncrementAutocompleteChangeCounter
{
  return atomic_fetch_add(&self->_autocompleteChangeCounter, 1u) + 1;
}

- (int)autocompleteChangeCounter
{
  return atomic_fetch_add_explicit(&self->_autocompleteChangeCounter, 0, memory_order_relaxed);
}

- (void)setLastTicket:(id)a3
{
  uint64_t v5 = (GEOMapServiceCompletionTicket *)a3;
  id v7 = v5;
  if (self->_lastTicket != v5)
  {
    objc_storeStrong((id *)&self->_lastTicket, a3);
    uint64_t v5 = v7;
  }
  if (v5)
  {
    [(GEOMapServiceCompletionTicket *)v5 retainSearchTime];
    uint64_t v5 = v7;
    self->_lastTicketRetainSearchTime = v6;
  }
}

- (void)setFinishedLocalCompletions:(BOOL)a3
{
  uint64_t v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = NSStringFromBOOL();
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finished collecting local results: %@", (uint8_t *)&v7, 0xCu);
  }
  self->_finishedLocalCompletions = a3;
  [(SearchDataProvider *)self incrementAutocompleteChangeCounter];
}

- (void)setFinishedServerCompletions:(BOOL)a3
{
  uint64_t v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = NSStringFromBOOL();
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finished collecting server results: %@", (uint8_t *)&v7, 0xCu);
  }
  self->_finishedServerCompletions = a3;
  [(SearchDataProvider *)self incrementAutocompleteChangeCounter];
}

- (void)setInputText:(id)a3 traits:(id)a4 source:(int)a5
{
}

- (void)setInputText:(id)a3 tappedQuerySuggestionCompletion:(id)a4 isRetainQuery:(BOOL)a5 traits:(id)a6 source:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = (NSString *)a3;
  id v13 = a4;
  id v14 = a6;
  if (self->_inputText == v12)
  {
    if (!v13) {
      goto LABEL_37;
    }
  }
  else
  {
    unsigned __int8 v15 = -[NSString isEqualToString:](v12, "isEqualToString:");
    if (!v13 && (v15 & 1) != 0) {
      goto LABEL_37;
    }
  }
  v16 = sub_100109E50();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v31 = 138412290;
    long long v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "SearchDataProvider starting collecting data for query %@", (uint8_t *)&v31, 0xCu);
  }

  self->_inputTextTimestamp = CFAbsoluteTimeGetCurrent();
  [(PersonalizedItemManager *)self->_deduplicator setUpdatesPaused:1];
  self->_lastRequestIsRetainQuery = a5;
  [(SearchDataProvider *)self setFinishedLocalCompletions:0];
  [(SearchDataProvider *)self setFinishedServerCompletions:0];
  [(SearchBarSearchManager *)self->_localSearchManager cancelCurrentSearch];
  id v17 = (NSString *)[(NSString *)v12 copy];
  inputText = self->_inputText;
  self->_inputText = v17;

  uint64_t v19 = [(NSString *)self->_inputText _maps_stringByTrimmingLeadingWhitespace];
  if (![v19 length])
  {

    uint64_t v19 = 0;
  }
  p_CFStringRef trimmedInputText = &self->_trimmedInputText;
  objc_storeStrong((id *)&self->_trimmedInputText, v19);
  uint64_t v21 = [AutocompleteContext alloc];
  if (self->_inputText) {
    CFStringRef v22 = (const __CFString *)self->_inputText;
  }
  else {
    CFStringRef v22 = &stru_101324E70;
  }
  long long v23 = [(AutocompleteContext *)v21 initWithQueryString:v22];
  autocompleteInputContext = self->_autocompleteInputContext;
  self->_autocompleteInputContext = v23;

  [(SearchDataProvider *)self updateAnalyticsStateWithContext:self->_autocompleteInputContext suggestionEntries:self->_autocompleteAnalyticsSuggestions];
  [(SearchDataProvider *)self ensureTraitsHaveDefaultValues:v14];
  objc_storeStrong((id *)&self->_traits, a6);
  if ([(NSString *)self->_trimmedInputText length])
  {
    [(SearchDataProvider *)self setFinishedServerCompletions:self->_trimmedInputText == 0];
    [(MKLocalSearchCompleter *)self->_searchCompleter setSource:v7];
    [(MKLocalSearchCompleter *)self->_searchCompleter setRetainedSearchMetadata:self->_retainedSearchMetadata];
    if (self->_trimmedInputText) {
      CFStringRef trimmedInputText = (const __CFString *)self->_trimmedInputText;
    }
    else {
      CFStringRef trimmedInputText = &stru_101324E70;
    }
    [(MKLocalSearchCompleter *)self->_searchCompleter setQueryFragment:trimmedInputText];
    [(MKLocalSearchCompleter *)self->_searchCompleter _setTappedQuerySuggestionCompletion:v13];
    if ([v14 hasMapRegion])
    {
      long long v26 = [v14 mapRegion];
      GEOMapRectForMapRegion();
      MKCoordinateRegion v34 = MKCoordinateRegionForMapRect(v33);
      -[MKLocalSearchCompleter setRegion:](self->_searchCompleter, "setRegion:", v34.center.latitude, v34.center.longitude, v34.span.latitudeDelta, v34.span.longitudeDelta);
    }
    if ([v14 hasMode])
    {
      unsigned int v27 = [v14 mode] - 1;
      if (v27 > 3) {
        uint64_t v28 = 103;
      }
      else {
        uint64_t v28 = qword_100F6F380[v27];
      }
      [(MKLocalSearchCompleter *)self->_searchCompleter setMapType:v28];
    }
    if ([v14 hasTimeSinceMapViewportChanged]) {
      -[MKLocalSearchCompleter setTimeSinceLastInBoundingRegion:](self->_searchCompleter, "setTimeSinceLastInBoundingRegion:", (double)[v14 timeSinceMapViewportChanged]);
    }
    if ([v14 hasSequenceNumber]) {
      self->_searchRequestAnalyticsSequenceNumber = [v14 sequenceNumber];
    }
    [(MKLocalSearchCompleter *)self->_searchCompleter setTraits:v14];
    if ([v14 autocompleteOriginationEditingServerWaypoints])
    {
      [(PersonalizedItemManager *)self->_deduplicator removeItemSource:self->_personalizedItemsFilter];
      objc_storeStrong((id *)&self->_autocompleteContext, self->_autocompleteInputContext);
      [(AutocompleteContext *)self->_autocompleteContext setDelegate:self];
      [(AutocompleteItemManager *)self->_deduplicator setAutocompleteContext:self->_autocompleteContext];
      [(SearchDataProvider *)self setLocalCompletionsItemSource:0];
      [(SearchDataProvider *)self setFinishedLocalCompletions:1];
    }
    else
    {
      [(SearchDataProvider *)self setFinishedLocalCompletions:0];
      [(PersonalizedItemManager *)self->_deduplicator addItemSource:self->_personalizedItemsFilter];
      unint64_t Integer = GEOConfigGetInteger();
      if ((Integer & 0x8000000000000000) == 0 && [(NSString *)*p_trimmedInputText length] <= Integer) {
        [(NSString *)*p_trimmedInputText _navigation_isCJK];
      }
      -[SearchBarSearchManager searchName:forSearchMode:backfill:context:originationType:](self->_localSearchManager, "searchName:forSearchMode:backfill:context:originationType:", self->_inputText, self->_searchMode, GEOConfigGetInteger(), self->_autocompleteInputContext, [v14 autocompleteOriginationType]);
    }
    [(SearchDataProvider *)self updateDeduper];
  }
  else
  {
    long long v29 = [(MKAutocompleteAnalyticsProvider *)self->_autocompleteAnalyticsState captureNewMetrics];
    [v29 submitWithStatus:4];
  }
LABEL_37:
}

- (void)updateAnalyticsStateWithContext:(id)a3 suggestionEntries:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 queryString];
  int v8 = (void *)v7;
  id v9 = &stru_101324E70;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  uint64_t v10 = v9;

  long long v11 = [v6 query];

  uint64_t v12 = [v11 queryTerms];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = &__NSArray0__struct;
  }
  id v15 = v14;

  if (v17) {
    v16 = v17;
  }
  else {
    v16 = &__NSArray0__struct;
  }
  [(MKAutocompleteAnalyticsProvider *)self->_autocompleteAnalyticsState updateStateWithQuery:v10 queryTokens:v15 visibleSuggestionEntries:v16];
}

- (void)updateDeduper
{
  id v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SearchDataProvider - Dedupe if necessary", buf, 2u);
  }

  if ([(SearchDataProvider *)self _shouldShowResults])
  {
    BOOL v4 = sub_100109E50();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchDataProvider - Dedupe results", v5, 2u);
    }

    [(PersonalizedItemAutocompleteFilter *)self->_personalizedItemsFilter setSearchString:self->_trimmedInputText];
    [(AutocompleteItemManager *)self->_deduplicator setTraits:self->_traits];
    [(PersonalizedItemManager *)self->_deduplicator setUpdatesPaused:0];
  }
}

- (void)reset
{
  [(SearchDataProvider *)self setFinishedLocalCompletions:0];
  [(SearchDataProvider *)self setFinishedServerCompletions:0];
  sortedCombinedResults = self->_sortedCombinedResults;
  self->_sortedCombinedResults = (NSArray *)&__NSArray0__struct;

  sections = self->_sections;
  self->_sections = (NSArray *)&__NSArray0__struct;

  inputText = self->_inputText;
  self->_inputText = 0;

  autocompleteInputContext = self->_autocompleteInputContext;
  self->_autocompleteInputContext = 0;

  autocompleteContext = self->_autocompleteContext;
  self->_autocompleteContext = 0;

  autocompleteAnalyticsSuggestions = self->_autocompleteAnalyticsSuggestions;
  self->_autocompleteAnalyticsSuggestions = (NSArray *)&__NSArray0__struct;

  *(_WORD *)&self->_showAutocompleteClientSource = 0;
  self->_shouldEnableRAPForNoResults = 0;
  self->_shouldEnableGrayscaleHighlighting = 0;
  [(SearchDataProvider *)self setServerCompletionsItemSource:0];
  [(SearchDataProvider *)self setLocalCompletionsItemSource:0];
  [(PersonalizedItemManager *)self->_deduplicator setClientRankingFunction:0];
  [(AutocompleteItemManager *)self->_deduplicator setPriorityFunction:0];
  [(AutocompleteItemManager *)self->_deduplicator setCompletionSections:0];
  [(AutocompleteItemManager *)self->_deduplicator setTopSectionIsQuerySuggestions:0];
  [(AutocompleteItemManager *)self->_deduplicator setShouldUseDistanceFeatureServerResults:0];
  [(AutocompleteItemManager *)self->_deduplicator setAutocompleteContext:0];
  [(AutocompleteItemManager *)self->_deduplicator setTraits:0];
  self->_enableStructuredRAPAffordance = 0;
  [(SearchDataProvider *)self setLastTicket:0];

  [(SearchDataProvider *)self updateAnalyticsStateWithContext:0 suggestionEntries:&__NSArray0__struct];
}

- (void)setServerCompletionsItemSource:(id)a3
{
  uint64_t v5 = (AutocompleteItemSource *)a3;
  serverCompletionsItemSource = self->_serverCompletionsItemSource;
  uint64_t v7 = v5;
  if (serverCompletionsItemSource != v5)
  {
    if (serverCompletionsItemSource) {
      -[PersonalizedItemManager removeItemSource:](self->_deduplicator, "removeItemSource:");
    }
    objc_storeStrong((id *)&self->_serverCompletionsItemSource, a3);
    if (self->_serverCompletionsItemSource) {
      -[PersonalizedItemManager addItemSource:](self->_deduplicator, "addItemSource:");
    }
  }
}

- (void)setLocalCompletionsItemSource:(id)a3
{
  uint64_t v5 = (AutocompleteItemSource *)a3;
  localCompletionsItemSource = self->_localCompletionsItemSource;
  uint64_t v7 = v5;
  if (localCompletionsItemSource != v5)
  {
    if (localCompletionsItemSource) {
      -[PersonalizedItemManager removeItemSource:](self->_deduplicator, "removeItemSource:");
    }
    objc_storeStrong((id *)&self->_localCompletionsItemSource, a3);
    if (self->_localCompletionsItemSource) {
      -[PersonalizedItemManager addItemSource:](self->_deduplicator, "addItemSource:");
    }
  }
}

- (double)retainSearchTime
{
  return self->_lastTicketRetainSearchTime;
}

- (void)ensureTraitsHaveDefaultValues:(id)a3
{
  id v3 = a3;
  if (![v3 supportedAutocompleteResultCellTypesCount])
  {
    [v3 addSupportedAutocompleteResultCellType:0];
    [v3 addSupportedAutocompleteResultCellType:3];
  }
  BOOL v4 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  id v5 = [v4 updatedTraitsForCurrentGarageState:v3];
}

- (BOOL)shouldShowRapCellWithResultsCount:(unint64_t)a3
{
  unsigned int IsEnabled_RAPSydney = _MKRAPIsAvailable();
  if (IsEnabled_RAPSydney)
  {
    unsigned int IsEnabled_RAPSydney = [(SearchDataProvider *)self shouldEnableRAPIfAvailable];
    if (IsEnabled_RAPSydney)
    {
      unsigned int IsEnabled_RAPSydney = MapsFeature_IsEnabled_RAPSydney();
      if (IsEnabled_RAPSydney)
      {
        LOBYTE(IsEnabled_RAPSydney) = [(SearchDataProvider *)self enableStructuredRAPAffordance];
        if (!a3) {
          LOBYTE(IsEnabled_RAPSydney) = 0;
        }
      }
    }
  }
  return IsEnabled_RAPSydney;
}

- (void)receivedSearchResults:(id)a3 forContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  inputText = self->_inputText;
  int v8 = [v6 queryString];
  LODWORD(inputText) = [(NSString *)inputText isEqualToString:v8];

  if (inputText)
  {
    [(AutocompleteContext *)self->_autocompleteContext setDelegate:0];
    objc_storeStrong((id *)&self->_autocompleteContext, a4);
    [(AutocompleteContext *)self->_autocompleteContext setDelegate:self];
    [(AutocompleteItemManager *)self->_deduplicator setAutocompleteContext:self->_autocompleteContext];
    [(SearchDataProvider *)self setFinishedLocalCompletions:1];
    [(SearchDataProvider *)self setLocalCompletionsItemSource:v9];
    [(SearchDataProvider *)self updateDeduper];
  }
}

- (void)completer:(id)a3 didUpdateResultsWithSections:(id)a4 forQueryFragment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (GEOConfigGetBOOL())
  {
    if (!v10 || ![(NSString *)self->_inputText hasPrefix:v10])
    {
      long long v11 = sub_100109E50();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        inputText = self->_inputText;
        int v36 = 138412546;
        v37 = inputText;
        __int16 v38 = 2112;
        id v39 = v10;
        id v13 = "SearchDataProvider - Not showing results as they are too old. input text: %@, query: %@";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v36, 0x16u);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
LABEL_7:
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v8 results];
      int v36 = 134217984;
      v37 = (NSString *)[v15 count];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "MKLocalSearchCompleter didUpdateResults: with %lu result(s)", (uint8_t *)&v36, 0xCu);
    }
    [(SearchDataProvider *)self setFinishedServerCompletions:1];
    v16 = [v8 results];
    if ([v16 count] || self->_contentUpdatedOnNoResults)
    {
    }
    else
    {
      unsigned __int8 v35 = [v8 _shouldDisplayNoResults];

      if ((v35 & 1) == 0) {
        goto LABEL_27;
      }
    }
    id v17 = objc_alloc((Class)NSMutableArray);
    v18 = [v8 results];
    long long v11 = [v17 initWithArray:v18];

    if (self->_searchMode == 2)
    {
      uint64_t v19 = +[NSPredicate predicateWithBlock:&stru_1012E8F60];
      [v11 filterUsingPredicate:v19];
    }
    id v20 = [v8 _clientRankingModel];
    if (v20)
    {
      uint64_t v21 = [v8 _clientRankingModel];
      CFStringRef v22 = +[PersonalizedItemClientRankingFunction clientRankingFunctionForGEOClientRankingModel:v21];
      p_deduplicator = &self->_deduplicator;
      [(PersonalizedItemManager *)self->_deduplicator setClientRankingFunction:v22];
    }
    else
    {
      p_deduplicator = &self->_deduplicator;
      [(PersonalizedItemManager *)self->_deduplicator setClientRankingFunction:0];
    }

    long long v25 = [v8 _sortPriorityMapping];
    if (v25)
    {
      long long v26 = [v8 _sortPriorityMapping];
      unsigned int v27 = +[PersonalizedItemPriorityFunction priorityFunctionForGEOSortPriorityMapping:v26];
      [(AutocompleteItemManager *)*p_deduplicator setPriorityFunction:v27];
    }
    else
    {
      [(AutocompleteItemManager *)*p_deduplicator setPriorityFunction:0];
    }

    id v28 = [v9 copy];
    [(AutocompleteItemManager *)self->_deduplicator setCompletionSections:v28];

    -[AutocompleteItemManager setTopSectionIsQuerySuggestions:](self->_deduplicator, "setTopSectionIsQuerySuggestions:", [v8 _autocompleteTopSectionIsQuerySuggestions]);
    -[AutocompleteItemManager setShouldUseDistanceFeatureServerResults:](self->_deduplicator, "setShouldUseDistanceFeatureServerResults:", [v8 _shouldUseDistanceFeatureServerResults]);
    long long v29 = [[AutocompleteItemSource alloc] initWithServerCompletions:v11 serverSections:v9];
    [(SearchDataProvider *)self setServerCompletionsItemSource:v29];

    self->_showAutocompleteClientSource = [v8 _showAutocompleteClientSource];
    self->_hasShowAutocompleteClientSource = 1;
    self->_shouldEnableRAPForNoResults = [v8 _shouldEnableRAPForNoResults];
    self->_shouldEnableGrayscaleHighlighting = [v8 _shouldEnableGrayscaleHighlighting];
    self->_highlightType = (int64_t)[v8 _highlightType];
    long long v30 = [v8 _placeSummaryLayoutMetadata];
    if (v30)
    {
      int v31 = [[_TtC4Maps20PlaceSummaryMetadata alloc] initWithMetadata:v30];
      placeSummaryMetadata = self->_placeSummaryMetadata;
      self->_placeSummaryMetadata = v31;
    }
    self->_enableStructuredRAPAffordance = [v8 _enableStructuredRAPAffordance];
    MKMapRect v33 = [v8 _recentAutocompleteSessionData];
    recentAutocompleteSessionData = self->_recentAutocompleteSessionData;
    self->_recentAutocompleteSessionData = v33;

    [(SearchDataProvider *)self updateDeduper];
    goto LABEL_26;
  }
  if ([(NSString *)self->_inputText isEqualToString:v10]) {
    goto LABEL_7;
  }
  long long v11 = sub_100109E50();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    long long v24 = self->_inputText;
    int v36 = 138412546;
    v37 = v24;
    __int16 v38 = 2112;
    id v39 = v10;
    id v13 = "SearchDataProvider - Not showing results due to text mismatch. input text: %@, query: %@";
    goto LABEL_18;
  }
LABEL_26:

LABEL_27:
}

- (void)completer:(id)a3 didFailWithError:(id)a4 forQueryFragment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v9 domain];
  if ([v11 isEqualToString:MKErrorDomain])
  {
    id v12 = [v9 code];

    if (v12 == (id)3)
    {
      [(SearchDataProvider *)self _completerWasThrottled:v8 queryFragment:v10];
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v9 localizedDescription];
    int v15 = 138412290;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "MKLocalSearchCompleter didFailWithError: %@", (uint8_t *)&v15, 0xCu);
  }
  [(SearchDataProvider *)self setFinishedServerCompletions:1];
  [(SearchDataProvider *)self setServerCompletionsItemSource:0];
  *(_WORD *)&self->_showAutocompleteClientSource = 0;
  self->_shouldEnableRAPForNoResults = 0;
  self->_shouldEnableGrayscaleHighlighting = 0;
  [(PersonalizedItemManager *)self->_deduplicator setClientRankingFunction:0];
  [(AutocompleteItemManager *)self->_deduplicator setPriorityFunction:0];
  [(AutocompleteItemManager *)self->_deduplicator setCompletionSections:0];
  [(AutocompleteItemManager *)self->_deduplicator setTopSectionIsQuerySuggestions:0];
  [(AutocompleteItemManager *)self->_deduplicator setShouldUseDistanceFeatureServerResults:0];
  self->_enableStructuredRAPAffordance = 0;
  self->_lastTicketRetainSearchTime = 0.0;
LABEL_8:
}

- (void)_completerWasThrottled:(id)a3 queryFragment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "MKLocalSearchCompleter was throttled", v9, 2u);
  }

  if (objc_opt_respondsToSelector()) {
    [(SearchDataProvider *)self completerDidUpdateResults:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [(SearchDataProvider *)self completer:v6 didUpdateResultsWithSections:&__NSArray0__struct forQueryFragment:v7];
  }
}

- (void)clearMKLocalSearchCompleterQueryState
{
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
}

- (void)_processNewAutocompleteItems:(id)a3 itemGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100109E50();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SearchDataProvider - process new AC list", buf, 2u);
  }

  unsigned int v9 = [(SearchDataProvider *)self exclusiveIncrementAutocompleteChangeCounter];
  id v10 = dispatch_get_global_queue(25, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003F45A4;
  v13[3] = &unk_1012E77D8;
  unsigned int v16 = v9;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, v13);
}

- (NSArray)sections
{
  return self->_sections;
}

- (unsigned)searchMode
{
  return self->_searchMode;
}

- (UserLocationSearchResult)userLocationSearchResult
{
  return self->_userLocationSearchResult;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (void)setRetainedSearchMetadata:(id)a3
{
}

- (BOOL)lastRequestIsRetainQuery
{
  return self->_lastRequestIsRetainQuery;
}

- (PersonalizedItemManager)mapPersonalizedItems
{
  return self->_mapPersonalizedItems;
}

- (GEOMapServiceCompletionTicket)lastTicket
{
  return self->_lastTicket;
}

- (unsigned)searchRequestAnalyticsSequenceNumber
{
  return self->_searchRequestAnalyticsSequenceNumber;
}

- (AutocompleteContext)autocompleteContext
{
  return self->_autocompleteContext;
}

- (AutocompleteContext)autocompleteInputContext
{
  return self->_autocompleteInputContext;
}

- (BOOL)showAutocompleteClientSource
{
  return self->_showAutocompleteClientSource;
}

- (BOOL)hasShowAutocompleteClientSource
{
  return self->_hasShowAutocompleteClientSource;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (GEOAutocompleteSessionData)_recentAutocompleteSessionData
{
  return self->_recentAutocompleteSessionData;
}

- (SearchDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)resultTypes
{
  return self->_resultTypes;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)shouldEnableRAPIfAvailable
{
  return self->_enableRAPIfAvailable;
}

- (void)setEnableRAPIfAvailable:(BOOL)a3
{
  self->_enableRAPIfAvailable = a3;
}

- (BOOL)isContentUpdatedOnNoResults
{
  return self->_contentUpdatedOnNoResults;
}

- (void)setContentUpdatedOnNoResults:(BOOL)a3
{
  self->_contentUpdatedOnNoResults = a3;
}

- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (int64_t)highlightType
{
  return self->_highlightType;
}

- (BOOL)shouldEnableRAPForNoResults
{
  return self->_shouldEnableRAPForNoResults;
}

- (AutocompleteItemSource)serverCompletionsItemSource
{
  return self->_serverCompletionsItemSource;
}

- (AutocompleteItemSource)localCompletionsItemSource
{
  return self->_localCompletionsItemSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_lastTicket, 0);
  objc_storeStrong((id *)&self->_mapPersonalizedItems, 0);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_userLocationSearchResult, 0);
  objc_storeStrong((id *)&self->_autocompleteAnalyticsSuggestions, 0);
  objc_storeStrong((id *)&self->_autocompleteAnalyticsState, 0);
  objc_storeStrong((id *)&self->_personalizedItemsFilter, 0);
  objc_storeStrong((id *)&self->_autocompleteContext, 0);
  objc_storeStrong((id *)&self->_sortedCombinedResults, 0);
  objc_storeStrong((id *)&self->_localCompletionsItemSource, 0);
  objc_storeStrong((id *)&self->_serverCompletionsItemSource, 0);
  objc_storeStrong((id *)&self->_deduplicator, 0);
  objc_storeStrong((id *)&self->_localSearchManager, 0);
  objc_storeStrong((id *)&self->_searchCompleter, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_autocompleteInputContext, 0);
  objc_storeStrong((id *)&self->_trimmedInputText, 0);
  objc_storeStrong((id *)&self->_inputText, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end