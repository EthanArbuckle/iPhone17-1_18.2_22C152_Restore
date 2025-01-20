@interface FCParsecArticleSearchOperation
- (BOOL)validateOperation;
- (FCContentContext)contentContext;
- (FCParsecArticleSearchOperation)initWithMoreResults:(id)a3 parsecQueryID:(unint64_t)a4;
- (NSArray)results;
- (NSString)keyboardInputMode;
- (NSString)query;
- (SFMoreResults)moreResults;
- (SFRankingFeedback)previousRankingFeedback;
- (SFRankingFeedback)rankingFeedback;
- (double)scale;
- (id)_rankingFeedbackWithSection:(id)a3;
- (id)articleSearchCompletionHandler;
- (unint64_t)batchSize;
- (unint64_t)parsecQueryID;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArticleSearchCompletionHandler:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setContentContext:(id)a3;
- (void)setKeyboardInputMode:(id)a3;
- (void)setMoreResults:(id)a3;
- (void)setParsecQueryID:(unint64_t)a3;
- (void)setPreviousRankingFeedback:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRankingFeedback:(id)a3;
- (void)setResults:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation FCParsecArticleSearchOperation

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(FCParsecArticleSearchOperation *)self query];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"article search operation requires a query"];
    int v9 = 136315906;
    v10 = "-[FCParsecArticleSearchOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCParsecArticleSearchOperation.m";
    __int16 v13 = 1024;
    int v14 = 40;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  v4 = [(FCParsecArticleSearchOperation *)self articleSearchCompletionHandler];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"article search operation requires a completion"];
    int v9 = 136315906;
    v10 = "-[FCParsecArticleSearchOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCParsecArticleSearchOperation.m";
    __int16 v13 = 1024;
    int v14 = 44;
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

- (FCParsecArticleSearchOperation)initWithMoreResults:(id)a3 parsecQueryID:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCParsecArticleSearchOperation;
  v8 = [(FCOperation *)&v11 init];
  int v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_moreResults, a3);
    v9->_parsecQueryID = a4;
  }

  return v9;
}

- (void)performOperation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(FCParsecArticleSearchOperation *)self previousRankingFeedback];
  if (v3)
  {
  }
  else
  {
    v4 = [(FCParsecArticleSearchOperation *)self moreResults];

    if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)[[NSString alloc] initWithFormat:@"must have previous ranking feedback when fetching more results"];
      *(_DWORD *)buf = 136315906;
      v16 = "-[FCParsecArticleSearchOperation performOperation]";
      __int16 v17 = 2080;
      v18 = "FCParsecArticleSearchOperation.m";
      __int16 v19 = 1024;
      int v20 = 64;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  BOOL v5 = [(FCParsecArticleSearchOperation *)self moreResults];

  if (v5)
  {
    v6 = [(FCParsecArticleSearchOperation *)self moreResults];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__FCParsecArticleSearchOperation_performOperation__block_invoke;
    v14[3] = &unk_1E5B4C8F8;
    v14[4] = self;
    [v6 loadSearchResultsWithCompletionAndErrorHandler:v14];
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F5CBD8], "fc_sharedParsecSession");
    id v7 = (void *)MEMORY[0x1E4F5CBB0];
    v8 = [(FCParsecArticleSearchOperation *)self query];
    int v9 = objc_msgSend(v7, "searchRequestWithString:triggerEvent:queryId:", v8, 1, -[FCParsecArticleSearchOperation parsecQueryID](self, "parsecQueryID"));

    v10 = [(FCParsecArticleSearchOperation *)self keyboardInputMode];
    [v9 setKeyboardInputMode:v10];

    [(FCParsecArticleSearchOperation *)self scale];
    objc_msgSend(v9, "setScale:");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__FCParsecArticleSearchOperation_performOperation__block_invoke_3;
    v13[3] = &unk_1E5B53CC8;
    v13[4] = self;
    objc_super v11 = [v6 taskWithRequest:v9 completion:v13];
    [v11 resume];
  }
}

