@interface SPUIResultsViewController
- (BOOL)_hasRealSuggestions;
- (BOOL)allowHighlightingWhenInactive;
- (BOOL)hasResultsWaitingToUpdate;
- (BOOL)isHighlighting;
- (BOOL)isResultOriginalSearchSuggestion:(id)a3;
- (BOOL)queryJustHasTopHits;
- (BOOL)searchAgentHasWindow:(id)a3;
- (BOOL)shouldAnimateUpdates;
- (BOOL)useLoadingView;
- (CGSize)contentSize;
- (CGSize)oldContentSize;
- (NSArray)resultSections;
- (NSTimer)loadingViewTimer;
- (SFResultSection)searchThroughSection;
- (SFResultSection)suggestionsSection;
- (SFSearchResult)actualSearchSuggestionResult;
- (SFSearchResult)goTakeoverResult;
- (SFSearchResult)highlightedResult;
- (SPSearchEntity)searchEntity;
- (SPUIResultsViewController)initWithSearchModel:(id)a3;
- (SPUIResultsViewController)initWithSearchModel:(id)a3 searchEntity:(id)a4;
- (SPUISearchModel)model;
- (SearchUIBackgroundColorDelegate)backgroundColorDelegate;
- (SearchUILoadingView)loadingView;
- (UISearchToken)searchToken;
- (id)asTypedSearchResult;
- (id)didFinishGettingAllResultsHandler;
- (id)makeAsYouTypeSuggestionSearchResultWithSearchString:(id)a3 detailText:(id)a4 suggestionIdentifier:(id)a5 queryContext:(id)a6;
- (id)restorationContext;
- (id)searchUIBackgroundColor;
- (unint64_t)currentDeviceAuthenticationState;
- (unint64_t)previousQueryId;
- (void)_pushSectionsUpdate;
- (void)changeTextFieldsReturnKeyType:(int64_t)a3 withGoTakeoverResult:(id)a4;
- (void)clearSuggestionSection;
- (void)finishedGettingResults:(BOOL)a3;
- (void)forceHighlightForResult:(id)a3;
- (void)highlightResultAfterUnmarkingText;
- (void)invalidateContentHeight;
- (void)purgeMemory;
- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3;
- (void)searchAgentClearedResults:(id)a3;
- (void)searchAgentFinishedQueryWithoutAdditionalResults:(id)a3;
- (void)searchAgentUpdatedResults:(id)a3;
- (void)searchUpdatedWithString:(id)a3 tokenEntity:(id)a4 queryId:(unint64_t)a5 wantsCompletions:(BOOL)a6 keyboardLanguage:(id)a7;
- (void)setAllowHighlightingWhenInactive:(BOOL)a3;
- (void)setBackgroundColorDelegate:(id)a3;
- (void)setDidFinishGettingAllResultsHandler:(id)a3;
- (void)setGoTakeoverResult:(id)a3;
- (void)setHasResultsWaitingToUpdate:(BOOL)a3;
- (void)setHighlightedResult:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setLoadingViewTimer:(id)a3;
- (void)setOldContentSize:(CGSize)a3;
- (void)setPreviousQueryId:(unint64_t)a3;
- (void)setQueryJustHasTopHits:(BOOL)a3;
- (void)setRestorationContext:(id)a3;
- (void)setResultSections:(id)a3;
- (void)setSearchEntity:(id)a3;
- (void)setSearchThroughSection:(id)a3;
- (void)setShouldAnimateUpdates:(BOOL)a3;
- (void)setSuggestionsSection:(id)a3;
- (void)setUseLoadingView:(BOOL)a3;
- (void)unhideLoadingView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SPUIResultsViewController

