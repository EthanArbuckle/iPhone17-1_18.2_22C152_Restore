@interface SXLayoutPipeline
- (NSMutableArray)postProcessors;
- (NSMutableArray)preProcessors;
- (NSOperationQueue)layoutOperationQueue;
- (SXDOMObjectProviderFactory)DOMObjectProviderFactory;
- (SXLayoutOperationFactory)layoutOperationFactory;
- (SXLayoutPipeline)initWithLayoutOperationFactory:(id)a3 DOMObjectProviderFactory:(id)a4;
- (SXLayoutPipelineDelegate)delegate;
- (void)addProcessor:(id)a3 type:(unint64_t)a4;
- (void)cancelTasks;
- (void)finalizeLayoutForLayoutOperation:(id)a3 task:(id)a4 DOMObjectProvider:(id)a5;
- (void)layoutWithTask:(id)a3;
- (void)removeProcessor:(id)a3 type:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SXLayoutPipeline

- (SXLayoutPipeline)initWithLayoutOperationFactory:(id)a3 DOMObjectProviderFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SXLayoutPipeline;
  v9 = [(SXLayoutPipeline *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutOperationFactory, a3);
    objc_storeStrong((id *)&v10->_DOMObjectProviderFactory, a4);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    preProcessors = v10->_preProcessors;
    v10->_preProcessors = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    postProcessors = v10->_postProcessors;
    v10->_postProcessors = (NSMutableArray *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    layoutOperationQueue = v10->_layoutOperationQueue;
    v10->_layoutOperationQueue = v15;

    v17 = v10->_layoutOperationQueue;
    v18 = NSString;
    v19 = [MEMORY[0x263F08C38] UUID];
    v20 = [v19 UUIDString];
    v21 = [v18 stringWithFormat:@"com.apple.news.anf-layout (%@)", v20];
    [(NSOperationQueue *)v17 setName:v21];

    [(NSOperationQueue *)v10->_layoutOperationQueue setQualityOfService:25];
    [(NSOperationQueue *)v10->_layoutOperationQueue setMaxConcurrentOperationCount:1];
  }

  return v10;
}

