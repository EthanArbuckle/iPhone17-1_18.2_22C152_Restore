@interface FCArticleSearchStream
- (BOOL)fetching;
- (BOOL)isFinished;
- (FCArticleSearchStream)initWithParsecQueryID:(unint64_t)a3;
- (FCCloudContext)cloudContext;
- (NSMutableOrderedSet)articleSearchResults;
- (NSString)keyboardInputMode;
- (NSString)query;
- (SFMoreResults)moreResults;
- (SFRankingFeedback)rankingFeedback;
- (double)scale;
- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (unint64_t)parsecQueryID;
- (void)setArticleSearchResults:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setFetching:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setKeyboardInputMode:(id)a3;
- (void)setMoreResults:(id)a3;
- (void)setParsecQueryID:(unint64_t)a3;
- (void)setQuery:(id)a3;
- (void)setRankingFeedback:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation FCArticleSearchStream

- (FCArticleSearchStream)initWithParsecQueryID:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FCArticleSearchStream;
  v4 = [(FCArticleSearchStream *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_parsecQueryID = a3;
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    articleSearchResults = v5->_articleSearchResults;
    v5->_articleSearchResults = v6;
  }
  return v5;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_super v9 = a5;
  id v10 = a6;
  if ([(FCArticleSearchStream *)self isFinished])
  {
    v11 = 0;
    if (v9 && v10)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
      block[3] = &unk_1E5B4CA88;
      id v28 = v10;
      dispatch_async(v9, block);

      v11 = 0;
    }
  }
  else
  {
    if ([(FCArticleSearchStream *)self fetching]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)[[NSString alloc] initWithFormat:@"shouldn't ask a stream for more results while it's fetching"];
      *(_DWORD *)buf = 136315906;
      v30 = "-[FCArticleSearchStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
      __int16 v31 = 2080;
      v32 = "FCArticleSearchOperation.m";
      __int16 v33 = 1024;
      int v34 = 172;
      __int16 v35 = 2114;
      v36 = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    [(FCArticleSearchStream *)self setFetching:1];
    v12 = [FCParsecArticleSearchOperation alloc];
    v13 = [(FCArticleSearchStream *)self moreResults];
    v11 = [(FCParsecArticleSearchOperation *)v12 initWithMoreResults:v13 parsecQueryID:[(FCArticleSearchStream *)self parsecQueryID]];

    v14 = [(FCArticleSearchStream *)self cloudContext];
    [(FCParsecArticleSearchOperation *)v11 setContentContext:v14];

    v15 = [(FCArticleSearchStream *)self query];
    [(FCParsecArticleSearchOperation *)v11 setQuery:v15];

    v16 = [(FCArticleSearchStream *)self keyboardInputMode];
    [(FCParsecArticleSearchOperation *)v11 setKeyboardInputMode:v16];

    [(FCArticleSearchStream *)self scale];
    -[FCParsecArticleSearchOperation setScale:](v11, "setScale:");
    v17 = [(FCArticleSearchStream *)self rankingFeedback];
    [(FCParsecArticleSearchOperation *)v11 setPreviousRankingFeedback:v17];

    [(FCOperation *)v11 setRelativePriority:1];
    [(FCOperation *)v11 setQualityOfService:a4];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_108;
    v23 = &unk_1E5B58980;
    v24 = self;
    id v26 = v10;
    v25 = v9;
    [(FCParsecArticleSearchOperation *)v11 setArticleSearchCompletionHandler:&v20];
    [(FCOperation *)v11 start];
  }
  return v11;
}

uint64_t __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_108(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
  v22[3] = &unk_1E5B58958;
  v22[4] = *(void *)(a1 + 32);
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(a2, "fc_orderedSetByTransformingWithBlock:", v22);
  v13 = [*(id *)(a1 + 32) articleSearchResults];
  [v13 unionOrderedSet:v12];

  [*(id *)(a1 + 32) setMoreResults:v11];
  [*(id *)(a1 + 32) setRankingFeedback:v10];
  [*(id *)(a1 + 32) setFinished:v11 == 0];
  [*(id *)(a1 + 32) setFetching:0];
  v14 = [[FCArticleSearchOperationFeedbackResult alloc] initWithSearchOperationRankingFeedBack:v10];

  v15 = *(void **)(a1 + 48);
  if (v15)
  {
    v16 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E5B4F0D0;
    id v21 = v15;
    id v18 = v12;
    v19 = v14;
    id v20 = v9;
    dispatch_async(v16, block);
  }
}

FCArticleSearchResult *__100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [FCArticleSearchResult alloc];
  v5 = [*(id *)(a1 + 32) cloudContext];
  v6 = [(FCArticleSearchResult *)v4 initWithParsecSearchResult:v3 cloudContext:v5];

  return v6;
}

void __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) array];
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
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

- (BOOL)fetching
{
  return self->_fetching;
}

- (void)setFetching:(BOOL)a3
{
  self->_fetching = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (SFMoreResults)moreResults
{
  return self->_moreResults;
}

- (void)setMoreResults:(id)a3
{
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void)setRankingFeedback:(id)a3
{
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
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

- (NSMutableOrderedSet)articleSearchResults
{
  return self->_articleSearchResults;
}

- (void)setArticleSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleSearchResults, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_moreResults, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end