@interface PIRetouchCacheNode
+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (BOOL)_setupRenderRequest:(id)a3 error:(id *)a4;
- (BOOL)_tryLoad:(id *)a3;
- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4;
- (PIRetouchCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_modifyEvaluatedGeometry:(id)a3;
- (id)baseIdentifier;
- (id)descriptionSubClassHook;
- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)outputRegion;
- (id)persistentURL;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)padding;
- (int64_t)subsampleFactorForScale:(id)a3;
- (void)_resolveSourceWithResponse:(id)a3;
- (void)_updateDigest:(id)a3 forStroke:(id)a4;
- (void)_updateInputRegion:(id)a3 outputRegion:(id)a4 forStroke:(id)a5 geometry:(id)a6;
- (void)resolveWithInputImage:(id)a3 retouchStrokes:(id)a4 cacheKey:(id)a5;
@end

@implementation PIRetouchCacheNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retouchQueue, 0);
  objc_storeStrong((id *)&self->_outputRegion, 0);
  objc_storeStrong((id *)&self->_inputRegion, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
}

- (id)outputRegion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5756;
  v22 = __Block_byref_object_dispose__5757;
  id v23 = 0;
  retouchQueue = self->_retouchQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__PIRetouchCacheNode_outputRegion__block_invoke;
  v17[3] = &unk_1E5D80410;
  v17[4] = self;
  v17[5] = &v18;
  dispatch_sync(retouchQueue, v17);
  v3 = (void *)v19[5];
  if (!v3)
  {
    v6 = NUAssertLogger_5758();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [NSString stringWithFormat:@"Missing output region"];
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v10 = NUAssertLogger_5758();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v14;
        __int16 v26 = 2114;
        v27 = v16;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);

  return v4;
}

void __34__PIRetouchCacheNode_outputRegion__block_invoke(uint64_t a1)
{
}

- (void)resolveWithInputImage:(id)a3 retouchStrokes:(id)a4 cacheKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [PIRetouchSourceNode alloc];
  v12 = [(NURenderNode *)self settings];
  v13 = [v12 objectForKeyedSubscript:@"detectedFaces"];
  v14 = [(PIRetouchSourceNode *)v11 initWithInputImage:v10 retouchStrokes:v9 detectedFaces:v13 cacheKey:v8];

  [(NUCacheNode *)self resolveWithSourceNode:v14 error:0];
}

- (void)_resolveSourceWithResponse:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v13 = NUAssertLogger_5758();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "response != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_5758();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v21;
        __int16 v29 = 2114;
        v30 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  id v26 = 0;
  v6 = [v4 result:&v26];
  id v7 = v26;
  if (v6)
  {
    id v8 = [(NURenderNode *)self settings];
    id v9 = [v8 objectForKeyedSubscript:@"strokes"];

    unint64_t baseStrokeIndex = self->_baseStrokeIndex;
    if (baseStrokeIndex)
    {
      uint64_t v11 = objc_msgSend(v9, "subarrayWithRange:", baseStrokeIndex, objc_msgSend(v9, "count") - self->_baseStrokeIndex);

      id v9 = (void *)v11;
    }
    v12 = [v6 image];
    [(PIRetouchCacheNode *)self resolveWithInputImage:v12 retouchStrokes:v9 cacheKey:self->_outputKey];
  }
  else
  {
    [(NUCacheNode *)self resolveWithSourceNode:0 error:v7];
  }
}

- (BOOL)_setupRenderRequest:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v13 = NUAssertLogger_5758();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_5758();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        __int16 v28 = 2114;
        __int16 v29 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v7 = v6;
  id v8 = [MEMORY[0x1E4F7A400] workingColorSpace];
  [v7 setColorSpace:v8];

  id v9 = [MEMORY[0x1E4F7A5D8] RGBAh];
  [v7 setPixelFormat:v9];

  objc_msgSend(v7, "setTileSize:", 256, 256);
  [v7 setName:@"PIRetouchCacheNode-setup"];
  inputRegion = self->_inputRegion;
  if (inputRegion)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A470]) initWithRegion:self->_inputRegion];
    [v7 setRegionPolicy:v11];

    [v7 setTargetBufferImage:self->_inputImage];
  }
  else
  {
    *a4 = [MEMORY[0x1E4F7A438] missingError:@"Missing input retouch region" object:0];
  }

  return inputRegion != 0;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PIRetouchCacheNode;
  id v13 = 0;
  v5 = [(NUCacheNode *)&v12 _evaluateImageGeometry:&v13];
  if (v5)
  {
    id v6 = v13;
    id v7 = [(PIRetouchCacheNode *)self _modifyEvaluatedGeometry:v5];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F7A438];
    id v9 = v13;
    id v10 = [v8 errorWithCode:1 reason:@"Could not get the input geometry" object:self underlyingError:v9];

    id v7 = 0;
    *a3 = v10;
  }

  return v7;
}

