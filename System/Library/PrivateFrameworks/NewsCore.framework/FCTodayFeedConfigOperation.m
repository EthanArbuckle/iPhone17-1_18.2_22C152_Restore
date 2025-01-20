@interface FCTodayFeedConfigOperation
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicy;
- (FCContentContext)context;
- (FCNetworkActivity)networkActivity;
- (FCNetworkActivity)parentNetworkActivity;
- (FCNewsAppConfiguration)appConfig;
- (FCTodayFeedConfigOperation)initWithContext:(id)a3 appConfig:(id)a4 request:(id)a5;
- (FCTodayFeedConfigRequest)request;
- (NFUnfairLock)completionLock;
- (NSData)resultCKConfigData;
- (NSData)resultNewsEdgeConfigData;
- (NSDictionary)resultCKRecordsByType;
- (id)_fetchFromCK;
- (id)_fetchFromNewsEdge;
- (id)fetchCompletionHandler;
- (id)reusableCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachePolicy:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setNetworkActivity:(id)a3;
- (void)setParentNetworkActivity:(id)a3;
- (void)setResultCKConfigData:(id)a3;
- (void)setResultCKRecordsByType:(id)a3;
- (void)setResultNewsEdgeConfigData:(id)a3;
- (void)setReusableCompletionHandler:(id)a3;
@end

@implementation FCTodayFeedConfigOperation

- (FCTodayFeedConfigOperation)initWithContext:(id)a3 appConfig:(id)a4 request:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCTodayFeedConfigOperation;
  v12 = [(FCOperation *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_appConfig, a4);
    uint64_t v14 = [v11 copy];
    request = v13->_request;
    v13->_request = (FCTodayFeedConfigRequest *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    completionLock = v13->_completionLock;
    v13->_completionLock = (NFUnfairLock *)v16;
  }
  return v13;
}

- (id)fetchCompletionHandler
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__32;
  id v11 = __Block_byref_object_dispose__32;
  id v12 = 0;
  v3 = [(FCTodayFeedConfigOperation *)self completionLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__FCTodayFeedConfigOperation_fetchCompletionHandler__block_invoke;
  v6[3] = &unk_1E5B4C258;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithLockSync:v6];

  v4 = _Block_copy((const void *)v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __52__FCTodayFeedConfigOperation_fetchCompletionHandler__block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 368));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setFetchCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(FCTodayFeedConfigOperation *)self completionLock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__FCTodayFeedConfigOperation_setFetchCompletionHandler___block_invoke;
  v8[3] = &unk_1E5B550D8;
  v8[4] = self;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 performWithLockSync:v8];

  if (*((unsigned char *)v12 + 24))
  {
    uint64_t v7 = [(FCTodayFeedConfigOperation *)self reusableCompletionHandler];
    ((void (**)(void, id))v7)[2](v7, v6);
  }
  _Block_object_dispose(&v11, 8);
}

void __56__FCTodayFeedConfigOperation_setFetchCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) reusableCompletionHandler];

  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = _Block_copy(*(const void **)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 368);
    *(void *)(v4 + 368) = v3;
    MEMORY[0x1F41817F8](v3, v5);
  }
}

- (BOOL)validateOperation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FCTodayFeedConfigOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)[[NSString alloc] initWithFormat:@"Today feed config operation must have a context"];
    int v12 = 136315906;
    uint64_t v13 = "-[FCTodayFeedConfigOperation validateOperation]";
    __int16 v14 = 2080;
    v15 = "FCTodayFeedConfigOperation.m";
    __int16 v16 = 1024;
    int v17 = 127;
    __int16 v18 = 2114;
    objc_super v19 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  uint64_t v4 = [(FCTodayFeedConfigOperation *)self appConfig];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = (void *)[[NSString alloc] initWithFormat:@"Today feed config operation must have an app config"];
    int v12 = 136315906;
    uint64_t v13 = "-[FCTodayFeedConfigOperation validateOperation]";
    __int16 v14 = 2080;
    v15 = "FCTodayFeedConfigOperation.m";
    __int16 v16 = 1024;
    int v17 = 131;
    __int16 v18 = 2114;
    objc_super v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  uint64_t v5 = [(FCTodayFeedConfigOperation *)self request];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"Today feed config operation must have a request"];
    int v12 = 136315906;
    uint64_t v13 = "-[FCTodayFeedConfigOperation validateOperation]";
    __int16 v14 = 2080;
    v15 = "FCTodayFeedConfigOperation.m";
    __int16 v16 = 1024;
    int v17 = 135;
    __int16 v18 = 2114;
    objc_super v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  uint64_t v3 = [(FCTodayFeedConfigOperation *)self parentNetworkActivity];

  if (v3)
  {
    uint64_t v4 = +[FCNetworkActivity activityWithLabel:2];
    uint64_t v5 = [(FCTodayFeedConfigOperation *)self parentNetworkActivity];
    [v4 setParentActivity:v5];

    [v4 startActivity];
    [(FCTodayFeedConfigOperation *)self setNetworkActivity:v4];
  }
  BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [(FCTodayFeedConfigOperation *)self _fetchFromCK];
  v8 = zalgo();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke;
  v26[3] = &unk_1E5B4BE70;
  v26[4] = self;
  id v27 = v6;
  id v9 = v6;
  id v10 = (id)[v7 alwaysOn:v8 always:v26];

  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  int v12 = [(FCTodayFeedConfigOperation *)self _fetchFromNewsEdge];
  uint64_t v13 = zalgo();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_12;
  v24[3] = &unk_1E5B4BE70;
  v24[4] = self;
  id v25 = v11;
  id v14 = v11;
  id v15 = (id)[v12 alwaysOn:v13 always:v24];

  __int16 v16 = zalgo();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_13;
  v22[3] = &unk_1E5B55128;
  v22[4] = self;
  id v23 = v12;
  id v17 = v12;
  id v18 = (id)[v7 thenOn:v16 then:v22];

  objc_super v19 = zalgo();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_19;
  v21[3] = &unk_1E5B4FD28;
  v21[4] = self;
  id v20 = (id)[v7 errorOn:v19 error:v21];
}

