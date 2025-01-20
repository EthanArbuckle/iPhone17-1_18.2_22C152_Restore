@interface PISemanticStyleRenderer
+ (BOOL)usingSharedSemanticStyleRendererWithMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5 perform:(id)a6;
- (BOOL)matchesMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5;
- (BOOL)prepareProcessor;
- (BOOL)useStyleEngine;
- (CMISmartStyleMetalRendererV1)processor;
- (MTLCommandQueue)metalCommandQueue;
- (PISemanticStyleRenderer)init;
- (PISemanticStyleRenderer)initWithMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5;
- (int)processingType;
- (void)dealloc;
@end

@implementation PISemanticStyleRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

- (CMISmartStyleMetalRendererV1)processor
{
  return self->_processor;
}

- (BOOL)useStyleEngine
{
  return self->_useStyleEngine;
}

- (int)processingType
{
  return self->_processingType;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (BOOL)matchesMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(PISemanticStyleRenderer *)self metalCommandQueue];

  if (v9 == v8 && [(PISemanticStyleRenderer *)self processingType] == a4) {
    return [(PISemanticStyleRenderer *)self useStyleEngine] ^ a5 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)prepareProcessor
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_processor)
  {
    v26 = NUAssertLogger_20707();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = [NSString stringWithFormat:@"Already prepared!"];
      int v34 = 138543362;
      v35 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v34, 0xCu);
    }
    v13 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v28 = NUAssertLogger_20707();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        id specific = dispatch_get_specific(*v13);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = specific;
        v13 = [v30 callStackSymbols];
        v32 = [v13 componentsJoinedByString:@"\n"];
        int v34 = 138543618;
        v35 = (const void **)specific;
        __int16 v36 = 2114;
        v37 = v32;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v34, 0x16u);
      }
    }
    else if (v29)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [specific componentsJoinedByString:@"\n"];
      int v34 = 138543362;
      v35 = v13;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v34, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_31;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F55F60]);
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [(PISemanticStyleRenderer *)self metalCommandQueue];
  v6 = (FigMetalContext *)[v3 initWithbundle:v4 andOptionalCommandQueue:v5];
  ctx = self->_ctx;
  self->_ctx = v6;

  if (self->_useStyleEngine)
  {
    id specific = objc_alloc_init(MEMORY[0x1E4F55F58]);
    [specific setMemSize:40894464];
    [specific setWireMemory:1];
    id v9 = [(PISemanticStyleRenderer *)self description];
    [specific setLabel:v9];

    id v10 = objc_alloc(MEMORY[0x1E4F55F40]);
    v11 = [(FigMetalContext *)self->_ctx device];
    v13 = (const void **)[v10 initWithDevice:v11 allocatorType:2];
    [(FigMetalContext *)self->_ctx setAllocator:v13];

    v12 = [(FigMetalContext *)self->_ctx allocator];
    LODWORD(v13) = [v12 setupWithDescriptor:specific];

    if (v13)
    {
      if (*MEMORY[0x1E4F7A750] == -1)
      {
LABEL_5:
        v14 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
        {
          int v34 = 67109120;
          LODWORD(v35) = v13;
          _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Failed to setup FigMetalAllocator, err = %d", (uint8_t *)&v34, 8u);
        }

        goto LABEL_8;
      }
LABEL_31:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
      goto LABEL_5;
    }
  }
  v16 = (CMISmartStyleMetalRendererV1 *)[objc_alloc(MEMORY[0x1E4F55F00]) initWithMetalContext:self->_ctx];
  processor = self->_processor;
  self->_processor = v16;

  int v18 = [(CMISmartStyleMetalRendererV1 *)self->_processor setup];
  if (v18)
  {
    int v19 = v18;
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
    }
    v20 = *MEMORY[0x1E4F7A758];
    BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR);
    if (v15)
    {
      int v34 = 67109120;
      LODWORD(v35) = v19;
      v21 = "PISemanticStyleProcessor: setup failed with error %d";
      v22 = v20;
LABEL_20:
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v34, 8u);
LABEL_8:
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    int v23 = [(CMISmartStyleMetalRendererV1 *)self->_processor prepareToProcess:self->_processingType];
    if (!v23)
    {
      LOBYTE(v15) = 1;
      return v15;
    }
    int v24 = v23;
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
    }
    v25 = *MEMORY[0x1E4F7A758];
    BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR);
    if (v15)
    {
      int v34 = 67109120;
      LODWORD(v35) = v24;
      v21 = "PISemanticStyleProcessor: prepare failed with error %d";
      v22 = v25;
      goto LABEL_20;
    }
  }
  return v15;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
  }
  id v3 = (id)*MEMORY[0x1E4F7A758];
  v4 = v3;
  os_signpost_id_t sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    metalCommandQueue = self->_metalCommandQueue;
    ctx = self->_ctx;
    id v8 = [(FigMetalContext *)ctx allocator];
    *(_DWORD *)buf = 134218752;
    v11 = self;
    __int16 v12 = 2048;
    v13 = metalCommandQueue;
    __int16 v14 = 2048;
    BOOL v15 = ctx;
    __int16 v16 = 2048;
    uint64_t v17 = [v8 memSize];
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v4, OS_SIGNPOST_INTERVAL_END, sid, "PISemanticStyleRenderer", "%p q=%p ctx=%p mem=%zu", buf, 0x2Au);
  }
  v9.receiver = self;
  v9.super_class = (Class)PISemanticStyleRenderer;
  [(PISemanticStyleRenderer *)&v9 dealloc];
}

