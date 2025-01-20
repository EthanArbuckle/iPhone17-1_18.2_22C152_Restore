@interface FCAssetsFetchOperation
- (FCAssetsFetchOperation)initWithAssetHandle:(id)a3;
- (FCAssetsFetchOperation)initWithAssetHandles:(id)a3;
- (id)archiveHandler;
- (id)interestTokenHandler;
- (id)progressHandler;
- (unint64_t)maxConcurrentFetchCount;
- (void)_finish;
- (void)performOperation;
- (void)setArchiveHandler:(id)a3;
- (void)setInterestTokenHandler:(id)a3;
- (void)setMaxConcurrentFetchCount:(unint64_t)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation FCAssetsFetchOperation

- (void)performOperation
{
  v2 = self;
  if (self) {
    self = (FCAssetsFetchOperation *)self->_assetHandles;
  }
  unint64_t v3 = [(FCAssetsFetchOperation *)self fc_countOfObjectsPassingTest:&__block_literal_global_188];
  if ([(FCFetchOperation *)v2 cachePolicy] == 3
    || (!v2 ? (v4 = 0) : (v4 = v2->_assetHandles), v3 == [(NSArray *)v4 count]))
  {
    v5 = [(FCAssetsFetchOperation *)v2 progressHandler];

    if (v5)
    {
      v6 = [(FCAssetsFetchOperation *)v2 progressHandler];
      if (v2) {
        assetHandles = v2->_assetHandles;
      }
      else {
        assetHandles = 0;
      }
      v8 = assetHandles;
      if ([(NSArray *)v8 count])
      {
        if (v2) {
          v10 = v2->_assetHandles;
        }
        else {
          v10 = 0;
        }
        v9.n128_f64[0] = (double)v3 / (double)[(NSArray *)v10 count];
      }
      else
      {
        v9.n128_u64[0] = 1.0;
      }
      v6[2](v6, v9);
    }
    -[FCAssetsFetchOperation _finish]((id *)&v2->super.super.super.super.isa);
  }
  else
  {
    dispatch_group_t v11 = dispatch_group_create();
    id v12 = objc_alloc_init(MEMORY[0x1E4F81C18]);
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_2;
    aBlock[3] = &unk_1E5B5C200;
    aBlock[4] = v2;
    id v13 = v12;
    id v34 = v13;
    v35 = v36;
    v14 = _Block_copy(aBlock);
    if ([(FCAssetsFetchOperation *)v2 maxConcurrentFetchCount])
    {
      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v16 = dispatch_queue_create("FCAssetsFetchOperation.serial", v15);
      if (v2) {
        objc_storeStrong((id *)&v2->_serialQueue, v16);
      }

      dispatch_semaphore_t v17 = dispatch_semaphore_create([(FCAssetsFetchOperation *)v2 maxConcurrentFetchCount]);
      if (v2) {
        v18 = v2->_assetHandles;
      }
      else {
        v18 = 0;
      }
      v19 = v18;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_7;
      v25[3] = &unk_1E5B5C250;
      v26 = v11;
      v27 = v2;
      v20 = v17;
      v28 = v20;
      id v29 = v14;
      [(NSArray *)v19 enumerateObjectsUsingBlock:v25];
    }
    else
    {
      if (v2) {
        v21 = v2->_assetHandles;
      }
      else {
        v21 = 0;
      }
      v22 = v21;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_5;
      v30[3] = &unk_1E5B5C228;
      v31 = v11;
      id v32 = v14;
      [(NSArray *)v22 enumerateObjectsUsingBlock:v30];

      v20 = v31;
    }

    if (FCDispatchGroupIsEmpty(v11))
    {
      block[5] = MEMORY[0x1E4F143A8];
      block[6] = 3221225472;
      block[7] = __42__FCAssetsFetchOperation_performOperation__block_invoke_10;
      block[8] = &unk_1E5B4C018;
      block[9] = v2;
      -[FCAssetsFetchOperation _finish]((id *)&v2->super.super.super.super.isa);
    }
    else
    {
      v23 = FCDispatchQueueForQualityOfService([(FCAssetsFetchOperation *)v2 qualityOfService]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_11;
      block[3] = &unk_1E5B4C018;
      block[4] = v2;
      dispatch_group_notify(v11, v23, block);
    }
    _Block_object_dispose(v36, 8);
  }
}

BOOL __42__FCAssetsFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dataProvider];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)_finish
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v24 = [MEMORY[0x1E4F1CA80] set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v2 = a1[56];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = 0;
      char v6 = 0;
      uint64_t v7 = *(void *)v27;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v2);
          }
          __n128 v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
          v10 = objc_msgSend(v9, "dataProvider", v24);

          if (v10)
          {
            dispatch_group_t v11 = [a1 interestTokenHandler];

            if (v11)
            {
              id v12 = [a1 interestTokenHandler];
              if (v9) {
                id v13 = (void *)v9[11];
              }
              else {
                id v13 = 0;
              }
              id v14 = v13;
              ((void (**)(void, id))v12)[2](v12, v14);
            }
            char v6 = 1;
          }
          else
          {
            v15 = [v9 remoteURL];
            dispatch_queue_t v16 = [v15 absoluteString];
            [v24 addObject:v16];

            if (!v5)
            {
              id v5 = [v9 downloadError];
            }
          }
          ++v8;
        }
        while (v4 != v8);
        uint64_t v17 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
        uint64_t v4 = v17;
      }
      while (v17);

      if (v6) {
        goto LABEL_26;
      }
    }
    else
    {

      id v5 = 0;
    }
    if (objc_msgSend(a1[56], "count", v24))
    {
      id v5 = v5;
      id v18 = v5;
      if (!v5)
      {
        if ([a1 cachePolicy] == 3) {
          objc_msgSend(MEMORY[0x1E4F28C58], "fc_notCachedErrorWithMissingObjects:", v24);
        }
        else {
          objc_msgSend(MEMORY[0x1E4F28C58], "fc_missingAssetErrorWithAssetHandles:", a1[56]);
        }
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = +[FCFetchOperationResult resultWithStatus:3 fetchedObject:0 error:v18];
      goto LABEL_37;
    }
LABEL_26:
    if (a1[56]) {
      id v19 = a1[56];
    }
    else {
      id v19 = (id)MEMORY[0x1E4F1CBF0];
    }
    v20 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:v19 error:0];
    v21 = [a1 archiveHandler];

    if (!v21) {
      goto LABEL_38;
    }
    id v18 = a1[56];
    uint64_t v22 = [a1 maxConcurrentFetchCount];
    if (v22) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = -1;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __33__FCAssetsFetchOperation__finish__block_invoke;
    v25[3] = &unk_1E5B51718;
    void v25[4] = a1;
    objc_msgSend(v18, "fc_visitSubarraysWithMaxCount:block:", v23, v25);