- (void)_pushSectionsUpdate
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  v3 = [(SPUIResultsViewController *)self resultSections];
  v4 = [v3 firstObject];

  v5 = [v4 results];
  v6 = [v5 firstObject];

  v7 = (void *)SPBlueButtonBehavior();
  v8 = [v4 bundleIdentifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F790F8]];

  v62 = v4;
  v10 = [v4 results];
  if ([v10 count] == 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = [v6 renderHorizontallyWithOtherResultsInCategory];
  }

  if (v7) {
    int v12 = 0;
  }
  else {
    int v12 = v11;
  }
  char v13 = [v6 noGoTakeover];
  if (v7 == (void *)1 || v12)
  {
    if (v9)
    {
      v7 = [(SearchUIResultsViewController *)self delegate];
      LOBYTE(v9) = objc_opt_respondsToSelector();
      if ((v9 & 1) != 0
        && ([(SearchUIResultsViewController *)self delegate],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            ([(id)v11 optOutOfGoButton] & 1) != 0))
      {
        char v14 = 1;
        LOBYTE(v9) = 1;
      }
      else
      {
        if ((v13 & 1) == 0)
        {
          if (v9) {

          }
          goto LABEL_31;
        }
        char v14 = 1;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    if (v7 == (void *)2) {
      goto LABEL_25;
    }
    char v14 = 0;
    LOBYTE(v9) = 0;
  }
  v15 = [(SPUIResultsViewController *)self asTypedSearchResult];
  BOOL v16 = v6 == v15 && [v6 type] == 29;

  if (v9) {
  if (v14)
  }
  {

    if (v16) {
      goto LABEL_31;
    }
LABEL_25:
    id v17 = [(SPUIResultsViewController *)self asTypedSearchResult];
    v18 = self;
    uint64_t v19 = 6;
    id v20 = 0;
    goto LABEL_32;
  }
  if (!v16) {
    goto LABEL_25;
  }
LABEL_31:
  id v17 = v6;
  v18 = self;
  uint64_t v19 = 1;
  id v20 = v17;
LABEL_32:
  [(SPUIResultsViewController *)v18 changeTextFieldsReturnKeyType:v19 withGoTakeoverResult:v20];
  if ([(SPUIResultsViewController *)self hasResultsWaitingToUpdate])
  {
    v21 = [(SearchUIResultsViewController *)self delegate];
    [v21 willUpdateFromResultsWithHighlightedResult:v17 viewController:self];

    [(SPUIResultsViewController *)self setHasResultsWaitingToUpdate:0];
  }
  uint64_t v22 = [(SPUIResultsViewController *)self resultSections];
  v23 = (void *)v22;
  v24 = (void *)MEMORY[0x263EFFA68];
  if (v22) {
    v24 = (void *)v22;
  }
  id v25 = v24;

  v26 = [(SearchUIResultsViewController *)self searchField];
  v27 = [v26 searchText];

  v60 = self;
  v61 = v6;
  v58 = v27;
  v59 = v17;
  if (v6)
  {
    uint64_t v28 = [v6 queryId];
    if ([v27 length]) {
      BOOL v29 = v28 != [(SPUIResultsViewController *)self previousQueryId];
    }
    else {
      BOOL v29 = 1;
    }
    unsigned int v57 = v29;
    [(SPUIResultsViewController *)self setPreviousQueryId:v28];
  }
  else
  {
    unsigned int v57 = 1;
  }
  uint64_t v30 = SPSuggestionDetailTextBehavior();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v25;
  uint64_t v65 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v71 != v64) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v33 = [v32 results];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v66 objects:v76 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v67;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v67 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = [MEMORY[0x263F67C78] cardSectionsForRenderingResult:*(void *)(*((void *)&v66 + 1) + 8 * j)];
              v39 = [v38 firstObject];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v40 = [v39 suggestionType];
                BOOL v41 = v30 != 1 || v40 == 0;
                BOOL v42 = !v41;
                if (!v30 || v42) {
                  [v39 setDetailText:0];
                }
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v66 objects:v76 count:16];
          }
          while (v35);
        }
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v65);
  }

  v43 = [MEMORY[0x263F67C78] cardForRenderingResult:v61];
  v44 = [v43 backgroundColor];

  if (v44)
  {
    v45 = [(SPUIResultsViewController *)v60 searchEntity];
    v46 = [v45 entityBackgroundColor];

    if (!v46)
    {
      v47 = [(SPUIResultsViewController *)v60 searchEntity];
      [v47 setEntityBackgroundColor:v44];

      v48 = [(SPUIResultsViewController *)v60 backgroundColorDelegate];
      [v48 didUpdateBackgroundColorForViewController:v60];
    }
  }
  [(SearchUIResultsViewController *)v60 updateWithResultSections:obj resetScrollPoint:v57 animated:[(SPUIResultsViewController *)v60 shouldAnimateUpdates]];
  v49 = [(SearchUIResultsViewController *)v60 searchField];
  char v50 = [v49 isFirstResponder];

  v51 = v59;
  if ((v50 & 1) == 0)
  {

    v51 = 0;
  }
  [(SPUIResultsViewController *)v60 forceHighlightForResult:v51];
  uint64_t v52 = [obj count];
  uint64_t v53 = MEMORY[0x263F79148];
  v54 = *(NSObject **)(MEMORY[0x263F79148] + 40);
  if (v52)
  {
    if (!v54)
    {
      SPUIInitLogging();
      v54 = *(NSObject **)(v53 + 40);
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = v54;
      uint64_t v56 = [obj count];
      *(_DWORD *)buf = 134217984;
      uint64_t v75 = v56;
      _os_log_impl(&dword_23D2E6000, v55, OS_LOG_TYPE_DEFAULT, "update with section count %lu", buf, 0xCu);
    }
  }
  else
  {
    if (!v54)
    {
      SPUIInitLogging();
      v54 = *(NSObject **)(v53 + 40);
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D2E6000, v54, OS_LOG_TYPE_DEFAULT, "no results", buf, 2u);
    }
  }
}

