@interface FCHeadlinesUpdateOperation
- (BOOL)validateOperation;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (FCHeadlinesUpdateOperation)init;
- (NSArray)headlines;
- (NSDictionary)resultHeadlinesByArticleID;
- (double)maxArticleAge;
- (id)updateCompletion;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setHeadlines:(id)a3;
- (void)setMaxArticleAge:(double)a3;
- (void)setResultHeadlinesByArticleID:(id)a3;
- (void)setUpdateCompletion:(id)a3;
@end

@implementation FCHeadlinesUpdateOperation

- (FCHeadlinesUpdateOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCHeadlinesUpdateOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(FCHeadlinesUpdateOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"update headlines operation requires context"];
    int v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    __int16 v19 = 1024;
    int v20 = 40;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  v4 = [(FCHeadlinesUpdateOperation *)self configuration];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)[[NSString alloc] initWithFormat:@"update headlines operation requires configuration"];
    int v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    __int16 v19 = 1024;
    int v20 = 44;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  v5 = [(FCHeadlinesUpdateOperation *)self headlines];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"update headlines operation requires headlines"];
    int v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    __int16 v19 = 1024;
    int v20 = 48;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  v6 = [(FCHeadlinesUpdateOperation *)self updateCompletion];

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)[[NSString alloc] initWithFormat:@"update headlines operation requires completion"];
    int v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    __int16 v19 = 1024;
    int v20 = 52;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7 && v5 != 0 && v6 != 0;
}

- (void)performOperation
{
  objc_super v3 = [(FCHeadlinesUpdateOperation *)self headlines];
  v4 = objc_msgSend(v3, "fc_dictionaryWithKeyBlock:", &__block_literal_global_31);

  v5 = [(FCHeadlinesUpdateOperation *)self context];
  v6 = [v5 internalContentContext];
  BOOL v7 = [v6 articleRecordSource];

  v8 = [v4 allKeys];
  v9 = [v7 fetchOperationForRecordsWithIDs:v8];

  [v9 setCachePolicy:4];
  [(FCHeadlinesUpdateOperation *)self maxArticleAge];
  objc_msgSend(v9, "setMaximumCachedAge:");
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_2;
  v14 = &unk_1E5B4BEC0;
  int v15 = self;
  id v16 = v4;
  id v10 = v4;
  [v9 setFetchCompletionBlock:&v11];
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v9, v11, v12, v13, v14, v15);
  [v9 start];
}

uint64_t __46__FCHeadlinesUpdateOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

void __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 status])
  {
    v4 = [*(id *)(a1 + 32) configuration];
    v5 = -[FCHeadlineExperimentalTitleProvider initWithShouldShowAlternateHeadlines:]([FCHeadlineExperimentalTitleProvider alloc], "initWithShouldShowAlternateHeadlines:", [v4 shouldShowAlternateHeadlines]);
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_3;
    v12[3] = &unk_1E5B50100;
    id v13 = v3;
    id v14 = *(id *)(a1 + 40);
    id v15 = v4;
    uint64_t v16 = *(void *)(a1 + 32);
    __int16 v17 = v5;
    BOOL v7 = v5;
    id v8 = v4;
    v9 = objc_msgSend(v6, "fc_dictionary:", v12);
    [*(id *)(a1 + 32) setResultHeadlinesByArticleID:v9];
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v3 error];
  [v10 finishedPerformingOperationWithError:v11];
}

void __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) fetchedObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_4;
  v10[3] = &unk_1E5B500D8;
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = *(void **)(a1 + 64);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v4;
  id v16 = v7;
  id v8 = v4;
  id v9 = v3;
  [v8 enumerateRecordsAndInterestTokensWithBlock:v10];
}

void __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 base];
  v4 = [v3 identifier];

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 sourceChannel];
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = [v6 identifier];
    int v20 = v8;
    v21[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v10 = [v5 parentIssue];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 identifier];
    v18 = v12;
    __int16 v19 = v11;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v14 = *(void **)(a1 + 48);
  id v15 = [*(id *)(a1 + 56) context];
  id v16 = [v15 assetManager];
  __int16 v17 = FCHeadlineWithHeldRecords(v14, v16, v4, *(void **)(a1 + 64), v9, 0, v13, *(void **)(a1 + 72));
  [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v4];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [(FCHeadlinesUpdateOperation *)self updateCompletion];
  id v5 = [(FCHeadlinesUpdateOperation *)self resultHeadlinesByArticleID];
  v6[2](v6, v5, v4);
}

- (NSArray)headlines
{
  return self->_headlines;
}

- (void)setHeadlines:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (double)maxArticleAge
{
  return self->_maxArticleAge;
}

- (void)setMaxArticleAge:(double)a3
{
  self->_maxArticleAge = a3;
}

- (id)updateCompletion
{
  return self->_updateCompletion;
}

- (void)setUpdateCompletion:(id)a3
{
}

- (NSDictionary)resultHeadlinesByArticleID
{
  return self->_resultHeadlinesByArticleID;
}

- (void)setResultHeadlinesByArticleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleID, 0);
  objc_storeStrong(&self->_updateCompletion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_headlines, 0);
}

@end