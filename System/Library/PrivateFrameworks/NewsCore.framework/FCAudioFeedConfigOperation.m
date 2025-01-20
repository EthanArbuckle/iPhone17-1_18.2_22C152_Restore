@interface FCAudioFeedConfigOperation
- (BOOL)validateOperation;
- (FCAudioFeedConfigOperation)init;
- (FCAudioFeedConfigOperation)initWithContext:(id)a3;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCAudioFeedConfigOperation

- (FCAudioFeedConfigOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAudioFeedConfigOperation init]";
    __int16 v9 = 2080;
    v10 = "FCAudioFeedConfigOperation.m";
    __int16 v11 = 1024;
    int v12 = 39;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAudioFeedConfigOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCAudioFeedConfigOperation)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAudioFeedConfigOperation;
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
      v3 = (void *)[[NSString alloc] initWithFormat:@"audio feed config operation requires a context"];
      int v5 = 136315906;
      id v6 = "-[FCAudioFeedConfigOperation validateOperation]";
      __int16 v7 = 2080;
      v8 = "FCAudioFeedConfigOperation.m";
      __int16 v9 = 1024;
      int v10 = 58;
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
  v13[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke;
  v13[3] = &unk_1E5B4E758;
  v13[4] = self;
  v3 = [MEMORY[0x1E4F81BF0] firstly:v13];
  uint64_t v4 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke_2;
  v12[3] = &unk_1E5B4FCD8;
  v12[4] = self;
  int v5 = [v3 thenOn:v4 then:v12];
  id v6 = zalgo();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke_3;
  v11[3] = &unk_1E5B53E70;
  v11[4] = self;
  __int16 v7 = [v5 thenOn:v6 then:v11];
  v8 = zalgo();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke_4;
  v10[3] = &unk_1E5B4FD28;
  v10[4] = self;
  id v9 = (id)[v7 errorOn:v8 error:v10];
}

id __46__FCAudioFeedConfigOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    BOOL v2 = [*(id *)(v1 + 376) configurationManager];
    v3 = FCCoreConfigurationPromise(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __46__FCAudioFeedConfigOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke;
    v7[3] = &unk_1E5B50378;
    v7[4] = v2;
    id v8 = v3;
    int v5 = (void *)[v4 initWithResolver:v7];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

uint64_t __46__FCAudioFeedConfigOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 first];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    objc_storeStrong((id *)(v5 + 384), v4);
  }

  id v6 = [v3 second];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    objc_storeStrong((id *)(v7 + 392), v6);
  }

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  return 0;
}

uint64_t __46__FCAudioFeedConfigOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(FCAudioFeedConfigOperation *)self fetchCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCAudioFeedConfigOperation *)self fetchCompletionHandler];
    if (self)
    {
      id v6 = self->_resultFeedConfig;
      resultLegacyConfig = self->_resultLegacyConfig;
    }
    else
    {
      id v6 = 0;
      resultLegacyConfig = 0;
    }
    ((void (**)(void, NSString *, NSString *, id))v5)[2](v5, v6, resultLegacyConfig, v8);
  }
}

void __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(FCRecordChainFetchOperation);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 376);
  }
  else {
    uint64_t v10 = 0;
  }
  [(FCRecordChainFetchOperation *)v7 setContext:v10];
  __int16 v11 = [*(id *)(a1 + 40) audioConfigRecordID];
  v31[0] = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [(FCRecordChainFetchOperation *)v8 setTopLevelRecordIDs:v12];

  v29[0] = @"AudioConfig";
  v28[0] = @"curatedArticleIDs";
  v28[1] = @"dailyBriefingArticleID";
  v28[2] = @"heroArticleIDs";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v30[0] = v13;
  v29[1] = @"ArticleList";
  v27 = @"articleIDs";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v30[1] = v14;
  v29[2] = @"Article";
  v26[0] = @"sourceChannelTagID";
  v26[1] = @"parentIssueID";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v30[2] = v15;
  v30[3] = MEMORY[0x1E4F1CBF0];
  v29[3] = @"Tag";
  v29[4] = @"Issue";
  v30[4] = MEMORY[0x1E4F1CBF0];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];
  [(FCRecordChainFetchOperation *)v8 setLinkKeysByRecordType:v16];

  v24 = @"AudioConfig";
  v17 = +[FCCachePolicy cachePolicyWithSoftMaxAge:300.0];
  v25 = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [(FCRecordChainFetchOperation *)v8 setCachePoliciesByRecordType:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_2;
  v21[3] = &unk_1E5B53E98;
  id v22 = v6;
  id v23 = v5;
  id v19 = v5;
  id v20 = v6;
  [(FCRecordChainFetchOperation *)v8 setRecordChainCompletionHandler:v21];
  [*(id *)(a1 + 32) associateChildOperation:v8];
  [(FCOperation *)v8 start];
}

void __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_3;
    v17 = &unk_1E5B4C7C0;
    id v19 = (void (**)(id, id))*(id *)(a1 + 32);
    id v18 = v5;
    v19[2](v19, v18);

    id v6 = v19;
  }
  else
  {
    id v6 = [a2 objectForKeyedSubscript:&unk_1EF8D7C50];
    uint64_t v7 = [v6 onlyRecord];
    id v8 = [v7 feedConfiguration];
    uint64_t v9 = [v7 configuration];
    if ([v8 length])
    {
      uint64_t v10 = *(void *)(a1 + 40);
      __int16 v11 = +[FCPair pairWithFirst:v8 second:v9];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_20;
      v12[3] = &unk_1E5B4CA88;
      id v13 = *(id *)(a1 + 32);
      __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_20((uint64_t)v12);
    }
  }
}

uint64_t __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_notAvailableError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
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
  objc_storeStrong((id *)&self->_resultLegacyConfig, 0);
  objc_storeStrong((id *)&self->_resultFeedConfig, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end