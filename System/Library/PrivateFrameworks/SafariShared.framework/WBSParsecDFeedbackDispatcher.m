@interface WBSParsecDFeedbackDispatcher
- (BOOL)_rankingFeedback:(id)a3 isShallowEqual:(id)a4;
- (WBSParsecDFeedbackDispatcher)initWithSession:(id)a3;
- (id)_customFeedbackOfType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)_takeStartSearchFeedbackForSearchOfType:(int64_t)a3 forQuery:(id)a4;
- (void)_postFeedbackOnFeedbackQueue:(id)a3 forQueryID:(int64_t)a4;
- (void)_postPendingVisibleResultsFeedbackEventsForQueryID:(int64_t)a3 queryString:(id)a4;
- (void)_setStartSearchFeedback:(id)a3 forSearchOfType:(int64_t)a4 withQuery:(id)a5;
- (void)dealloc;
- (void)didBeginSearchOfType:(int64_t)a3 withQuery:(id)a4 endpoint:(unint64_t)a5;
- (void)didBeginSearchOfType:(int64_t)a3 withQuery:(id)a4 urlString:(id)a5 headers:(id)a6 endpoint:(unint64_t)a7;
- (void)didDisplayCompletionListItems:(id)a3 forQuery:(id)a4 forEvent:(int64_t)a5;
- (void)didGenerateCompletionListItemsWithRankingObserver:(id)a3 forQueryID:(int64_t)a4;
- (void)didHideRepeatedlyIgnoredSiriSuggestedSiteWithFeedbackEvent:(id)a3;
- (void)didRankSections:(id)a3 blendingDuration:(double)a4 feedbackForHiddenAndDuplicateResults:(id)a5 forQueryID:(int64_t)a6 hiddenIgnoredSiriSuggestedSite:(id)a7;
- (void)didReceiveLocalResultsForQuery:(id)a3;
- (void)didReceiveParsecResultsAfterTimeout:(id)a3;
- (void)flush;
- (void)postFeedback:(id)a3 forQueryID:(int64_t)a4;
- (void)searchViewAppearedBecauseOfEvent:(unint64_t)a3 forQueryID:(int64_t)a4 usesLoweredSearchBar:(BOOL)a5;
- (void)searchViewAppearedBecauseOfEvent:(unint64_t)a3 isSafariReaderAvailable:(BOOL)a4 forQueryID:(int64_t)a5 usesLoweredSearchBar:(BOOL)a6;
- (void)searchViewDisappearedBecauseOfEvent:(int64_t)a3 forQueryID:(int64_t)a4;
- (void)sendClearInputFeedbackWithTriggerEvent:(unint64_t)a3 forQueryID:(int64_t)a4;
- (void)sendCrowdsourcedAutoFillFeedback:(id)a3 forQueryID:(int64_t)a4;
- (void)sendNewTabFeedback:(BOOL)a3;
- (void)triggeredExperimentWithTreatmentId:(id)a3 withQueryID:(int64_t)a4;
- (void)triggeredExperimentWithTreatmentId:(id)a3 withQueryID:(int64_t)a4 cfDiffered:(BOOL)a5 cfUsed:(BOOL)a6 cfError:(unint64_t)a7;
- (void)userDidEngageWithCompletionListItem:(id)a3 onActionButton:(BOOL)a4 method:(int64_t)a5;
- (void)userDidEngageWithCompletionListItem:(id)a3 onActionButton:(BOOL)a4 method:(int64_t)a5 doesMatchSiriSuggestion:(BOOL)a6 voiceSearchQueryID:(id)a7;
- (void)userDidTapMicKey:(int64_t)a3;
- (void)userDidTypeKey:(int64_t)a3;
- (void)userTypedGoToSearch:(id)a3 endpoint:(unint64_t)a4 triggerEvent:(int64_t)a5 forQueryID:(int64_t)a6;
- (void)userTypedURLDirectlyForQuery:(id)a3 triggerEvent:(int64_t)a4;
@end

