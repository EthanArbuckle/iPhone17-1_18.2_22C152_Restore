@interface FCUserFacingTagSearchOperation
- (BOOL)validateOperation;
- (FCContentContext)contentContext;
- (FCStreamingResults)channelSearchResults;
- (FCStreamingResults)topicSearchResults;
- (NSString)searchString;
- (id)_fetchResultsForTagType:(unint64_t)a3 batchSize:(unint64_t)a4;
- (id)_fetchResultsForUserFacingTopicsWithInitialChannels:(id)a3;
- (id)searchResultsBlock;
- (unint64_t)batchSize;
- (unint64_t)userFacingTagOptions;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setBatchSize:(unint64_t)a3;
- (void)setChannelSearchResults:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setSearchResultsBlock:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setTopicSearchResults:(id)a3;
- (void)setUserFacingTagOptions:(unint64_t)a3;
@end

@implementation FCUserFacingTagSearchOperation

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(FCUserFacingTagSearchOperation *)self contentContext];

  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"tag search operation requires a content context"];
    int v5 = 136315906;
    v6 = "-[FCUserFacingTagSearchOperation validateOperation]";
    __int16 v7 = 2080;
    v8 = "FCUserFacingTagSearchOperation.m";
    __int16 v9 = 1024;
    int v10 = 32;
    __int16 v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
  }
  return v2 != 0;
}

- (void)performOperation
{
  unint64_t v3 = [(FCUserFacingTagSearchOperation *)self userFacingTagOptions];
  if (v3)
  {
    unint64_t v4 = v3;
    unint64_t v5 = [(FCUserFacingTagSearchOperation *)self batchSize];
    uint64_t v6 = 20;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_2;
    v14[3] = &unk_1E5B51D58;
    if (v5 > 0x14) {
      uint64_t v6 = v5;
    }
    v14[4] = self;
    v14[5] = v6;
    __int16 v7 = [MEMORY[0x1E4F81BF0] firstly:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_3;
    v13[3] = &unk_1E5B51DA0;
    v13[4] = self;
    v13[5] = v4;
    v8 = [v7 then:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_6;
    v12[3] = &unk_1E5B51DC8;
    v12[4] = self;
    __int16 v9 = [v8 then:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_7;
    v11[3] = &unk_1E5B4FD28;
    v11[4] = self;
    id v10 = (id)[v9 error:v11];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke;
    v15[3] = &unk_1E5B4C018;
    v15[4] = self;
    __50__FCUserFacingTagSearchOperation_performOperation__block_invoke((uint64_t)v15);
  }
}

void __50__FCUserFacingTagSearchOperation_performOperation__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [*(id *)(a1 + 32) setChannelSearchResults:v2];

  id v3 = (id)objc_opt_new();
  [*(id *)(a1 + 32) setTopicSearchResults:v3];
}

uint64_t __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchResultsForTagType:2 batchSize:*(void *)(a1 + 40)];
}

id __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 underlyingStream];
  unint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  __int16 v7 = v6;

  v8 = [v3 array];

  __int16 v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    __int16 v9 = v8;
  }
  id v10 = v9;

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    v12 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_55);
    uint64_t v13 = [[FCTransformedStream alloc] initWithStream:v7 transformBlock:&__block_literal_global_55];
    v14 = [[FCStreamingResults alloc] initWithResults:v12 followedByStream:v13];
    [*(id *)(a1 + 32) setChannelSearchResults:v14];

    uint64_t v11 = *(void *)(a1 + 40);
  }
  if ((v11 & 2) != 0)
  {
    v15 = [*(id *)(a1 + 32) _fetchResultsForUserFacingTopicsWithInitialChannels:v10];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 userFacingTagType] == 2) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(FCUserFacingTagSearchOperation *)self searchResultsBlock];

  if (v4)
  {
    unint64_t v5 = [(FCUserFacingTagSearchOperation *)self searchResultsBlock];
    id v6 = [(FCUserFacingTagSearchOperation *)self channelSearchResults];
    __int16 v7 = [(FCUserFacingTagSearchOperation *)self topicSearchResults];
    ((void (**)(void, void *, void *, id))v5)[2](v5, v6, v7, v8);
  }
}

- (id)_fetchResultsForUserFacingTopicsWithInitialChannels:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke;
  v9[3] = &unk_1E5B50378;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  __int16 v7 = (void *)[v5 initWithResolver:v9];

  return v7;
}

void __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_2;
  v17[3] = &unk_1E5B4E758;
  v17[4] = *(void *)(a1 + 32);
  __int16 v7 = [MEMORY[0x1E4F81BF0] firstly:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_3;
  v14[3] = &unk_1E5B51DF0;
  id v15 = *(id *)(a1 + 40);
  id v16 = v5;
  id v8 = v5;
  __int16 v9 = [v7 then:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_5;
  v12[3] = &unk_1E5B4EF68;
  id v13 = v6;
  id v10 = v6;
  id v11 = (id)[v9 error:v12];
}

uint64_t __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 batchSize];
  return [v1 _fetchResultsForTagType:1 batchSize:v2];
}

uint64_t __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "fc_arrayOfObjectsPassingTest:", &__block_literal_global_16_0);
  id v5 = [v3 underlyingStream];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  __int16 v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = [v3 array];
  id v11 = objc_msgSend(v9, "fc_arrayByAddingObjectsFromArray:toArray:", v10, v4);

  v12 = [[FCStreamingResults alloc] initWithResults:v11 followedByStream:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 0;
}

BOOL __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 userFacingTagType] == 1;
}

uint64_t __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_fetchResultsForTagType:(unint64_t)a3 batchSize:(unint64_t)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke;
  v10[3] = &unk_1E5B51E40;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  id v8 = (void *)[v7 initWithResolver:v10];
  return v8;
}

void __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) contentContext];
  [v7 setContentContext:v8];

  __int16 v9 = [*(id *)(a1 + 32) searchString];
  [v7 setSearchString:v9];

  [v7 setTagType:*(void *)(a1 + 40)];
  [v7 setBatchSize:*(void *)(a1 + 48)];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke_2;
  id v15 = &unk_1E5B51E18;
  id v16 = v6;
  id v17 = v5;
  id v10 = v5;
  id v11 = v6;
  [v7 setSearchResultsBlock:&v12];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v12, v13, v14, v15);
  [v7 start];
}

void __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v6 = (void (**)(id, id))*(id *)(a1 + 32);
    id v5 = v4;
    v6[2](v6, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (unint64_t)userFacingTagOptions
{
  return self->_userFacingTagOptions;
}

- (void)setUserFacingTagOptions:(unint64_t)a3
{
  self->_userFacingTagOptions = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (id)searchResultsBlock
{
  return self->_searchResultsBlock;
}

- (void)setSearchResultsBlock:(id)a3
{
}

- (FCStreamingResults)channelSearchResults
{
  return self->_channelSearchResults;
}

- (void)setChannelSearchResults:(id)a3
{
}

- (FCStreamingResults)topicSearchResults
{
  return self->_topicSearchResults;
}

- (void)setTopicSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicSearchResults, 0);
  objc_storeStrong((id *)&self->_channelSearchResults, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end