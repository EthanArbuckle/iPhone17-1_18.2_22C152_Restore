@interface NURenderRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)isOneShot;
- (BOOL)shouldCoalesceUpdates;
- (BOOL)shouldUseLowMemoryMode;
- (NSArray)pipelineFilters;
- (NSString)additionalDebugInfo;
- (NSString)name;
- (NUComposition)composition;
- (NUComposition)internalComposition;
- (NUDevice)device;
- (NUPriority)priority;
- (NURenderContext)renderContext;
- (NURenderRequest)init;
- (NURenderRequest)initWithComposition:(id)a3;
- (NURenderRequest)initWithRequest:(id)a3;
- (OS_dispatch_queue)responseQueue;
- (double)submitTime;
- (id)completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newRenderJob;
- (id)submitGenericSynchronous:(id *)a3;
- (id)voucher;
- (int64_t)mediaComponentType;
- (int64_t)requestNumber;
- (int64_t)sampleMode;
- (void)introspectPrepare:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDevice:(id)a3;
- (void)setInternalComposition:(id)a3;
- (void)setIsOneShot:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPipelineFilters:(id)a3;
- (void)setPriority:(id)a3;
- (void)setRenderContext:(id)a3;
- (void)setRequestNumber:(int64_t)a3;
- (void)setResponseQueue:(id)a3;
- (void)setSampleMode:(int64_t)a3;
- (void)setShouldCoalesceUpdates:(BOOL)a3;
- (void)setShouldUseLowMemoryMode:(BOOL)a3;
- (void)setSubmitTime:(double)a3;
- (void)setTime:(id *)a3;
- (void)setVoucher:(id)a3;
- (void)submitGeneric:(id)a3;
- (void)submitGenericConfiguringRequest:(id)a3 completion:(id)a4;
- (void)takePropertiesFromRequest:(id)a3;
@end

@implementation NURenderRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_voucher, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_internalComposition, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_pipelineFilters, 0);
}

- (void)setVoucher:(id)a3
{
}

- (id)voucher
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setSubmitTime:(double)a3
{
  self->_submitTime = a3;
}

- (double)submitTime
{
  return self->_submitTime;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setInternalComposition:(id)a3
{
}

- (NUComposition)internalComposition
{
  return (NUComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIsOneShot:(BOOL)a3
{
  self->_isOneShot = a3;
}

- (BOOL)isOneShot
{
  return self->_isOneShot;
}

- (void)setShouldUseLowMemoryMode:(BOOL)a3
{
  self->_shouldUseLowMemoryMode = a3;
}

- (BOOL)shouldUseLowMemoryMode
{
  return self->_shouldUseLowMemoryMode;
}

- (void)setRenderContext:(id)a3
{
}

- (NURenderContext)renderContext
{
  return self->_renderContext;
}

- (void)setResponseQueue:(id)a3
{
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setPriority:(id)a3
{
}

- (NUPriority)priority
{
  return self->_priority;
}

- (void)setRequestNumber:(int64_t)a3
{
  self->_requestNumber = a3;
}

- (int64_t)requestNumber
{
  return self->_requestNumber;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setDevice:(id)a3
{
}

- (NUDevice)device
{
  return self->_device;
}

- (void)setPipelineFilters:(id)a3
{
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)introspectPrepare:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = (void *)[(NURenderRequest *)self copy];
  [v5 setSubmitTime:NUAbsoluteTime()];
  v6 = (void *)voucher_copy_without_importance();
  [v5 setVoucher:v6];

  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5679;
  v13 = __Block_byref_object_dispose__5680;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__NURenderRequest_introspectPrepare___block_invoke;
  v8[3] = &unk_1E5D95F08;
  v8[4] = &v9;
  [v5 setCompletionBlock:v8];
  v7 = (void *)[v5 newRenderJob];
  [v7 runToPrepareSynchronous];
  v4[2](v4, v7, v10[5]);

  _Block_object_dispose(&v9, 8);
}

void __37__NURenderRequest_introspectPrepare___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  id v3 = (id)[a2 result:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
}

- (id)submitGenericSynchronous:(id *)a3
{
  v4 = (void *)[(NURenderRequest *)self copy];
  [v4 setSubmitTime:NUAbsoluteTime()];
  v5 = (void *)voucher_copy_without_importance();
  [v4 setVoucher:v5];

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5679;
  v15 = __Block_byref_object_dispose__5680;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__NURenderRequest_submitGenericSynchronous___block_invoke;
  v10[3] = &unk_1E5D95F08;
  v10[4] = &v11;
  v6 = (void *)MEMORY[0x1AD0FAA90]([v4 setCompletionBlock:v10]);
  v7 = (void *)[v4 newRenderJob];
  [v7 runSynchronous];

  v8 = [(id)v12[5] result:a3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __44__NURenderRequest_submitGenericSynchronous___block_invoke(uint64_t a1, void *a2)
{
}

- (void)submitGenericConfiguringRequest:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1AD0FAA90]();
  uint64_t v9 = (void *)[(NURenderRequest *)self copy];
  [v9 setCompletionBlock:v7];
  [v9 setSubmitTime:NUAbsoluteTime()];
  v10 = (void *)voucher_copy_without_importance();
  [v9 setVoucher:v10];

  if (v6) {
    v6[2](v6, v9);
  }
  if (+[NUGlobalSettings runNeutrinoSynchronously])
  {
    uint64_t v11 = (void *)[v9 newRenderJob];
    [v11 runSynchronous];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__NURenderRequest_submitGenericConfiguringRequest_completion___block_invoke;
    v12[3] = &unk_1E5D94448;
    id v13 = v9;
    +[NURenderTransaction withCurrentTransaction:v12];
  }
}

uint64_t __62__NURenderRequest_submitGenericConfiguringRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 submitRequest:*(void *)(a1 + 32)];
}

- (void)submitGeneric:(id)a3
{
}

- (int64_t)mediaComponentType
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
  }
  uint64_t v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  uint64_t v11 = v14;
  v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NURenderRequest mediaComponentType]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 147, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)newRenderJob
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
  }
  uint64_t v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  uint64_t v11 = v14;
  v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NURenderRequest newRenderJob]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 142, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  int64_t requestNumber = self->_requestNumber;
  int64_t parentRequestNumber = self->_parentRequestNumber;
  if (parentRequestNumber)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" parent #: %lld", self->_parentRequestNumber);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = &stru_1F0017700;
  }
  int64_t copiedFromRequestNumber = self->_copiedFromRequestNumber;
  if (copiedFromRequestNumber)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" copy-of #: %lld", self->_copiedFromRequestNumber);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1F0017700;
  }
  uint64_t v11 = [v3 stringWithFormat:@"<%@:%p %@> request #: %lld%@%@ composition: %@ device: %@ filters: %@", v4, self, name, requestNumber, v8, v10, self->_internalComposition, self->_device, self->_pipelineFilters];
  if (copiedFromRequestNumber) {

  }
  if (parentRequestNumber) {

  }
  return v11;
}