- (void)layoutWithTask:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = [v4 identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Pipeline receieved new layout task, task-identifier=%{public}@", (uint8_t *)&buf, 0xCu);
  }
  id v8 = [(SXLayoutPipeline *)self DOMObjectProviderFactory];
  v9 = [v8 createDOMObjectProvider];

  v10 = [v4 DOM];
  [v9 setDOM:v10];

  uint64_t v11 = [(SXLayoutPipeline *)self layoutOperationFactory];
  v12 = [v11 layoutOperationWithTask:v4 DOMObjectProvider:v9];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v13 = [MEMORY[0x263F1C408] sharedApplication];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke;
  v48[3] = &unk_264651A80;
  v48[4] = &buf;
  uint64_t v14 = [v13 beginBackgroundTaskWithName:@"ANF Layout" expirationHandler:v48];

  *(void *)(*((void *)&buf + 1) + 24) = v14;
  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke_2;
  v40[3] = &unk_264651AD0;
  v27 = &v44;
  objc_copyWeak(&v44, &location);
  v28 = &v45;
  objc_copyWeak(&v45, &from);
  id v15 = v4;
  id v41 = v15;
  id v16 = v9;
  id v42 = v16;
  p_long long buf = &buf;
  [v12 setCompletionBlock:v40];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke_9;
  v36[3] = &unk_264651AF8;
  objc_copyWeak(&v39, &from);
  id v17 = v15;
  id v37 = v17;
  id v18 = v16;
  id v38 = v18;
  [v12 beforeLayout:v36];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __35__SXLayoutPipeline_layoutWithTask___block_invoke_11;
  v32 = &unk_264651AF8;
  objc_copyWeak(&v35, &from);
  id v19 = v17;
  id v33 = v19;
  id v20 = v18;
  id v34 = v20;
  [v12 afterLayout:&v29];
  v21 = [(SXLayoutPipeline *)self layoutOperationQueue];
  [v21 cancelAllOperations];

  v22 = (id)SXLayoutLog;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v23 = objc_msgSend(v19, "identifier", &v44, &v45, v29, v30, v31, v32, v33);
    v24 = [(SXLayoutPipeline *)self layoutOperationQueue];
    v25 = [v24 name];
    *(_DWORD *)v49 = 138412802;
    v50 = v12;
    __int16 v51 = 2114;
    v52 = v23;
    __int16 v53 = 2114;
    v54 = v25;
    _os_log_impl(&dword_222AC5000, v22, OS_LOG_TYPE_DEFAULT, "Adding layout operation: %@, task-identifier= %{public}@, layout-queue: %{public}@", v49, 0x20u);
  }
  v26 = [(SXLayoutPipeline *)self layoutOperationQueue];
  [v26 addOperation:v12];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v39);

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1D108];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x263F1D108])
  {
    v3 = [MEMORY[0x263F1C408] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke_3;
  block[3] = &unk_264651AA8;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  id v7 = WeakRetained;
  id v8 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v4;
  id v5 = WeakRetained;
  dispatch_sync(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v11);
}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [*(id *)(a1 + 32) isCancelled];
  uint64_t v4 = (void *)SXLayoutLog;
  BOOL v5 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0 || !WeakRetained)
  {
    if (v5)
    {
      id v11 = *(void **)(a1 + 40);
      v12 = v4;
      uint64_t v13 = [v11 identifier];
      [*(id *)(a1 + 32) duration];
      int v17 = 138543618;
      double v18 = *(double *)&v13;
      __int16 v19 = 2048;
      double v20 = v14 * 1000.0;
      _os_log_impl(&dword_222AC5000, v12, OS_LOG_TYPE_DEFAULT, "Cancelled layout task; dropping result, task-identifier=%{public}@, duration=%fms",
        (uint8_t *)&v17,
        0x16u);
    }
  }
  else
  {
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      id v7 = v4;
      [v6 duration];
      double v9 = v8 * 1000.0;
      double v10 = [*(id *)(a1 + 40) identifier];
      int v17 = 134218242;
      double v18 = v9;
      __int16 v19 = 2114;
      double v20 = v10;
      _os_log_impl(&dword_222AC5000, v7, OS_LOG_TYPE_DEFAULT, "Finished layout task in %fms, task-identifier=%{public}@", (uint8_t *)&v17, 0x16u);
    }
    [WeakRetained finalizeLayoutForLayoutOperation:*(void *)(a1 + 32) task:*(void *)(a1 + 40) DOMObjectProvider:*(void *)(a1 + 48)];
  }
  uint64_t v15 = *MEMORY[0x263F1D108];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != *MEMORY[0x263F1D108])
  {
    id v16 = [MEMORY[0x263F1C408] sharedApplication];
    [v16 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
  }
}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = [WeakRetained preProcessors];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138412546;
    long long v17 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          double v14 = *(void **)(a1 + 32);
          uint64_t v15 = v13;
          id v16 = [v14 identifier];
          *(_DWORD *)long long buf = v17;
          objc_super v23 = v12;
          __int16 v24 = 2114;
          v25 = v16;
          _os_log_impl(&dword_222AC5000, v15, OS_LOG_TYPE_DEFAULT, "Executing pre-processor: %@, task-identifier= %{public}@", buf, 0x16u);
        }
        objc_msgSend(v12, "processLayoutTask:layoutBlueprint:DOMObjectProvider:", *(void *)(a1 + 32), v3, *(void *)(a1 + 40), v17, (void)v18);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = [WeakRetained postProcessors];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138412546;
    long long v17 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          double v14 = *(void **)(a1 + 32);
          uint64_t v15 = v13;
          id v16 = [v14 identifier];
          *(_DWORD *)long long buf = v17;
          objc_super v23 = v12;
          __int16 v24 = 2114;
          v25 = v16;
          _os_log_impl(&dword_222AC5000, v15, OS_LOG_TYPE_DEFAULT, "Executing post-processor: %@, task-identifier= %{public}@", buf, 0x16u);
        }
        objc_msgSend(v12, "processLayoutTask:layoutBlueprint:DOMObjectProvider:", *(void *)(a1 + 32), v3, *(void *)(a1 + 40), v17, (void)v18);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)finalizeLayoutForLayoutOperation:(id)a3 task:(id)a4 DOMObjectProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [SXLayoutResult alloc];
  v12 = [v10 layoutBlueprint];
  uint64_t v13 = [v8 DOM];

  [v10 duration];
  double v15 = v14;

  long long v17 = [(SXLayoutResult *)v11 initWithLayoutBlueprint:v12 DOM:v13 duration:v15];
  id v16 = [(SXLayoutPipeline *)self delegate];
  [v16 layoutPipeline:self finishedTask:v9 withResult:v17];
}

- (void)addProcessor:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4 == 1)
    {
      id v9 = v6;
      uint64_t v7 = [(SXLayoutPipeline *)self postProcessors];
    }
    else
    {
      if (a4) {
        goto LABEL_7;
      }
      id v9 = v6;
      uint64_t v7 = [(SXLayoutPipeline *)self preProcessors];
    }
    id v8 = v7;
    [v7 addObject:v9];

    id v6 = v9;
  }
LABEL_7:
}

- (void)removeProcessor:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4 == 1)
    {
      id v9 = v6;
      uint64_t v7 = [(SXLayoutPipeline *)self postProcessors];
    }
    else
    {
      if (a4) {
        goto LABEL_7;
      }
      id v9 = v6;
      uint64_t v7 = [(SXLayoutPipeline *)self preProcessors];
    }
    id v8 = v7;
    [v7 removeObject:v9];

    id v6 = v9;
  }
LABEL_7:
}

- (void)cancelTasks
{
  id v3 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_222AC5000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all layout tasks", v5, 2u);
  }
  uint64_t v4 = [(SXLayoutPipeline *)self layoutOperationQueue];
  [v4 cancelAllOperations];
}

- (SXLayoutPipelineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SXLayoutPipelineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXLayoutOperationFactory)layoutOperationFactory
{
  return self->_layoutOperationFactory;
}

- (SXDOMObjectProviderFactory)DOMObjectProviderFactory
{
  return self->_DOMObjectProviderFactory;
}

- (NSOperationQueue)layoutOperationQueue
{
  return self->_layoutOperationQueue;
}

- (NSMutableArray)preProcessors
{
  return self->_preProcessors;
}

- (NSMutableArray)postProcessors
{
  return self->_postProcessors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessors, 0);
  objc_storeStrong((id *)&self->_preProcessors, 0);
  objc_storeStrong((id *)&self->_layoutOperationQueue, 0);
  objc_storeStrong((id *)&self->_DOMObjectProviderFactory, 0);
  objc_storeStrong((id *)&self->_layoutOperationFactory, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end