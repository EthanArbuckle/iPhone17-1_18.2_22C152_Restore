@interface FCArticleSearchOperation
- (BOOL)validateOperation;
- (FCArticleSearchOperation)initWithParsecQueryID:(unint64_t)a3;
- (FCArticleSearchOperationFeedbackResult)feedbackResult;
- (FCArticleStreamingResults)results;
- (FCCloudContext)cloudContext;
- (NSError)searchError;
- (NSString)keyboardInputMode;
- (NSString)query;
- (double)scale;
- (id)articleSearchCompletion;
- (unint64_t)parsecQueryID;
- (unint64_t)resultsLimit;
- (void)_performSearchQuery:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArticleSearchCompletion:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setFeedbackResult:(id)a3;
- (void)setKeyboardInputMode:(id)a3;
- (void)setParsecQueryID:(unint64_t)a3;
- (void)setQuery:(id)a3;
- (void)setResults:(id)a3;
- (void)setResultsLimit:(unint64_t)a3;
- (void)setScale:(double)a3;
- (void)setSearchError:(id)a3;
@end

@implementation FCArticleSearchOperation

- (FCArticleSearchOperation)initWithParsecQueryID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCArticleSearchOperation;
  result = [(FCOperation *)&v5 init];
  if (result) {
    result->_parsecQueryID = a3;
  }
  return result;
}

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(FCArticleSearchOperation *)self query];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"article search operation requires a query"];
    int v9 = 136315906;
    v10 = "-[FCArticleSearchOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCArticleSearchOperation.m";
    __int16 v13 = 1024;
    int v14 = 80;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  v4 = [(FCArticleSearchOperation *)self articleSearchCompletion];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"article search operation requires a completion"];
    int v9 = 136315906;
    v10 = "-[FCArticleSearchOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCArticleSearchOperation.m";
    __int16 v13 = 1024;
    int v14 = 84;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)performOperation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__FCArticleSearchOperation_performOperation__block_invoke;
  v2[3] = &unk_1E5B58908;
  v2[4] = self;
  [(FCArticleSearchOperation *)self _performSearchQuery:v2];
}

void __44__FCArticleSearchOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v7 = *(void **)(a1 + 32);
  id v9 = a4;
  id v8 = a3;
  [v7 setResults:a2];
  [*(id *)(a1 + 32) setFeedbackResult:v8];

  [*(id *)(a1 + 32) setSearchError:v9];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v9];
}

- (void)_performSearchQuery:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[FCArticleSearchStream alloc] initWithParsecQueryID:[(FCArticleSearchOperation *)self parsecQueryID]];
  v6 = [(FCArticleSearchOperation *)self cloudContext];
  [(FCArticleSearchStream *)v5 setCloudContext:v6];

  v7 = [(FCArticleSearchOperation *)self query];
  [(FCArticleSearchStream *)v5 setQuery:v7];

  id v8 = [(FCArticleSearchOperation *)self keyboardInputMode];
  [(FCArticleSearchStream *)v5 setKeyboardInputMode:v8];

  [(FCArticleSearchOperation *)self scale];
  -[FCArticleSearchStream setScale:](v5, "setScale:");
  unint64_t v9 = [(FCArticleSearchOperation *)self resultsLimit];
  uint64_t v10 = [(FCArticleSearchOperation *)self qualityOfService];
  __int16 v11 = FCDispatchQueueForQualityOfService([(FCArticleSearchOperation *)self qualityOfService]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __48__FCArticleSearchOperation__performSearchQuery___block_invoke;
  v18 = &unk_1E5B58930;
  v19 = v5;
  id v20 = v4;
  v12 = v5;
  id v13 = v4;
  int v14 = [(FCArticleSearchStream *)v12 fetchMoreResultsWithLimit:v9 qualityOfService:v10 callbackQueue:v11 completionHandler:&v15];

  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v14, v15, v16, v17, v18);
}

void __48__FCArticleSearchOperation__performSearchQuery___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "fc_isCancellationError");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = [(FCStreamingResults *)[FCArticleStreamingResults alloc] initWithResults:v11 followedByStream:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(FCArticleSearchOperation *)self articleSearchCompletion];

  if (v4)
  {
    BOOL v5 = [(FCArticleSearchOperation *)self articleSearchCompletion];
    v6 = [(FCArticleSearchOperation *)self results];
    id v7 = [(FCArticleSearchOperation *)self feedbackResult];
    ((void (**)(void, void *, void *, id))v5)[2](v5, v6, v7, v8);
  }
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSString)keyboardInputMode
{
  return self->_keyboardInputMode;
}

- (void)setKeyboardInputMode:(id)a3
{
  self->_keyboardInputMode = (NSString *)a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
}

- (id)articleSearchCompletion
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setArticleSearchCompletion:(id)a3
{
}

- (unint64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(unint64_t)a3
{
  self->_parsecQueryID = a3;
}

- (FCArticleStreamingResults)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSError)searchError
{
  return self->_searchError;
}

- (void)setSearchError:(id)a3
{
}

- (FCArticleSearchOperationFeedbackResult)feedbackResult
{
  return self->_feedbackResult;
}

- (void)setFeedbackResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackResult, 0);
  objc_storeStrong((id *)&self->_searchError, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_articleSearchCompletion, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end