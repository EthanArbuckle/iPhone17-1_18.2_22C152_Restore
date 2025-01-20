@interface FCArticleStreamingResults
- (FCArticleSearchOperationFeedbackResult)feedbackResult;
- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 batchSize:(unint64_t)a5 completion:(id)a6;
- (void)setFeedbackResult:(id)a3;
@end

@implementation FCArticleStreamingResults

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 batchSize:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = [(FCStreamingResults *)self serialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke;
  v13[3] = &unk_1E5B56528;
  unint64_t v15 = a3;
  unint64_t v16 = a5;
  int64_t v17 = a4;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 enqueueBlockForMainThread:v13];
}

void __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) count];
  if (*(void *)(a1 + 48) <= v4
    || (unint64_t v5 = v4,
        [*(id *)(a1 + 32) underlyingStream],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isFinished],
        v6,
        (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
    v3[2](v3);
  }
  else
  {
    if (*(void *)(a1 + 48) - v5 >= *(void *)(a1 + 56)) {
      unint64_t v9 = *(void *)(a1 + 56);
    }
    else {
      unint64_t v9 = *(void *)(a1 + 48) - v5;
    }
    objc_opt_class();
    id v10 = [*(id *)(a1 + 32) underlyingStream];
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v12 = v11;

    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2;
    v18[3] = &unk_1E5B57E88;
    unint64_t v15 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 48);
    unint64_t v21 = v5;
    uint64_t v22 = v16;
    uint64_t v23 = v14;
    uint64_t v24 = v13;
    id v19 = v15;
    v20 = v3;
    id v17 = (id)[v12 fetchMoreResultsWithLimit:v9 qualityOfService:v14 callbackQueue:MEMORY[0x1E4F14428] completionHandler:v18];
  }
}

void __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = a2;
  v11 = [v8 results];
  uint64_t v12 = [v11 count];
  uint64_t v13 = *(void *)(a1 + 56);

  if (v12 != v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"async results are out of sync"];
    int v17 = 136315906;
    v18 = "-[FCArticleStreamingResults fetchObjectsUpToCount:qualityOfService:batchSize:completion:]_block_invoke_2";
    __int16 v19 = 2080;
    v20 = "FCArticleStreamingResults.m";
    __int16 v21 = 1024;
    int v22 = 42;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v17, 0x26u);
  }
  uint64_t v14 = [*(id *)(a1 + 32) results];
  [v14 addObjectsFromArray:v10];

  [*(id *)(a1 + 32) setFeedbackResult:v9];
  if (v7)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, id))(v15 + 16))(v15, v7);
    }
  }
  else
  {
    [*(id *)(a1 + 32) fetchObjectsUpToCount:*(void *)(a1 + 64) qualityOfService:*(void *)(a1 + 72) batchSize:*(void *)(a1 + 80) completion:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
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
}

@end