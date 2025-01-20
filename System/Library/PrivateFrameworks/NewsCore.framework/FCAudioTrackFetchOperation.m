@interface FCAudioTrackFetchOperation
- (BOOL)cachedOnly;
- (FCArticleAudioTrack)audioTrack;
- (FCAudioTrackFetchOperation)initWithContext:(id)a3 audioTrack:(id)a4;
- (FCContentContext)context;
- (id)archiveHandler;
- (id)fetchCompletionHandler;
- (id)interestTokenHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArchiveHandler:(id)a3;
- (void)setCachedOnly:(BOOL)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setInterestTokenHandler:(id)a3;
@end

@implementation FCAudioTrackFetchOperation

- (FCAudioTrackFetchOperation)initWithContext:(id)a3 audioTrack:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCAudioTrackFetchOperation;
  v9 = [(FCOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_audioTrack, a4);
  }

  return v10;
}

- (void)performOperation
{
  v3 = [(FCAudioTrackFetchOperation *)self context];
  v4 = [v3 internalContentContext];
  v5 = [v4 avAssetDownloadManager];

  v6 = [(FCAudioTrackFetchOperation *)self audioTrack];
  id v7 = [v6 asset];
  id v8 = -[FCAVAssetDownloadManager interestTokenForCachedAsset:](v5, v7);

  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke;
    v14[3] = &unk_1E5B4BE70;
    v14[4] = self;
    v15 = v8;
    __46__FCAudioTrackFetchOperation_performOperation__block_invoke((uint64_t)v14);
    v9 = v15;
LABEL_6:

    goto LABEL_7;
  }
  if (![(FCAudioTrackFetchOperation *)self cachedOnly])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke_3;
    v10[3] = &unk_1E5B4BE70;
    v11 = v5;
    objc_super v12 = self;
    -[FCAVAssetDownloadManager restoreBackgroundDownloadsWithCompletionHandler:]((uint64_t)v11, v10);
    v9 = v11;
    goto LABEL_6;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke_2;
  v13[3] = &unk_1E5B4C018;
  v13[4] = self;
  __46__FCAudioTrackFetchOperation_performOperation__block_invoke_2((uint64_t)v13);
LABEL_7:
}

uint64_t __46__FCAudioTrackFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) interestTokenHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) interestTokenHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
  v4 = *(void **)(a1 + 32);
  return [v4 finishedPerformingOperationWithError:0];
}

void __46__FCAudioTrackFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [v1 audioTrack];
  v4 = [v8 asset];
  v5 = [v4 identifier];
  v6 = [v3 setWithObject:v5];
  id v7 = objc_msgSend(v2, "fc_notCachedErrorWithMissingObjects:", v6);
  [v1 finishedPerformingOperationWithError:v7];
}

void __46__FCAudioTrackFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) audioTrack];
  v4 = [v3 asset];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke_4;
  v6[3] = &unk_1E5B57E60;
  v6[4] = *(void *)(a1 + 40);
  v5 = -[FCAVAssetDownloadManager downloadAsset:completionHandler:](v2, v4, v6);

  [*(id *)(a1 + 40) associateChildOperation:v5];
}

void __46__FCAudioTrackFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    v11 = *(void **)(a1 + 32);
    id v12 = v6;
    objc_msgSend(v11, "finishedPerformingOperationWithError:", v12, v10, 3221225472, __46__FCAudioTrackFetchOperation_performOperation__block_invoke_5, &unk_1E5B4BE70, v11);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) interestTokenHandler];

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) interestTokenHandler];
      ((void (**)(void, id))v9)[2](v9, v5);
    }
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

uint64_t __46__FCAudioTrackFetchOperation_performOperation__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__FCAudioTrackFetchOperation_operationWillFinishWithError___block_invoke;
    v12[3] = &unk_1E5B4BE70;
    v12[4] = self;
    id v13 = v4;
    __59__FCAudioTrackFetchOperation_operationWillFinishWithError___block_invoke((uint64_t)v12);
  }
  else
  {
    id v6 = [(FCAudioTrackFetchOperation *)self archiveHandler];

    if (v6)
    {
      id v7 = [(FCAudioTrackFetchOperation *)self archiveHandler];
      id v8 = [(FCAudioTrackFetchOperation *)self audioTrack];
      v9 = [v8 contentArchive];
      ((void (**)(void, void *))v7)[2](v7, v9);
    }
    uint64_t v10 = [(FCAudioTrackFetchOperation *)self fetchCompletionHandler];

    if (v10)
    {
      v11 = [(FCAudioTrackFetchOperation *)self fetchCompletionHandler];
      v11[2](v11, 0);
    }
  }
}

void __59__FCAudioTrackFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fetchCompletionHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) fetchCompletionHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
{
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCArticleAudioTrack)audioTrack
{
  return self->_audioTrack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTrack, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
}

@end