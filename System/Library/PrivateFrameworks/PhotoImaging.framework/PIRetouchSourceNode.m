@interface PIRetouchSourceNode
+ (id)intermediateCacheForSubsample:(BOOL)a3;
- (PIRetouchSourceNode)initWithImage:(id)a3 identifier:(id)a4 orientation:(int64_t)a5;
- (PIRetouchSourceNode)initWithImage:(id)a3 settings:(id)a4 orientation:(int64_t)a5;
- (PIRetouchSourceNode)initWithInputImage:(id)a3 retouchStrokes:(id)a4 detectedFaces:(id)a5 cacheKey:(id)a6;
- (void)_performRetouchIfNeeded;
- (void)applyRetouchStrokes:(id)a3 toImage:(id)a4;
- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9;
@end

@implementation PIRetouchSourceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_retouchImage, 0);
}

- (void)applyRetouchStrokes:(id)a3 toImage:(id)a4
{
  v26 = self;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  uint64_t v30 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v30)
  {
    v31 = 0;
    uint64_t v28 = *(void *)v35;
    unint64_t v6 = 0x1E5D7D000uLL;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v9 = kdebug_trace();
        context = (void *)MEMORY[0x1AD0F8D70](v9);
        v10 = [v8 objectForKeyedSubscript:@"repairEdges"];
        v11 = [v8 objectForKeyedSubscript:@"sourceOffset"];
        v12 = [v11 objectForKeyedSubscript:@"x"];
        v13 = [v11 objectForKeyedSubscript:@"y"];
        [v12 doubleValue];
        double v15 = v14;
        [v13 doubleValue];
        double v17 = v16;
        v18 = [*(id *)(v6 + 4016) brushStrokeFromRetouchStrokeDictionary:v8];
        v19 = [v8 objectForKeyedSubscript:@"mode"];
        uint64_t v20 = PIRetouchModeFromString(v19);

        if (v20 == 2)
        {
          if (!v31)
          {
            v31 = [MEMORY[0x1E4F1E018] context];
          }
          v21 = [(NURenderNode *)v26 settings];
          v22 = [v21 objectForKeyedSubscript:@"detectedFaces"];
          uint64_t v33 = 0;
          +[PIRepairUtilities applyRepairMLStrokeToMutableBuffer:v29 brushStroke:v18 detectedFaces:v22 context:v31 error:&v33];
        }
        else
        {
          objc_msgSend(*(id *)(v6 + 4016), "applyRepairStrokeToMutableBuffer:brushStroke:sourceOffset:repairEdges:", v29, v18, objc_msgSend(v10, "BOOLValue"), v15, v17);
        }

        kdebug_trace();
        unint64_t v6 = 0x1E5D7D000;
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v30);
  }
  else
  {
    v31 = 0;
  }

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_269);
  }
  v23 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    uint64_t v25 = [obj count];
    *(_DWORD *)buf = 134217984;
    uint64_t v39 = v25;
    _os_log_impl(&dword_1A9680000, v24, OS_LOG_TYPE_DEFAULT, "Recomputed retouch for %ld strokes", buf, 0xCu);
  }
}

- (void)_performRetouchIfNeeded
{
  if (!self->_renderedImage)
  {
    id obj = self->_cacheKey;
    objc_sync_enter(obj);
    if (!self->_renderedImage)
    {
      [(PIRetouchSourceNode *)self applyRetouchStrokes:self->_strokes toImage:self->_retouchImage];
      objc_opt_class();
      v3 = +[PIRetouchSourceNode intermediateCacheForSubsample:objc_opt_isKindOfClass() & 1];
      v4 = [(NUMutableBufferImage *)self->_retouchImage purgeableImageCopy];
      [v3 setObject:v4 forKey:self->_cacheKey];

      id v5 = [(NUMutableBufferImage *)self->_retouchImage immutableImageCopy];
      renderedImage = self->_renderedImage;
      self->_renderedImage = v5;

      retouchImage = self->_retouchImage;
      self->_retouchImage = 0;
    }
    objc_sync_exit(obj);
  }
}

+ (id)intermediateCacheForSubsample:(BOOL)a3
{
  BOOL v3 = a3;
  if (intermediateCacheForSubsample__onceToken != -1) {
    dispatch_once(&intermediateCacheForSubsample__onceToken, &__block_literal_global_5807);
  }
  v4 = &intermediateCacheForSubsample__s_retouchCache;
  if (v3) {
    v4 = &intermediateCacheForSubsample__s_retouchCacheForSubsample;
  }
  id v5 = (void *)*v4;
  return v5;
}

