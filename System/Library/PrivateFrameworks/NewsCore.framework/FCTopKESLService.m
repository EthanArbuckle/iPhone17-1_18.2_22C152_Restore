@interface FCTopKESLService
- (FCCloudContext)context;
- (FCTopKESLService)init;
- (FCTopKESLService)initWithContext:(id)a3;
- (id)_promiseConfiguration;
- (id)_promiseFeedItemsForTags:(id)a3 configuration:(id)a4;
- (id)_promiseRelevantTagsWithConfiguration:(id)a3;
- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4;
@end

@implementation FCTopKESLService

- (FCTopKESLService)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTopKESLService;
  v6 = [(FCTopKESLService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (FCTopKESLService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTopKESLService init]";
    __int16 v9 = 2080;
    v10 = "FCTopKESLService.m";
    __int16 v11 = 1024;
    int v12 = 44;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTopKESLService init]"];
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
  v26[3] = __Block_byref_object_copy__68;
  v26[4] = __Block_byref_object_dispose__68;
  id v27 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke;
  v25[3] = &unk_1E5B4E758;
  v25[4] = self;
  v8 = [MEMORY[0x1E4F81BF0] firstly:v25];
  __int16 v9 = zalgo();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_2;
  v24[3] = &unk_1E5B51460;
  v24[4] = self;
  v24[5] = v26;
  v10 = [v8 thenOn:v9 then:v24];
  __int16 v11 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_3;
  v23[3] = &unk_1E5B51488;
  v23[4] = self;
  v23[5] = v26;
  int v12 = [v10 thenOn:v11 then:v23];
  __int16 v13 = zalgo();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_4;
  v21[3] = &unk_1E5B514B0;
  id v14 = v7;
  id v22 = v14;
  uint64_t v15 = [v12 thenOn:v13 then:v21];
  v16 = zalgo();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_5;
  v19[3] = &unk_1E5B4EF68;
  id v17 = v14;
  id v20 = v17;
  id v18 = (id)[v15 errorOn:v16 error:v19];

  _Block_object_dispose(v26, 8);
}

uint64_t __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promiseConfiguration];
}

id __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) _promiseRelevantTagsWithConfiguration:v4];

  return v5;
}

uint64_t __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _promiseFeedItemsForTags:a2 configuration:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

id __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_promiseConfiguration
{
  v2 = [(FCTopKESLService *)self context];
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
  v9[2] = __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke;
  v9[3] = &unk_1E5B50378;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)[v5 initWithResolver:v9];

  return v7;
}

void __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v18[2] = __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke_2;
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

void __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v15 = (void (**)(id, id))*(id *)(a1 + 48);
    id v14 = v6;
    v15[2](v15, v14);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) context];
    v8 = [v7 feedPersonalizer];
    __int16 v9 = [v5 allKeys];
    id v10 = [v8 rankTagIDsDescending:v9];

    __int16 v11 = objc_msgSend(v10, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 40), "maxTagESLArticleListsToQuery"));
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = objc_msgSend(v5, "nf_objectsForKeysWithoutMarker:", v11);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

uint64_t __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_promiseFeedItemsForTags:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  id v7 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v8 = v7;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_2;
    v11[3] = &unk_1E5B50378;
    v11[4] = self;
    id v12 = v5;
    __int16 v9 = (void *)[v8 initWithResolver:v11];
  }
  else
  {
    __int16 v9 = (void *)[v7 initWithValue:MEMORY[0x1E4F1CBF0]];
  }

  return v9;
}

void __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCDateRange alloc];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v9 = [(FCDateRange *)v7 initWithStartDate:v8 timeInterval:604800.0];

  id v10 = +[FCFeedRange feedRangeFromDateRange:v9];
  __int16 v11 = objc_alloc_init(FCFeedRequestOperation);
  id v12 = [*(id *)(a1 + 32) context];
  [(FCFeedRequestOperation *)v11 setContext:v12];

  uint64_t v13 = +[FCFeedDatabase temporaryFeedDatabaseWithEndpoint:1];
  [(FCFeedRequestOperation *)v11 setFeedDatabase:v13];

  id v14 = [*(id *)(a1 + 32) context];
  uint64_t v15 = [v14 configurationManager];
  id v16 = [v15 configuration];
  [(FCFeedRequestOperation *)v11 setConfiguration:v16];

  id v17 = *(void **)(a1 + 40);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_3;
  v28[3] = &unk_1E5B5A240;
  id v18 = v10;
  id v29 = v18;
  long long v30 = xmmword_1A4974A70;
  id v19 = objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", v28);
  [(FCFeedRequestOperation *)v11 setFeedRequests:v19];

  id v20 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v20;
    id v22 = [(FCOperation *)v11 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v32 = v22;
    _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "will fetch tag evergreen feed items with operation: %{public}@", buf, 0xCu);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_25;
  v25[3] = &unk_1E5B544E0;
  id v26 = v6;
  id v27 = v5;
  id v23 = v5;
  id v24 = v6;
  [(FCFeedRequestOperation *)v11 setRequestCompletionHandler:v25];
  [(FCOperation *)v11 start];
}

FCFeedRequest *__59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(FCFeedRequest);
  id v5 = [v3 feedIDForBin:a1[5]];

  [(FCFeedRequest *)v4 setFeedID:v5];
  [(FCFeedRequest *)v4 setFeedRange:a1[4]];
  [(FCFeedRequest *)v4 setMaxCount:a1[6]];
  return v4;
}

void __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_25(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    __int16 v11 = (void (**)(id, id))*(id *)(a1 + 32);
    id v10 = v7;
    v11[2](v11, v10);
  }
  else
  {
    [v6 makeObjectsPerformSelector:sel_markAsEvergreen];
    v8 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = v8;
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v6 count];
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "did fetch %lu tag evergreen feed items", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_2_26(uint64_t a1)
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