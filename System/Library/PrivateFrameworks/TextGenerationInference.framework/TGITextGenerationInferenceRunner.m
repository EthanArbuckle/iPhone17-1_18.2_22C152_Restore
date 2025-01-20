@interface TGITextGenerationInferenceRunner
- (BOOL)isCanceled;
- (BOOL)shouldDoCacheLookUp;
- (NSUUID)executionUUID;
- (OS_dispatch_queue)workQueue;
- (TGITextGenerationInferenceRunner)initWithQueue:(id)a3 executionUUID:(id)a4 operation:(id)a5 session:(id)a6;
- (TGITextGenerationInferenceSession)session;
- (TGITextGenerationInferenceWordFragment)runIncrementalInferenceWithTokenIDs:(TGITextGenerationInferenceWordFragment *__return_ptr)retstr;
- (TGTextGenerationOperation)operation;
- (id).cxx_construct;
- (shared_ptr<TGITextGenerationInferenceDecodingPolicy>)decodingPolicy;
- (shared_ptr<TGITextGenerationInferenceModelInterface>)model;
- (void)cancel;
- (void)run;
- (void)setCanceled:(BOOL)a3;
- (void)setModel:(shared_ptr<TGITextGenerationInferenceModelInterface>)a3;
- (void)setShouldDoCacheLookUp:(BOOL)a3;
@end

@implementation TGITextGenerationInferenceRunner

- (TGITextGenerationInferenceRunner)initWithQueue:(id)a3 executionUUID:(id)a4 operation:(id)a5 session:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TGITextGenerationInferenceRunner;
  v15 = [(TGITextGenerationInferenceRunner *)&v22 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    operation = v15->_operation;
    v15->_operation = (TGTextGenerationOperation *)v16;

    objc_storeStrong((id *)&v15->_session, a6);
    objc_storeStrong((id *)&v15->_workQueue, a3);
    *(_WORD *)&v15->_canceled = 256;
    uint64_t v18 = [v12 copy];
    executionUUID = v15->_executionUUID;
    v15->_executionUUID = (NSUUID *)v18;

    TGITextGenerationInferenceDecodingPolicy::create(v20);
  }

  return 0;
}

- (void)run
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_25EB6B000, log, OS_LOG_TYPE_ERROR, "Failed to run operation: %@, model configuration doesn't match session configuration", buf, 0xCu);
}

- (TGITextGenerationInferenceWordFragment)runIncrementalInferenceWithTokenIDs:(TGITextGenerationInferenceWordFragment *__return_ptr)retstr
{
  v3 = v2;
  v4 = v1;
  v6 = [v1 workQueue];
  dispatch_assert_queue_V2(v6);

  if (!v3[1]) {
    -[TGITextGenerationInferenceRunner runIncrementalInferenceWithTokenIDs:]();
  }
  if ([v4 shouldDoCacheLookUp])
  {
    v7 = [v4 session];
    v8 = v7;
    if (v7)
    {
      [v7 stateCache];
      v7 = __p[0];
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
    }
    TGITextGenerationInferenceSessionStateCache::cacheEntryForTokenIDs((const void ****)v7, (uint64_t)v3, (uint64_t)&v25);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }

    if (v27)
    {
      int v9 = *v28;
      [v4 model];
      (*(void (**)(void **__return_ptr))(*(void *)v23 + 64))(__p);
      if (v24) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
      retstr->var0 = v9;
      if (SHIBYTE(v22) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&retstr->var1, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      }
      else
      {
        *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0 = *(_OWORD *)__p;
        *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = v22;
      }
      [v4 model];
      (*(void (**)(char *, void, long long *))(*(void *)v23 + 16))(v23, v3[1], &v25);
      result = (TGITextGenerationInferenceWordFragment *)v24;
      if (v24) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
      if (SHIBYTE(v22) < 0)
      {
        uint64_t v18 = __p[0];
        goto LABEL_38;
      }
      return result;
    }
    [v4 setShouldDoCacheLookUp:0];
  }
  uint64_t v10 = *(unsigned int *)(*v3 + 4 * v3[1] - 4);
  [v4 model];
  (*(void (**)(void, uint64_t))(*(void *)v25 + 48))(v25, v10);
  if (*((void *)&v25 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v25 + 1));
  }
  [v4 decodingPolicy];
  id v11 = v23;
  [v4 model];
  (*(void (**)(long long *__return_ptr))(*(void *)v19 + 32))(&v25);
  TGITextGenerationInferenceDecodingPolicy::stateWithLogits(v11, (short float *)v25, *((unint64_t *)&v25 + 1), (uint64_t *)__p);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  id v12 = [v4 session];
  id v13 = v12;
  if (v12)
  {
    [v12 stateCache];
    uint64_t v14 = (uint64_t)v23;
  }
  else
  {
    uint64_t v14 = 0;
    v23 = 0;
    v24 = 0;
  }
  [v4 model];
  (*(void (**)(long long *__return_ptr))(*(void *)v19 + 24))(&v25);
  TGITextGenerationInferenceSessionStateCache::addCacheEntryForStepState(v14, (uint64_t)&v25, (uint64_t)__p);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }

  int v15 = *(_DWORD *)__p[0];
  [v4 model];
  (*(void (**)(long long *__return_ptr))(*(void *)v23 + 64))(&v25);
  result = (TGITextGenerationInferenceWordFragment *)v24;
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  retstr->var0 = v15;
  p_var1 = (std::string *)&retstr->var1;
  if ((SHIBYTE(v26) & 0x80000000) == 0)
  {
    *(_OWORD *)&p_var1->__r_.__value_.__l.__data_ = v25;
    p_var1->__r_.__value_.__r.__words[2] = v26;
    return result;
  }
  std::string::__init_copy_ctor_external(p_var1, (const std::string::value_type *)v25, *((std::string::size_type *)&v25 + 1));
  if (SHIBYTE(v26) < 0)
  {
    uint64_t v18 = (void *)v25;
LABEL_38:
    operator delete(v18);
  }
  return result;
}

- (void)cancel
{
  v6 = [(TGITextGenerationInferenceRunner *)self workQueue];
  dispatch_assert_queue_not_V2(v6);

  [(TGITextGenerationInferenceRunner *)self setCanceled:1];
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:89 userInfo:0];
  v3 = [(TGITextGenerationInferenceRunner *)self session];
  v4 = [v3 delegate];
  v5 = [(TGITextGenerationInferenceRunner *)self executionUUID];
  [v4 operationWithExecutionUUID:v5 didFailWithError:v7];
}

- (shared_ptr<TGITextGenerationInferenceModelInterface>)model
{
  objc_copyCppObjectAtomic(v2, &self->_model, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setModel:(shared_ptr<TGITextGenerationInferenceModelInterface>)a3
{
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (TGTextGenerationOperation)operation
{
  return (TGTextGenerationOperation *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)executionUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (TGITextGenerationInferenceSession)session
{
  return (TGITextGenerationInferenceSession *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)shouldDoCacheLookUp
{
  return self->_shouldDoCacheLookUp;
}

- (void)setShouldDoCacheLookUp:(BOOL)a3
{
  self->_shouldDoCacheLookUp = a3;
}

- (shared_ptr<TGITextGenerationInferenceDecodingPolicy>)decodingPolicy
{
  objc_copyCppObjectAtomic(v2, &self->_decodingPolicy, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__11);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_decodingPolicy.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_model.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_operation, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

- (void)runIncrementalInferenceWithTokenIDs:.cold.1()
{
}

@end