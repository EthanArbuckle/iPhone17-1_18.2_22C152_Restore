@interface NUDevice
+ (id)_ciContextOptionsForRendererOptions:(unint64_t)a3;
- (BOOL)hasMetalSupport;
- (BOOL)shouldLogRendererUsed;
- (BOOL)shouldRenderUsingMetal;
- (BOOL)supportsPixelFormat:(id)a3;
- (MTLDevice)metalDevice;
- (NSMutableDictionary)renderers;
- (NSString)description;
- (NSString)model;
- (NSString)name;
- (NUDevice)init;
- (NUDevice)initWithName:(id)a3 model:(id)a4 metalDevice:(id)a5;
- (NURenderer)lowPriorityRenderer;
- (NURenderer)renderer;
- (id)_metalCommandQueue;
- (id)_newRendererWithCIContextOptions:(id)a3 error:(id *)a4;
- (id)_newRendererWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)_rendererWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)highPriorityLowMemoryRendererWithoutIntermediateCaching:(id *)a3;
- (id)lowPriorityLowMemoryRendererWithoutIntermediateCaching:(id *)a3;
- (id)lowPriorityRenderer:(id *)a3;
- (id)lowPriorityRendererWithoutIntermediateCaching:(id *)a3;
- (id)renderer:(id *)a3;
- (id)rendererWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)rendererWithoutIntermediateCaching:(id *)a3;
- (int64_t)_defaultSampleMode;
- (int64_t)_preferredSampleMode;
- (int64_t)defaultSampleMode;
- (unint64_t)family;
- (void)clearCaches;
- (void)clearRenderers;
- (void)executeMetal:(id)a3;
@end

@implementation NUDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_lowPriorityRenderer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_renderers, 0);
}

- (NSMutableDictionary)renderers
{
  return self->_renderers;
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (NURenderer)lowPriorityRenderer
{
  return self->_lowPriorityRenderer;
}

- (NURenderer)renderer
{
  return self->_renderer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (void)clearRenderers
{
}

- (BOOL)supportsPixelFormat:(id)a3
{
  id v4 = a3;
  v5 = [(NUDevice *)self metalDevice];
  [v4 metalFormat];

  MTLPixelFormatGetInfoForDevice();
  return 0;
}

- (id)_metalCommandQueue
{
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    id v4 = (MTLCommandQueue *)[(MTLDevice *)self->_metalDevice newCommandQueue];
    v5 = self->_commandQueue;
    self->_commandQueue = v4;

    commandQueue = self->_commandQueue;
  }

  return commandQueue;
}

- (void)executeMetal:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__NUDevice_executeMetal___block_invoke;
  block[3] = &unk_1E5D95E40;
  block[4] = self;
  block[5] = &v30;
  dispatch_sync(queue, block);
  v6 = [MEMORY[0x1E4F29060] currentThread];
  v7 = [v6 threadDictionary];

  v28 = self;
  v8 = [NSString stringWithFormat:@"NUDevice(%p).currentCommandBuffer"];
  v9 = [v7 objectForKeyedSubscript:v8];
  if (v9)
  {
    v4[2](v4, v9);
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F351E8]);
    v11 = [(id)v31[5] commandBufferWithDescriptor:v10];
    if (!v11)
    {
      v14 = NUAssertLogger_292();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [NSString stringWithFormat:@"No Metal command buffer!"];
        *(_DWORD *)buf = 138543362;
        v37 = v15;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v17 = NUAssertLogger_292();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v18)
        {
          v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v22 = [MEMORY[0x1E4F29060] callStackSymbols];
          v23 = [v22 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v37 = v21;
          __int16 v38 = 2114;
          v39 = v23;
          _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v18)
      {
        v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v37 = v20;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUDevice executeMetal:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 231, @"No Metal command buffer!", v24, v25, v26, v27, (uint64_t)v28);
    }
    [v7 setObject:v11 forKeyedSubscript:v8];
    [v11 enqueue];
    v4[2](v4, v11);
    [v11 commit];
    [v11 waitUntilScheduled];
    if ([v11 status] == 5)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_184);
      }
      v12 = (id)_NULogger;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [v11 error];
        *(_DWORD *)buf = 138543362;
        v37 = v13;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Metal execution failed: %{public}@", buf, 0xCu);
      }
    }
    [v7 setObject:0 forKeyedSubscript:v8];
  }
  _Block_object_dispose(&v30, 8);
}

