@interface FCIssueHeadlinesFetchOperation
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicy;
- (FCIssueHeadlinesFetchOperation)init;
- (FCIssueHeadlinesFetchOperation)initWithContext:(id)a3 issueIDs:(id)a4;
- (FCIssueHeadlinesFetchOperation)initWithContext:(id)a3 issues:(id)a4;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachePolicy:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCIssueHeadlinesFetchOperation

- (FCIssueHeadlinesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueHeadlinesFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCIssueHeadlinesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 47;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssueHeadlinesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCIssueHeadlinesFetchOperation)initWithContext:(id)a3 issueIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCIssueHeadlinesFetchOperation;
  __int16 v9 = [(FCOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    uint64_t v11 = [v8 copy];
    issueIDs = v10->_issueIDs;
    v10->_issueIDs = (NSArray *)v11;
  }
  return v10;
}

- (FCIssueHeadlinesFetchOperation)initWithContext:(id)a3 issues:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_108);
  id v8 = [(FCIssueHeadlinesFetchOperation *)self initWithContext:v6 issueIDs:v7];

  return v8;
}

uint64_t __57__FCIssueHeadlinesFetchOperation_initWithContext_issues___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)[[NSString alloc] initWithFormat:@"channel issues fetch operation requires a context"];
      int v8 = 136315906;
      __int16 v9 = "-[FCIssueHeadlinesFetchOperation validateOperation]";
      __int16 v10 = 2080;
      uint64_t v11 = "FCIssueHeadlinesFetchOperation.m";
      __int16 v12 = 1024;
      int v13 = 76;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
    }
    char v3 = 0;
    if (!self) {
      goto LABEL_9;
    }
  }
  if (self->_issueIDs)
  {
    char v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"issues headlines fetch operation requires issue IDs"];
    int v8 = 136315906;
    __int16 v9 = "-[FCIssueHeadlinesFetchOperation validateOperation]";
    __int16 v10 = 2080;
    uint64_t v11 = "FCIssueHeadlinesFetchOperation.m";
    __int16 v12 = 1024;
    int v13 = 80;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  char v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__47;
  v14[4] = __Block_byref_object_dispose__47;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke;
  v13[3] = &unk_1E5B4E758;
  v13[4] = self;
  char v3 = [MEMORY[0x1E4F81BF0] firstly:v13];
  char v4 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_2;
  v12[3] = &unk_1E5B51460;
  v12[4] = self;
  v12[5] = v14;
  v5 = [v3 thenOn:v4 then:v12];
  id v6 = zalgo();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3;
  v11[3] = &unk_1E5B56D28;
  v11[4] = self;
  v11[5] = v14;
  id v7 = [v5 thenOn:v6 then:v11];
  int v8 = zalgo();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_8;
  v10[3] = &unk_1E5B4FD28;
  v10[4] = self;
  id v9 = (id)[v7 errorOn:v8 error:v10];

  _Block_object_dispose(v14, 8);
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = [*(id *)(v1 + 384) configurationManager];
    char v3 = FCCoreConfigurationPromise(v2);
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke;
    v8[3] = &unk_1E5B4EEF0;
    v8[4] = v5;
    v5 = (void *)[v6 initWithResolver:v8];
  }

  return v5;
}

