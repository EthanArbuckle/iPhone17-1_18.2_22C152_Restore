@interface FCAudioConfigurationOperation
- (BOOL)validateOperation;
- (FCAudioConfigurationOperation)init;
- (FCAudioConfigurationOperation)initWithContext:(id)a3;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCAudioConfigurationOperation

- (FCAudioConfigurationOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAudioConfigurationOperation init]";
    __int16 v9 = 2080;
    v10 = "FCAudioConfigurationOperation.m";
    __int16 v11 = 1024;
    int v12 = 36;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAudioConfigurationOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCAudioConfigurationOperation)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAudioConfigurationOperation;
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
      v3 = (void *)[[NSString alloc] initWithFormat:@"daily briefing fetch operation requires a context"];
      int v5 = 136315906;
      id v6 = "-[FCAudioConfigurationOperation validateOperation]";
      __int16 v7 = 2080;
      v8 = "FCAudioConfigurationOperation.m";
      __int16 v9 = 1024;
      int v10 = 55;
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
  v13[2] = __49__FCAudioConfigurationOperation_performOperation__block_invoke;
  v13[3] = &unk_1E5B4E758;
  v13[4] = self;
  v3 = [MEMORY[0x1E4F81BF0] firstly:v13];
  uint64_t v4 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__FCAudioConfigurationOperation_performOperation__block_invoke_2;
  v12[3] = &unk_1E5B4FCD8;
  v12[4] = self;
  int v5 = [v3 thenOn:v4 then:v12];
  id v6 = zalgo();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__FCAudioConfigurationOperation_performOperation__block_invoke_3;
  v11[3] = &unk_1E5B4DDA8;
  v11[4] = self;
  __int16 v7 = [v5 thenOn:v6 then:v11];
  v8 = zalgo();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__FCAudioConfigurationOperation_performOperation__block_invoke_4;
  v10[3] = &unk_1E5B4FD28;
  v10[4] = self;
  id v9 = (id)[v7 errorOn:v8 error:v10];
}

id __49__FCAudioConfigurationOperation_performOperation__block_invoke(uint64_t a1)
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

id __49__FCAudioConfigurationOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__FCAudioConfigurationOperation__promiseConfiguration___block_invoke;
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

uint64_t __49__FCAudioConfigurationOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 384), a2);
    id v4 = *(void **)(a1 + 32);
  }
  else
  {
    id v4 = 0;
  }
  [v4 finishedPerformingOperationWithError:0];
  return 0;
}

uint64_t __49__FCAudioConfigurationOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int v5 = (id)FCOperationLog;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(FCOperation *)self shortOperationDescription];
      __int16 v7 = (void *)v6;
      if (self) {
        resultConfigString = self->_resultConfigString;
      }
      else {
        resultConfigString = 0;
      }
      int v13 = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      v16 = resultConfigString;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with config %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  id v9 = [(FCAudioConfigurationOperation *)self fetchCompletionHandler];

  if (v9)
  {
    uint64_t v10 = [(FCAudioConfigurationOperation *)self fetchCompletionHandler];
    __int16 v11 = (void *)v10;
    if (self) {
      int v12 = self->_resultConfigString;
    }
    else {
      int v12 = 0;
    }
    (*(void (**)(uint64_t, NSString *, id))(v10 + 16))(v10, v12, v4);
  }
}

void __55__FCAudioConfigurationOperation__promiseConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = objc_alloc_init(FCRecordChainFetchOperation);
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
  v28[0] = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [(FCRecordChainFetchOperation *)v8 setTopLevelRecordIDs:v12];

  v26[0] = @"AudioConfig";
  v26[1] = @"ArticleList";
  v27[0] = MEMORY[0x1E4F1CBF0];
  v27[1] = MEMORY[0x1E4F1CBF0];
  v26[2] = @"Article";
  v26[3] = @"Tag";
  v27[2] = MEMORY[0x1E4F1CBF0];
  v27[3] = MEMORY[0x1E4F1CBF0];
  v26[4] = @"Issue";
  v27[4] = MEMORY[0x1E4F1CBF0];
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
  [(FCRecordChainFetchOperation *)v8 setLinkKeysByRecordType:v13];

  v24 = @"AudioConfig";
  uint64_t v14 = +[FCCachePolicy cachePolicyWithSoftMaxAge:3600.0];
  v25 = v14;
  __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [(FCRecordChainFetchOperation *)v8 setCachePoliciesByRecordType:v15];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __55__FCAudioConfigurationOperation__promiseConfiguration___block_invoke_2;
  v21 = &unk_1E5B53E98;
  id v22 = v6;
  id v23 = v5;
  id v16 = v5;
  id v17 = v6;
  [(FCRecordChainFetchOperation *)v8 setRecordChainCompletionHandler:&v18];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8, v18, v19, v20, v21);
  [(FCOperation *)v8 start];
}

void __55__FCAudioConfigurationOperation__promiseConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    __int16 v11 = (void (**)(id, id))*(id *)(a1 + 32);
    id v10 = v5;
    v11[2](v11, v10);
  }
  else
  {
    id v6 = [a2 objectForKeyedSubscript:&unk_1EF8D7CB0];
    __int16 v7 = [v6 onlyRecord];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [v7 configuration];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

uint64_t __55__FCAudioConfigurationOperation__promiseConfiguration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
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
  objc_storeStrong((id *)&self->_resultConfigString, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end