uint64_t __25__NUDevice_executeMetal___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _metalCommandQueue];

  return MEMORY[0x1F41817F8]();
}

- (void)clearCaches
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__NUDevice_clearCaches__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __23__NUDevice_clearCaches__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_303];
}

void __23__NUDevice_clearCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 context];
  [v3 clearCaches];
}

- (id)_newRendererWithCIContextOptions:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [v6 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v9];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v10;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v11 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v11 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
      }
      goto LABEL_8;
    }
    if (v11 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v12 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v13 = (void *)MEMORY[0x1E4F29060];
    v14 = v12;
    v15 = [v13 callStackSymbols];
    v16 = [v15 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v16;
    _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v17 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v19 = (void *)MEMORY[0x1E4F29060];
  id v20 = specific;
  v14 = v17;
  v21 = [v19 callStackSymbols];
  v22 = [v21 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v30 = specific;
  __int16 v31 = 2114;
  uint64_t v32 = v22;
  _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v23 = (objc_class *)objc_opt_class();
  uint64_t v24 = NSStringFromClass(v23);
  _NUAssertFailHandler((uint64_t)"-[NUDevice _newRendererWithCIContextOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 198, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v25, v26, v27, v28, v24);
}

- (id)_newRendererWithOptions:(unint64_t)a3 error:(id *)a4
{
  v6 = [(id)objc_opt_class() _ciContextOptionsForRendererOptions:a3];
  id v7 = [(NUDevice *)self _newRendererWithCIContextOptions:v6 error:a4];

  return v7;
}

- (id)_rendererWithOptions:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v8 = [(NSMutableDictionary *)self->_renderers objectForKey:v7];
  if (!v8)
  {
    id v8 = [(NUDevice *)self _newRendererWithOptions:a3 error:a4];
    [(NSMutableDictionary *)self->_renderers setObject:v8 forKeyedSubscript:v7];
    if ([(NUDevice *)self shouldLogRendererUsed])
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_184);
      }
      v9 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        name = self->_name;
        int v12 = 138543874;
        v13 = name;
        __int16 v14 = 2114;
        id v15 = v8;
        __int16 v16 = 2050;
        unint64_t v17 = a3;
        _os_log_impl(&dword_1A9892000, v9, OS_LOG_TYPE_INFO, "Rendering on device %{public}@ using renderer: %{public}@ - [Options  %{public}lx]", (uint8_t *)&v12, 0x20u);
      }
    }
  }

  return v8;
}

- (id)rendererWithOptions:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  int v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__NUDevice_rendererWithOptions_error___block_invoke;
  v7[3] = &unk_1E5D93B78;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __38__NUDevice_rendererWithOptions_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _rendererWithOptions:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

  return MEMORY[0x1F41817F8]();
}

- (id)highPriorityLowMemoryRendererWithoutIntermediateCaching:(id *)a3
{
  return [(NUDevice *)self rendererWithOptions:24 error:a3];
}

- (id)lowPriorityLowMemoryRendererWithoutIntermediateCaching:(id *)a3
{
  return [(NUDevice *)self rendererWithOptions:25 error:a3];
}

- (id)lowPriorityRendererWithoutIntermediateCaching:(id *)a3
{
  return [(NUDevice *)self rendererWithOptions:17 error:a3];
}

- (id)rendererWithoutIntermediateCaching:(id *)a3
{
  return [(NUDevice *)self rendererWithOptions:16 error:a3];
}