- (NUComposition)composition
{
  uint64_t v2 = [(NURenderRequest *)self internalComposition];
  id v3 = (void *)[v2 copy];

  return (NUComposition *)v3;
}

- (BOOL)shouldCoalesceUpdates
{
  uint64_t v2 = [(NURenderRequest *)self renderContext];
  char v3 = [v2 shouldCoalesceUpdates];

  return v3;
}

- (void)setShouldCoalesceUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NURenderRequest *)self renderContext];
  [v4 setShouldCoalesceUpdates:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 96), self->_internalComposition);
    objc_storeStrong((id *)(v5 + 48), self->_device);
    *(void *)(v5 + 32) = self->_sampleMode;
    uint64_t v6 = [(NSArray *)self->_pipelineFilters copy];
    id v7 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v6;

    uint64_t v8 = [(NURenderRequest *)self name];
    uint64_t v9 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v8;

    uint64_t v10 = [(NURenderRequest *)self priority];
    uint64_t v11 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v10;

    uint64_t v12 = [(NURenderRequest *)self responseQueue];
    id v13 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v12;

    uint64_t v14 = [(NURenderRequest *)self renderContext];
    v15 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v14;

    long long v16 = *(_OWORD *)&self->_time.value;
    *(void *)(v5 + 144) = self->_time.epoch;
    *(_OWORD *)(v5 + 128) = v16;
    *(void *)(v5 + 64) = atomic_fetch_add(&NURenderRequestGlobalCounter, 1uLL);
    *(void *)(v5 + 16) = self->_parentRequestNumber;
    int64_t copiedFromRequestNumber = self->_copiedFromRequestNumber;
    if (!copiedFromRequestNumber) {
      int64_t copiedFromRequestNumber = self->_requestNumber;
    }
    *(void *)(v5 + 8) = copiedFromRequestNumber;
    *(unsigned char *)(v5 + 24) = self->_shouldUseLowMemoryMode;
    *(unsigned char *)(v5 + 25) = self->_isOneShot;
  }
  return (id)v5;
}

- (void)takePropertiesFromRequest:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  uint64_t v5 = [v4 device];
  device = self->_device;
  self->_device = v5;

  self->_sampleMode = [v4 sampleMode];
  id v7 = [v4 pipelineFilters];
  pipelineFilters = self->_pipelineFilters;
  self->_pipelineFilters = v7;

  uint64_t v9 = [v4 priority];
  priority = self->_priority;
  self->_priority = v9;

  uint64_t v11 = [v4 responseQueue];
  responseQueue = self->_responseQueue;
  self->_responseQueue = v11;

  id v13 = [v4 renderContext];
  renderContext = self->_renderContext;
  self->_renderContext = v13;

  if (v4)
  {
    [v4 time];
  }
  else
  {
    long long v19 = 0uLL;
    int64_t v20 = 0;
  }
  *(_OWORD *)&self->_time.value = v19;
  self->_time.epoch = v20;
  self->_shouldUseLowMemoryMode = [v4 shouldUseLowMemoryMode];
  self->_isOneShot = [v4 isOneShot];
  [v4 submitTime];
  self->_submitTime = v15;
  self->_int64_t parentRequestNumber = v4[8];
  long long v16 = [v4 name];
  id v17 = [v16 stringByAppendingFormat:@".%@", objc_opt_class()];
  name = self->_name;
  self->_name = v17;
}

