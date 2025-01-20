@interface FCSearchOperation
- (BOOL)shouldFetchFullHeadline;
- (BOOL)validateOperation;
- (FCCloudContext)cloudContext;
- (FCSearchOperation)initWithSearchText:(id)a3 cloudContext:(id)a4 parsecQueryID:(unint64_t)a5;
- (FCSearchResult)searchResult;
- (NSString)keyboardInputMode;
- (NSString)searchString;
- (double)scale;
- (id)_fetchFullHeadlineResultsForArticles:(id)a3;
- (id)_fetchResultsForArticlesWithBatchSize:(unint64_t)a3;
- (id)_fetchResultsForTagsWithBatchSize:(unint64_t)a3;
- (id)searchResultsBlock;
- (unint64_t)batchSize;
- (unint64_t)parsecQueryID;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setBatchSize:(unint64_t)a3;
- (void)setCloudContext:(id)a3;
- (void)setKeyboardInputMode:(id)a3;
- (void)setParsecQueryID:(unint64_t)a3;
- (void)setScale:(double)a3;
- (void)setSearchResult:(id)a3;
- (void)setSearchResultsBlock:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setShouldFetchFullHeadline:(BOOL)a3;
@end

@implementation FCSearchOperation

- (FCSearchOperation)initWithSearchText:(id)a3 cloudContext:(id)a4 parsecQueryID:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCSearchOperation;
  v11 = [(FCOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_searchString, a3);
    objc_storeStrong((id *)&v12->_cloudContext, a4);
    v12->_parsecQueryID = a5;
    v12->_shouldFetchFullHeadline = 0;
    uint64_t v13 = objc_opt_new();
    searchResult = v12->_searchResult;
    v12->_searchResult = (FCSearchResult *)v13;
  }
  return v12;
}

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(FCSearchOperation *)self cloudContext];

  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Search operation requires a cloud context"];
    int v5 = 136315906;
    v6 = "-[FCSearchOperation validateOperation]";
    __int16 v7 = 2080;
    v8 = "FCSearchOperation.m";
    __int16 v9 = 1024;
    int v10 = 87;
    __int16 v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
  }
  return v2 != 0;
}

- (void)performOperation
{
  unint64_t v3 = [(FCSearchOperation *)self batchSize];
  uint64_t v4 = 20;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__FCSearchOperation_performOperation__block_invoke;
  v14[3] = &unk_1E5B51D58;
  if (v3 > 0x14) {
    uint64_t v4 = v3;
  }
  v14[4] = self;
  v14[5] = v4;
  int v5 = [MEMORY[0x1E4F81BF0] firstly:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__FCSearchOperation_performOperation__block_invoke_2;
  v13[3] = &unk_1E5B5C960;
  v13[4] = self;
  v6 = [v5 then:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__FCSearchOperation_performOperation__block_invoke_3;
  v12[3] = &unk_1E5B5C988;
  v12[4] = self;
  __int16 v7 = [v6 then:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__FCSearchOperation_performOperation__block_invoke_4;
  v11[3] = &unk_1E5B5C988;
  v11[4] = self;
  v8 = [v7 then:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__FCSearchOperation_performOperation__block_invoke_5;
  v10[3] = &unk_1E5B4FD28;
  v10[4] = self;
  id v9 = (id)[v8 error:v10];
}

uint64_t __37__FCSearchOperation_performOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchResultsForTagsWithBatchSize:*(void *)(a1 + 40)];
}

uint64_t __37__FCSearchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 searchResult];
  [v5 setTagSearchResult:v4];

  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 batchSize];
  return [v6 _fetchResultsForArticlesWithBatchSize:v7];
}

id __37__FCSearchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldFetchFullHeadline])
  {
    id v4 = [*(id *)(a1 + 32) _fetchFullHeadlineResultsForArticles:v3];
  }
  else
  {
    id v4 = v3;
  }
  int v5 = v4;

  return v5;
}

uint64_t __37__FCSearchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 searchResult];
  [v5 setArticleSearchResult:v4];

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  return 0;
}