- (id)_modifyEvaluatedGeometry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F7A508]);
  if (v3)
  {
    [v3 extent];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  uint64_t v5 = objc_msgSend(v3, "orientation", v8, v9);
  id v6 = objc_msgSend(v4, "initWithExtent:renderScale:orientation:", &v8, *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8), v5);

  return v6;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v15 = NUAssertLogger_5758();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "originalRequest != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_5758();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        id v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        id v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  id v7 = v6;
  id v8 = objc_alloc(MEMORY[0x1E4F7A3B8]);
  long long v9 = [v7 composition];
  id v10 = (void *)[v8 initWithComposition:v9];

  [v10 setName:@"PIRetouchCacheNode-newRequest"];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v38 = __Block_byref_object_copy__5756;
  v39 = __Block_byref_object_dispose__5757;
  id v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  retouchQueue = self->_retouchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
  block[3] = &unk_1E5D7F2D8;
  uint64_t v31 = &v33;
  block[4] = self;
  id v12 = v10;
  id v30 = v12;
  v32 = buf;
  dispatch_sync(retouchQueue, block);
  if (*((unsigned char *)v34 + 24))
  {
    [v12 setResponseQueue:self->_retouchQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2;
    v28[3] = &unk_1E5D7FAE0;
    v28[4] = self;
    [v12 setCompletionBlock:v28];
    id v13 = v12;
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to generate retouch render request" object:self underlyingError:*(void *)(*(void *)&buf[8] + 40)];
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

void __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  char v5 = [v2 _setupRenderRequest:v3 error:&obj];
  objc_storeStrong(v4, obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

uint64_t __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resolveSourceWithResponse:a2];
}

- (void)_updateInputRegion:(id)a3 outputRegion:(id)a4 forStroke:(id)a5 geometry:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v23 = a4;
  id v12 = a3;
  id v13 = [v11 objectForKeyedSubscript:@"sourceOffset"];
  v14 = [v13 objectForKeyedSubscript:@"x"];
  v15 = [v13 objectForKeyedSubscript:@"y"];
  [v14 doubleValue];
  [v15 doubleValue];
  long long v46 = 0u;
  long long v47 = 0u;
  if (v10) {
    [v10 extent];
  }
  v16 = +[PIRepairUtilities brushStrokeFromRetouchStrokeDictionary:v11];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v17 = [v11 objectForKeyedSubscript:@"mode"];

  uint64_t v18 = PIRetouchModeFromString(v17);
  if (v18 == 2)
  {
    long long v44 = v46;
    long long v45 = v47;
    long long v42 = v46;
    long long v43 = v47;
    long long v40 = v46;
    long long v41 = v47;
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    if (v16)
    {
      [v16 extent];
    }
    else
    {
      long long v36 = 0uLL;
      long long v37 = 0uLL;
    }
    NUPixelRectIntersection();
    [v16 radius];
    double v20 = v19;
    uint64_t v21 = NUPixelPointFromCGPoint();
    long long v34 = v46;
    long long v35 = v47;
    long long v32 = v38;
    long long v33 = v39;
    +[PIRepairUtilities calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:](PIRepairUtilities, "calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:", v21, v22, &v34, &v32, &v44, &v42, v20, &v40);
  }
  long long v34 = v44;
  long long v35 = v45;
  long long v32 = v46;
  long long v33 = v47;
  NUPixelRectFlipYOrigin();
  long long v44 = v38;
  long long v45 = v39;
  long long v34 = v40;
  long long v35 = v41;
  long long v32 = v46;
  long long v33 = v47;
  NUPixelRectFlipYOrigin();
  long long v40 = v38;
  long long v41 = v39;
  long long v34 = v42;
  long long v35 = v43;
  long long v32 = v46;
  long long v33 = v47;
  NUPixelRectFlipYOrigin();
  long long v42 = v38;
  long long v43 = v39;
  [(PIRetouchCacheNode *)self padding];
  long long v34 = v44;
  long long v35 = v45;
  NUPixelRectDilate();
  long long v44 = v38;
  long long v45 = v39;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v34 = v40;
  long long v35 = v41;
  NUAlignPixelRectToPixelGrid();
  long long v34 = v38;
  long long v35 = v39;
  long long v32 = v46;
  long long v33 = v47;
  NUPixelRectIntersection();
  [v12 addRect:v31];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = v42;
  long long v33 = v43;
  NUAlignPixelRectToPixelGrid();
  long long v32 = v34;
  long long v33 = v35;
  NUPixelRectIntersection();
  [v12 addRect:v30];
  long long v32 = 0u;
  long long v33 = 0u;
  NUAlignPixelRectToPixelGrid();
  long long v28 = v32;
  long long v29 = v33;
  NUPixelRectIntersection();
  [v12 addRect:v27];

  long long v28 = 0u;
  long long v29 = 0u;
  NUAlignPixelRectToPixelGrid();
  long long v25 = v28;
  long long v26 = v29;
  NUPixelRectIntersection();
  [v23 addRect:v24];
}