@implementation WBSParsecDFeedbackDispatcher

uint64_t __56__WBSParsecDFeedbackDispatcher_postFeedback_forQueryID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postFeedbackOnFeedbackQueue:*(void *)(a1 + 40) forQueryID:*(void *)(a1 + 48)];
}

- (void)searchViewAppearedBecauseOfEvent:(unint64_t)a3 forQueryID:(int64_t)a4 usesLoweredSearchBar:(BOOL)a5
{
}

- (WBSParsecDFeedbackDispatcher)initWithSession:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WBSParsecDFeedbackDispatcher;
  v5 = [(WBSParsecDFeedbackDispatcher *)&v22 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    v7 = v6;
    if (v4) {
      [(NSArray *)v6 addObject:v4];
    }
    feedbackListeners = v5->_feedbackListeners;
    v5->_feedbackListeners = v7;
    v9 = v7;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    visibleResultsFeedbackEventsToBeSent = v5->_visibleResultsFeedbackEventsToBeSent;
    v5->_visibleResultsFeedbackEventsToBeSent = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    previousRankingFeedbackEventsSentForCurrentQueryID = v5->_previousRankingFeedbackEventsSentForCurrentQueryID;
    v5->_previousRankingFeedbackEventsSentForCurrentQueryID = (NSMutableArray *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDFeedbackDispatcher", v14);
    feedbackQueue = v5->_feedbackQueue;
    v5->_feedbackQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDFeedbackDispatcher", v17);
    queriesToDictionariesMappingQueue = v5->_queriesToDictionariesMappingQueue;
    v5->_queriesToDictionariesMappingQueue = (OS_dispatch_queue *)v18;

    v20 = v5;
  }

  return v5;
}

- (void)searchViewAppearedBecauseOfEvent:(unint64_t)a3 isSafariReaderAvailable:(BOOL)a4 forQueryID:(int64_t)a5 usesLoweredSearchBar:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F9A3D0]) initWithEvent:a3];
  [v10 setReaderTextAvailable:v8];
  if (objc_opt_respondsToSelector()) {
    [v10 setIsUsingLoweredSearchBar:v6];
  }
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v10 forQueryID:a5];
}

- (void)postFeedback:(id)a3 forQueryID:(int64_t)a4
{
  id v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Posting feedback to parsecd", buf, 2u);
  }
  BOOL v8 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:]((uint64_t)v6, v8);
    if (!v6) {
      goto LABEL_7;
    }
  }
  else if (!v6)
  {
    goto LABEL_7;
  }
  if (WBSParsecGlobalFeedbackIsEnabled())
  {
    feedbackQueue = self->_feedbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__WBSParsecDFeedbackDispatcher_postFeedback_forQueryID___block_invoke;
    block[3] = &unk_1E5C9F3C0;
    block[4] = self;
    id v11 = v6;
    int64_t v12 = a4;
    dispatch_async(feedbackQueue, block);
  }
LABEL_7:
}

