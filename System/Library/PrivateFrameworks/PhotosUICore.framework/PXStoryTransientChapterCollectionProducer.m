@interface PXStoryTransientChapterCollectionProducer
- (OS_dispatch_queue)storyQueue;
- (OS_dispatch_queue)workQueue;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryTransientChapterCollectionProducer)init;
- (PXStoryTransientChapterCollectionProducer)initWithStoryQueue:(id)a3;
- (id)_chapterCollectionManagerWithUneditedChapterColection:(id)a3;
- (id)requestChapterCollectionForKeyAsset:(id)a3 curatedAssets:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6;
- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4;
- (void)_workQueue_persistEditTransaction:(id)a3;
- (void)chapterCollectionManager:(id)a3 didApplyEditTransaction:(id)a4;
- (void)setErrorReporter:(id)a3;
- (void)workQueue_saveEditTransaction:(id)a3 completionHandler:(id)a4;
@end

@implementation PXStoryTransientChapterCollectionProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_errorReporter);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_transientChapterCollectionManager, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setErrorReporter:(id)a3
{
}

- (PXStoryErrorReporter)errorReporter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_errorReporter);
  return (PXStoryErrorReporter *)WeakRetained;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)chapterCollectionManager:(id)a3 didApplyEditTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(PXStoryTransientChapterCollectionProducer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PXStoryTransientChapterCollectionProducer_chapterCollectionManager_didApplyEditTransaction___block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v12, &location);
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __94__PXStoryTransientChapterCollectionProducer_chapterCollectionManager_didApplyEditTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_workQueue_persistEditTransaction:", *(void *)(a1 + 32));
}

- (id)requestChapterCollectionForKeyAsset:(id)a3 curatedAssets:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
  v13 = [(PXStoryTransientChapterCollectionProducer *)self storyQueue];
  objc_initWeak(&location, self);
  v14 = [(PXStoryTransientChapterCollectionProducer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DD20A0;
  id v15 = v12;
  id v24 = v15;
  objc_copyWeak(&v29, &location);
  id v25 = v10;
  id v26 = v9;
  id v27 = v13;
  id v28 = v11;
  id v16 = v11;
  id v17 = v13;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(v14, block);

  v20 = v28;
  id v21 = v15;

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  return v21;
}

void __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v3 = objc_msgSend(WeakRetained, "workQueue_uneditedChapterCollectionWithAssets:keyAsset:", *(void *)(a1 + 40), *(void *)(a1 + 48));

    v4 = *(NSObject **)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke_2;
    v6[3] = &unk_1E5DD2078;
    id v7 = *(id *)(a1 + 32);
    id v8 = v3;
    id v5 = v3;
    objc_copyWeak(&v10, (id *)(a1 + 72));
    id v9 = *(id *)(a1 + 64);
    dispatch_async(v4, v6);

    objc_destroyWeak(&v10);
  }
}

void __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (*(void *)(a1 + 40))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      id v4 = [WeakRetained _chapterCollectionManagerWithUneditedChapterColection:*(void *)(a1 + 40)];
    }
    else
    {
      id v4 = 0;
    }
    v3 = [[PXStoryProducerResult alloc] initWithObject:v4];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)workQueue_saveEditTransaction:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v13 = PXStoryErrorCreateWithCodeDebugFormat(4, @"%@ doesn't support saving chapter edits", v7, v8, v9, v10, v11, v12, (uint64_t)v14);
  (*((void (**)(id, void, void *))a4 + 2))(v5, 0, v13);
}

- (void)_workQueue_persistEditTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryTransientChapterCollectionProducer *)self storyQueue];
  id v6 = [(PXStoryTransientChapterCollectionProducer *)self errorReporter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke;
  v9[3] = &unk_1E5DD2570;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [(PXStoryTransientChapterCollectionProducer *)self workQueue_saveEditTransaction:v4 completionHandler:v9];
}

void __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "failed to persist chapter collection edits: %@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke_6;
    v8[3] = &unk_1E5DD32A8;
    id v7 = *(NSObject **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setError:*(void *)(a1 + 40) forComponent:@"ChapterCollectionPersistence"];
}

- (id)_chapterCollectionManagerWithUneditedChapterColection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryTransientChapterCollectionProducer *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  transientChapterCollectionManager = self->_transientChapterCollectionManager;
  if (transientChapterCollectionManager)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __99__PXStoryTransientChapterCollectionProducer__chapterCollectionManagerWithUneditedChapterColection___block_invoke;
    v11[3] = &unk_1E5DD2050;
    id v12 = v4;
    [(PXStoryTransientChapterCollectionManager *)transientChapterCollectionManager performChanges:v11];
  }
  else
  {
    id v7 = [[PXStoryTransientChapterCollectionManager alloc] initWithUneditedChapterCollection:v4];
    id v8 = self->_transientChapterCollectionManager;
    self->_transientChapterCollectionManager = v7;

    [(PXStoryTransientChapterCollectionManager *)self->_transientChapterCollectionManager setPersistenceDelegate:self];
  }
  id v9 = self->_transientChapterCollectionManager;

  return v9;
}

uint64_t __99__PXStoryTransientChapterCollectionProducer__chapterCollectionManagerWithUneditedChapterColection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUneditedChapterCollection:*(void *)(a1 + 32)];
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXStoryTransientChapterCollectionProducer.m", 41, @"Method %s is a responsibility of subclass %@", "-[PXStoryTransientChapterCollectionProducer workQueue_uneditedChapterCollectionWithAssets:keyAsset:]", v11 object file lineNumber description];

  abort();
}

- (PXStoryTransientChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryTransientChapterCollectionProducer;
  id v5 = [(PXStoryTransientChapterCollectionProducer *)&v18 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v6;
    }
    else
    {
      id v8 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v8;
    }

    id v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    id v12 = (const char *)[v11 UTF8String];
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (PXStoryTransientChapterCollectionProducer)init
{
  return [(PXStoryTransientChapterCollectionProducer *)self initWithStoryQueue:0];
}

@end