@interface _NUStyleEngineMemoryResource
+ (BOOL)usingSharedMemoryResourceForDevice:(id)a3 withDescriptor:(id)a4 perform:(id)a5;
- (BOOL)setup;
- (CMIExternalMemoryDescriptor)descriptor;
- (CMIExternalMemoryResource)resource;
- (MTLDevice)device;
- (_NUStyleEngineMemoryResource)init;
- (_NUStyleEngineMemoryResource)initWithDevice:(id)a3 descriptor:(id)a4;
- (id)description;
- (void)dealloc;
@end

@implementation _NUStyleEngineMemoryResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (CMIExternalMemoryResource)resource
{
  return self->_resource;
}

- (CMIExternalMemoryDescriptor)descriptor
{
  return self->_descriptor;
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CMIExternalMemoryResource *)self->_resource allocatorBackend];
  v6 = [v3 stringWithFormat:@"<%@:%p size: %zu>", v4, self, objc_msgSend(v5, "memSize")];

  return v6;
}

- (BOOL)setup
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F55F50]);
  objc_msgSend(v3, "setMemSize:", -[CMIExternalMemoryDescriptor memSize](self->_descriptor, "memSize"));
  [v3 setWireMemory:0];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 setLabel:v5];

  [v3 setMemoryPoolId:0];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F48]), "initWithDevice:allocatorType:", self->_device, -[CMIExternalMemoryDescriptor allocatorType](self->_descriptor, "allocatorType"));
  int v7 = [v6 setupWithDescriptor:v3];
  if (v7)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Failed to setup FigMetalAllocatorBackend, err = %d", (uint8_t *)v10, 8u);
    }
  }
  else
  {
    [(CMIExternalMemoryResource *)self->_resource setAllocatorBackend:v6];
  }

  return v7 == 0;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  id v3 = (id)_NULogger;
  uint64_t v4 = v3;
  os_signpost_id_t sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = [(CMIExternalMemoryResource *)self->_resource allocatorBackend];
    *(_DWORD *)buf = 134218240;
    v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 memSize];
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v4, OS_SIGNPOST_INTERVAL_END, sid, "_NUStyleEngineMemoryResource", "%p mem=%zu", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)_NUStyleEngineMemoryResource;
  [(_NUStyleEngineMemoryResource *)&v7 dealloc];
}

- (_NUStyleEngineMemoryResource)initWithDevice:(id)a3 descriptor:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = NUAssertLogger_27648();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "device != nil");
      v19 = (_NUStyleEngineMemoryResource *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_27648();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = (_NUStyleEngineMemoryResource *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        __int16 v53 = 2114;
        v54 = v36;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineMemoryResource initWithDevice:descriptor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2517, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"device != nil");
  }
  v9 = v8;
  if (!v8)
  {
    v25 = NUAssertLogger_27648();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "desc != nil");
      v26 = (_NUStyleEngineMemoryResource *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_27648();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v41 = (_NUStyleEngineMemoryResource *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E4F29060];
        v43 = v41;
        v44 = [v42 callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v41;
        __int16 v53 = 2114;
        v54 = v45;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineMemoryResource initWithDevice:descriptor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2518, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"desc != nil");
  }
  v50.receiver = self;
  v50.super_class = (Class)_NUStyleEngineMemoryResource;
  __int16 v10 = [(_NUStyleEngineMemoryResource *)&v50 init];
  objc_storeStrong((id *)&v10->_device, a3);
  objc_storeStrong((id *)&v10->_descriptor, a4);
  uint64_t v11 = (CMIExternalMemoryResource *)objc_alloc_init(MEMORY[0x1E4F55EC0]);
  resource = v10->_resource;
  v10->_resource = v11;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  v13 = (id)_NULogger;
  v10->_os_signpost_id_t sid = os_signpost_id_make_with_pointer(v13, v10);

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  v14 = (id)_NULogger;
  v15 = v14;
  os_signpost_id_t sid = v10->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 134217984;
    v52 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v15, OS_SIGNPOST_INTERVAL_BEGIN, sid, "_NUStyleEngineMemoryResource", "%p", buf, 0xCu);
  }

  return v10;
}

- (_NUStyleEngineMemoryResource)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
  }
  id v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
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
  BOOL v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineMemoryResource init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2513, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (BOOL)usingSharedMemoryResourceForDevice:(id)a3 withDescriptor:(id)a4 perform:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (uint64_t (**)(id, void *))a5;
  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  uint64_t v12 = +[NURenderResourcePool shared];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __90___NUStyleEngineMemoryResource_usingSharedMemoryResourceForDevice_withDescriptor_perform___block_invoke;
  uint64_t v24 = &unk_1E5D95DC8;
  id v13 = v7;
  id v25 = v13;
  id v14 = v8;
  id v26 = v14;
  v15 = [v12 checkOutResourceForKey:v11 matching:&v21];

  if (v15
    || (v16 = [_NUStyleEngineMemoryResource alloc],
        v15 = -[_NUStyleEngineMemoryResource initWithDevice:descriptor:](v16, "initWithDevice:descriptor:", v13, v14, v21, v22, v23, v24, v25), [(_NUStyleEngineMemoryResource *)v15 setup]))
  {
    v17 = [(_NUStyleEngineMemoryResource *)v15 resource];
    char v18 = v9[2](v9, v17);

    id v19 = +[NURenderResourcePool shared];
    [v19 checkInResource:v15 forKey:v11];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

@end