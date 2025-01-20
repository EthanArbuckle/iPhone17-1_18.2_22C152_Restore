@interface TGITextGenerationInferenceSession
- (NSUUID)uuid;
- (TGITextGenerationInferenceRunnerManager)inferenceRunnerManager;
- (TGITextGenerationInferenceSession)initWithUUID:(id)a3 configuration:(id)a4 inferenceRunnerManager:(id)a5;
- (TGTextGenerationConfiguration)configuration;
- (TGTextGenerationOperationDelegate)delegate;
- (id).cxx_construct;
- (id)enqueueOperation:(id)a3;
- (shared_ptr<TGITextGenerationInferenceSessionStateCache>)stateCache;
- (void)cancelOperationWithExecutionUUID:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TGITextGenerationInferenceSession

- (TGITextGenerationInferenceSession)initWithUUID:(id)a3 configuration:(id)a4 inferenceRunnerManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TGITextGenerationInferenceSession;
  v11 = [(TGITextGenerationInferenceSession *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    v13 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v12;

    uint64_t v14 = [v9 copy];
    v15 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v14;

    TGITextGenerationInferenceSessionStateCache::create((TGITextGenerationInferenceSessionStateCache *)0x400, &v19);
    long long v16 = v19;
    long long v19 = 0uLL;
    v17 = (std::__shared_weak_count *)*((void *)v11 + 6);
    *(_OWORD *)(v11 + 40) = v16;
    if (v17)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      if (*((void *)&v19 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v19 + 1));
      }
    }
    objc_storeStrong((id *)v11 + 4, a5);
  }

  return (TGITextGenerationInferenceSession *)v11;
}

- (id)enqueueOperation:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08C38] UUID];
  v6 = [(TGITextGenerationInferenceSession *)self inferenceRunnerManager];
  [v6 enqueueOperation:v4 executionUUID:v5 session:self];

  return v5;
}

- (void)cancelOperationWithExecutionUUID:(id)a3
{
  id v5 = a3;
  id v4 = [(TGITextGenerationInferenceSession *)self inferenceRunnerManager];
  [v4 cancelOperationWithExecutionUUID:v5];
}

- (TGTextGenerationOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TGTextGenerationOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (TGTextGenerationConfiguration)configuration
{
  return (TGTextGenerationConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (TGITextGenerationInferenceRunnerManager)inferenceRunnerManager
{
  return (TGITextGenerationInferenceRunnerManager *)objc_getProperty(self, a2, 32, 1);
}

- (shared_ptr<TGITextGenerationInferenceSessionStateCache>)stateCache
{
  objc_copyCppObjectAtomic(v2, &self->_stateCache, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__1);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_stateCache.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_inferenceRunnerManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end