LABEL_37:

LABEL_38:
    [v20 setMissingObjectDescriptions:v24];
    [a1 finishExecutingWithResult:v20];
  }
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (void)setInterestTokenHandler:(id)a3
{
}

- (FCAssetsFetchOperation)initWithAssetHandles:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAssetsFetchOperation;
  id v5 = [(FCFetchOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assetHandles = v5->_assetHandles;
    v5->_assetHandles = (NSArray *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_assetHandles, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (FCAssetsFetchOperation)initWithAssetHandle:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v7 = [(FCAssetsFetchOperation *)self initWithAssetHandles:v6];
  }
  else
  {
    uint64_t v7 = [(FCAssetsFetchOperation *)self initWithAssetHandles:MEMORY[0x1E4F1CBF0]];
  }

  return v7;
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 relativePriority];
  uint64_t v9 = [*(id *)(a1 + 32) flags];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  dispatch_queue_t v16 = __42__FCAssetsFetchOperation_performOperation__block_invoke_3;
  uint64_t v17 = &unk_1E5B5C1D8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v18 = v10;
  uint64_t v19 = v11;
  uint64_t v21 = *(void *)(a1 + 48);
  id v12 = v5;
  id v20 = v12;
  id v13 = [v7 fetchDataProviderWithPriority:v8 flags:v9 completion:&v14];

  if (v13) {
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v13, v14, v15, v16, v17, v18, v19);
  }
}

uint64_t __42__FCAssetsFetchOperation_performOperation__block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_4;
    v7[3] = &unk_1E5B4F3B0;
    id v4 = (void *)a1[4];
    uint64_t v5 = a1[7];
    v7[4] = a1[5];
    v7[5] = v5;
    [v4 performWithLockSync:v7];
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) progressHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) progressHandler];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v5 = *(void **)(v4 + 448);
    }
    else {
      uint64_t v5 = 0;
    }
    v3[2](v3, (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)/ (double)(unint64_t)[v5 count]);
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_6;
  v6[3] = &unk_1E5B4C018;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v4, v6);
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_6(uint64_t a1)
{
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    uint64_t v5 = (void *)v4[57];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v4 qualityOfService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_8;
  v10[3] = &unk_1E5B58EF0;
  id v11 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v12 = v3;
  id v13 = *(id *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = FCBlockWithQualityOfService(v7, v10);
  dispatch_async(v6, v9);
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_8(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_9;
  v4[3] = &unk_1E5B4BE70;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v4);
}

intptr_t __42__FCAssetsFetchOperation_performOperation__block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_10(uint64_t a1)
{
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_11(uint64_t a1)
{
}

void __33__FCAssetsFetchOperation__finish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 archiveHandler];
  id v4 = [v3 contentArchive];

  v5[2](v5, v4);
}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

- (void)setArchiveHandler:(id)a3
{
}

@end