- (void)setHasResultsWaitingToUpdate:(BOOL)a3
{
  self->_hasResultsWaitingToUpdate = a3;
}

- (NSArray)resultSections
{
  return (NSArray *)objc_getProperty(self, a2, 1096, 1);
}

- (id)asTypedSearchResult
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SPUIResultsViewController *)self suggestionsSection];
  v3 = [v2 results];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 type] == 30)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (SFResultSection)suggestionsSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 1104, 1);
}

- (BOOL)shouldAnimateUpdates
{
  return self->_shouldAnimateUpdates;
}

- (void)setPreviousQueryId:(unint64_t)a3
{
  self->_previousQueryId = a3;
}

- (BOOL)isHighlighting
{
  return self->_isHighlighting;
}

- (BOOL)hasResultsWaitingToUpdate
{
  return self->_hasResultsWaitingToUpdate;
}

- (void)forceHighlightForResult:(id)a3
{
  id v8 = a3;
  if ([(SPUIResultsViewController *)self allowHighlightingWhenInactive]
    || ([(SearchUIResultsViewController *)self delegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isActiveViewController:self],
        v4,
        v5))
  {
    self->_isHighlighting = 1;
    v6 = [(SearchUIResultsViewController *)self searchField];
    char v7 = [v6 hasMarkedText];

    if ((v7 & 1) == 0) {
      [(SearchUIResultsViewController *)self highlightResult:v8];
    }
    [(SPUIResultsViewController *)self setHighlightedResult:v8];
    self->_isHighlighting = 0;
  }
}

- (void)setHighlightedResult:(id)a3
{
}

- (void)changeTextFieldsReturnKeyType:(int64_t)a3 withGoTakeoverResult:(id)a4
{
  id v12 = a4;
  if ([(SPUIResultsViewController *)self allowHighlightingWhenInactive]
    || ([(SearchUIResultsViewController *)self delegate],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isActiveViewController:self],
        v6,
        v7))
  {
    id v8 = a3 == 1 ? v12 : 0;
    [(SPUIResultsViewController *)self setGoTakeoverResult:v8];
    long long v9 = [(SearchUIResultsViewController *)self searchField];
    uint64_t v10 = [v9 returnKeyType];

    if (v10 != a3)
    {
      long long v11 = [(SearchUIResultsViewController *)self searchField];
      [v11 setReturnKeyType:a3];

      +[SPUITextField updateBlueButton];
    }
  }
}

- (BOOL)allowHighlightingWhenInactive
{
  return self->_allowHighlightingWhenInactive;
}

- (void)setGoTakeoverResult:(id)a3
{
}

- (SPUISearchModel)model
{
  return (SPUISearchModel *)objc_getProperty(self, a2, 1072, 1);
}

- (id)searchUIBackgroundColor
{
  v2 = [(SPUIResultsViewController *)self searchEntity];
  v3 = [v2 entityBackgroundColor];

  return v3;
}

