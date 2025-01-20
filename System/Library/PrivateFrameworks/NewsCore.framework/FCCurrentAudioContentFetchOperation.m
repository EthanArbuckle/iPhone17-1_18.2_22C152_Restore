@interface FCCurrentAudioContentFetchOperation
- (BOOL)validateOperation;
- (FCCurrentAudioContentFetchOperation)init;
- (FCCurrentAudioContentFetchOperation)initWithContext:(id)a3;
- (id)_promiseConfiguration;
- (id)_promiseContentWithConfiguration:(id)a3;
- (id)_promisePlaceholderContentWithConfiguration:(id)a3;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCCurrentAudioContentFetchOperation

- (FCCurrentAudioContentFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCurrentAudioContentFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCCurrentAudioContentFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 54;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCurrentAudioContentFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCCurrentAudioContentFetchOperation)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCurrentAudioContentFetchOperation;
  id v6 = [(FCOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)[[NSString alloc] initWithFormat:@"current magazine content fetch operation requires a context"];
      int v5 = 136315906;
      id v6 = "-[FCCurrentAudioContentFetchOperation validateOperation]";
      __int16 v7 = 2080;
      v8 = "FCCurrentAudioContentFetchOperation.m";
      __int16 v9 = 1024;
      int v10 = 73;
      __int16 v11 = 2114;
      int v12 = v3;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)performOperation
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke;
  v13[3] = &unk_1E5B4E758;
  v13[4] = self;
  v3 = [MEMORY[0x1E4F81BF0] firstly:v13];
  uint64_t v4 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_2;
  v12[3] = &unk_1E5B4FCD8;
  v12[4] = self;
  int v5 = [v3 thenOn:v4 then:v12];
  id v6 = zalgo();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_3;
  v11[3] = &unk_1E5B50728;
  v11[4] = self;
  __int16 v7 = [v5 thenOn:v6 then:v11];
  v8 = zalgo();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_4;
  v10[3] = &unk_1E5B4FD28;
  v10[4] = self;
  id v9 = (id)[v7 errorOn:v8 error:v10];
}

uint64_t __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promiseConfiguration];
}

id __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = NewsCoreUserDefaults();
  int v5 = [v4 BOOLForKey:@"audio_config_enabled"];

  id v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 _promiseContentWithConfiguration:v3];
  }
  else {
  __int16 v7 = [v6 _promisePlaceholderContentWithConfiguration:v3];
  }

  return v7;
}

uint64_t __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_3(uint64_t a1, char *newValue)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, newValue, newValue, 384);
    id v3 = *(void **)(a1 + 32);
  }
  [v3 finishedPerformingOperationWithError:0];
  return 0;
}

uint64_t __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int v5 = (id)FCOperationLog;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    id v6 = [(FCOperation *)self shortOperationDescription];
    if (self)
    {
      __int16 v7 = self->_resultCurrentContent;
      v8 = v7;
      if (v7)
      {
        recentHeadlines = v7->_recentHeadlines;
        goto LABEL_6;
      }
    }
    else
    {
      v8 = 0;
    }
    recentHeadlines = 0;
LABEL_6:
    int v10 = recentHeadlines;
    uint64_t v11 = [(NSArray *)v10 count];
    if (self)
    {
      int v12 = self->_resultCurrentContent;
      uint64_t v13 = v12;
      if (v12)
      {
        featuredHeadlines = v12->_featuredHeadlines;
LABEL_9:
        uint64_t v15 = featuredHeadlines;
        int v24 = 138543874;
        v25 = v6;
        __int16 v26 = 2048;
        uint64_t v27 = v11;
        __int16 v28 = 2048;
        uint64_t v29 = [(NSArray *)v15 count];
        _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with %lu recent headlines, %lu featured headlines", (uint8_t *)&v24, 0x20u);

        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    featuredHeadlines = 0;
    goto LABEL_9;
  }
LABEL_11:
  v16 = [(FCCurrentAudioContentFetchOperation *)self fetchCompletionHandler];

  if (v16)
  {
    v17 = [(FCCurrentAudioContentFetchOperation *)self fetchCompletionHandler];
    if (self)
    {
      v18 = self->_resultCurrentContent;
      v19 = v18;
      if (v18) {
        v20 = v18->_recentHeadlines;
      }
      else {
        v20 = 0;
      }
      v21 = v20;
      v22 = self->_resultCurrentContent;
      self = (FCCurrentAudioContentFetchOperation *)v22;
      if (v22)
      {
        v23 = v22->_featuredHeadlines;
LABEL_17:
        ((void (**)(void, NSArray *, NSArray *, id))v17)[2](v17, v21, v23, v4);

        goto LABEL_18;
      }
    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    v23 = 0;
    goto LABEL_17;
  }
LABEL_18:
}

- (id)_promiseConfiguration
{
  if (self) {
    self = (FCCurrentAudioContentFetchOperation *)self->_context;
  }
  BOOL v2 = [(FCCurrentAudioContentFetchOperation *)self configurationManager];
  id v3 = FCCoreConfigurationPromise(v2);

  return v3;
}

- (id)_promiseContentWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke;
  v9[3] = &unk_1E5B50378;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  __int16 v7 = (void *)[v5 initWithResolver:v9];

  return v7;
}

