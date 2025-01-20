@interface FCIssueArticlesOperation
- (BOOL)validateOperation;
- (FCEdgeCacheHint)edgeCacheHint;
- (FCIssueArticlesOperation)init;
- (FCIssueArticlesOperation)initWithContext:(id)a3 issueIDs:(id)a4;
- (FCIssueArticlesOperation)initWithContext:(id)a3 issues:(id)a4;
- (id)fetchCompletionHandler;
- (unint64_t)maxIssuesPerFetch;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setEdgeCacheHint:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setMaxIssuesPerFetch:(unint64_t)a3;
@end

@implementation FCIssueArticlesOperation

- (FCIssueArticlesOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueArticlesOperation init]";
    __int16 v9 = 2080;
    v10 = "FCIssueArticlesOperation.m";
    __int16 v11 = 1024;
    int v12 = 34;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssueArticlesOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCIssueArticlesOperation)initWithContext:(id)a3 issueIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCIssueArticlesOperation;
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

- (FCIssueArticlesOperation)initWithContext:(id)a3 issues:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_29);
  id v8 = [(FCIssueArticlesOperation *)self initWithContext:v6 issueIDs:v7];

  return v8;
}

uint64_t __51__FCIssueArticlesOperation_initWithContext_issues___block_invoke(uint64_t a1, void *a2)
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
      __int16 v9 = "-[FCIssueArticlesOperation validateOperation]";
      __int16 v10 = 2080;
      uint64_t v11 = "FCIssueArticlesOperation.m";
      __int16 v12 = 1024;
      int v13 = 63;
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
    __int16 v9 = "-[FCIssueArticlesOperation validateOperation]";
    __int16 v10 = 2080;
    uint64_t v11 = "FCIssueArticlesOperation.m";
    __int16 v12 = 1024;
    int v13 = 67;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  char v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke;
  v16[3] = &unk_1E5B4E758;
  v16[4] = self;
  char v3 = [MEMORY[0x1E4F81BF0] firstly:v16];
  char v4 = zalgo();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_2;
  v15[3] = &unk_1E5B4FCD8;
  v15[4] = self;
  v5 = [v3 thenOn:v4 then:v15];
  id v6 = zalgo();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_3;
  v14[3] = &unk_1E5B4FD00;
  v14[4] = self;
  id v7 = [v5 thenOn:v6 then:v14];
  int v8 = zalgo();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_4;
  v13[3] = &unk_1E5B4FD00;
  v13[4] = self;
  __int16 v9 = [v7 thenOn:v8 then:v13];
  __int16 v10 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_5;
  v12[3] = &unk_1E5B4FD28;
  v12[4] = self;
  id v11 = (id)[v9 errorOn:v10 error:v12];
}

id __44__FCIssueArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = [*(id *)(v1 + 392) configurationManager];
    char v3 = FCCoreConfigurationPromise(v2);
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

id __44__FCIssueArticlesOperation_performOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke;
    v5[3] = &unk_1E5B4EEF0;
    v5[4] = v1;
    char v3 = (void *)[v2 initWithResolver:v5];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

id __44__FCIssueArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__FCIssueArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke;
    v6[3] = &unk_1E5B4FD78;
    v6[4] = v2;
    char v3 = objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", v6);
    char v4 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:v3];
  }
  else
  {
    char v4 = 0;
  }
  return v4;
}

uint64_t __44__FCIssueArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 408), a2);
    char v4 = *(void **)(a1 + 32);
  }
  else
  {
    char v4 = 0;
  }
  [v4 finishedPerformingOperationWithError:0];
  return 0;
}

uint64_t __44__FCIssueArticlesOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  char v4 = [(FCIssueArticlesOperation *)self fetchCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCIssueArticlesOperation *)self fetchCompletionHandler];
    id v6 = (void *)v5;
    if (self) {
      resultFeedItems = self->_resultFeedItems;
    }
    else {
      resultFeedItems = 0;
    }
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, resultFeedItems, v8);
  }
}

void __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    __int16 v9 = *(void **)(v8 + 392);
  }
  else {
    __int16 v9 = 0;
  }
  __int16 v10 = [v9 internalContentContext];
  id v11 = [v10 contentDatabase];
  -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v11);

  int v13 = [*(id *)(a1 + 32) edgeCacheHint];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v12, v13, 416);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 400);
  }
  else {
    uint64_t v15 = 0;
  }
  -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v15);
  uint64_t v16 = [*(id *)(a1 + 32) maxIssuesPerFetch];
  if (v7) {
    v7->_maxBatchSize = v16;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2;
  v24[3] = &unk_1E5B4BF30;
  v24[4] = *(void *)(a1 + 32);
  v17 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v24);
  -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v17);

  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3;
  newValue[3] = &unk_1E5B4FD50;
  id v22 = v6;
  id v23 = v5;
  id v18 = v5;
  id v20 = v6;
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v19, newValue, 440);
  }
  [*(id *)(a1 + 32) associateChildOperation:v7];
  [(FCOperation *)v7 start];
}

void __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = objc_opt_new();
  id v6 = v4;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v5, @"Issue", 16);
    objc_setProperty_nonatomic_copy(v6, v7, MEMORY[0x1E4F1CBF0], 24);
  }
  v22[0] = @"contentArticleIDs";
  __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v8, v9, 32);
  }

  [v3 addObject:v6];
  __int16 v10 = objc_opt_new();
  __int16 v12 = v10;
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v11, @"Article", 16);
  }
  int v13 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 392);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [v15 internalContentContext];
  v17 = [v16 articleRecordSource];
  id v18 = [v13 keysForArticleRecordWithRecordSource:v17];
  id v20 = v18;
  if (v12)
  {
    objc_setProperty_nonatomic_copy(v12, v19, v18, 24);

    objc_setProperty_nonatomic_copy(v12, v21, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v12];
}

void __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    __int16 v9 = (void (**)(id, id))*(id *)(a1 + 32);
    id v8 = v6;
    v9[2](v9, v8);
  }
  else
  {
    SEL v7 = objc_msgSend(a2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_29);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Article"];

  return v3;
}

id __64__FCIssueArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke(uint64_t a1, void *a2)
{
  char v4 = (void *)MEMORY[0x1E4F82A50];
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[49];
  }
  id v6 = v5;
  id v7 = a2;
  id v8 = [v6 contentStoreFrontID];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    __int16 v10 = *(void **)(v9 + 392);
  }
  else {
    __int16 v10 = 0;
  }
  id v11 = [v10 internalContentContext];
  __int16 v12 = [v11 articleRecordSource];
  int v13 = [v4 feedItemFromCKRecord:v7 storefrontID:v8 recordSource:v12];

  return v13;
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (void)setEdgeCacheHint:(id)a3
{
}

- (unint64_t)maxIssuesPerFetch
{
  return self->_maxIssuesPerFetch;
}

- (void)setMaxIssuesPerFetch:(unint64_t)a3
{
  self->_maxIssuesPerFetch = a3;
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
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
}

@end