- (SPSearchEntity)searchEntity
{
  return (SPSearchEntity *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setAllowHighlightingWhenInactive:(BOOL)a3
{
  self->_allowHighlightingWhenInactive = a3;
}

- (SPUIResultsViewController)initWithSearchModel:(id)a3
{
  return [(SPUIResultsViewController *)self initWithSearchModel:a3 searchEntity:0];
}

- (SPUIResultsViewController)initWithSearchModel:(id)a3 searchEntity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPUIResultsViewController;
  long long v9 = [(SPUIResultsViewController *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v11 = [(SPUIResultsViewController *)v9 view];
    id v12 = [v11 layer];
    [v12 setAllowsGroupOpacity:0];

    [(SearchUIResultsViewController *)v10 setShouldUseInsetRoundedSections:0];
    [(SPUIResultsViewController *)v10 setHasResultsWaitingToUpdate:0];
    [v7 setDelegate:v10];
    [v7 setMaxUISuggestions:0x7FFFFFFFFFFFFFFFLL];
    objc_storeStrong((id *)&v10->_model, a3);
    [(SPUIResultsViewController *)v10 setSearchEntity:v8];
    [(SearchUIResultsViewController *)v10 setRestorationContextClass:objc_opt_class()];
  }

  return v10;
}

- (void)setSearchEntity:(id)a3
{
}

- (void)searchAgentUpdatedResults:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263F79148];
  v6 = *(NSObject **)(MEMORY[0x263F79148] + 32);
  if (!v6)
  {
    SPUIInitLogging();
    v6 = *(NSObject **)(v5 + 32);
  }
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  id v8 = *(void **)(v5 + 32);
  if (!v8)
  {
    SPUIInitLogging();
    id v8 = *(void **)(v5 + 32);
  }
  long long v9 = v8;
  uint64_t v10 = v9;
  unint64_t v11 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "tableUpdate", (const char *)&unk_23D315BC7, buf, 2u);
  }

  if ([v4 queryPartiallyComplete])
  {
    if (self->_startTime) {
      sp_analytics_log_timing();
    }
    self->_startTime = 0;
  }
  else if ([v4 queryComplete])
  {
    [(SPUIResultsViewController *)self finishedGettingResults:1];
  }
  else if (self->_startTime)
  {
    sp_analytics_log_timing();
  }
  id v12 = [v4 sections];
  if ([v4 wantsCompletions])
  {
    unint64_t v27 = v7 - 1;
    os_signpost_id_t v28 = v7;
    [(SPUIResultsViewController *)self setSuggestionsSection:0];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v26 = v12;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      uint64_t v17 = *MEMORY[0x263F790C0];
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v20 = [v19 bundleIdentifier];
          int v21 = [v20 isEqualToString:v17];

          if (v21)
          {
            [(SPUIResultsViewController *)self setSuggestionsSection:v19];
            goto LABEL_28;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    unint64_t v11 = v27;
    os_signpost_id_t v7 = v28;
    uint64_t v5 = MEMORY[0x263F79148];
    id v12 = v26;
  }
  else
  {
    [(SPUIResultsViewController *)self clearSuggestionSection];
  }
  -[SPUIResultsViewController setQueryJustHasTopHits:](self, "setQueryJustHasTopHits:", [v4 queryJustHasTopHits]);
  if ([v4 queryPartiallyComplete] & 1) != 0 || (objc_msgSend(v4, "queryComplete"))
  {
    uint64_t v22 = [v4 searchThroughSection];
    [(SPUIResultsViewController *)self setSearchThroughSection:v22];
  }
  else
  {
    [(SPUIResultsViewController *)self setSearchThroughSection:0];
  }
  [(SPUIResultsViewController *)self setResultSections:v12];
  [(SPUIResultsViewController *)self setHasResultsWaitingToUpdate:1];
  [(SPUIResultsViewController *)self _pushSectionsUpdate];
  v23 = *(void **)(v5 + 32);
  if (!v23)
  {
    SPUIInitLogging();
    v23 = *(void **)(v5 + 32);
  }
  v24 = v23;
  id v25 = v24;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v25, OS_SIGNPOST_INTERVAL_END, v7, "tableUpdate", " enableTelemetry=YES ", buf, 2u);
  }
}

- (void)setSuggestionsSection:(id)a3
{
}

- (void)setSearchThroughSection:(id)a3
{
}

- (void)setResultSections:(id)a3
{
}

- (void)setQueryJustHasTopHits:(BOOL)a3
{
  self->_queryJustHasTopHits = a3;
}

- (void)clearSuggestionSection
{
}