void __46__FCTodayFeedConfigOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    objc_msgSend(*(id *)(a1 + 40), "fc_timeIntervalUntilNow");
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    unint64_t v10 = (unint64_t)(fmax(v6, 0.0) * 1000.0);
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums fetching config from CK", (uint8_t *)&v7, 0x16u);
  }
}

void __46__FCTodayFeedConfigOperation_performOperation__block_invoke_12(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    objc_msgSend(*(id *)(a1 + 40), "fc_timeIntervalUntilNow");
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    unint64_t v10 = (unint64_t)(fmax(v6, 0.0) * 1000.0);
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums fetching config from News Edge", (uint8_t *)&v7, 0x16u);
  }
}

id __46__FCTodayFeedConfigOperation_performOperation__block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordsByType];
  [*(id *)(a1 + 32) setResultCKRecordsByType:v4];

  uint64_t v5 = [v3 configData];

  [*(id *)(a1 + 32) setResultCKConfigData:v5];
  double v6 = [*(id *)(a1 + 32) appConfig];
  [v6 todayFeedConfigEndpointTimeoutAfterCK];
  uint64_t v8 = v7;

  __int16 v9 = (void *)MEMORY[0x1E4F81BF0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_2;
  v18[3] = &unk_1E5B51D58;
  id v19 = *(id *)(a1 + 40);
  uint64_t v20 = v8;
  unint64_t v10 = [v9 firstly:v18];
  uint64_t v11 = zalgo();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_3;
  v17[3] = &unk_1E5B55100;
  v17[4] = *(void *)(a1 + 32);
  int v12 = [v10 thenOn:v11 then:v17];
  uint64_t v13 = zalgo();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_4;
  v16[3] = &unk_1E5B4FD28;
  v16[4] = *(void *)(a1 + 32);
  id v14 = [v12 errorOn:v13 error:v16];

  return v14;
}

uint64_t __46__FCTodayFeedConfigOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) timeoutAfter:*(double *)(a1 + 40)];
}

id __46__FCTodayFeedConfigOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setResultNewsEdgeConfigData:v3];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  return v3;
}

void __46__FCTodayFeedConfigOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  if (![v4 isEqualToString:*MEMORY[0x1E4F81C28]]) {
    goto LABEL_5;
  }
  uint64_t v5 = [v3 code];
  uint64_t v6 = *MEMORY[0x1E4F81C30];

  if (v5 == v6)
  {
    uint64_t v7 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v4 = v7;
      __int16 v9 = [v8 shortOperationDescription];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ timed out waiting for config from News Edge, falling back to CK", (uint8_t *)&v10, 0xCu);

LABEL_5:
    }
  }
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