uint64_t __53__PIRetouchSourceNode_intermediateCacheForSubsample___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)intermediateCacheForSubsample__s_retouchCache;
  intermediateCacheForSubsample__s_retouchCache = (uint64_t)v0;

  [(id)intermediateCacheForSubsample__s_retouchCache setCountLimit:5];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  BOOL v3 = (void *)intermediateCacheForSubsample__s_retouchCacheForSubsample;
  intermediateCacheForSubsample__s_retouchCacheForSubsample = (uint64_t)v2;

  v4 = (void *)intermediateCacheForSubsample__s_retouchCacheForSubsample;
  return [v4 setCountLimit:5];
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a9;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_269);
  }
  double v16 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    v26 = (void *)MEMORY[0x1E4F29060];
    v27 = v16;
    uint64_t v28 = [v26 currentThread];
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)&uint8_t buf[4] = a5;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = a6;
    HIWORD(v39) = 1024;
    *(_DWORD *)v40 = a7;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = a8;
    *(_WORD *)&v40[10] = 2048;
    *(void *)&v40[12] = v28;
    _os_log_debug_impl(&dword_1A9680000, v27, OS_LOG_TYPE_DEBUG, "provideImageData (%d,%d,%d,%d) tid=%p", buf, 0x24u);
  }
  [(PIRetouchSourceNode *)self _performRetouchIfNeeded];
  renderedImage = self->_renderedImage;
  *(void *)buf = a5;
  unint64_t v39 = a6;
  *(void *)v40 = a7;
  *(void *)&v40[8] = a8;
  [MEMORY[0x1E4F7A528] copyPixelsFromImage:renderedImage rect:buf destPtr:a3 destPtrRowBytes:a4];
  *(void *)buf = a5;
  unint64_t v39 = a6;
  *(void *)v40 = a7;
  *(void *)&v40[8] = a8;
  v18 = [MEMORY[0x1E4F7A5F8] regionWithRect:buf];
  [(NUBufferImage *)self->_renderedImage validRegion];
  unint64_t v29 = a5;
  uint64_t v20 = v19 = a3;
  v21 = [v18 regionByRemovingRegion:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F7A588]);
  v23 = [(NUBufferImage *)self->_renderedImage format];
  v24 = objc_msgSend(v22, "initWithSize:format:rowBytes:mutableBytes:", a7, a8, v23, a4, v19);

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __75__PIRetouchSourceNode_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke;
  v31[3] = &unk_1E5D80460;
  unint64_t v34 = a6;
  unint64_t v35 = a7;
  id v32 = v24;
  unint64_t v33 = v29;
  unint64_t v36 = a8;
  long long v37 = buf;
  *(void *)buf = 0;
  id v25 = v24;
  [v21 enumerateRects:v31];
}

uint64_t __75__PIRetouchSourceNode_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke(uint64_t a1, long long *a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v3 = a2[1];
  long long v7 = *a2;
  long long v8 = v3;
  NUPixelRectOffset();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 72);
  long long v7 = 0u;
  long long v8 = 0u;
  return [MEMORY[0x1E4F7A528] fillPixelsInBuffer:v4 rect:&v7 srcPixel:v5];
}

- (PIRetouchSourceNode)initWithInputImage:(id)a3 retouchStrokes:(id)a4 detectedFaces:(id)a5 cacheKey:(id)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    long long v37 = NUAssertLogger_5758();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil");
      *(_DWORD *)location = 138543362;
      *(void *)&location[4] = v38;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", location, 0xCu);
    }
    unint64_t v39 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v41 = NUAssertLogger_5758();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v55 = dispatch_get_specific(*v39);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v55;
        __int16 v83 = 2114;
        v84 = v59;
        _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", location, 0x16u);
      }
      goto LABEL_31;
    }
    if (!v42) {
      goto LABEL_31;
    }
LABEL_22:
    v53 = [MEMORY[0x1E4F29060] callStackSymbols];
    v54 = [v53 componentsJoinedByString:@"\n"];
    *(_DWORD *)location = 138543362;
    *(void *)&location[4] = v54;
    _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", location, 0xCu);

    goto LABEL_31;
  }
  if (!v10)
  {
    v43 = NUAssertLogger_5758();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "strokes != nil");
      *(_DWORD *)location = 138543362;
      *(void *)&location[4] = v44;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", location, 0xCu);
    }
    v45 = (const void **)MEMORY[0x1E4F7A308];
    v46 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v41 = NUAssertLogger_5758();
    BOOL v47 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v47)
      {
        v60 = dispatch_get_specific(*v45);
        v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        v63 = [v61 callStackSymbols];
        v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v60;
        __int16 v83 = 2114;
        v84 = v64;
        _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", location, 0x16u);
      }
      goto LABEL_31;
    }
    if (!v47) {
      goto LABEL_31;
    }
    goto LABEL_22;
  }
  v13 = v12;
  if (!v12)
  {
    v48 = NUAssertLogger_5758();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cacheKey != nil");
      *(_DWORD *)location = 138543362;
      *(void *)&location[4] = v49;
      _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", location, 0xCu);
    }
    v50 = (const void **)MEMORY[0x1E4F7A308];
    v51 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v41 = NUAssertLogger_5758();
    BOOL v52 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (!v51)
    {
      if (!v52) {
        goto LABEL_31;
      }
      goto LABEL_22;
    }
    if (v52)
    {
      v65 = dispatch_get_specific(*v50);
      v66 = (void *)MEMORY[0x1E4F29060];
      id v67 = v65;
      v68 = [v66 callStackSymbols];
      v69 = [v68 componentsJoinedByString:@"\n"];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v65;
      __int16 v83 = 2114;
      v84 = v69;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", location, 0x16u);
    }