- (NURenderRequest)initWithRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = NUAssertLogger_5719();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "request != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_5719();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        long long v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        long long v19 = [v17 callStackSymbols];
        int64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        __int16 v27 = 2114;
        __int16 v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderRequest initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 57, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"request != nil");
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v4 internalComposition];
  id v7 = [(NURenderRequest *)self initWithComposition:v6];

  [(NURenderRequest *)v7 takePropertiesFromRequest:v5];
  return v7;
}

- (NURenderRequest)initWithComposition:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v22 = NUAssertLogger_5719();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger_5719();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = v29;
        __int16 v41 = 2114;
        v42 = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      __int16 v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderRequest initWithComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 38, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"composition != nil");
  }
  uint64_t v5 = v4;
  v38.receiver = self;
  v38.super_class = (Class)NURenderRequest;
  uint64_t v6 = [(NURenderRequest *)&v38 init];
  v6->_int64_t requestNumber = atomic_fetch_add(&NURenderRequestGlobalCounter, 1uLL);
  uint64_t v7 = [NSString stringWithFormat:@"%@-%lld", objc_opt_class(), v6->_requestNumber];
  name = v6->_name;
  v6->_name = (NSString *)v7;

  uint64_t v9 = objc_alloc_init(NURenderContext);
  renderContext = v6->_renderContext;
  v6->_renderContext = v9;

  id v11 = [(NURenderRequest *)v6 name];
  uint64_t v12 = (const char *)[v11 UTF8String];
  BOOL v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
  responseQueue = v6->_responseQueue;
  v6->_responseQueue = (OS_dispatch_queue *)v14;

  uint64_t v16 = [v5 copy];
  internalComposition = v6->_internalComposition;
  v6->_internalComposition = (NUComposition *)v16;

  pipelineFilters = v6->_pipelineFilters;
  v6->_pipelineFilters = (NSArray *)MEMORY[0x1E4F1CBF0];

  long long v19 = objc_alloc_init(NUPriority);
  priority = v6->_priority;
  v6->_priority = v19;

  return v6;
}

- (NURenderRequest)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
  }
  BOOL v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    uint64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    BOOL v13 = v11;
    dispatch_queue_t v14 = [v12 callStackSymbols];
    double v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  int64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  id v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderRequest init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 33, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (NSString)additionalDebugInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"Request Class = %@\n", v5];

  unint64_t v6 = [(NURenderRequest *)self sampleMode];
  if (v6 > 3) {
    uint64_t v7 = @"invalid";
  }
  else {
    uint64_t v7 = off_1E5D941F0[v6];
  }
  uint64_t v8 = v7;
  [v3 appendFormat:@"sampleMode = %@\n", v8];

  uint64_t v9 = [(NURenderRequest *)self pipelineFilters];
  objc_msgSend(v3, "appendFormat:", @"pipelineFilter.count = %d\n", objc_msgSend(v9, "count"));

  uint64_t v10 = [(NURenderRequest *)self device];
  [v3 appendFormat:@"device = %@\n", v10];

  id v11 = [(NURenderRequest *)self priority];
  [v3 appendFormat:@"priority = %@\n", v11];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [(NURenderRequest *)self scalePolicy];
    [v3 appendFormat:@"scalePolicy = %@\n", v12];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "appendFormat:", @"maxFaceCount = %ld\n", -[NURenderRequest maxFaceCount](self, "maxFaceCount"));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v13 = self;
    dispatch_queue_t v14 = [(NURenderRequest *)v13 dataExtractor];
    [v3 appendFormat:@"dataExtractor = %@\n", v14];

    double v15 = [(NURenderRequest *)v13 options];

    if (v15) {
      [v3 appendFormat:@"options = %@\n", v15];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = self;
    id v17 = [(NURenderRequest *)v16 colorSpace];
    [v3 appendFormat:@"colorSpace = %@\n", v17];

    id v18 = [(NURenderRequest *)v16 regionPolicy];
    [v3 appendFormat:@"regionPolicy = %@\n", v18];

    id v19 = [(NURenderRequest *)v16 pixelFormat];
    [v3 appendFormat:@"pixelFormat = %@\n", v19];

    uint64_t v20 = [(NURenderRequest *)v16 tileSize];
    uint64_t v22 = [NSString stringWithFormat:@"{%ld, %ld}", v20, v21];
    [v3 appendFormat:@"tileSize = %@\n", v22];

    uint64_t v23 = [(NURenderRequest *)v16 borderSize];
    uint64_t v25 = v24;

    uint64_t v26 = [NSString stringWithFormat:@"{%ld, %ld}", v23, v25];
    [v3 appendFormat:@"borderSize = %@\n", v26];
  }
  uint64_t v27 = (void *)[v3 copy];

  return (NSString *)v27;
}

@end