void __37__FCSearchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "fc_isCancellationError")) {
    id v3 = 0;
  }
  else {
    id v3 = v4;
  }
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v3];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCSearchOperation *)self searchResultsBlock];

  if (v4)
  {
    int v5 = [(FCSearchOperation *)self searchResultsBlock];
    v6 = [(FCSearchOperation *)self searchResult];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (id)_fetchResultsForTagsWithBatchSize:(unint64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke;
  v8[3] = &unk_1E5B553F8;
  v8[4] = self;
  v8[5] = a3;
  v6 = (void *)[v5 initWithResolver:v8];
  return v6;
}

void __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  v8 = [*(id *)(a1 + 32) cloudContext];
  id v9 = v8;
  if (v8)
  {
    if ([v8 conformsToProtocol:&unk_1EF8F8838]) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }
  id v11 = v10;
  [v7 setContentContext:v11];

  v12 = [*(id *)(a1 + 32) searchString];
  [v7 setSearchString:v12];

  [v7 setUserFacingTagOptions:3];
  [v7 setBatchSize:*(void *)(a1 + 40)];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke_2;
  v18 = &unk_1E5B5C9B0;
  id v19 = v6;
  id v20 = v5;
  id v13 = v5;
  id v14 = v6;
  [v7 setSearchResultsBlock:&v15];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v15, v16, v17, v18);
  [v7 start];
}

void __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v24 = (void (**)(id, id))*(id *)(a1 + 32);
    id v23 = v9;
    v24[2](v24, v23);
  }
  else
  {
    int v10 = objc_alloc_init(FCTagSearchOperationResult);
    if ([v7 count])
    {
      id v11 = [v7 underlyingStream];
      v12 = v11;
      if (v11) {
        id v13 = v11;
      }
      else {
        id v13 = (id)objc_opt_new();
      }
      id v14 = v13;

      uint64_t v15 = [v7 array];
      uint64_t v16 = [[FCStreamingResults alloc] initWithResults:v15 followedByStream:v14];
      [(FCTagSearchOperationResult *)v10 setChannels:v16];
    }
    if ([v8 count])
    {
      v17 = [v8 underlyingStream];
      v18 = v17;
      if (v17) {
        id v19 = v17;
      }
      else {
        id v19 = (id)objc_opt_new();
      }
      id v20 = v19;

      v21 = [v8 array];
      v22 = [[FCStreamingResults alloc] initWithResults:v21 followedByStream:v20];
      [(FCTagSearchOperationResult *)v10 setTopics:v22];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_fetchResultsForArticlesWithBatchSize:(unint64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke;
  v8[3] = &unk_1E5B553F8;
  v8[4] = self;
  v8[5] = a3;
  id v6 = (void *)[v5 initWithResolver:v8];
  return v6;
}

void __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = -[FCArticleSearchOperation initWithParsecQueryID:]([FCArticleSearchOperation alloc], "initWithParsecQueryID:", [*(id *)(a1 + 32) parsecQueryID]);
  id v8 = [*(id *)(a1 + 32) cloudContext];
  [(FCArticleSearchOperation *)v7 setCloudContext:v8];

  id v9 = [*(id *)(a1 + 32) searchString];
  [(FCArticleSearchOperation *)v7 setQuery:v9];

  [(FCArticleSearchOperation *)v7 setResultsLimit:*(void *)(a1 + 40)];
  int v10 = [*(id *)(a1 + 32) keyboardInputMode];
  [(FCArticleSearchOperation *)v7 setKeyboardInputMode:v10];

  [*(id *)(a1 + 32) scale];
  -[FCArticleSearchOperation setScale:](v7, "setScale:");
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke_2;
  uint64_t v16 = &unk_1E5B5C9D8;
  id v17 = v6;
  id v18 = v5;
  id v11 = v5;
  id v12 = v6;
  [(FCArticleSearchOperation *)v7 setArticleSearchCompletion:&v13];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v13, v14, v15, v16);
  [(FCOperation *)v7 start];
}

