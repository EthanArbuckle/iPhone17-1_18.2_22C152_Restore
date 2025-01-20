@interface TGITextGenerationInferenceRunnerManager
- (BOOL)isStarted;
- (NSDictionary)scheduledInferenceRunnerByExecutionUUID;
- (NSMutableDictionary)inferenceRunnerByExecutionUUID;
- (OS_dispatch_queue)inferenceQueue;
- (OS_dispatch_queue)workQueue;
- (TGITextGenerationInferenceDataSource)dataSource;
- (TGITextGenerationInferenceRunnerManager)initWithWorkQueue:(id)a3;
- (TGITextGenerationInferenceRunnerManager)initWithWorkQueue:(id)a3 inferenceQueue:(id)a4 dataSource:(id)a5;
- (id).cxx_construct;
- (shared_ptr<TGITextGenerationInferenceModelInterface>)model;
- (void)cancelOperationWithExecutionUUID:(id)a3;
- (void)enqueueOperation:(id)a3 executionUUID:(id)a4 session:(id)a5;
- (void)runInferenceRunners;
- (void)setModel:(shared_ptr<TGITextGenerationInferenceModelInterface>)a3;
- (void)setScheduledInferenceRunnerByExecutionUUID:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)start;
@end

@implementation TGITextGenerationInferenceRunnerManager

- (TGITextGenerationInferenceRunnerManager)initWithWorkQueue:(id)a3
{
  id v4 = a3;
  v5 = dispatch_queue_create("com.apple.text-generation-inference", 0);
  v6 = dispatch_get_global_queue(33, 0);
  dispatch_set_target_queue(v5, v6);

  v7 = objc_alloc_init(TGITextGenerationInferenceDataSource);
  v8 = [(TGITextGenerationInferenceRunnerManager *)self initWithWorkQueue:v4 inferenceQueue:v5 dataSource:v7];

  return v8;
}

- (TGITextGenerationInferenceRunnerManager)initWithWorkQueue:(id)a3 inferenceQueue:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TGITextGenerationInferenceRunnerManager;
  v12 = [(TGITextGenerationInferenceRunnerManager *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a5);
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    inferenceRunnerByExecutionUUID = v13->_inferenceRunnerByExecutionUUID;
    v13->_inferenceRunnerByExecutionUUID = (NSMutableDictionary *)v14;

    uint64_t v16 = [NSDictionary dictionary];
    scheduledInferenceRunnerByExecutionUUID = v13->_scheduledInferenceRunnerByExecutionUUID;
    v13->_scheduledInferenceRunnerByExecutionUUID = (NSDictionary *)v16;

    objc_storeStrong((id *)&v13->_inferenceQueue, a4);
    objc_storeStrong((id *)&v13->_workQueue, a3);
  }

  return v13;
}

- (void)start
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25EB6B000, log, OS_LOG_TYPE_ERROR, "Cannot start inference runner manager, default configuration is nil", v1, 2u);
}

void __48__TGITextGenerationInferenceRunnerManager_start__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 dataSource];
  id v4 = v3;
  if (v3)
  {
    [v3 createModelWithConfiguration:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = 0;
    v6 = 0;
  }
  [v2 setModel:&v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (void)enqueueOperation:(id)a3 executionUUID:(id)a4 session:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(TGITextGenerationInferenceRunnerManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(TGITextGenerationInferenceRunnerManager *)self dataSource];
  v12 = [(TGITextGenerationInferenceRunnerManager *)self inferenceQueue];
  v13 = [v11 createInferenceRunnerWithQueue:v12 executionUUID:v8 operation:v17 session:v9];

  uint64_t v14 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
  uint64_t v15 = [v14 count];

  uint64_t v16 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
  [v16 setObject:v13 forKeyedSubscript:v8];

  if (!v15) {
    [(TGITextGenerationInferenceRunnerManager *)self runInferenceRunners];
  }
}

- (void)runInferenceRunners
{
  v3 = [(TGITextGenerationInferenceRunnerManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
    v7 = [v6 allValues];
    id v8 = (void *)[v7 copy];

    id v9 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
    id v10 = (void *)[v9 copy];
    [(TGITextGenerationInferenceRunnerManager *)self setScheduledInferenceRunnerByExecutionUUID:v10];

    id v11 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
    [v11 removeAllObjects];

    v12 = [(TGITextGenerationInferenceRunnerManager *)self inferenceQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke;
    v15[3] = &unk_265534610;
    id v16 = v8;
    id v17 = self;
    id v13 = v8;
    dispatch_async(v12, v15);
  }
  else
  {
    uint64_t v14 = MEMORY[0x263EFFA78];
    [(TGITextGenerationInferenceRunnerManager *)self setScheduledInferenceRunnerByExecutionUUID:v14];
  }
}

void __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        if (v7)
        {
          [v7 model];
        }
        else
        {
          uint64_t v10 = 0;
          id v11 = 0;
        }
        [v6 setModel:&v10];
        if (v11) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v11);
        }
        [v6 run];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }

  id v8 = [*(id *)(a1 + 40) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke_2;
  block[3] = &unk_2655345E8;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v8, block);
}

uint64_t __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) runInferenceRunners];
}

- (void)cancelOperationWithExecutionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TGITextGenerationInferenceRunnerManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
  v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    id v8 = [(TGITextGenerationInferenceRunnerManager *)self inferenceRunnerByExecutionUUID];
    [v8 setObject:0 forKeyedSubscript:v4];

LABEL_4:
    [v7 cancel];
    goto LABEL_5;
  }
  id v9 = [(TGITextGenerationInferenceRunnerManager *)self scheduledInferenceRunnerByExecutionUUID];
  v7 = [v9 objectForKeyedSubscript:v4];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v10 = _nlpDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[TGITextGenerationInferenceRunnerManager cancelOperationWithExecutionUUID:]((uint64_t)v4, v10);
  }

  v7 = 0;
LABEL_5:
}

- (NSMutableDictionary)inferenceRunnerByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)scheduledInferenceRunnerByExecutionUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScheduledInferenceRunnerByExecutionUUID:(id)a3
{
}

- (OS_dispatch_queue)inferenceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (shared_ptr<TGITextGenerationInferenceModelInterface>)model
{
  objc_copyCppObjectAtomic(v2, &self->_model, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__0);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setModel:(shared_ptr<TGITextGenerationInferenceModelInterface>)a3
{
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (TGITextGenerationInferenceDataSource)dataSource
{
  return (TGITextGenerationInferenceDataSource *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  cntrl = self->_model.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inferenceQueue, 0);
  objc_storeStrong((id *)&self->_scheduledInferenceRunnerByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_inferenceRunnerByExecutionUUID, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void)cancelOperationWithExecutionUUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25EB6B000, a2, OS_LOG_TYPE_ERROR, "Cannot cancel, operation with uuid not found: %@", (uint8_t *)&v2, 0xCu);
}

@end