LABEL_31:

    _NUAssertFailHandler();
    __break(1u);
  }
  v70 = v11;
  uint64_t v14 = [v9 size];
  uint64_t v16 = v15;
  uint64_t v80 = *MEMORY[0x1E4F1E3E8];
  double v17 = [MEMORY[0x1E4F1CA98] null];
  v81 = v17;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];

  objc_initWeak((id *)location, self);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __80__PIRetouchSourceNode_initWithInputImage_retouchStrokes_detectedFaces_cacheKey___block_invoke;
  v74[3] = &unk_1E5D7F300;
  objc_copyWeak(&v75, (id *)location);
  v18 = (void *)MEMORY[0x1AD0F8FE0](v74);
  id v19 = objc_alloc(MEMORY[0x1E4F1E050]);
  uint64_t v20 = [v9 format];
  uint64_t v21 = [v20 CIFormat];
  id v22 = [v9 colorSpace];
  v23 = objc_msgSend(v19, "initWithImageProvider:width:height:format:colorSpace:options:", v18, v14, v16, v21, objc_msgSend(v22, "CGColorSpace"), v71);

  if (v70)
  {
    v78[0] = @"identifier";
    v78[1] = @"strokes";
    v79[0] = v13;
    v79[1] = v10;
    v78[2] = @"detectedFaces";
    v79[2] = v70;
    v24 = v78;
    id v25 = v79;
    uint64_t v26 = 3;
  }
  else
  {
    v76[0] = @"identifier";
    v76[1] = @"strokes";
    v77[0] = v13;
    v77[1] = v10;
    v24 = v76;
    id v25 = v77;
    uint64_t v26 = 2;
  }
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:v26];
  v73.receiver = self;
  v73.super_class = (Class)PIRetouchSourceNode;
  uint64_t v28 = [(NUCISourceNode *)&v73 initWithImage:v23 settings:v27 orientation:1];
  uint64_t v29 = [v9 mutableImageCopy];
  retouchImage = v28->_retouchImage;
  v28->_retouchImage = (NUMutableBufferImage *)v29;

  renderedImage = v28->_renderedImage;
  v28->_renderedImage = 0;

  uint64_t v32 = [v10 copy];
  strokes = v28->_strokes;
  v28->_strokes = (NSArray *)v32;

  uint64_t v34 = [v13 copy];
  cacheKey = v28->_cacheKey;
  v28->_cacheKey = (NSString *)v34;

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)location);

  return v28;
}

void __80__PIRetouchSourceNode_initWithInputImage_retouchStrokes_detectedFaces_cacheKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained provideImageData:a2 bytesPerRow:a3 origin:a4 :a5 size:a6 :a7 userInfo:0];
}

- (PIRetouchSourceNode)initWithImage:(id)a3 settings:(id)a4 orientation:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v10 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v11 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v12 = NSString;
      v13 = v11;
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(a2);
      double v17 = [v12 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v15, v16];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v17;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v18 = *v9;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v18 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
        }
LABEL_7:
        os_log_t v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F29060];
          uint64_t v21 = v19;
          id v22 = [v20 callStackSymbols];
          v23 = [v22 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v32 = v23;
          _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v18 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v26 = (void *)MEMORY[0x1E4F29060];
      id v27 = specific;
      uint64_t v21 = v24;
      uint64_t v28 = [v26 callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = specific;
      __int16 v33 = 2114;
      uint64_t v34 = v29;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
  }
}

- (PIRetouchSourceNode)initWithImage:(id)a3 identifier:(id)a4 orientation:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v10 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v11 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v12 = NSString;
      v13 = v11;
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(a2);
      double v17 = [v12 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v15, v16];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v17;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v18 = *v9;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v18 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
        }
LABEL_7:
        os_log_t v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F29060];
          uint64_t v21 = v19;
          id v22 = [v20 callStackSymbols];
          v23 = [v22 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v32 = v23;
          _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v18 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v26 = (void *)MEMORY[0x1E4F29060];
      id v27 = specific;
      uint64_t v21 = v24;
      uint64_t v28 = [v26 callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = specific;
      __int16 v33 = 2114;
      uint64_t v34 = v29;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
  }
}

@end