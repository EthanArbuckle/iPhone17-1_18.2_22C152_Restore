@interface FCFeedPrewarmer
- (FCContentContext)contentContext;
- (FCFeedPrewarmer)initWithContentContext:(id)a3;
- (FCThreadSafeMutableDictionary)prewarmOperations;
- (void)finishPrewarmingRequestForKey:(id)a3 completion:(id)a4;
- (void)startPrewarmingRequest:(id)a3;
@end

@implementation FCFeedPrewarmer

- (FCFeedPrewarmer)initWithContentContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCFeedPrewarmer;
  v6 = [(FCFeedPrewarmer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentContext, a3);
    v8 = objc_alloc_init(FCThreadSafeMutableDictionary);
    prewarmOperations = v7->_prewarmOperations;
    v7->_prewarmOperations = v8;
  }
  return v7;
}

- (void)startPrewarmingRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [FCFeedPrewarmOperation alloc];
  v6 = [(FCFeedPrewarmer *)self contentContext];
  v7 = [(FCFeedPrewarmOperation *)v5 initWithPrewarmRequest:v4 contentContext:v6];

  [(FCOperation *)v7 setQualityOfService:25];
  [(FCOperation *)v7 setRelativePriority:1];
  v8 = [(FCFeedPrewarmer *)self prewarmOperations];
  v9 = [v4 requestKey];
  [v8 setObject:v7 forKey:v9];

  v10 = (void *)FCFeedPrewarmLog;
  if (os_log_type_enabled((os_log_t)FCFeedPrewarmLog, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = v10;
    v12 = [v4 requestKey];
    v13 = [(FCOperation *)v7 operationID];
    int v15 = 138543618;
    v16 = v12;
    __int16 v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "will prewarm feeds for key=%{public}@, operationID=%{public}@", (uint8_t *)&v15, 0x16u);
  }
  v14 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_prewarmQueue");
  [v14 addOperation:v7];
}

- (void)finishPrewarmingRequestForKey:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(FCFeedPrewarmer *)self prewarmOperations];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = v9;
    objc_super v11 = (void *)FCFeedPrewarmLog;
    if (os_log_type_enabled((os_log_t)FCFeedPrewarmLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = [v10 operationID];
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "will finish prewarm operation for key=%{public}@, operationID=%{public}@", buf, 0x16u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke_4;
    v15[3] = &unk_1E5B58878;
    id v16 = v7;
    id v14 = v7;
    [v10 commitResultsOnceWithCompletionHandler:v15];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke;
    v17[3] = &unk_1E5B4CC80;
    id v18 = v6;
    id v19 = v7;
    id v10 = v7;
    __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke((uint64_t)v17);

    id v14 = v18;
  }
}

void __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = FCFeedPrewarmLog;
  if (os_log_type_enabled((os_log_t)FCFeedPrewarmLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "found no prewarm operation for key=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v5 = [FCFeedPrewarmResult alloc];
    id v6 = [(FCFeedPrewarmResult *)v5 initWithSuccessfulRequests:MEMORY[0x1E4F1CBF0] failedRequests:MEMORY[0x1E4F1CBF0]];
    (*(void (**)(uint64_t, FCFeedPrewarmResult *))(v4 + 16))(v4, v6);
  }
}

uint64_t __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (FCThreadSafeMutableDictionary)prewarmOperations
{
  return self->_prewarmOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmOperations, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end