void __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = objc_alloc_init(FCRecordChainFetchOperation);
  v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 376);
  }
  else {
    uint64_t v10 = 0;
  }
  [(FCRecordChainFetchOperation *)v7 setContext:v10];
  uint64_t v11 = [*(id *)(a1 + 40) audioConfigRecordID];
  v39[0] = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  [(FCRecordChainFetchOperation *)v8 setTopLevelRecordIDs:v12];

  v37[0] = @"AudioConfig";
  v36[0] = @"latestAudioArticleListID";
  v36[1] = @"featuredAudioArticleListID";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v38[0] = v13;
  v37[1] = @"ArticleList";
  v35 = @"articleIDs";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v38[1] = v14;
  v37[2] = @"Article";
  v34[0] = @"sourceChannelTagID";
  v34[1] = @"parentIssueID";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v38[2] = v15;
  v38[3] = MEMORY[0x1E4F1CBF0];
  v37[3] = @"Tag";
  v37[4] = @"Issue";
  v38[4] = MEMORY[0x1E4F1CBF0];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];
  [(FCRecordChainFetchOperation *)v8 setLinkKeysByRecordType:v16];

  v32 = @"AudioConfig";
  v17 = +[FCCachePolicy cachePolicyWithSoftMaxAge:3600.0];
  v33 = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [(FCRecordChainFetchOperation *)v8 setCachePoliciesByRecordType:v18];

  v19 = +[FCEdgeCacheHint edgeCacheHintForAudioContent];
  [(FCRecordChainFetchOperation *)v8 setEdgeCacheHint:v19];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  __int16 v26 = __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke_2;
  uint64_t v27 = &unk_1E5B50750;
  id v30 = v6;
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 32);
  id v28 = v20;
  uint64_t v29 = v21;
  id v31 = v5;
  id v22 = v5;
  id v23 = v6;
  [(FCRecordChainFetchOperation *)v8 setRecordChainCompletionHandler:&v24];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8, v24, v25, v26, v27);
  [(FCOperation *)v8 start];
}

void __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v29 = (void (**)(id, id))*(id *)(a1 + 48);
    id v28 = v6;
    v29[2](v29, v28);

    __int16 v7 = v29;
  }
  else
  {
    uint64_t v27 = [v5 objectForKeyedSubscript:&unk_1EF8D7908];
    v8 = [v5 objectForKeyedSubscript:&unk_1EF8D7920];
    uint64_t v9 = [v5 objectForKeyedSubscript:&unk_1EF8D7938];
    __int16 v26 = [v5 objectForKeyedSubscript:&unk_1EF8D7950];
    uint64_t v10 = [v5 objectForKeyedSubscript:&unk_1EF8D7968];
    uint64_t v24 = v9;
    uint64_t v11 = [v9 onlyRecord];
    uint64_t v25 = v8;
    int v12 = [v8 transformRecordsByIDWithBlock:&__block_literal_global_34];
    v14 = *(void **)(a1 + 32);
    uint64_t v13 = *(void **)(a1 + 40);
    if (v13) {
      uint64_t v13 = (void *)v13[47];
    }
    uint64_t v15 = v13;
    v16 = [v15 assetManager];
    v17 = [v12 allValues];
    v18 = FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v14, v16, v27, v10, v26, v17, 1);

    if ([v11 hasLatestAudioArticleListID])
    {
      v19 = [v11 latestAudioArticleListID];
      id v20 = [v18 objectForKeyedSubscript:v19];
    }
    else
    {
      id v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if ([v11 hasFeaturedAudioArticleListID])
    {
      uint64_t v21 = [v11 featuredAudioArticleListID];
      id v22 = [v18 objectForKeyedSubscript:v21];
    }
    else
    {
      id v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v23 = -[FCCurrentAudioContent initWithRecentHeadlines:featuredHeadlines:]([FCCurrentAudioContent alloc], v20, v22);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    __int16 v7 = (void (**)(id, id))v27;
  }
}

uint64_t __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

FCArticleList *__72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[FCArticleList alloc] initWithRecord:v5 interestToken:v4];

  return v6;
}

- (id)_promisePlaceholderContentWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke;
  v9[3] = &unk_1E5B507A0;
  v9[4] = self;
  id v10 = &unk_1EF8D8AA8;
  id v11 = v4;
  id v6 = v4;
  __int16 v7 = (void *)[v5 initWithResolver:v9];

  return v7;
}

void __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = [FCArticleHeadlinesFetchOperation alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 376);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [(FCArticleHeadlinesFetchOperation *)v7 initWithContext:v9 articleIDs:*(void *)(a1 + 40) ignoreCacheForArticleIDs:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke_2;
  v13[3] = &unk_1E5B50778;
  id v15 = v6;
  id v14 = *(id *)(a1 + 48);
  id v16 = v5;
  id v11 = v5;
  id v12 = v6;
  [(FCFetchOperation *)v10 setFetchCompletionBlock:v13];
  [*(id *)(a1 + 32) associateChildOperation:v10];
  [(FCOperation *)v10 start];
}

void __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 status])
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke_3;
    uint64_t v25 = &unk_1E5B4C7C0;
    uint64_t v27 = (void (**)(id, void *))*(id *)(a1 + 40);
    id v26 = v3;
    id v4 = [v26 error];
    v27[2](v27, v4);

    id v5 = v27;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = objc_msgSend(v3, "fetchedObject", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
          id v12 = [*(id *)(a1 + 32) paidBundleConfig];
          double v13 = (double)arc4random_uniform([v12 audioSuggestionsMaxAge]);

          id v14 = [MEMORY[0x1E4F1C9C8] date];
          id v15 = [v14 dateByAddingTimeInterval:-v13];
          [v11 setPublishDate:v15];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v8);
    }

    id v16 = [FCCurrentAudioContent alloc];
    v17 = [v3 fetchedObject];
    id v5 = -[FCCurrentAudioContent initWithRecentHeadlines:featuredHeadlines:](v16, v17, MEMORY[0x1E4F1CBF0]);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCurrentContent, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end