- (void)finishedGettingResults:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SPUIResultsViewController *)self didFinishGettingAllResultsHandler];

  if (v5)
  {
    v6 = [(SPUIResultsViewController *)self didFinishGettingAllResultsHandler];
    v6[2](v6, v3);
  }
  os_signpost_id_t v7 = [(SPUIResultsViewController *)self loadingView];

  if (v7)
  {
    id v8 = [(SPUIResultsViewController *)self loadingView];
    [v8 setAlpha:0.0];

    long long v9 = [(SPUIResultsViewController *)self loadingView];
    [v9 setLoadingState:1];

    uint64_t v10 = [(SPUIResultsViewController *)self loadingViewTimer];
    [v10 invalidate];

    unint64_t v11 = [(SearchUIResultsViewController *)self contentScrollView];
    id v12 = [v11 layer];
    [v12 setAllowsGroupOpacity:0];

    v13[4] = self;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__SPUIResultsViewController_finishedGettingResults___block_invoke;
    v14[3] = &unk_264E90660;
    v14[4] = self;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__SPUIResultsViewController_finishedGettingResults___block_invoke_2;
    v13[3] = &unk_264E90660;
    [MEMORY[0x263F67C78] performAnimatableChanges:v14 animated:1 completion:v13];
  }
}

- (id)didFinishGettingAllResultsHandler
{
  return self->didFinishGettingAllResultsHandler;
}

void __46__SPUIResultsViewController_unhideLoadingView__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) loadingView];
  [v1 setAlpha:1.0];
}

- (void)unhideLoadingView
{
  BOOL v3 = [(SPUIResultsViewController *)self loadingView];
  uint64_t v4 = [v3 loadingState];

  if (!v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __46__SPUIResultsViewController_unhideLoadingView__block_invoke;
    v5[3] = &unk_264E90660;
    v5[4] = self;
    [MEMORY[0x263F67C78] performAnimatableChanges:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SPUIResultsViewController;
  [(SPUIResultsViewController *)&v9 viewWillAppear:a3];
  uint64_t v4 = [(SPUIResultsViewController *)self loadingView];
  uint64_t v5 = [v4 loadingState];

  if (!v5)
  {
    v6 = [(SPUIResultsViewController *)self loadingView];
    [v6 setAlpha:0.0];

    os_signpost_id_t v7 = [(SPUIResultsViewController *)self loadingViewTimer];
    [v7 invalidate];

    [(SPUIResultsViewController *)self setLoadingViewTimer:0];
    id v8 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_unhideLoadingView selector:0 userInfo:0 repeats:0.5];
    [(SPUIResultsViewController *)self setLoadingViewTimer:v8];
  }
}

- (SearchUILoadingView)loadingView
{
  return (SearchUILoadingView *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setLoadingViewTimer:(id)a3
{
}

- (NSTimer)loadingViewTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1144, 1);
}

- (SFSearchResult)goTakeoverResult
{
  return self->_goTakeoverResult;
}

- (void)setUseLoadingView:(BOOL)a3
{
  self->_useLoadingView = a3;
  if (a3
    && ([(SPUIResultsViewController *)self loadingView],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v6 = objc_opt_new();
    [(SPUIResultsViewController *)self setLoadingView:v6];

    os_signpost_id_t v7 = [(SPUIResultsViewController *)self view];
    id v8 = [(SPUIResultsViewController *)self loadingView];
    [v7 insertSubview:v8 atIndex:0];

    objc_super v9 = (void *)MEMORY[0x263F67C10];
    uint64_t v10 = [(SPUIResultsViewController *)self loadingView];
    [v9 fillContainerWithView:v10];

    id v11 = [(SearchUIResultsViewController *)self contentScrollView];
    [v11 setAlpha:0.0];
  }
  else
  {
    uint64_t v5 = [(SPUIResultsViewController *)self loadingView];
    [v5 removeFromSuperview];

    [(SPUIResultsViewController *)self setLoadingView:0];
  }
}

- (UISearchToken)searchToken
{
  BOOL v3 = [(SPUIResultsViewController *)self searchEntity];
  uint64_t v4 = +[SPUISearchHeader tokenFromSearchEntity:v3];

  uint64_t v5 = [(SPUIResultsViewController *)self searchEntity];
  v6 = [v5 tokenText];
  [v4 setRepresentedObject:v6];

  return (UISearchToken *)v4;
}

- (BOOL)isResultOriginalSearchSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUIResultsViewController *)self actualSearchSuggestionResult];

  return v5 == v4;
}