- (id)lowPriorityRenderer:(id *)a3
{
  return [(NUDevice *)self rendererWithOptions:5 error:a3];
}

- (id)renderer:(id *)a3
{
  return [(NUDevice *)self rendererWithOptions:4 error:a3];
}

- (BOOL)shouldLogRendererUsed
{
  return +[NUGlobalSettings devicePrintRenderer];
}

- (BOOL)shouldRenderUsingMetal
{
  BOOL v2 = [(NUDevice *)self hasMetalSupport];
  if (v2) {
    LOBYTE(v2) = !+[NUGlobalSettings deviceDisableMetal];
  }
  return v2;
}

- (int64_t)_preferredSampleMode
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
  }
  BOOL v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    id v4 = v2;
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    int v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  __int16 v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  __int16 v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  uint64_t v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUDevice _preferredSampleMode]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 80, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (int64_t)_defaultSampleMode
{
  int64_t result = +[NUGlobalSettings deviceDefaultSampleMode];
  if ((unint64_t)result > 3 || ((0xEu >> (result & 0xF)) & 1) == 0)
  {
    return [(NUDevice *)self _preferredSampleMode];
  }
  return result;
}

- (int64_t)defaultSampleMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__NUDevice_defaultSampleMode__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__NUDevice_defaultSampleMode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _defaultSampleMode];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)family
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
  }
  BOOL v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v3 = NSString;
    id v4 = v2;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    int v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  __int16 v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  __int16 v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  uint64_t v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUDevice family]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 55, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (BOOL)hasMetalSupport
{
  return self->_metalDevice != 0;
}

- (NSString)description
{
  int64_t v3 = NSString;
  id v4 = [(NUDevice *)self name];
  id v5 = [(NUDevice *)self model];
  uint64_t v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return (NSString *)v6;
}

- (NUDevice)initWithName:(id)a3 model:(id)a4 metalDevice:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v25 = NUAssertLogger_292();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v43 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v28 = NUAssertLogger_292();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        id v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v32;
        __int16 v44 = 2114;
        v45 = v36;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDevice initWithName:model:metalDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 30, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"name != nil");
  }
  uint64_t v11 = v10;
  v41.receiver = self;
  v41.super_class = (Class)NUDevice;
  int v12 = [(NUDevice *)&v41 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    model = v12->_model;
    v12->_model = (NSString *)v15;

    objc_storeStrong((id *)&v12->_metalDevice, a5);
    id v17 = [NSString stringWithFormat:@"NUDevice.%@", v8];
    uint64_t v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    renderers = v12->_renderers;
    v12->_renderers = v22;
  }
  return v12;
}

- (NUDevice)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
  }
  int64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    id v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    id v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    __int16 v14 = [v12 callStackSymbols];
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  __int16 v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  uint64_t v13 = v16;
  dispatch_queue_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v29 = specific;
  __int16 v30 = 2114;
  __int16 v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUDevice init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 25, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)_ciContextOptionsForRendererOptions:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1E228];
  }
  else
  {
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1E220];
  }
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v6];
LABEL_6:
  if ((v3 & 8) != 0)
  {
    if (!+[NUGlobalSettings rendererContextLowMemoryTarget])goto LABEL_13; {
    uint64_t v10 = NSNumber;
    }
    int64_t v8 = +[NUGlobalSettings rendererContextLowMemoryTarget];
    id v9 = v10;
    goto LABEL_12;
  }
  if ((v3 & 4) != 0)
  {
    int64_t v7 = +[NUGlobalSettings rendererContextLargeMemoryTarget];
    if (v7)
    {
      int64_t v8 = v7;
      id v9 = NSNumber;
LABEL_12:
      uint64_t v11 = [v9 numberWithInteger:v8];
      [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1E200]];
    }
  }
LABEL_13:
  if ((v3 & 0x10) != 0) {
    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F1E1E0]];
  }
  int v12 = (void *)[v5 copy];

  return v12;
}

@end