void __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v12 = (void (**)(id, id))*(id *)(a1 + 32);
    id v11 = v9;
    v12[2](v12, v11);
  }
  else
  {
    int v10 = objc_alloc_init(FCArticleSearchOperationResult);
    [(FCArticleSearchOperationResult *)v10 setArticles:v7];
    [(FCArticleSearchOperationResult *)v10 setFeedBack:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_fetchFullHeadlineResultsForArticles:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke;
  v9[3] = &unk_1E5B50378;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  id v7 = (void *)[v5 initWithResolver:v9];

  return v7;
}

void __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) articles];
  id v8 = [v7 array];

  id v9 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_198);
  id v10 = [FCArticleHeadlinesFetchOperation alloc];
  id v11 = [*(id *)(a1 + 40) cloudContext];
  id v12 = [(FCArticleHeadlinesFetchOperation *)v10 initWithContext:v11 articleIDs:v9 ignoreCacheForArticleIDs:0];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_3;
  v17[3] = &unk_1E5B5CA40;
  id v21 = v6;
  id v18 = v9;
  id v19 = v8;
  id v20 = *(id *)(a1 + 32);
  id v22 = v5;
  id v13 = v5;
  id v14 = v8;
  id v15 = v9;
  id v16 = v6;
  [(FCFetchOperation *)v12 setFetchCompletionBlock:v17];
  [*(id *)(a1 + 40) associateChildOperation:v12];
  [(FCOperation *)v12 start];
}

uint64_t __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

void __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_3(id *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 status])
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_4;
    v38[3] = &unk_1E5B4CC80;
    id v39 = v3;
    id v40 = a1[7];
    __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_4((uint64_t)v38);

    id v4 = v39;
  }
  else
  {
    id v33 = v3;
    id v5 = [v3 fetchedObject];
    id v4 = objc_msgSend(v5, "fc_dictionaryWithKeyBlock:", &__block_literal_global_234_0);

    id v6 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      uint64_t v8 = [v4 count];
      uint64_t v9 = [a1[4] count];
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v8;
      __int16 v44 = 2048;
      uint64_t v45 = v9;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_INFO, "inflated %lu of %lu search results", buf, 0x16u);
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v32 = a1;
    id v11 = a1[5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v17 = objc_msgSend(v16, "articleID", v32);
          id v18 = [v4 objectForKey:v17];

          id v19 = v16;
          id v20 = v19;
          if (v18)
          {
            [v19 setInflatedHeadline:v18];
          }
          else
          {
            id v21 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              id v22 = v21;
              id v23 = [v20 articleID];
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = (uint64_t)v23;
              _os_log_error_impl(&dword_1A460D000, v22, OS_LOG_TYPE_ERROR, "failed to inflate search result headline with article ID: %@", buf, 0xCu);
            }
          }
          [v10 addObject:v20];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v13);
    }

    v24 = [v32[6] articles];
    v25 = [v24 underlyingStream];
    v26 = v25;
    if (v25) {
      id v27 = v25;
    }
    else {
      id v27 = (id)objc_opt_new();
    }
    v28 = v27;

    v29 = objc_alloc_init(FCArticleSearchOperationResult);
    v30 = [(FCStreamingResults *)[FCArticleStreamingResults alloc] initWithResults:v10 followedByStream:v28];
    [(FCArticleSearchOperationResult *)v29 setArticles:v30];

    v31 = [v32[6] feedBack];
    [(FCArticleSearchOperationResult *)v29 setFeedBack:v31];

    (*((void (**)(void))v32[8] + 2))();
    id v3 = v33;
  }
}

void __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v2;
    id v7 = [v5 error];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to inflate search result headlines with error: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

uint64_t __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_231(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
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

- (BOOL)shouldFetchFullHeadline
{
  return self->_shouldFetchFullHeadline;
}

- (void)setShouldFetchFullHeadline:(BOOL)a3
{
  self->_shouldFetchFullHeadline = a3;
}

- (id)searchResultsBlock
{
  return self->_searchResultsBlock;
}

- (void)setSearchResultsBlock:(id)a3
{
}

- (FCSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end