uint64_t __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:&unk_1EF8D7F50];
  v5 = [v3 objectForKeyedSubscript:&unk_1EF8D7F68];
  uint64_t v6 = [v3 objectForKeyedSubscript:&unk_1EF8D7F80];

  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id v7 = (void *)v7[48];
  }
  int v8 = v7;
  id v9 = [v8 tagController];
  v44 = (void *)v6;
  __int16 v10 = [v9 channelsForTagRecords:v6];

  uint64_t v11 = *(void **)(a1 + 32);
  __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v11) {
    uint64_t v11 = (void *)v11[48];
  }
  int v13 = v11;
  __int16 v14 = [v13 assetManager];
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = [v5 allRecordIDs];
  v17 = [v15 setWithArray:v16];
  v43 = FCHeadlinesByArticleIDFromHeldRecords(v12, v14, v17, v5, v10, v4, 1, 1);

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_22;
  v52[3] = &unk_1E5B50240;
  id v18 = v10;
  uint64_t v19 = *(void *)(a1 + 32);
  id v42 = v18;
  id v53 = v18;
  uint64_t v54 = v19;
  v41 = [v4 transformRecordsByIDWithBlock:v52];
  v20 = [FCMultiAccessChecker alloc];
  v21 = objc_opt_new();
  v55[0] = v21;
  v22 = [FCStorefrontAccessChecker alloc];
  v23 = *(void **)(a1 + 32);
  v45 = v5;
  v24 = v4;
  if (v23) {
    v23 = (void *)v23[48];
  }
  v25 = v23;
  v26 = [v25 privateChannelMembershipController];
  v27 = [(FCStorefrontAccessChecker *)v22 initWithPrivateChannelMembershipController:v26];
  v55[1] = v27;
  v28 = objc_opt_new();
  v55[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
  v30 = [(FCMultiAccessChecker *)v20 initWithAccessCheckers:v29];

  uint64_t v31 = *(void *)(a1 + 32);
  if (v31) {
    v32 = *(void **)(v31 + 384);
  }
  else {
    v32 = 0;
  }
  v33 = [v32 networkReachability];
  uint64_t v34 = [v33 offlineReason];

  if (v34)
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3_34;
    v49[3] = &unk_1E5B4D3D0;
    v49[4] = *(void *)(a1 + 32);
    id v50 = v41;
    id v51 = v43;
    if (__50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3_34((uint64_t)v49))
    {
      v35 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_offlineErrorWithReason:", v34);
      [*(id *)(a1 + 32) finishedPerformingOperationWithError:v35];

      id v36 = v50;
      goto LABEL_16;
    }
  }
  v37 = [v41 allValues];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_6;
  v46[3] = &unk_1E5B56D00;
  id v47 = v43;
  v48 = v30;
  v38 = objc_msgSend(v37, "fc_dictionaryWithValueBlock:", v46);
  uint64_t v39 = *(void *)(a1 + 32);
  if (v39) {
    objc_storeStrong((id *)(v39 + 400), v38);
  }

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  id v36 = v47;
LABEL_16:

  return 0;
}

FCIssue *__50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  int v8 = [v5 channelTagID];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [FCIssue alloc];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      int v13 = *(void **)(v12 + 384);
    }
    else {
      int v13 = 0;
    }
    __int16 v14 = [v13 assetManager];
    id v15 = [(FCIssue *)v11 initWithIssueRecord:v5 assetManager:v14 interestToken:v6 sourceChannel:v10];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3_34(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[49];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    uint64_t v18 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(a1 + 40) objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (!v8)
        {
LABEL_21:
          uint64_t v16 = 1;
          goto LABEL_23;
        }
        id v9 = v8;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = [v9 allArticleIDs];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(a1 + 48) objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * j)];

              if (!v15)
              {

                goto LABEL_21;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v18;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      uint64_t v16 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_23:

  return v16;
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 allArticleIDs];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_7;
  v6[3] = &unk_1E5B4C4A8;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v6);

  return v4;
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([*(id *)(a1 + 40) hasAccessToItem:v3 blockedReason:0 error:0]) {
      id v3 = v4;
    }
    else {
      id v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

uint64_t __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(FCIssueHeadlinesFetchOperation *)self fetchCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCIssueHeadlinesFetchOperation *)self fetchCompletionHandler];
    uint64_t v6 = (void *)v5;
    if (self) {
      resultHeadlinesByIssue = self->_resultHeadlinesByIssue;
    }
    else {
      resultHeadlinesByIssue = 0;
    }
    (*(void (**)(uint64_t, NSDictionary *, id))(v5 + 16))(v5, resultHeadlinesByIssue, v8);
  }
}

void __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(FCRecordChainFetchOperation);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 384);
  }
  else {
    uint64_t v10 = 0;
  }
  [(FCRecordChainFetchOperation *)v7 setContext:v10];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 392);
  }
  else {
    uint64_t v12 = 0;
  }
  [(FCRecordChainFetchOperation *)v8 setTopLevelRecordIDs:v12];
  v28[0] = @"Issue";
  v27 = @"allArticleIDs";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v29[0] = v13;
  v28[1] = @"Article";
  long long v26 = @"sourceChannelTagID";
  __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v28[2] = @"Tag";
  v29[1] = v14;
  v29[2] = MEMORY[0x1E4F1CBF0];
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  [(FCRecordChainFetchOperation *)v8 setLinkKeysByRecordType:v15];

  uint64_t v16 = [*(id *)(a1 + 32) cachePolicy];

  if (v16)
  {
    long long v24 = @"Issue";
    v17 = [*(id *)(a1 + 32) cachePolicy];
    long long v25 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [(FCRecordChainFetchOperation *)v8 setCachePoliciesByRecordType:v18];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke_2;
  v21[3] = &unk_1E5B53E98;
  id v22 = v5;
  id v23 = v6;
  id v19 = v6;
  id v20 = v5;
  [(FCRecordChainFetchOperation *)v8 setRecordChainCompletionHandler:v21];
  [*(id *)(a1 + 32) associateChildOperation:v8];
  [(FCOperation *)v8 start];
}

uint64_t __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(id)a3
{
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
  objc_storeStrong((id *)&self->_resultHeadlinesByIssue, 0);
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end