uint64_t __46__FCTodayFeedConfigOperation_performOperation__block_invoke_19(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [FCTodayFeedConfigResponse alloc];
    uint64_t v7 = [(FCTodayFeedConfigOperation *)self resultCKConfigData];
    uint64_t v8 = [(FCTodayFeedConfigOperation *)self resultCKRecordsByType];
    __int16 v9 = [(FCTodayFeedConfigOperation *)self resultNewsEdgeConfigData];
    uint64_t v5 = [(FCTodayFeedConfigResponse *)v6 initWithCKConfigData:v7 ckRecordsByType:v8 newsEdgeConfigData:v9];
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__32;
  v29 = __Block_byref_object_dispose__32;
  id v30 = 0;
  int v10 = [(FCTodayFeedConfigOperation *)self completionLock];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke;
  uint64_t v20 = &unk_1E5B4F360;
  v21 = self;
  uint64_t v11 = v5;
  v22 = v11;
  id v12 = v4;
  id v23 = v12;
  v24 = &v25;
  [v10 performWithLockSync:&v17];

  uint64_t v13 = [(FCTodayFeedConfigOperation *)self networkActivity];

  if (v13)
  {
    id v14 = [(FCTodayFeedConfigOperation *)self networkActivity];
    [v14 completeActivityWithSuccess:v4 == 0];

    id v15 = [(FCTodayFeedConfigOperation *)self parentNetworkActivity];
    [v15 completeActivityWithSuccess:v4 == 0];
  }
  __int16 v16 = [(FCTodayFeedConfigOperation *)self reusableCompletionHandler];
  v16[2](v16, v26[5]);

  _Block_object_dispose(&v25, 8);
}

void __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke_2;
  v7[3] = &unk_1E5B55150;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [*(id *)(a1 + 32) setReusableCompletionHandler:v7];
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 368));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = 0;
}

uint64_t __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(result + 32), *(void *)(result + 40));
  }
  return result;
}

- (id)_fetchFromCK
{
  id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke;
  v6[3] = &unk_1E5B4EEF0;
  v6[4] = self;
  id v4 = (void *)[v3 initWithResolver:v6];
  return v4;
}

void __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v37[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(FCRecordChainFetchOperation);
  id v8 = [*(id *)(a1 + 32) context];
  [(FCRecordChainFetchOperation *)v7 setContext:v8];

  id v9 = [*(id *)(a1 + 32) cachePolicy];
  [(FCRecordChainFetchOperation *)v7 setCachePolicy:v9];

  int v10 = +[FCEdgeCacheHint edgeCacheHintForForYouConfig];
  [(FCRecordChainFetchOperation *)v7 setEdgeCacheHint:v10];

  [(FCRecordChainFetchOperation *)v7 setNetworkEventType:14];
  uint64_t v11 = [*(id *)(a1 + 32) networkActivity];

  if (v11)
  {
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2;
    v28[3] = &unk_1E5B55178;
    objc_copyWeak(&v29, (id *)location);
    [(FCRecordChainFetchOperation *)v7 setNetworkActivityBlock:v28];
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)location);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_3;
  v27[3] = &unk_1E5B4BF30;
  v27[4] = *(void *)(a1 + 32);
  id v12 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v27);
  [(FCRecordChainFetchOperation *)v7 setTopLevelRecordIDs:v12];

  v36[0] = @"ForYouConfig";
  v35 = @"todayFeedTopStoriesArticleIDs";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v37[0] = v13;
  v36[1] = @"Article";
  v34[0] = @"sourceChannelTagID";
  v34[1] = @"parentIssueID";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v37[1] = v14;
  v36[2] = @"ArticleList";
  v33 = @"articleIDs";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v37[2] = v15;
  v36[3] = @"Tag";
  v36[4] = @"Issue";
  v37[3] = MEMORY[0x1E4F1CBF0];
  v37[4] = MEMORY[0x1E4F1CBF0];
  __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];
  [(FCRecordChainFetchOperation *)v7 setLinkKeysByRecordType:v16];

  uint64_t v17 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void **)(a1 + 32);
    id v19 = v17;
    uint64_t v20 = [v18 shortOperationDescription];
    v21 = [(FCRecordChainFetchOperation *)v7 topLevelRecordIDs];
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v20;
    __int16 v31 = 2114;
    v32 = v21;
    _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch config from CK with top-level record IDs: %{public}@", location, 0x16u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_28;
  v24[3] = &unk_1E5B551A0;
  v24[4] = *(void *)(a1 + 32);
  id v25 = v6;
  id v26 = v5;
  id v22 = v5;
  id v23 = v6;
  [(FCRecordChainFetchOperation *)v7 setRecordChainCompletionHandler:v24];
  [*(id *)(a1 + 32) associateChildOperation:v7];
  [(FCOperation *)v7 start];
}

id __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[FCNetworkActivity activityWithLabel:4];
  id v3 = [WeakRetained networkActivity];
  [v2 setParentActivity:v3];

  return v2;
}

void __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 request];
  id v6 = [v5 forYouConfigID];
  [v4 addObject:v6];

  id v8 = [*(id *)(a1 + 32) request];
  uint64_t v7 = [v8 additionalRecordIDs];
  [v4 addObjectsFromArray:v7];
}