- (void)_postFeedbackOnFeedbackQueue:(id)a3 forQueryID:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = self->_feedbackListeners;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "reportFeedback:queryId:", v6, a4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)dealloc
{
  if ([(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer isValid]) {
    [(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer fire];
  }
  [(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer invalidate];
  sendPendingVisibleResultsFeedbackFeedbackEventsTimer = self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer;
  self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)WBSParsecDFeedbackDispatcher;
  [(WBSParsecDFeedbackDispatcher *)&v4 dealloc];
}

- (void)flush
{
}

- (void)didDisplayCompletionListItems:(id)a3 forQuery:(id)a4 forEvent:(int64_t)a5
{
  id v9 = a4;
  uint64_t v10 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_6);
  id v11 = objc_alloc(MEMORY[0x1E4F9A540]);
  if ((unint64_t)(a5 - 1) > 2) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = qword_1A6D5F150[a5 - 1];
  }
  long long v13 = (void *)[v11 initWithResults:v10 triggerEvent:v12];
  uint64_t v14 = [v9 queryID];
  long long v15 = self->_previousQueryForVisibleResultsFeedback;
  objc_storeStrong((id *)&self->_currentQueryForVisibleResultsFeedback, a4);
  [(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer invalidate];
  if (v14 != [(WBSCompletionQuery *)v15 queryID])
  {
    objc_storeStrong((id *)&self->_previousQueryForVisibleResultsFeedback, a4);
    if ([(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count])
    {
      uint64_t v16 = [(WBSCompletionQuery *)v15 queryID];
      uint64_t v17 = [(WBSCompletionQuery *)v15 queryString];
      [(WBSParsecDFeedbackDispatcher *)self _postPendingVisibleResultsFeedbackEventsForQueryID:v16 queryString:v17];
    }
  }
  [(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent addObject:v13];
  dispatch_queue_t v18 = (void *)MEMORY[0x1E4F1CB00];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__WBSParsecDFeedbackDispatcher_didDisplayCompletionListItems_forQuery_forEvent___block_invoke_2;
  v22[3] = &unk_1E5C9F8F8;
  id v23 = v9;
  uint64_t v24 = v14;
  v22[4] = self;
  id v19 = v9;
  v20 = [v18 scheduledTimerWithTimeInterval:0 repeats:v22 block:0.5];
  sendPendingVisibleResultsFeedbackFeedbackEventsTimer = self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer;
  self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer = v20;
}

uint64_t __80__WBSParsecDFeedbackDispatcher_didDisplayCompletionListItems_forQuery_forEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sfSearchResultValue];
}

void __80__WBSParsecDFeedbackDispatcher_didDisplayCompletionListItems_forQuery_forEvent___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) queryString];
    [v3 _postPendingVisibleResultsFeedbackEventsForQueryID:v2 queryString:v4];
  }
}

- (void)_postPendingVisibleResultsFeedbackEventsForQueryID:(int64_t)a3 queryString:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3, a4);
  if ([(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent objectAtIndexedSubscript:v7];
      id v9 = [v8 results];
      [v6 addObjectsFromArray:v9];

      if (v7 == [(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count] - 1)
      {
        uint64_t v10 = [v6 allObjects];
        [v8 setResults:v10];
      }
      else
      {
        [v8 setResults:0];
      }
      feedbackQueue = self->_feedbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__WBSParsecDFeedbackDispatcher__postPendingVisibleResultsFeedbackEventsForQueryID_queryString___block_invoke;
      block[3] = &unk_1E5C9F3C0;
      block[4] = self;
      id v14 = v8;
      int64_t v15 = a3;
      id v12 = v8;
      dispatch_async(feedbackQueue, block);

      ++v7;
    }
    while (v7 < [(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count]);
  }
  [(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent removeAllObjects];
}

uint64_t __95__WBSParsecDFeedbackDispatcher__postPendingVisibleResultsFeedbackEventsForQueryID_queryString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postFeedbackOnFeedbackQueue:*(void *)(a1 + 40) forQueryID:*(void *)(a1 + 48)];
}

- (void)userDidEngageWithCompletionListItem:(id)a3 onActionButton:(BOOL)a4 method:(int64_t)a5
{
}