- (int64_t)padding
{
  return 80;
}

- (void)_updateDigest:(id)a3 forStroke:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  [v15 addString:@"RetouchStroke{"];
  id v6 = [v5 objectForKeyedSubscript:@"sourceOffset"];
  objc_msgSend(v6, "nu_updateDigest:", v15);
  [v15 addCString:","];
  id v7 = [v5 objectForKeyedSubscript:@"radius"];
  objc_msgSend(v7, "nu_updateDigest:", v15);

  [v15 addCString:","];
  id v8 = [v5 objectForKeyedSubscript:@"softness"];
  objc_msgSend(v8, "nu_updateDigest:", v15);

  [v15 addCString:","];
  long long v9 = [v5 objectForKeyedSubscript:@"opacity"];
  objc_msgSend(v9, "nu_updateDigest:", v15);

  [v15 addCString:","];
  id v10 = [v5 objectForKeyedSubscript:@"points"];

  uint64_t v11 = [v10 count];
  id v12 = [NSNumber numberWithUnsignedInteger:v11];
  objc_msgSend(v12, "nu_updateDigest:", v15);
  if (v11)
  {
    [v15 addCString:","];
    id v13 = [v10 objectAtIndexedSubscript:0];
    objc_msgSend(v13, "nu_updateDigest:", v15);

    [v15 addCString:","];
    v14 = [v10 objectAtIndexedSubscript:v11 - 1];
    objc_msgSend(v14, "nu_updateDigest:", v15);
  }
  [v15 addString:@"}"];
}

- (id)baseIdentifier
{
  baseIdentifier = self->_baseIdentifier;
  if (!baseIdentifier)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F7A428]);
    id v5 = [(NUCacheNode *)self inputNode];
    objc_msgSend(v5, "nu_updateDigest:", v4);

    [v4 addString:@"subsample["];
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[NUCacheNode subsampleFactor](self, "subsampleFactor"));
    objc_msgSend(v6, "nu_updateDigest:", v4);

    [v4 addString:@"]"];
    id v7 = [v4 stringValue];
    id v8 = self->_baseIdentifier;
    self->_baseIdentifier = v7;

    baseIdentifier = self->_baseIdentifier;
  }
  return baseIdentifier;
}