- (BOOL)searchAgentHasWindow:(id)a3
{
  BOOL v3 = [(SPUIResultsViewController *)self view];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (unint64_t)currentDeviceAuthenticationState
{
  v2 = (void *)MEMORY[0x263F79178];
  BOOL v3 = [(SPUIResultsViewController *)self view];
  unint64_t v4 = [v2 deviceAuthenticationStateForView:v3];

  return v4;
}

void __52__SPUIResultsViewController_finishedGettingResults___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentScrollView];
  [v1 setAlpha:1.0];
}

uint64_t __52__SPUIResultsViewController_finishedGettingResults___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingView];
  [v2 removeFromSuperview];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setLoadingView:0];
}

- (void)invalidateContentHeight
{
  [(SPUIResultsViewController *)self setQueryJustHasTopHits:0];
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[SPUIResultsViewController setOldContentSize:](self, "setOldContentSize:", v3, v4);
}

- (void)searchAgentFinishedQueryWithoutAdditionalResults:(id)a3
{
}

- (void)searchAgentClearedResults:(id)a3
{
  [(SearchUIResultsViewController *)self updateWithResultSections:MEMORY[0x263EFFA68] resetScrollPoint:1];
  [(SPUIResultsViewController *)self setSuggestionsSection:0];
  [(SPUIResultsViewController *)self setResultSections:0];
  [(SPUIResultsViewController *)self setSearchThroughSection:0];
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[SPUIResultsViewController setOldContentSize:](self, "setOldContentSize:", v4, v5);
}

- (SFSearchResult)actualSearchSuggestionResult
{
  v2 = [(SPUIResultsViewController *)self suggestionsSection];
  double v3 = [v2 results];
  double v4 = [v3 firstObject];

  return (SFSearchResult *)v4;
}

- (id)makeAsYouTypeSuggestionSearchResultWithSearchString:(id)a3 detailText:(id)a4 suggestionIdentifier:(id)a5 queryContext:(id)a6
{
  uint64_t v9 = *MEMORY[0x263F67518];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  if ([v11 isEqualToString:v9]) {
    uint64_t v14 = 6;
  }
  else {
    uint64_t v14 = 14;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F67A10]) initWithIdentifier:v11 suggestion:v13 query:v13 score:v14 type:1.0];

  [v15 setDetailText:v12];
  uint64_t v16 = [MEMORY[0x263F78E50] buildResultWithSuggestion:v15 queryContext:v10];

  return v16;
}