- (void)userDidEngageWithCompletionListItem:(id)a3 onActionButton:(BOOL)a4 method:(int64_t)a5 doesMatchSiriSuggestion:(BOOL)a6 voiceSearchQueryID:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v28 = a3;
  id v12 = a7;
  long long v13 = [v28 sfSearchResultValue];
  id v14 = (void *)[v13 copy];

  if (v14)
  {
    if (objc_opt_respondsToSelector())
    {
      int64_t v15 = [v14 title];

      if (!v15)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F9A4C0];
        uint64_t v17 = [v28 siriSuggestion];
        dispatch_queue_t v18 = [v17 title];
        id v19 = [v16 textWithString:v18];
        [v14 setTitle:v19];
      }
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = [v28 engagementDestination];
    }
    else {
      uint64_t v20 = 3;
    }
    uint64_t v21 = 1;
    if (a5 != 1) {
      uint64_t v21 = 2;
    }
    if (a5 == 2) {
      uint64_t v22 = 20;
    }
    else {
      uint64_t v22 = v21;
    }
    id v23 = (void *)[objc_alloc(MEMORY[0x1E4F9A340]) initWithResult:v14 triggerEvent:v22 destination:v20];
    uint64_t v24 = v23;
    if (v10) {
      [v23 setActionTarget:4];
    }
    if (objc_opt_respondsToSelector()) {
      [v24 setMatchesUnengagedSuggestion:v8];
    }
    int64_t v25 = [(WBSCompletionQuery *)self->_currentQueryForVisibleResultsFeedback queryID];
    if (a5 == 2) {
      int64_t v26 = (int)[v12 intValue];
    }
    else {
      int64_t v26 = v25;
    }
    if ([(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count])
    {
      [(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer invalidate];
      v27 = [(WBSCompletionQuery *)self->_currentQueryForVisibleResultsFeedback queryString];
      [(WBSParsecDFeedbackDispatcher *)self _postPendingVisibleResultsFeedbackEventsForQueryID:v26 queryString:v27];
    }
    [(WBSParsecDFeedbackDispatcher *)self postFeedback:v24 forQueryID:v26];
  }
}

- (void)userTypedURLDirectlyForQuery:(id)a3 triggerEvent:(int64_t)a4
{
  id v11 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F9A050]);
  unint64_t v7 = [v11 queryString];
  BOOL v8 = (void *)[v6 initWithInput:v7];

  if (a4 == 1) {
    [v8 setTriggerEvent:20];
  }
  uint64_t v9 = [v11 queryID];
  if ([(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count])
  {
    [(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer invalidate];
    BOOL v10 = [v11 queryString];
    [(WBSParsecDFeedbackDispatcher *)self _postPendingVisibleResultsFeedbackEventsForQueryID:v9 queryString:v10];
  }
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v8, [v11 queryID]);
}

- (void)userTypedGoToSearch:(id)a3 endpoint:(unint64_t)a4 triggerEvent:(int64_t)a5 forQueryID:(int64_t)a6
{
  BOOL v10 = (objc_class *)MEMORY[0x1E4F9A048];
  id v11 = a3;
  id v13 = (id)[[v10 alloc] initWithInput:v11 endpoint:a4];

  if (a5 == 1) {
    [v13 setTriggerEvent:20];
  }
  if ([(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count])
  {
    [(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer invalidate];
    id v12 = [(WBSCompletionQuery *)self->_currentQueryForVisibleResultsFeedback queryString];
    [(WBSParsecDFeedbackDispatcher *)self _postPendingVisibleResultsFeedbackEventsForQueryID:a6 queryString:v12];
  }
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v13 forQueryID:a6];
}

- (void)didReceiveLocalResultsForQuery:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WBSParsecDFeedbackDispatcher *)self _takeStartSearchFeedbackForSearchOfType:1 forQuery:v4];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F9A078]) initWithStartSearch:v5];
    if (v6)
    {
      unint64_t v7 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 134218240;
        BOOL v10 = v6;
        __int16 v11 = 2048;
        id v12 = v5;
        _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Sending bookmarks/history search end feedback to parsecd: %p (paired with search start feedback: %p)", (uint8_t *)&v9, 0x16u);
      }
      BOOL v8 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[WBSParsecDFeedbackDispatcher didReceiveLocalResultsForQuery:]();
      }
      -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v6, [v4 queryID]);
    }
  }
}

- (void)didBeginSearchOfType:(int64_t)a3 withQuery:(id)a4 endpoint:(unint64_t)a5
{
}