- (PISemanticStyleRenderer)initWithMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v20 = NUAssertLogger_20707();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "commandQueue != nil");
      v21 = (PISemanticStyleRenderer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v24 = NUAssertLogger_20707();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = (PISemanticStyleRenderer *)dispatch_get_specific(*v22);
        BOOL v29 = (void *)MEMORY[0x1E4F29060];
        v30 = v28;
        id v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        __int16 v36 = 2114;
        v37 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v35 = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v10 = v9;
  v33.receiver = self;
  v33.super_class = (Class)PISemanticStyleRenderer;
  v11 = [(PISemanticStyleRenderer *)&v33 init];
  objc_storeStrong((id *)&v11->_metalCommandQueue, a3);
  v11->_processingType = a4;
  v11->_useStyleEngine = a5;
  __int16 v12 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
  }
  v13 = (id *)MEMORY[0x1E4F7A758];
  __int16 v14 = (id)*MEMORY[0x1E4F7A758];
  v11->_os_signpost_id_t sid = os_signpost_id_make_with_pointer(v14, v11);

  if (*v12 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
  }
  BOOL v15 = *v13;
  __int16 v16 = v15;
  os_signpost_id_t sid = v11->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    metalCommandQueue = v11->_metalCommandQueue;
    *(_DWORD *)buf = 134218240;
    v35 = v11;
    __int16 v36 = 2048;
    v37 = metalCommandQueue;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v16, OS_SIGNPOST_INTERVAL_BEGIN, sid, "PISemanticStyleRenderer", "%p q=%p", buf, 0x16u);
  }

  return v11;
}

- (PISemanticStyleRenderer)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v6 = NSString;
      v7 = v5;
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(a2);
      v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_404);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          __int16 v14 = (void *)MEMORY[0x1E4F29060];
          BOOL v15 = v13;
          __int16 v16 = [v14 callStackSymbols];
          uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_404);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      BOOL v15 = v18;
      v22 = [v20 callStackSymbols];
      int v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    int v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_404);
  }
}

+ (BOOL)usingSharedSemanticStyleRendererWithMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5 perform:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  v11 = (uint64_t (**)(id, void *))a6;
  uint64_t v12 = NSStringFromClass((Class)a1);
  os_log_t v13 = [MEMORY[0x1E4F7A640] shared];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int v24 = __119__PISemanticStyleRenderer_usingSharedSemanticStyleRendererWithMetalCommandQueue_processingType_useStyleEngine_perform___block_invoke;
  BOOL v25 = &unk_1E5D80AC8;
  id v14 = v10;
  id v26 = v14;
  int v27 = v8;
  BOOL v28 = v7;
  BOOL v15 = [v13 checkOutResourceForKey:v12 matching:&v22];

  if (v15
    || (__int16 v16 = [PISemanticStyleRenderer alloc],
        BOOL v15 = -[PISemanticStyleRenderer initWithMetalCommandQueue:processingType:useStyleEngine:](v16, "initWithMetalCommandQueue:processingType:useStyleEngine:", v14, v8, v7, v22, v23, v24, v25), [(PISemanticStyleRenderer *)v15 prepareProcessor]))
  {
    uint64_t v17 = [(PISemanticStyleRenderer *)v15 processor];
    char v18 = v11[2](v11, v17);

    int v19 = [(PISemanticStyleRenderer *)v15 processor];
    [v19 resetState];

    v20 = [MEMORY[0x1E4F7A640] shared];
    [v20 checkInResource:v15 forKey:v12];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

uint64_t __119__PISemanticStyleRenderer_usingSharedSemanticStyleRendererWithMetalCommandQueue_processingType_useStyleEngine_perform___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesMetalCommandQueue:*(void *)(a1 + 32) processingType:*(unsigned int *)(a1 + 40) useStyleEngine:*(unsigned __int8 *)(a1 + 44)];
}

@end