@interface FCTagESLService
- (FCCloudContext)context;
- (FCTagESLService)init;
- (FCTagESLService)initWithContext:(id)a3;
- (id)_promiseConfiguration;
- (id)_promiseCuratedFeedItemsForTags:(id)a3 configuration:(id)a4;
- (id)_promiseRelevantTagsWithConfiguration:(id)a3;
- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4;
@end

@implementation FCTagESLService

- (FCTagESLService)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTagESLService;
  v6 = [(FCTagESLService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (FCTagESLService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagESLService init]";
    __int16 v9 = 2080;
    v10 = "FCTagESLService.m";
    __int16 v11 = 1024;
    int v12 = 42;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTagESLService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__27;
  v26[4] = __Block_byref_object_dispose__27;
  id v27 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke;
  v25[3] = &unk_1E5B4E758;
  v25[4] = self;
  v8 = [MEMORY[0x1E4F81BF0] firstly:v25];
  __int16 v9 = zalgo();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_2;
  v24[3] = &unk_1E5B51460;
  v24[4] = self;
  v24[5] = v26;
  v10 = [v8 thenOn:v9 then:v24];
  __int16 v11 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_3;
  v23[3] = &unk_1E5B51488;
  v23[4] = self;
  v23[5] = v26;
  int v12 = [v10 thenOn:v11 then:v23];
  __int16 v13 = zalgo();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_4;
  v21[3] = &unk_1E5B514B0;
  id v14 = v7;
  id v22 = v14;
  uint64_t v15 = [v12 thenOn:v13 then:v21];
  v16 = zalgo();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_5;
  v19[3] = &unk_1E5B4EF68;
  id v17 = v14;
  id v20 = v17;
  id v18 = (id)[v15 errorOn:v16 error:v19];

  _Block_object_dispose(v26, 8);
}

uint64_t __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promiseConfiguration];
}

id __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) _promiseRelevantTagsWithConfiguration:v4];

  return v5;
}

uint64_t __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _promiseCuratedFeedItemsForTags:a2 configuration:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

id __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_promiseConfiguration
{
  v2 = [(FCTagESLService *)self context];
  id v3 = [v2 configurationManager];
  id v4 = FCCoreConfigurationPromise(v3);

  return v4;
}

- (id)_promiseRelevantTagsWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke;
  v9[3] = &unk_1E5B50378;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)[v5 initWithResolver:v9];

  return v7;
}

void __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) context];
  v8 = [v7 tagController];
  __int16 v9 = [*(id *)(a1 + 32) context];
  id v10 = [v9 subscriptionList];
  __int16 v11 = [v10 allSubscribedTagIDs];
  int v12 = [v11 allObjects];
  uint64_t v13 = FCCurrentQoS();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke_2;
  v18[3] = &unk_1E5B50750;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(a1 + 40);
  id v20 = v6;
  v18[4] = v14;
  id v19 = v15;
  id v21 = v5;
  id v16 = v5;
  id v17 = v6;
  [v8 fetchTagsForTagIDs:v12 maximumCachedAge:v13 qualityOfService:v18 completionHandler:1.79769313e308];
}

void __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v16 = (void (**)(id, id))*(id *)(a1 + 48);
    id v15 = v6;
    v16[2](v16, v15);
  }
  else
  {
    id v7 = [v5 keysOfEntriesPassingTest:&__block_literal_global_43];
    v8 = [v7 allObjects];

    __int16 v9 = [*(id *)(a1 + 32) context];
    id v10 = [v9 feedPersonalizer];
    __int16 v11 = [v10 rankTagIDsDescending:v8];

    int v12 = objc_msgSend(v11, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 40), "maxTagESLArticleListsToQuery"));
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = objc_msgSend(v5, "nf_objectsForKeysWithoutMarker:", v12);
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
}

uint64_t __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 hasEvergreenArticleList];
}

- (id)_promiseCuratedFeedItemsForTags:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  id v9 = objc_alloc(MEMORY[0x1E4F81BF0]);
  id v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_2;
    v13[3] = &unk_1E5B507A0;
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    __int16 v11 = (void *)[v10 initWithResolver:v13];
  }
  else
  {
    __int16 v11 = (void *)[v9 initWithValue:MEMORY[0x1E4F1CBF0]];
  }

  return v11;
}

void __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCTagCuratedESLArticlesOperation alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) context];
  uint64_t v10 = *(void *)(a1 + 48);
  __int16 v11 = [*(id *)(a1 + 40) context];
  int v12 = [v11 bundleSubscriptionManager];
  uint64_t v13 = [(FCTagCuratedESLArticlesOperation *)v7 initWithTags:v8 context:v9 configuration:v10 bundleSubscriptionManager:v12];

  id v14 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    id v16 = [(FCOperation *)v13 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v26 = v16;
    _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "will fetch tag evergreen feed items with operation: %{public}@", buf, 0xCu);
  }
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_22;
  id v22 = &unk_1E5B514F8;
  id v23 = v6;
  id v24 = v5;
  id v17 = v5;
  id v18 = v6;
  [(FCTagCuratedESLArticlesOperation *)v13 setCompletionHandler:&v19];
  [(FCOperation *)v13 start];
}

void __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v10 = (void (**)(id, id))*(id *)(a1 + 32);
    id v9 = v6;
    v10[2](v10, v9);
  }
  else
  {
    id v7 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = [v5 count];
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "did fetch %lu tag evergreen feed items", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_2_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end