- (void)didBeginSearchOfType:(int64_t)a3 withQuery:(id)a4 urlString:(id)a5 headers:(id)a6 endpoint:(unint64_t)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v12 triggerEvent];
  if (a3 == 1)
  {
    if ([MEMORY[0x1E4F97EA0] defaultSearchEngineMatchesExperiment])
    {
      uint64_t v20 = NSNumber;
      uint64_t v21 = +[WBSTrialManager shared];
      uint64_t v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "trialABGroupIdentifier"));
      uint64_t v17 = [v22 stringValue];
    }
    else
    {
      uint64_t v17 = 0;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F9A450]);
    uint64_t v24 = [v12 queryString];
    dispatch_queue_t v18 = objc_msgSend(v23, "initWithInput:triggerEvent:searchType:indexType:queryId:originatingApp:", v24, v15, 2, 5, objc_msgSend(v12, "queryID"), v17);

    id v19 = @"bookmarks/history";
  }
  else
  {
    if (a3) {
      goto LABEL_14;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F9A458]);
    uint64_t v17 = [v12 queryString];
    dispatch_queue_t v18 = objc_msgSend(v16, "initWithInput:url:headers:triggerEvent:endpoint:queryId:", v17, v13, v14, v15, a7, objc_msgSend(v12, "queryID"));
    id v19 = @"search engine";
  }

  if (v18)
  {
    [(WBSParsecDFeedbackDispatcher *)self _setStartSearchFeedback:v18 forSearchOfType:a3 withQuery:v12];
    int64_t v25 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v27 = 138543362;
      id v28 = v19;
      _os_log_impl(&dword_1A6B5F000, v25, OS_LOG_TYPE_INFO, "Sending %{public}@ search start feedback to parsecd.", (uint8_t *)&v27, 0xCu);
    }
    int64_t v26 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[WBSParsecDFeedbackDispatcher didBeginSearchOfType:withQuery:urlString:headers:endpoint:]();
    }
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v18, [v12 queryID]);
  }
LABEL_14:
}

- (void)didGenerateCompletionListItemsWithRankingObserver:(id)a3 forQueryID:(int64_t)a4
{
  id v6 = [a3 rankingFeedback];
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v6 forQueryID:a4];
}

- (void)didRankSections:(id)a3 blendingDuration:(double)a4 feedbackForHiddenAndDuplicateResults:(id)a5 forQueryID:(int64_t)a6 hiddenIgnoredSiriSuggestedSite:(id)a7
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if ([v12 count])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke;
    v33[3] = &unk_1E5C9F948;
    id v28 = v15;
    id v34 = v28;
    id v35 = v13;
    id v16 = objc_msgSend(v12, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v33);
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F9A318]) initWithSections:v16 blendingDuration:a4];
    char v18 = objc_opt_respondsToSelector();
    if (v14 && (v18 & 1) != 0)
    {
      v37[0] = v14;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      [v17 setHiddenResults:v19];
    }
    if (self->_previousQueryIDForRankedResultsFeedback != a6)
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      previousRankingFeedbackEventsSentForCurrentQueryID = self->_previousRankingFeedbackEventsSentForCurrentQueryID;
      self->_previousRankingFeedbackEventsSentForCurrentQueryID = v20;

      self->_previousQueryIDForRankedResultsFeedback = a6;
    }
    int64_t v27 = a6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v22 = self->_previousRankingFeedbackEventsSentForCurrentQueryID;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      while (2)
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          if (-[WBSParsecDFeedbackDispatcher _rankingFeedback:isShallowEqual:](self, "_rankingFeedback:isShallowEqual:", v17, *(void *)(*((void *)&v29 + 1) + 8 * v26), v27, v28, (void)v29))
          {

            goto LABEL_17;
          }
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v36 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    [(NSMutableArray *)self->_previousRankingFeedbackEventsSentForCurrentQueryID addObject:v17];
    [(WBSParsecDFeedbackDispatcher *)self postFeedback:v17 forQueryID:v27];
