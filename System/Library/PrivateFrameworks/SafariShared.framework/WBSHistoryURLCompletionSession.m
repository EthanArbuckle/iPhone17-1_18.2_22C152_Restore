@interface WBSHistoryURLCompletionSession
- (WBSHistoryURLCompletionSession)initWithHistoryService:(id)a3;
- (id)_databaseConnectionOptions;
- (id)_matchSnapshotForCompletionMatch:(id)a3;
- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5;
- (void)_ensureDatabaseIsWarmed;
- (void)_getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8;
- (void)enumerateMatchDataForTypedStringHint:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 options:(unint64_t)a5 withBlock:(id)a6;
- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8;
@end

@implementation WBSHistoryURLCompletionSession

- (WBSHistoryURLCompletionSession)initWithHistoryService:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryURLCompletionSession;
  v6 = [(WBSHistoryURLCompletionSession *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_historyService, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryURLCompletionSession", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)_matchSnapshotForCompletionMatch:(id)a3
{
  id v3 = a3;
  if ([v3 matchLocation] == 4)
  {
    v4 = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    v6 = [v3 originalURLString];
    v7 = objc_msgSend(v5, "safari_URLWithDataAsString:", v6);

    uint64_t matched = _SSURLCompletionMatchLocationForWBSURLCompletionMatchLocation([v3 matchLocation]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v3 data];
      v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v9 lastVisitedTimeInterval];
      v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = [v9 visitCount];
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      v11 = 0;
    }
    v13 = [WBSURLCompletionMatchSnapshot alloc];
    v14 = [v3 title];
    v4 = -[WBSURLCompletionMatchSnapshot initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:](v13, "initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:", v7, v14, matched, [v3 isTopHit], 0, 0, v12, v11);
  }
  return v4;
}

- (void)_getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8
{
  v14 = (void (**)(id, void *, void *, void))a8;
  urlCompletionDatabase = self->_urlCompletionDatabase;
  id v23 = 0;
  id v22 = 0;
  [(WBSURLCompletionDatabase *)urlCompletionDatabase getBestMatchesForTypedString:a3 filterResultsUsingProfileIdentifier:a4 topHits:&v23 matches:&v22 limit:a5 forQueryID:a6 withSearchParameters:a7];
  id v16 = v23;
  id v17 = v22;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke;
  v21[3] = &unk_1E5C9DAD8;
  v21[4] = self;
  v18 = objc_msgSend(v16, "safari_mapObjectsUsingBlock:", v21);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5C9DAD8;
  v20[4] = self;
  v19 = objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v20);
  v14[2](v14, v18, v19, 0);
}

id __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _matchSnapshotForCompletionMatch:a2];
  return v2;
}

id __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _matchSnapshotForCompletionMatch:a2];
  return v2;
}

- (id)_databaseConnectionOptions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)_ensureDatabaseIsWarmed
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  database = self->_database;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__WBSHistoryURLCompletionSession__ensureDatabaseIsWarmed__block_invoke;
  v6[3] = &unk_1E5C8D348;
  dispatch_semaphore_t v7 = v3;
  id v5 = v3;
  [(WBSHistoryServiceDatabase *)database ensureLatestVisitsAreComputed:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __57__WBSHistoryURLCompletionSession__ensureDatabaseIsWarmed__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = dispatch_group_create();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v18 = [MEMORY[0x1E4F29268] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke;
  block[3] = &unk_1E5C8E258;
  block[4] = self;
  id v38 = v18;
  v40 = v41;
  id v20 = v16;
  id v39 = v20;
  id v21 = v18;
  dispatch_group_async(v17, internalQueue, block);
  qos_class_t v22 = qos_class_self();
  id v23 = dispatch_get_global_queue(v22, 0);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_3;
  v29[3] = &unk_1E5C9DB28;
  v29[4] = self;
  id v30 = v13;
  unint64_t v35 = a5;
  int64_t v36 = a6;
  id v31 = v14;
  id v32 = v15;
  id v33 = v20;
  v34 = v41;
  id v24 = v20;
  id v25 = v15;
  id v26 = v14;
  id v27 = v13;
  dispatch_group_notify(v17, v23, v29);

  _Block_object_dispose(v41, 8);
}

void __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    [v2 _ensureDatabaseIsWarmed];
  }
  else
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v4 = *(void **)(a1 + 32);
    id v5 = (void *)v4[1];
    v6 = [v4 _databaseConnectionOptions];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2;
    id v13 = &unk_1E5C9DB00;
    uint64_t v17 = *(void *)(a1 + 56);
    dispatch_queue_t v8 = v3;
    id v14 = v8;
    id v9 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v9;
    [v5 connectWithOptions:v6 connection:v7 completionHandler:&v10];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsWarmed", v10, v11, v12, v13);
  }
}

void __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  if (!v10 || v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v7 = objc_alloc_init(WBSURLCompletionDatabase);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "setDataSource:");
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

uint64_t __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 72) + 8) + 24)) {
    return [*(id *)(result + 32) _getBestMatchesForTypedString:*(void *)(result + 40) filterResultsUsingProfileIdentifier:*(void *)(result + 48) limit:*(void *)(result + 80) forQueryID:*(void *)(result + 88) withSearchParameters:*(void *)(result + 56) completionHandler:*(void *)(result + 64)];
  }
  return result;
}

- (void)enumerateMatchDataForTypedStringHint:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 options:(unint64_t)a5 withBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryURLCompletionSession.enumerateMatchDataForTypedStringHint", 0);
  dispatch_group_t v12 = dispatch_group_create();
  id v13 = [(WBSHistoryServiceDatabase *)self->_database urlCompletion];
  id v14 = [MEMORY[0x1E4F1C9C8] date];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke;
  v20[3] = &unk_1E5C9DB50;
  uint64_t v17 = v12;
  id v21 = v17;
  v18 = v11;
  qos_class_t v22 = v18;
  id v19 = v10;
  id v23 = v19;
  [v13 searchForUserTypedString:v9 options:a5 currentTime:v17 enumerationGroup:v20 enumerationBlock:v16];

  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
}

void __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(NSObject **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2;
  v8[3] = &unk_1E5C8C660;
  id v6 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_group_async(v4, v5, v8);
}

uint64_t __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[WBSHistoryServiceURLCompletionMatchData alloc] initWithLastVisitWasFailure:0 visitWasFromThisDevice:0 visitWasClientError:0];
  id v9 = [[WBSHistoryServiceURLCompletionMatchEntry alloc] initWithURLString:v6 title:v7 topSitesScore:0 visitCountScore:0.0];
  v12[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(WBSHistoryServiceURLCompletionMatchData *)v8 setEntries:v10];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCompletionDatabase, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_historyService, 0);
}

@end