- (void)searchUpdatedWithString:(id)a3 tokenEntity:(id)a4 queryId:(unint64_t)a5 wantsCompletions:(BOOL)a6 keyboardLanguage:(id)a7
{
  BOOL v8 = a6;
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  self->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  [(SearchUIResultsViewController *)self setQueryString:v12];
  if (![v12 length])
  {
    uint64_t v15 = [v13 tokenText];
    uint64_t v16 = [v15 length];

    if (!v16)
    {
      [(SPUIResultsViewController *)self clearSuggestionSection];
      [(SPUIResultsViewController *)self setResultSections:0];
      [(SPUIResultsViewController *)self setSearchThroughSection:0];
      [(SPUIResultsViewController *)self _pushSectionsUpdate];
      goto LABEL_43;
    }
  }
  if (!v8)
  {
    [(SPUIResultsViewController *)self clearSuggestionSection];
    goto LABEL_43;
  }
  uint64_t v17 = objc_opt_new();
  [v17 setSearchString:v12];
  [v17 setKeyboardLanguage:v14];
  [v17 setQueryIdent:a5];
  v18 = [(SPUIResultsViewController *)self makeAsYouTypeSuggestionSearchResultWithSearchString:v12 detailText:0 suggestionIdentifier:*MEMORY[0x263F67518] queryContext:v17];
  uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v20 = [v19 localizedStringForKey:@"SUGGESTION_DETAIL_WEB" value:&stru_26F104E28 table:@"Search"];

  long long v68 = (void *)v20;
  long long v70 = [(SPUIResultsViewController *)self makeAsYouTypeSuggestionSearchResultWithSearchString:v12 detailText:v20 suggestionIdentifier:*MEMORY[0x263F67520] queryContext:v17];
  int v21 = [(SPUIResultsViewController *)self suggestionsSection];

  if (!v21)
  {
    int v47 = 1;
    goto LABEL_39;
  }
  uint64_t v22 = [(SPUIResultsViewController *)self suggestionsSection];
  v23 = [v22 results];
  v24 = (void *)[v23 mutableCopy];

  uint64_t v25 = [v24 count];
  long long v67 = v18;
  BOOL v66 = v25 == 0;
  uint64_t v65 = v24;
  if (!v25)
  {
    [v24 addObject:v18];
    [v24 addObject:v70];
    goto LABEL_35;
  }
  uint64_t v64 = v17;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v26 = v24;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (!v27)
  {

    goto LABEL_35;
  }
  uint64_t v28 = v27;
  v59 = self;
  id v60 = v14;
  id v61 = v12;
  id v62 = v13;
  uint64_t v29 = 0;
  obuint64_t j = v26;
  uint64_t v72 = *(void *)v74;
  uint64_t v30 = *MEMORY[0x263F674F0];
  uint64_t v69 = *MEMORY[0x263F674F8];
  uint64_t v31 = -1;
  uint64_t v32 = -1;
  while (2)
  {
    uint64_t v33 = 0;
    uint64_t v63 = v29 + v28;
    do
    {
      if (*(void *)v74 != v72) {
        objc_enumerationMutation(obj);
      }
      uint64_t v34 = *(void **)(*((void *)&v73 + 1) + 8 * v33);
      uint64_t v35 = objc_msgSend(v34, "resultBundleId", v59, v60, v61);
      char v36 = [v35 isEqualToString:v30];

      if (v36)
      {
        uint64_t v32 = v29 + v33;
      }
      else
      {
        v37 = [v34 resultBundleId];
        int v38 = [v37 isEqualToString:v69];

        if (v38)
        {
          v39 = [MEMORY[0x263F67C78] cardSectionsForRenderingResult:v34];
          int v40 = [v39 firstObject];

          BOOL v41 = [MEMORY[0x263F67C78] cardSectionsForRenderingResult:v70];
          BOOL v42 = [v41 firstObject];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v43 = [v40 detailText];
              v44 = [v43 text];

              v45 = [v42 detailText];
              [v45 setText:v44];
            }
          }

          uint64_t v31 = v29 + v33;
        }
      }
      if ((v32 & 0x8000000000000000) == 0 && (v31 & 0x8000000000000000) == 0)
      {
        v46 = obj;

        id v14 = v60;
        id v12 = v61;
        self = v59;
        uint64_t v17 = v64;
LABEL_28:
        v48 = [v46 objectAtIndexedSubscript:v32];
        [(SearchUIResultsViewController *)self replaceResult:v48 withResult:v67];

        v49 = [(SPUIResultsViewController *)self highlightedResult];
        char v50 = [v46 objectAtIndexedSubscript:v32];

        if (v49 == v50) {
          [(SPUIResultsViewController *)self forceHighlightForResult:v67];
        }
        [v46 replaceObjectAtIndex:v32 withObject:v67];
        goto LABEL_31;
      }
      ++v33;
    }
    while (v28 != v33);
    uint64_t v28 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
    uint64_t v29 = v63;
    if (v28) {
      continue;
    }
    break;
  }
  v46 = obj;

  id v14 = v60;
  id v12 = v61;
  self = v59;
  uint64_t v17 = v64;
  if ((v32 & 0x8000000000000000) == 0) {
    goto LABEL_28;
  }
LABEL_31:
  id v13 = v62;
  if ((v31 & 0x8000000000000000) == 0)
  {
    v51 = [obj objectAtIndexedSubscript:v31];
    [(SearchUIResultsViewController *)self replaceResult:v51 withResult:v70];

    [obj replaceObjectAtIndex:v31 withObject:v70];
  }
LABEL_35:
  uint64_t v52 = [(SPUIResultsViewController *)self suggestionsSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v53 = [(SPUIResultsViewController *)self suggestionsSection];
    uint64_t v54 = [v53 mutableDeepCopy];
  }
  else
  {
    id v55 = objc_alloc(MEMORY[0x263F78D70]);
    uint64_t v53 = [(SPUIResultsViewController *)self suggestionsSection];
    uint64_t v54 = [v55 initWithSection:v53];
  }
  uint64_t v56 = (void *)v54;

  [v56 setResults:v65];
  [(SPUIResultsViewController *)self setSuggestionsSection:v56];

  v18 = v67;
  int v47 = v66;