LABEL_17:
  }
}

id __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 results];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke_2;
  id v13 = &unk_1E5C9F920;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  unint64_t v7 = objc_msgSend(v6, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, &v10);
  objc_msgSend(v5, "setResults:", 0, v10, v11, v12, v13);
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F9A3F0]) initWithResults:v7 section:v5 localSectionPosition:a3 personalizationScore:0.0];

  return v8;
}

id __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    id v6 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
    unint64_t v7 = [v5 identifier];

    if (!v7
      || (BOOL v8 = *(void **)(a1 + 40),
          [v5 identifier],
          int v9 = objc_claimAutoreleasedReturnValue(),
          [v8 objectForKeyedSubscript:v9],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v6))
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F9A360]) initWithResult:v5 hiddenResults:0 duplicateResults:0 localResultPosition:a3];
    }
  }

  return v6;
}

- (BOOL)_rankingFeedback:(id)a3 isShallowEqual:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 queryId];
  v54 = v6;
  if (v7 != [v6 queryId]) {
    goto LABEL_4;
  }
  BOOL v8 = [v5 sections];
  if ([v8 count])
  {
    int v9 = [v5 sections];
    uint64_t v10 = [v9 count];
    uint64_t v11 = [v54 sections];
    uint64_t v12 = [v11 count];

    if (v10 != v12) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  id v15 = [v5 sections];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    BOOL v13 = 1;
    goto LABEL_5;
  }
  unint64_t v17 = 0;
  id v53 = v5;
  while (1)
  {
    v61 = [v5 sections];
    char v18 = [v61 objectAtIndexedSubscript:v17];
    id v19 = [v18 section];
    uint64_t v20 = [v19 identifier];
    uint64_t v21 = [v54 sections];
    uint64_t v22 = [v21 objectAtIndexedSubscript:v17];
    uint64_t v23 = [v22 section];
    uint64_t v24 = [v23 identifier];
    int v25 = [v20 isEqualToString:v24];

    if (!v25) {
      break;
    }
    uint64_t v26 = [v5 sections];
    int64_t v27 = [v26 objectAtIndexedSubscript:v17];
    id v28 = [v27 results];
    if ([v28 count])
    {
      v59 = [v5 sections];
      long long v29 = [v59 objectAtIndexedSubscript:v17];
      long long v30 = [v29 results];
      uint64_t v62 = [v30 count];
      long long v31 = [v54 sections];
      long long v32 = [v31 objectAtIndexedSubscript:v17];
      v33 = [v32 results];
      uint64_t v57 = [v33 count];

      if (v62 != v57) {
        break;
      }
    }
    else
    {
    }
    unint64_t v34 = 0;
    while (1)
    {
      id v35 = [v5 sections];
      v36 = [v35 objectAtIndexedSubscript:v17];
      v37 = [v36 results];
      unint64_t v38 = [v37 count];

      if (v34 >= v38) {
        break;
      }
      v63 = [v5 sections];
      v60 = [v63 objectAtIndexedSubscript:v17];
      v58 = [v60 results];
      v56 = [v58 objectAtIndexedSubscript:v34];
      v39 = [v56 result];
      v40 = [v39 identifier];
      v41 = [v54 sections];
      v42 = [v41 objectAtIndexedSubscript:v17];
      [v42 results];
      v44 = unint64_t v43 = v17;
      v45 = [v44 objectAtIndexedSubscript:v34];
      v46 = [v45 result];
      v47 = [v46 identifier];
      char v55 = [v40 isEqualToString:v47];

      unint64_t v17 = v43;
      id v5 = v53;

      ++v34;
      if ((v55 & 1) == 0) {
        goto LABEL_4;
      }
    }
    unint64_t v48 = v17 + 1;
    [v5 sections];
    v50 = id v49 = v5;
    unint64_t v51 = [v50 count];

    id v5 = v49;
    BOOL v13 = 1;
    BOOL v52 = v48 >= v51;
    unint64_t v17 = v48;
    if (v52) {
      goto LABEL_5;
    }
  }