void __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2_29;
    v9[3] = &unk_1E5B4E088;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2_29(v9);
  }
  else
  {
    id v8 = [[FCTodayFeedConfigCKResult alloc] initWithRecordsByType:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2_29(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)a1[4];
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    uint64_t v6 = a1[5];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ encountered error fetching config from CK: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)_fetchFromNewsEdge
{
  id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke;
  v6[3] = &unk_1E5B4EEF0;
  v6[4] = self;
  id v4 = (void *)[v3 initWithResolver:v6];
  return v4;
}

void __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) appConfig];
  char v8 = [v7 todayFeedConfigRequestsEnabled];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) context];
    __int16 v10 = [v9 appConfigurationManager];
    uint64_t v11 = v10;
    if (v10)
    {
      if ([v10 conformsToProtocol:&unk_1EF8F0670]) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      id v14 = *(void **)(a1 + 32);
      id v28 = v13;
      id v15 = [v14 networkActivity];

      if (v15)
      {
        objc_initWeak(location, *(id *)(a1 + 32));
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_82;
        aBlock[3] = &unk_1E5B551C8;
        objc_copyWeak(&v33, location);
        id v26 = _Block_copy(aBlock);
        objc_destroyWeak(&v33);
        objc_destroyWeak(location);
      }
      else
      {
        id v26 = 0;
      }
      __int16 v16 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void **)(a1 + 32);
        uint64_t v18 = v16;
        id v19 = [v17 shortOperationDescription];
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v19;
        _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch config from News Edge", (uint8_t *)location, 0xCu);
      }
      uint64_t v20 = FCDispatchQueueForQualityOfService(objc_msgSend(*(id *)(a1 + 32), "qualityOfService", v26));
      v21 = [*(id *)(a1 + 32) request];
      uint64_t v22 = [v21 feedType];
      id v23 = [*(id *)(a1 + 32) request];
      v24 = [v23 formatVersion];
      id v25 = [*(id *)(a1 + 32) cachePolicy];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_85;
      v29[3] = &unk_1E5B551F0;
      v29[4] = *(void *)(a1 + 32);
      id v30 = v6;
      id v31 = v5;
      [v28 fetchTodayFeedConfigurationIfNeededWithCompletionQueue:v20 feedType:v22 formatVersion:v24 cachePolicy:v25 networkActivityBlock:v27 completion:v29];
    }
    else
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      void v34[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_81;
      v34[3] = &unk_1E5B4CC80;
      v34[4] = *(void *)(a1 + 32);
      id v35 = v5;
      __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_81((uint64_t)v34);
    }
  }
  else
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2;
    v36[3] = &unk_1E5B4CC80;
    v36[4] = *(void *)(a1 + 32);
    id v37 = v5;
    __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2((uint64_t)v36);
  }
}

uint64_t __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    char v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will skip News Edge because it's disabled in the app config", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_81(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    char v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will skip News Edge because there's no config manager", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_82(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F95DB0];
  id v3 = [WeakRetained networkActivity];
  id v4 = [v3 token];
  id v5 = [v2 activityWithDomain:54 label:3 parentToken:v4];

  return v5;
}

void __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_85(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2_86;
    v6[3] = &unk_1E5B4E088;
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = *(id *)(a1 + 40);
    __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2_86(v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2_86(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)a1[4];
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    uint64_t v6 = a1[5];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ encountered error fetching config from News Edge: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (FCTodayFeedConfigRequest)request
{
  return self->_request;
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(id)a3
{
}

- (FCNetworkActivity)parentNetworkActivity
{
  return self->_parentNetworkActivity;
}

- (void)setParentNetworkActivity:(id)a3
{
}

- (NFUnfairLock)completionLock
{
  return self->_completionLock;
}

- (id)reusableCompletionHandler
{
  return self->_reusableCompletionHandler;
}

- (void)setReusableCompletionHandler:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCNewsAppConfiguration)appConfig
{
  return self->_appConfig;
}

- (NSData)resultCKConfigData
{
  return self->_resultCKConfigData;
}

- (void)setResultCKConfigData:(id)a3
{
}

- (NSDictionary)resultCKRecordsByType
{
  return self->_resultCKRecordsByType;
}

- (void)setResultCKRecordsByType:(id)a3
{
}

- (NSData)resultNewsEdgeConfigData
{
  return self->_resultNewsEdgeConfigData;
}

- (void)setResultNewsEdgeConfigData:(id)a3
{
}

- (FCNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_resultNewsEdgeConfigData, 0);
  objc_storeStrong((id *)&self->_resultCKRecordsByType, 0);
  objc_storeStrong((id *)&self->_resultCKConfigData, 0);
  objc_storeStrong((id *)&self->_appConfig, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_reusableCompletionHandler, 0);
  objc_storeStrong((id *)&self->_completionLock, 0);
  objc_storeStrong((id *)&self->_parentNetworkActivity, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end