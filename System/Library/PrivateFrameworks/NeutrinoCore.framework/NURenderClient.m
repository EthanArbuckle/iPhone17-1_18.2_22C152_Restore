@interface NURenderClient
- (BOOL)shouldCoalesceUpdates;
- (NSString)name;
- (NUPriority)priority;
- (NURenderClient)init;
- (NURenderClient)initWithName:(id)a3;
- (NURenderClient)initWithName:(id)a3 responseQueue:(id)a4;
- (NURenderContext)renderContext;
- (OS_dispatch_queue)responseQueue;
- (id)description;
- (id)genericCompletionBlock;
- (void)cancel;
- (void)setGenericCompletionBlock:(id)a3;
- (void)setName:(id)a3;
- (void)setPriority:(id)a3;
- (void)setRenderContext:(id)a3;
- (void)setShouldCoalesceUpdates:(BOOL)a3;
- (void)submitGenericRequest:(id)a3;
- (void)submitGenericRequest:(id)a3 completion:(id)a4;
@end

@implementation NURenderClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_genericCompletionBlock, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_priority, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setGenericCompletionBlock:(id)a3
{
}

- (id)genericCompletionBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setRenderContext:(id)a3
{
}

- (NURenderContext)renderContext
{
  return self->_renderContext;
}

- (OS_dispatch_queue)responseQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPriority:(id)a3
{
}

- (NUPriority)priority
{
  return (NUPriority *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShouldCoalesceUpdates:(BOOL)a3
{
  self->_shouldCoalesceUpdates = a3;
}

- (BOOL)shouldCoalesceUpdates
{
  return self->_shouldCoalesceUpdates;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)submitGenericRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NURenderClient *)self genericCompletionBlock];
  [(NURenderClient *)self submitGenericRequest:v4 completion:v5];
}

- (void)submitGenericRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[v7 copy];
  v9 = [v7 name];

  [v8 setName:v9];
  v10 = [(NURenderClient *)self priority];
  [v8 setPriority:v10];

  v11 = [(NURenderClient *)self responseQueue];
  [v8 setResponseQueue:v11];

  v12 = [(NURenderClient *)self renderContext];
  [v8 setRenderContext:v12];

  [v8 setCompletionBlock:v6];
  objc_msgSend(v8, "setShouldCoalesceUpdates:", -[NURenderClient shouldCoalesceUpdates](self, "shouldCoalesceUpdates"));
  [v8 setSubmitTime:NUAbsoluteTime()];
  v13 = (void *)voucher_copy_without_importance();
  [v8 setVoucher:v13];

  if (+[NUGlobalSettings runNeutrinoSynchronously])
  {
    v14 = (void *)[v8 newRenderJob];
    [v14 runSynchronous];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__NURenderClient_submitGenericRequest_completion___block_invoke;
    v15[3] = &unk_1E5D94448;
    id v16 = v8;
    +[NURenderTransaction withCurrentTransaction:v15];
  }
}

uint64_t __50__NURenderClient_submitGenericRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 submitRequest:*(void *)(a1 + 32)];
}

- (void)cancel
{
  id v4 = +[NUScheduler sharedScheduler];
  v3 = [(NURenderClient *)self renderContext];
  [v4 cancelJobsForRenderContext:v3];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p - '%@'>", objc_opt_class(), self, self->_name];
}

- (NURenderClient)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    id v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
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
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderClient init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 254, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (NURenderClient)initWithName:(id)a3 responseQueue:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = (NSString *)a3;
  id v7 = (OS_dispatch_queue *)a4;
  if (!v6)
  {
    id v19 = NUAssertLogger_5719();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_5719();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v33;
        __int16 v54 = 2114;
        v55 = v37;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderClient initWithName:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 239, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"name != nil");
  }
  v8 = v7;
  if (!v7)
  {
    uint64_t v26 = NUAssertLogger_5719();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "responseQueue != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v29 = NUAssertLogger_5719();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v42;
        __int16 v54 = 2114;
        v55 = v46;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderClient initWithName:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 240, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"responseQueue != nil");
  }
  v51.receiver = self;
  v51.super_class = (Class)NURenderClient;
  v9 = [(NURenderClient *)&v51 init];
  name = v9->_name;
  v9->_name = v6;
  v11 = v6;

  v12 = objc_alloc_init(NUPriority);
  priority = v9->_priority;
  v9->_priority = v12;

  responseQueue = v9->_responseQueue;
  v9->_responseQueue = v8;
  v15 = v8;

  id v16 = objc_alloc_init(NURenderContext);
  renderContext = v9->_renderContext;
  v9->_renderContext = v16;

  return v9;
}

- (NURenderClient)initWithName:(id)a3
{
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("NURenderClient.response", v5);

  v8 = [(NURenderClient *)self initWithName:v6 responseQueue:v7];
  return v8;
}

@end