LABEL_4:
  BOOL v13 = 0;
LABEL_5:

  return v13;
}

- (void)didReceiveParsecResultsAfterTimeout:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_41);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F9A370]) initWithResults:v4];
    id v6 = [v7 firstObject];
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v5, [v6 parsecQueryID]);
  }
}

uint64_t __68__WBSParsecDFeedbackDispatcher_didReceiveParsecResultsAfterTimeout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sfSearchResultValue];
}

- (void)didHideRepeatedlyIgnoredSiriSuggestedSiteWithFeedbackEvent:(id)a3
{
  id v4 = a3;
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v4, [v4 queryId]);
}

- (id)_customFeedbackOfType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v10 = 0;
  id v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a4 options:0 error:&v10];
  id v6 = v10;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F9A028]) initWithType:a3 data:v5];
  }
  else
  {
    BOOL v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSParsecDFeedbackDispatcher _customFeedbackOfType:JSONDictionary:](v8, v6, a3);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)sendCrowdsourcedAutoFillFeedback:(id)a3 forQueryID:(int64_t)a4
{
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[WBSParsecDFeedbackDispatcher sendCrowdsourcedAutoFillFeedback:forQueryID:]((uint64_t)v6, v7);
  }
  BOOL v8 = [(WBSParsecDFeedbackDispatcher *)self _customFeedbackOfType:1 JSONDictionary:v6];
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v8 forQueryID:a4];
}

- (void)sendNewTabFeedback:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WBSParsecDFeedbackDispatcher sendNewTabFeedback:](v5);
  }
  [(WBSParsecDFeedbackDispatcher *)self searchViewAppearedBecauseOfEvent:8 forQueryID:+[WBSCompletionQuery currentQueryID] usesLoweredSearchBar:v3];
}

- (void)sendClearInputFeedbackWithTriggerEvent:(unint64_t)a3 forQueryID:(int64_t)a4
{
  id v7 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[WBSParsecDFeedbackDispatcher sendClearInputFeedbackWithTriggerEvent:forQueryID:](v7);
  }
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F99F50]) initWithEvent:a3];
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v8 forQueryID:a4];
}

- (void)triggeredExperimentWithTreatmentId:(id)a3 withQueryID:(int64_t)a4 cfDiffered:(BOOL)a5 cfUsed:(BOOL)a6 cfError:(unint64_t)a7
{
  if (a3)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F9A0A8]) initWithCfDiffered:a5 cfUsed:a6 cfError:a7];
    [(WBSParsecDFeedbackDispatcher *)self postFeedback:v9 forQueryID:a4];
  }
}

- (void)triggeredExperimentWithTreatmentId:(id)a3 withQueryID:(int64_t)a4
{
  if (a3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F9A0A8]);
    [(WBSParsecDFeedbackDispatcher *)self postFeedback:v6 forQueryID:a4];
  }
}

- (void)_setStartSearchFeedback:(id)a3 forSearchOfType:(int64_t)a4 withQuery:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queriesToDictionariesMappingQueue = self->_queriesToDictionariesMappingQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__WBSParsecDFeedbackDispatcher__setStartSearchFeedback_forSearchOfType_withQuery___block_invoke;
  v13[3] = &unk_1E5C9C538;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queriesToDictionariesMappingQueue, v13);
}

void __82__WBSParsecDFeedbackDispatcher__setStartSearchFeedback_forSearchOfType_withQuery___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 8);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v2 = *(void **)(a1[4] + 8);
  }
  id v6 = [v2 objectForKey:a1[5]];

  if (!v6)
  {
    id v7 = *(void **)(a1[4] + 8);
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:v8 forKey:a1[5]];
  }
  uint64_t v9 = a1[6];
  id v11 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  id v10 = [NSNumber numberWithInteger:a1[7]];
  [v11 setObject:v9 forKeyedSubscript:v10];
}

