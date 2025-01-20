@interface FCGlobalESLService
- (FCCloudContext)context;
- (FCGlobalESLService)init;
- (FCGlobalESLService)initWithContext:(id)a3;
- (id)_promiseConfiguration;
- (id)_promiseCuratedFeedItemsWithConfiguration:(id)a3;
- (id)_promiseFeedItemsWithIssues:(id)a3 configuration:(id)a4;
- (id)_promiseIssueFeedItemsWithConfiguration:(id)a3;
- (id)_promiseIssuesWithConfiguration:(id)a3;
- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4;
@end

@implementation FCGlobalESLService

- (FCGlobalESLService)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCGlobalESLService;
  v6 = [(FCGlobalESLService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (FCGlobalESLService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCGlobalESLService init]";
    __int16 v9 = 2080;
    v10 = "FCGlobalESLService.m";
    __int16 v11 = 1024;
    int v12 = 43;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCGlobalESLService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__36;
  v31[4] = __Block_byref_object_dispose__36;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__36;
  v29[4] = __Block_byref_object_dispose__36;
  id v30 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke;
  v28[3] = &unk_1E5B4E758;
  v28[4] = self;
  v20 = [MEMORY[0x1E4F81BF0] firstly:v28];
  v7 = zalgo();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_2;
  v27[3] = &unk_1E5B51460;
  v27[4] = self;
  v27[5] = v31;
  v8 = [v20 thenOn:v7 then:v27];
  __int16 v9 = zalgo();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_3;
  v26[3] = &unk_1E5B55858;
  v26[4] = self;
  v26[5] = v29;
  v26[6] = v31;
  v10 = [v8 thenOn:v9 then:v26];
  __int16 v11 = zalgo();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_4;
  v25[3] = &unk_1E5B55880;
  v25[4] = v29;
  int v12 = [v10 thenOn:v11 then:v25];
  __int16 v13 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_5;
  v23[3] = &unk_1E5B514B0;
  id v14 = v6;
  id v24 = v14;
  uint64_t v15 = [v12 thenOn:v13 then:v23];
  v16 = zalgo();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_6;
  v21[3] = &unk_1E5B4EF68;
  id v17 = v14;
  id v22 = v17;
  id v18 = (id)[v15 errorOn:v16 error:v21];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

uint64_t __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promiseConfiguration];
}

id __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) shouldManuallySupplementEvergreenWithIssueArticles])
  {
    id v5 = [*(id *)(a1 + 32) _promiseIssueFeedItemsWithConfiguration:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

id __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) _promiseCuratedFeedItemsWithConfiguration:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  return v5;
}

uint64_t __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingUniqueObjectsFromArray:toArray:", a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

id __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_promiseConfiguration
{
  v2 = [(FCGlobalESLService *)self context];
  id v3 = [v2 configurationManager];
  id v4 = FCCoreConfigurationPromise(v3);

  return v4;
}

- (id)_promiseIssueFeedItemsWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F81BF0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke;
  v14[3] = &unk_1E5B4FEB0;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  v7 = [v5 firstly:v14];
  v8 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke_2;
  v12[3] = &unk_1E5B558A8;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  v10 = [v7 thenOn:v8 then:v12];

  return v10;
}

uint64_t __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promiseIssuesWithConfiguration:*(void *)(a1 + 40)];
}

uint64_t __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _promiseFeedItemsWithIssues:a2 configuration:*(void *)(a1 + 40)];
}

- (id)_promiseIssuesWithConfiguration:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke;
  v7[3] = &unk_1E5B4EEF0;
  v7[4] = self;
  id v5 = (void *)[v4 initWithResolver:v7];
  return v5;
}

void __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [FCCurrentIssuesFetchOperation alloc];
  v8 = [*(id *)(a1 + 32) context];
  id v9 = [(FCCurrentIssuesFetchOperation *)v7 initWithContext:v8];

  v10 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = v10;
    int v12 = [(FCOperation *)v9 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    id v22 = v12;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "will fetch current issues with operation: %{public}@", buf, 0xCu);
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke_16;
  id v18 = &unk_1E5B514F8;
  id v19 = v6;
  id v20 = v5;
  id v13 = v5;
  id v14 = v6;
  [(FCCurrentIssuesFetchOperation *)v9 setFetchCompletionHandler:&v15];
  [(FCOperation *)v9 start];
}

void __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v10 = (void (**)(id, id))*(id *)(a1 + 32);
    id v9 = v6;
    v10[2](v10, v9);
  }
  else
  {
    v7 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = [v5 count];
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "did fetch %lu issues", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_promiseFeedItemsWithIssues:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke;
  v13[3] = &unk_1E5B507A0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  __int16 v11 = (void *)[v8 initWithResolver:v13];

  return v11;
}

void __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCIssueArticlesOperation alloc];
  id v8 = [*(id *)(a1 + 32) context];
  id v9 = [(FCIssueArticlesOperation *)v7 initWithContext:v8 issues:*(void *)(a1 + 40)];

  id v10 = +[FCEdgeCacheHint edgeCacheHintForCurrentIssueArticles];
  [(FCIssueArticlesOperation *)v9 setEdgeCacheHint:v10];

  -[FCIssueArticlesOperation setMaxIssuesPerFetch:](v9, "setMaxIssuesPerFetch:", [*(id *)(a1 + 48) maxIssuesPerESLInventoryRequest]);
  __int16 v11 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [(FCOperation *)v9 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "will fetch issue feed items with operation: %{public}@", buf, 0xCu);
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke_22;
  id v19 = &unk_1E5B514F8;
  id v20 = v6;
  id v21 = v5;
  id v14 = v5;
  id v15 = v6;
  [(FCIssueArticlesOperation *)v9 setFetchCompletionHandler:&v16];
  [(FCOperation *)v9 start];
}

void __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v10 = (void (**)(id, id))*(id *)(a1 + 32);
    id v9 = v6;
    v10[2](v10, v9);
  }
  else
  {
    [v5 makeObjectsPerformSelector:sel_markAsEvergreen];
    id v7 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = [v5 count];
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "did fetch %lu issue feed items", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_promiseCuratedFeedItemsWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke;
  v9[3] = &unk_1E5B50378;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)[v5 initWithResolver:v9];

  return v7;
}

void __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCGlobalCuratedESLArticlesOperation alloc];
  id v8 = [*(id *)(a1 + 32) context];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) context];
  __int16 v11 = [(FCGlobalCuratedESLArticlesOperation *)v7 initWithContext:v8 configuration:v9 contentVariantProvider:v10];

  uint64_t v12 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    id v14 = [(FCOperation *)v11 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v14;
    _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "will fetch global evergreen feed items with operation: %{public}@", buf, 0xCu);
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke_26;
  id v20 = &unk_1E5B514F8;
  id v21 = v6;
  id v22 = v5;
  id v15 = v5;
  id v16 = v6;
  [(FCGlobalCuratedESLArticlesOperation *)v11 setCompletionHandler:&v17];
  [(FCOperation *)v11 start];
}

void __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v10 = (void (**)(id, id))*(id *)(a1 + 32);
    id v9 = v6;
    v10[2](v10, v9);
  }
  else
  {
    id v7 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = [v5 count];
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "did fetch %lu global evergreen feed items", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke_2(uint64_t a1)
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