- (BOOL)_tryLoad:(id *)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (self->_outputKey)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v6 = [(NUCacheNode *)self inputNode];
    v58 = [v6 outputImageGeometry:a3];

    if (v58)
    {
      id v7 = [(NURenderNode *)self settings];
      id v8 = [v7 objectForKeyedSubscript:@"strokes"];

      uint64_t v56 = [v8 count];
      long long v9 = [(PIRetouchCacheNode *)self baseIdentifier];
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:");
      [v10 addObject:v9];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v90 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v75;
        do
        {
          uint64_t v14 = 0;
          id v15 = v9;
          do
          {
            if (*(void *)v75 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v74 + 1) + 8 * v14);
            id v17 = objc_alloc_init(MEMORY[0x1E4F7A428]);
            objc_msgSend(v15, "nu_updateDigest:", v17);
            [(PIRetouchCacheNode *)self _updateDigest:v17 forStroke:v16];
            long long v9 = [v17 stringValue];

            [v10 addObject:v9];
            ++v14;
            id v15 = v9;
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v90 count:16];
        }
        while (v12);
      }

      id v18 = objc_alloc_init(MEMORY[0x1E4F7A5A0]);
      id v19 = objc_alloc_init(MEMORY[0x1E4F7A5A0]);
      double v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v56 + 1];
      uint64_t v21 = [MEMORY[0x1E4F7A5F8] region];
      [v20 addObject:v21];

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id obj = v11;
      uint64_t v22 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v71 != v23) {
              objc_enumerationMutation(obj);
            }
            [(PIRetouchCacheNode *)self _updateInputRegion:v18 outputRegion:v19 forStroke:*(void *)(*((void *)&v70 + 1) + 8 * i) geometry:v58];
            long long v25 = (void *)[v19 copy];
            [v20 addObject:v25];
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
        }
        while (v22);
      }

      long long v26 = (NURegion *)[v19 copy];
      outputRegion = self->_outputRegion;
      self->_outputRegion = v26;

      objc_opt_class();
      long long v28 = +[PIRetouchSourceNode intermediateCacheForSubsample:objc_opt_isKindOfClass() & 1];
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2020000000;
      uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
      *(void *)&long long v84 = 0;
      *((void *)&v84 + 1) = &v84;
      uint64_t v85 = 0x3032000000;
      v86 = __Block_byref_object_copy__5756;
      v87 = __Block_byref_object_dispose__5757;
      id v88 = 0;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __31__PIRetouchCacheNode__tryLoad___block_invoke;
      v59[3] = &unk_1E5D803E8;
      v63 = &v84;
      id v55 = v28;
      id v60 = v55;
      id v29 = v20;
      id v61 = v29;
      v62 = self;
      v64 = &v66;
      uint64_t v65 = v56;
      [v10 enumerateObjectsWithOptions:2 usingBlock:v59];
      id v30 = [*(id *)(*((void *)&v84 + 1) + 40) validRegion];
      int v3 = [v30 includesRegion:v18];

      if (v3)
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_269);
        }
        uint64_t v31 = (id)*MEMORY[0x1E4F7A758];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = [(NUCacheNode *)self subsampleFactor];
          uint64_t v33 = v67[3];
          *(_DWORD *)buf = 67109632;
          int v79 = v32;
          __int16 v80 = 1024;
          int v81 = v33;
          __int16 v82 = 1024;
          LODWORD(v83[0]) = v56;
          _os_log_impl(&dword_1A9680000, v31, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache hit (stroke #%d out of %d)", buf, 0x14u);
        }

        outputKey = [*(id *)(*((void *)&v84 + 1) + 40) immutableImageCopy];
        long long v35 = objc_msgSend(obj, "subarrayWithRange:", v67[3], v56 - v67[3]);
        [(PIRetouchCacheNode *)self resolveWithInputImage:outputKey retouchStrokes:v35 cacheKey:v9];
        [*(id *)(*((void *)&v84 + 1) + 40) endAccess];
      }
      else
      {
        long long v37 = *(void **)(*((void *)&v84 + 1) + 40);
        if (v37)
        {
          long long v38 = [v37 validRegion];
          long long v39 = [v18 regionByRemovingRegion:v38];
          inputRegion = self->_inputRegion;
          self->_inputRegion = v39;

          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_269);
          }
          long long v41 = (id)*MEMORY[0x1E4F7A758];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            int v42 = [(NUCacheNode *)self subsampleFactor];
            uint64_t v43 = v67[3];
            long long v44 = self->_inputRegion;
            *(_DWORD *)buf = 67109890;
            int v79 = v42;
            __int16 v80 = 1024;
            int v81 = v43;
            __int16 v82 = 1024;
            LODWORD(v83[0]) = v56;
            WORD2(v83[0]) = 2112;
            *(void *)((char *)v83 + 6) = v44;
            _os_log_impl(&dword_1A9680000, v41, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache hit [partial] (stroke #%d out of %d), invalid region: %@", buf, 0x1Eu);
          }

          long long v45 = [*(id *)(*((void *)&v84 + 1) + 40) mutableImageCopy];
          inputImage = self->_inputImage;
          self->_inputImage = v45;

          self->_unint64_t baseStrokeIndex = v67[3];
          [*(id *)(*((void *)&v84 + 1) + 40) endAccess];
        }
        else
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_269);
          }
          long long v47 = (id)*MEMORY[0x1E4F7A758];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            int v48 = [(NUCacheNode *)self subsampleFactor];
            *(_DWORD *)buf = 67109632;
            int v79 = v48;
            __int16 v80 = 1024;
            int v81 = v56;
            __int16 v82 = 2048;
            v83[0] = self;
            _os_log_impl(&dword_1A9680000, v47, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache miss [%d strokes] (%p)", buf, 0x18u);
          }

          v49 = (NURegion *)[v18 copy];
          v50 = self->_inputRegion;
          self->_inputRegion = v49;

          self->_unint64_t baseStrokeIndex = 0;
          v51 = self->_inputImage;
          self->_inputImage = 0;
        }
        v52 = v9;
        outputKey = self->_outputKey;
        self->_outputKey = v52;
      }

      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v66, 8);
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_269);
      }
      long long v36 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        id v54 = *a3;
        LODWORD(v84) = 138543362;
        *(void *)((char *)&v84 + 4) = v54;
        _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Failed to load retouch geometry, error: %{public}@", (uint8_t *)&v84, 0xCu);
      }
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