LABEL_39:
  unsigned int v57 = [MEMORY[0x263F82438] sharedApplication];
  int v58 = [v57 isRunningTest];

  if (v47 && !v58) {
    [(SPUIResultsViewController *)self _pushSectionsUpdate];
  }

LABEL_43:
}

- (CGSize)contentSize
{
  if ([(SPUIResultsViewController *)self queryJustHasTopHits])
  {
    [(SPUIResultsViewController *)self oldContentSize];
  }
  else
  {
    double v5 = [(SearchUIResultsViewController *)self sections];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)SPUIResultsViewController;
      [(SearchUIResultsViewController *)&v9 contentSize];
    }
    else
    {
      double v7 = *MEMORY[0x263F001B0];
      double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    -[SPUIResultsViewController setOldContentSize:](self, "setOldContentSize:", v7, v8);
    [(SPUIResultsViewController *)self oldContentSize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)_hasRealSuggestions
{
  v2 = [(SPUIResultsViewController *)self suggestionsSection];
  double v3 = [v2 results];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(SPUIResultsViewController *)self asTypedSearchResult];
    [(SPUIResultsViewController *)self forceHighlightForResult:v4];
  }
  else
  {
    [(SPUIResultsViewController *)self forceHighlightForResult:0];
  }
  [(SPUIResultsViewController *)self changeTextFieldsReturnKeyType:6 withGoTakeoverResult:0];
}

- (void)setRestorationContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPUIResultsViewController;
  [(SearchUIResultsViewController *)&v8 setRestorationContext:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 sections];
    [(SearchUIResultsViewController *)self setSections:v5];

    uint64_t v6 = [v4 searchEntity];
    [(SPUIResultsViewController *)self setSearchEntity:v6];

    double v7 = [v4 searchString];
    [(SearchUIResultsViewController *)self setQueryString:v7];
  }
}

- (id)restorationContext
{
  v8.receiver = self;
  v8.super_class = (Class)SPUIResultsViewController;
  double v3 = [(SearchUIResultsViewController *)&v8 restorationContext];
  id v4 = [(SearchUIResultsViewController *)self sections];
  [v3 setSections:v4];

  double v5 = [(SPUIResultsViewController *)self searchEntity];
  [v3 setSearchEntity:v5];

  uint64_t v6 = [(SearchUIResultsViewController *)self queryString];
  [v3 setSearchString:v6];

  return v3;
}

- (void)highlightResultAfterUnmarkingText
{
  id v3 = [(SPUIResultsViewController *)self highlightedResult];
  [(SPUIResultsViewController *)self forceHighlightForResult:v3];
}

- (void)purgeMemory
{
  v3.receiver = self;
  v3.super_class = (Class)SPUIResultsViewController;
  [(SearchUIResultsViewController *)&v3 purgeMemory];
  [(SPUIResultsViewController *)self setResultSections:0];
  [(SPUIResultsViewController *)self setSuggestionsSection:0];
}

- (void)setDidFinishGettingAllResultsHandler:(id)a3
{
}

- (SearchUIBackgroundColorDelegate)backgroundColorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundColorDelegate);
  return (SearchUIBackgroundColorDelegate *)WeakRetained;
}

- (void)setBackgroundColorDelegate:(id)a3
{
}

- (BOOL)useLoadingView
{
  return self->_useLoadingView;
}

- (void)setShouldAnimateUpdates:(BOOL)a3
{
  self->_shouldAnimateUpdates = a3;
}

- (SFResultSection)searchThroughSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 1112, 1);
}

- (unint64_t)previousQueryId
{
  return self->_previousQueryId;
}

- (SFSearchResult)highlightedResult
{
  return (SFSearchResult *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setLoadingView:(id)a3
{
}

- (BOOL)queryJustHasTopHits
{
  return self->_queryJustHasTopHits;
}

- (CGSize)oldContentSize
{
  objc_copyStruct(v4, &self->_oldContentSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOldContentSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_oldContentSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingViewTimer, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_highlightedResult, 0);
  objc_storeStrong((id *)&self->_searchThroughSection, 0);
  objc_storeStrong((id *)&self->_suggestionsSection, 0);
  objc_storeStrong((id *)&self->_resultSections, 0);
  objc_destroyWeak((id *)&self->_backgroundColorDelegate);
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_goTakeoverResult, 0);
  objc_storeStrong(&self->didFinishGettingAllResultsHandler, 0);
}

@end