void __50__FCParsecArticleSearchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    __int16 v19 = *(void **)(a1 + 32);
    id v20 = v6;
    objc_msgSend(v19, "finishedPerformingOperationWithError:", v20, v18, 3221225472, __50__FCParsecArticleSearchOperation_performOperation__block_invoke_2, &unk_1E5B4BE70, v19);
  }
  else
  {
    if (v5 && [v5 count])
    {
      objc_opt_class();
      v8 = [v5 lastObject];
      int v9 = [v8 moreResults];
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      id v11 = v10;
      [*(id *)(a1 + 32) setMoreResults:v11];

      [*(id *)(a1 + 32) setResults:v5];
    }
    else
    {
      [*(id *)(a1 + 32) setResults:MEMORY[0x1E4F1CBF0]];
      [*(id *)(a1 + 32) setMoreResults:0];
    }
    v12 = *(void **)(a1 + 32);
    __int16 v13 = [v12 previousRankingFeedback];
    int v14 = [v13 sections];
    __int16 v15 = [v14 firstObject];
    v16 = [v15 section];
    __int16 v17 = [v12 _rankingFeedbackWithSection:v16];
    [*(id *)(a1 + 32) setRankingFeedback:v17];

    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

uint64_t __50__FCParsecArticleSearchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __50__FCParsecArticleSearchOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v20 = v6;
  if (!v6)
  {
    id v7 = a3;
    uint64_t v8 = [v7 results];
    int v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (v8) {
      v10 = (void *)v8;
    }
    id v11 = v10;

    if ([v11 count])
    {
      objc_opt_class();
      v12 = [v11 lastObject];
      __int16 v13 = [v12 moreResults];
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
      }
      else
      {
        int v14 = 0;
      }
      id v15 = v14;
      [*(id *)(a1 + 32) setMoreResults:v15];

      [*(id *)(a1 + 32) setResults:v11];
    }
    else
    {
      [*(id *)(a1 + 32) setResults:MEMORY[0x1E4F1CBF0]];
      [*(id *)(a1 + 32) setMoreResults:0];
    }
    v16 = *(void **)(a1 + 32);
    __int16 v17 = [v7 sections];

    uint64_t v18 = [v17 firstObject];
    __int16 v19 = [v16 _rankingFeedbackWithSection:v18];
    [*(id *)(a1 + 32) setRankingFeedback:v19];

    id v6 = 0;
  }
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(FCParsecArticleSearchOperation *)self rankingFeedback];
  unint64_t v6 = v4 | v5;

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v14 = (void *)[[NSString alloc] initWithFormat:@"successful parsec search operation should always have ranking feedback"];
    int v15 = 136315906;
    v16 = "-[FCParsecArticleSearchOperation operationWillFinishWithError:]";
    __int16 v17 = 2080;
    uint64_t v18 = "FCParsecArticleSearchOperation.m";
    __int16 v19 = 1024;
    int v20 = 130;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  id v7 = [(FCParsecArticleSearchOperation *)self rankingFeedback];

  if (!v7)
  {
    uint64_t v8 = [(FCParsecArticleSearchOperation *)self previousRankingFeedback];
    [(FCParsecArticleSearchOperation *)self setRankingFeedback:v8];
  }
  int v9 = [(FCParsecArticleSearchOperation *)self articleSearchCompletionHandler];

  if (v9)
  {
    v10 = [(FCParsecArticleSearchOperation *)self articleSearchCompletionHandler];
    id v11 = [(FCParsecArticleSearchOperation *)self results];
    v12 = [(FCParsecArticleSearchOperation *)self moreResults];
    __int16 v13 = [(FCParsecArticleSearchOperation *)self rankingFeedback];
    ((void (**)(void, void *, void *, void *, unint64_t))v10)[2](v10, v11, v12, v13, v4);
  }
}

- (id)_rankingFeedbackWithSection:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v4 = (void *)[a3 copy];
    uint64_t v5 = [(FCParsecArticleSearchOperation *)self results];
    [v4 setResults:v5];

    unint64_t v6 = [(FCParsecArticleSearchOperation *)self previousRankingFeedback];
    id v7 = [v6 sections];
    uint64_t v8 = [v7 firstObject];
    int v9 = [v8 results];
    v10 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_58);

    id v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = [(FCParsecArticleSearchOperation *)self results];
    __int16 v13 = objc_msgSend(v11, "fc_arrayByAddingObjectsFromArray:toArray:", v12, v10);

    int v14 = objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &__block_literal_global_21_0);
    int v15 = (void *)[objc_alloc(MEMORY[0x1E4F9A3F0]) initWithResults:v14 section:v4 localSectionPosition:0 personalizationScore:0.0];
    v19[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    v16 = 0;
  }
  __int16 v17 = (void *)[objc_alloc(MEMORY[0x1E4F9A318]) initWithSections:v16 blendingDuration:0.0];

  return v17;
}

uint64_t __62__FCParsecArticleSearchOperation__rankingFeedbackWithSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 result];
}

id __62__FCParsecArticleSearchOperation__rankingFeedbackWithSection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F9A360];
  id v3 = a2;
  unint64_t v4 = (void *)[[v2 alloc] initWithResult:v3 hiddenResults:0 duplicateResults:0 localResultPosition:0];

  return v4;
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
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (SFRankingFeedback)previousRankingFeedback
{
  return self->_previousRankingFeedback;
}

- (void)setPreviousRankingFeedback:(id)a3
{
}

- (id)articleSearchCompletionHandler
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setArticleSearchCompletionHandler:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void)setRankingFeedback:(id)a3
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

- (SFMoreResults)moreResults
{
  return self->_moreResults;
}

- (void)setMoreResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreResults, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_articleSearchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_previousRankingFeedback, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_keyboardInputMode, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end