void __31__PIRetouchCacheNode__tryLoad___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v11)
  {
    [v11 beginAccess];
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) validRegion];
    uint64_t v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    int v14 = [v12 includesRegion:v13];

    if (v14)
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
      *a4 = 1;
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_269);
      }
      id v15 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void **)(a1 + 48);
        id v17 = v15;
        int v18 = [v16 subsampleFactor];
        uint64_t v19 = *(void *)(a1 + 72);
        v20[0] = 67109632;
        v20[1] = v18;
        __int16 v21 = 1024;
        int v22 = a3;
        __int16 v23 = 1024;
        int v24 = v19;
        _os_log_impl(&dword_1A9680000, v17, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache miss [purged] (stroke #%d out of %d)", (uint8_t *)v20, 0x14u);
      }
      [*(id *)(a1 + 32) removeObjectForKey:v7];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endAccess];
    }
  }
}

+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!a6)
  {
    __int16 v23 = NUAssertLogger_5758();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      int v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v25 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v27 = NUAssertLogger_5758();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        long long v41 = dispatch_get_specific(*v25);
        int v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v25 = [v42 callStackSymbols];
        long long v44 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v57 = (const void **)v41;
        __int16 v58 = 2114;
        v59 = v44;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v57 = v25;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v33 = _NUAssertFailHandler();
    goto LABEL_33;
  }
  if (!v9)
  {
    id v30 = NUAssertLogger_5758();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      uint64_t v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v25 = (const void **)MEMORY[0x1E4F7A308];
    int v32 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v27 = NUAssertLogger_5758();
    int v33 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (v33)
      {
        long long v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v25 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v57 = v25;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_35:

      int v38 = _NUAssertFailHandler();
      goto LABEL_36;
    }
LABEL_33:
    if (v33)
    {
      long long v45 = dispatch_get_specific(*v25);
      long long v46 = (void *)MEMORY[0x1E4F29060];
      id v47 = v45;
      uint64_t v25 = [v46 callStackSymbols];
      int v48 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v45;
      __int16 v58 = 2114;
      v59 = v48;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  if (!v10)
  {
    long long v35 = NUAssertLogger_5758();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      long long v36 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v36;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v25 = (const void **)MEMORY[0x1E4F7A308];
    long long v37 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v27 = NUAssertLogger_5758();
    int v38 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!v37)
    {
      if (v38)
      {
        long long v39 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v57 = v40;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_38;
    }
LABEL_36:
    if (v38)
    {
      v49 = dispatch_get_specific(*v25);
      v50 = (void *)MEMORY[0x1E4F29060];
      id v51 = v49;
      v52 = [v50 callStackSymbols];
      v53 = [v52 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v49;
      __int16 v58 = 2114;
      v59 = v53;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_38:

    _NUAssertFailHandler();
  }
  uint64_t v12 = v11;
  uint64_t v13 = [v10 objectForKeyedSubscript:@"retouch"];
  int v14 = v13;
  if (v13)
  {
    id v15 = [v13 objectForKeyedSubscript:@"inputStrokes"];
    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
      id v54 = @"strokes";
      id v55 = v15;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      int v18 = (void *)[v16 initWithDictionary:v17];

      uint64_t v19 = [v14 objectForKeyedSubscript:@"detectedFaces"];
      if (v19) {
        [v18 setObject:v19 forKey:@"detectedFaces"];
      }
      double v20 = [(NUCacheNode *)[PIRetouchCacheNode alloc] initWithInput:v9 settings:v18];
      __int16 v21 = [(NUCacheNode *)[PIRetouchSubsampleCacheNode alloc] initWithInput:v20 settings:v18];
    }
    else
    {
      [MEMORY[0x1E4F7A438] missingError:@"Missing input strokes" object:v14];
      __int16 v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] missingError:@"Missing retouch settings" object:v10];
    __int16 v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__5756;
  retouchQueue = self->_retouchQueue;
  uint64_t v13 = __Block_byref_object_dispose__5757;
  id v14 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PIRetouchCacheNode_tryLoadPersistentURL_error___block_invoke;
  block[3] = &unk_1E5D7F2B0;
  block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(retouchQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    BOOL v6 = 1;
  }
  else
  {
    *a4 = (id) v10[5];
    BOOL v6 = *((unsigned char *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __49__PIRetouchCacheNode_tryLoadPersistentURL_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  int v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  char v4 = [v2 _tryLoad:&obj];
  objc_storeStrong(v3, obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PIRetouchCacheNode;
  BOOL v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    id v29 = NUAssertLogger_5758();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      int v48 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v31 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v33 = NUAssertLogger_5758();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        long long v37 = dispatch_get_specific(*v31);
        int v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        long long v40 = [v38 callStackSymbols];
        long long v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        int v48 = v37;
        __int16 v49 = 2114;
        v50 = v41;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      long long v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      int v48 = v36;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v10 = v9;
  if ([v9 evaluationMode] == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    v46.receiver = self;
    v46.super_class = (Class)PIRetouchCacheNode;
    uint64_t v12 = [(NUCacheNode *)&v46 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
    if (v12)
    {
      if ([(NURenderNode *)self isCached])
      {
        id v11 = v12;
      }
      else
      {
        [v12 subsampleFactor];
        uint64_t v13 = NUScaleMake();
        uint64_t v15 = v14;
        [v10 scale];
        uint64_t v42 = v13;
        uint64_t v16 = NUScaleDivide();
        uint64_t v18 = v17;
        uint64_t v19 = (uint64_t *)MEMORY[0x1E4F7A338];
        uint64_t v44 = *MEMORY[0x1E4F7A338];
        uint64_t v45 = *(void *)(MEMORY[0x1E4F7A338] + 8);
        double v20 = (void *)[v10 copy];
        NUScaleMake();
        if (NUScaleCompare() < 1)
        {
          uint64_t v21 = v16;
        }
        else
        {
          objc_msgSend(v20, "setScale:", v42, v15);
          uint64_t v44 = v16;
          uint64_t v45 = v18;
          uint64_t v21 = *v19;
          uint64_t v18 = v19[1];
        }
        int v22 = [(PIRetouchCacheNode *)self retouchInputNode];
        __int16 v23 = [v22 nodeByReplayingAgainstCache:v8 pipelineState:v20 error:a5];

        if (v23)
        {
          int v24 = -[PIRetouchCompositeNode initWithScale:sampleMode:input:retouch:]([PIRetouchCompositeNode alloc], "initWithScale:sampleMode:input:retouch:", v21, v18, [v10 sampleMode], v23, v12);
          id v11 = [MEMORY[0x1E4F7A610] nodeFromCache:v24 cache:v8];

          objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
          if ((NUScaleEqual() & 1) == 0)
          {
            id v43 = objc_alloc(MEMORY[0x1E4F7A678]);
            uint64_t v25 = [v10 scale];
            v27 = objc_msgSend(v43, "initWithTargetScale:effectiveScale:sampleMode:input:", v25, v26, v44, v45, objc_msgSend(v10, "sampleMode"), v11);

            id v11 = [MEMORY[0x1E4F7A610] nodeFromCache:v27 cache:v8];

            objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
          }
        }
        else
        {
          id v11 = 0;
        }
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Cannot evaluate cache node" object:self];
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  return 1;
}

- (id)persistentURL
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB10]);
  char v4 = NSString;
  id v5 = [(NUCacheNode *)self cacheIdentifier];
  BOOL v6 = [v4 stringWithFormat:@"x-cache-node://retouch/%@", v5];
  id v7 = (void *)[v3 initWithString:v6];

  return v7;
}

- (id)descriptionSubClassHook
{
  return @"Retouch";
}

- (PIRetouchCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PIRetouchCacheNode;
  id v5 = [(NUCacheNode *)&v9 initWithInputs:a3 settings:a4 subsampleFactor:a5];
  dispatch_queue_t v6 = dispatch_queue_create("PIRetouchCacheNode", 0);
  retouchQueue = v5->_retouchQueue;
  v5->_retouchQueue = (OS_dispatch_queue *)v6;

  return v5;
}

@end