- (id)_takeStartSearchFeedbackForSearchOfType:(int64_t)a3 forQuery:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__33;
  uint64_t v21 = __Block_byref_object_dispose__33;
  id v22 = 0;
  id v7 = [NSNumber numberWithInteger:a3];
  queriesToDictionariesMappingQueue = self->_queriesToDictionariesMappingQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__WBSParsecDFeedbackDispatcher__takeStartSearchFeedbackForSearchOfType_forQuery___block_invoke;
  v13[3] = &unk_1E5C9F990;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  int64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queriesToDictionariesMappingQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __81__WBSParsecDFeedbackDispatcher__takeStartSearchFeedbackForSearchOfType_forQuery___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v2 = [v5 objectForKeyedSubscript:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [v5 removeObjectForKey:a1[6]];
}

- (void)searchViewDisappearedBecauseOfEvent:(int64_t)a3 forQueryID:(int64_t)a4
{
  if ([(NSMutableArray *)self->_visibleResultsFeedbackEventsToBeSent count])
  {
    [(NSTimer *)self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer invalidate];
    int64_t v7 = [(WBSCompletionQuery *)self->_currentQueryForVisibleResultsFeedback queryID];
    id v8 = [(WBSCompletionQuery *)self->_currentQueryForVisibleResultsFeedback queryString];
    [(WBSParsecDFeedbackDispatcher *)self _postPendingVisibleResultsFeedbackEventsForQueryID:v7 queryString:v8];
  }
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F9A3D8]) initWithEvent:a3];
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v9 forQueryID:a4];
}

- (void)userDidTypeKey:(int64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F99F60]) initWithEvent:@"com.apple.safari.keystroke" timeInterval:0 queryId:a3];
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v5 forQueryID:a3];
}

- (void)userDidTapMicKey:(int64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F99F60]) initWithEvent:@"com.apple.safari.mictap" timeInterval:0 queryId:a3];
  [(WBSParsecDFeedbackDispatcher *)self postFeedback:v5 forQueryID:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRankingFeedbackEventsSentForCurrentQueryID, 0);
  objc_storeStrong((id *)&self->_visibleResultsFeedbackEventsToBeSent, 0);
  objc_storeStrong((id *)&self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, 0);
  objc_storeStrong((id *)&self->_currentQueryForVisibleResultsFeedback, 0);
  objc_storeStrong((id *)&self->_previousQueryForVisibleResultsFeedback, 0);
  objc_storeStrong((id *)&self->_feedbackListeners, 0);
  objc_storeStrong((id *)&self->_queriesToDictionariesMappingQueue, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_queriesToDictionariesFromSearchTypesToStartSearchFeedbacks, 0);
}

- (void)postFeedback:(uint64_t)a1 forQueryID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Posting feedback to parsecd: %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)didReceiveLocalResultsForQuery:.cold.1()
{
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "Sending bookmarks/history search end feedback to parsecd: %{private}@ (paired with search start feedback: %{private}@)");
}

- (void)didBeginSearchOfType:withQuery:urlString:headers:endpoint:.cold.1()
{
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "Sending %{public}@ search start feedback to parsecd: %{private}@");
}

- (void)_customFeedbackOfType:(uint64_t)a3 JSONDictionary:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v7 = 134218242;
  uint64_t v8 = a3;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to serialize feedback of type %lu with error %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)sendCrowdsourcedAutoFillFeedback:(uint64_t)a1 forQueryID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Sending AutoFill feedback: %@", (uint8_t *)&v2, 0xCu);
}

- (void)sendNewTabFeedback:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Sending new tab feedback to parsecd", v1, 2u);
}

- (void)sendClearInputFeedbackWithTriggerEvent:(os_log_t)log forQueryID:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Sending input field cleared feedback to parsecd", v1, 2u);
}

@end