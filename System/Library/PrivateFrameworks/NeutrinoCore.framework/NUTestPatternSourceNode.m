@interface NUTestPatternSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (NUTestPatternSourceNode)initWithSettings:(id)a3;
- (NUTestPatternSourceNode)initWithSize:(id)a3 orientation:(int64_t)a4;
- (NUTestPatternSourceNode)initWithSize:(id)a3 orientation:(int64_t)a4 scale:(id)a5;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)sourceOrientation;
@end

@implementation NUTestPatternSourceNode

- (void).cxx_destruct
{
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    v12 = NUAssertLogger_12311();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_12311();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 237, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  v6 = v5;
  if ((unint64_t)([v5 auxiliaryImageType] - 2) > 9)
  {
    if ([v6 mediaComponentType] == 1)
    {
      BOOL v9 = 1;
    }
    else
    {
      +[NUError mismatchError:@"expected an image mediaComponentType" object:v6];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unint64_t v7 = [v6 auxiliaryImageType];
    if (v7 > 0xB) {
      v8 = @"Invalid";
    }
    else {
      v8 = off_1E5D94190[v7];
    }
    v10 = v8;
    *a4 = +[NUError unsupportedError:@"Auxiliary image type is not supported" object:v10];

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a4)
  {
    v12 = NUAssertLogger_12311();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_12311();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 215, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"subsampleFactor != NULL");
  }
  BOOL v9 = v8;
  *a4 = 1;
  v10 = [(NUTestPatternSourceNode *)self _evaluateImage:a5];

  return v10;
}

- (id)_evaluateImage:(id *)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v4 = [(NURenderNode *)self outputImageGeometry:a3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 scaledSize];
    uint64_t v8 = v7;
    id v9 = objc_alloc(MEMORY[0x1E4F1E050]);
    v10 = objc_alloc_init(NUTestPatternImage);
    uint64_t v11 = *MEMORY[0x1E4F1E278];
    v12 = [(NUColorSpace *)self->_colorSpace CGColorSpace];
    v18[0] = @"width";
    v13 = [NSNumber numberWithInteger:v6];
    v18[1] = @"height";
    v19[0] = v13;
    v14 = [NSNumber numberWithInteger:v8];
    v19[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    BOOL v16 = (void *)[v9 initWithImageProvider:v10 size:v6 :v8 format:v11 colorSpace:v12 options:v15];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NUSourceNode *)self load:a4])
  {
    uint64_t v7 = objc_alloc_init(_NUImageProperties);
    [(_NUImageProperties *)v7 setMetadata:MEMORY[0x1E4F1CC08]];
    [(_NUImageProperties *)v7 setColorSpace:self->_colorSpace];
    uint64_t v8 = [(NUTestPatternSourceNode *)self pixelSizeWithSourceOptions:v6];
    -[_NUImageProperties setSize:](v7, "setSize:", v8, v9);
    [(_NUImageProperties *)v7 setOrientation:[(NUTestPatternSourceNode *)self sourceOrientation]];
    [(_NUImageProperties *)v7 setAlphaInfo:2];
    [(_NUImageProperties *)v7 setComponentInfo:0];
    v10 = objc_alloc_init(NUTestPatternAuxiliaryProperties);
    -[NUTestPatternAuxiliaryProperties setSize:](v10, "setSize:", self->_size.width, self->_size.height);
    [(NUTestPatternAuxiliaryProperties *)v10 setAuxiliaryImageTypeCGIdentifier:*MEMORY[0x1E4F2F3B8]];
    [(_NUImageProperties *)v7 setAuxiliaryImageProperties:v10 forType:2];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  id v5 = [NUImageGeometry alloc];
  v8[0] = 0;
  v8[1] = 0;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_size;
  id v6 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v5, "initWithExtent:renderScale:orientation:", v8, self->_scale.numerator, self->_scale.denominator, self->_orientation);

  return v6;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    id v21 = NUAssertLogger_12311();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_12311();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v28;
        __int16 v39 = 2114;
        v40 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 150, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  v13 = v12;
  if ([(NUTestPatternSourceNode *)self supportsPipelineState:v12 error:a6])
  {
    id v14 = objc_alloc((Class)objc_opt_class());
    p_$5BB7312FFE32F1AB3F1F5957C99A58B3 size = &self->_size;
    int64_t orientation = self->_orientation;
    uint64_t v17 = [v13 scale];
    v19 = objc_msgSend(v14, "initWithSize:orientation:scale:", p_size->width, p_size->height, orientation, v17, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = [v11 objectForKeyedSubscript:@"__addTags"];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    id v14 = [v10 currentGroup];
    id v15 = (id)[v14 addTag:@"__SourceOrigin" forNode:self];
  }
  BOOL v16 = [(NUSourceNode *)self _addOrientationNode:self sourceSettings:v11 error:a7];

  return v16;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  p_$5BB7312FFE32F1AB3F1F5957C99A58B3 size = &self->_size;
  int64_t width = self->_size.width;
  int64_t height = p_size->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (int64_t)sourceOrientation
{
  return self->_orientation;
}

- (NUTestPatternSourceNode)initWithSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12332);
  }
  id v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    uint64_t v7 = v5;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    id v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12332);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12332);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    int v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v14 = (void *)MEMORY[0x1E4F29060];
    id v15 = v13;
    BOOL v16 = [v14 callStackSymbols];
    uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  id v15 = v18;
  v22 = [v20 callStackSymbols];
  v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 120, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUTestPatternSourceNode)initWithSize:(id)a3 orientation:(int64_t)a4 scale:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a4 - 1) >= 8)
  {
    id v21 = NUAssertLogger_12311();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      *(_DWORD *)buf = 138543362;
      v79 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_12311();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v79 = v42;
        __int16 v80 = 2114;
        v81 = v46;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v79 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSize:orientation:scale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 104, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  if (!a3.var0 || (int64_t var1 = a3.var1) == 0)
  {
    uint64_t v28 = NUAssertLogger_12311();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelSizeIsEmpty(size)");
      *(_DWORD *)buf = 138543362;
      v79 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_12311();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v79 = v51;
        __int16 v80 = 2114;
        v81 = v55;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v79 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSize:orientation:scale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 105, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"!NUPixelSizeIsEmpty(size)");
  }
  int64_t var0 = a5.var0;
  if (a5.var0 < 1 || (int64_t v7 = a5.var1, a5.var1 <= 0))
  {
    uint64_t v35 = NUAssertLogger_12311();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      *(_DWORD *)buf = 138543362;
      v79 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v38 = NUAssertLogger_12311();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        v63 = [v61 callStackSymbols];
        v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v79 = v60;
        __int16 v80 = 2114;
        v81 = v64;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v79 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSize:orientation:scale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 106, @"Invalid parameter not satisfying: %s", v65, v66, v67, v68, (uint64_t)"NUScaleIsValid(scale)");
  }
  v76[0] = @"size";
  int64_t v72 = a3.var0;
  v71 = objc_msgSend(NSNumber, "numberWithInteger:");
  v75[0] = v71;
  id v10 = [NSNumber numberWithInteger:var1];
  v75[1] = v10;
  int64_t v70 = var1;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
  v77[0] = v11;
  v76[1] = @"orientation";
  uint64_t v12 = [NSNumber numberWithInteger:a4];
  v77[1] = v12;
  v76[2] = @"scale";
  [NSNumber numberWithInteger:var0];
  int v13 = v69 = var0;
  v74[0] = v13;
  id v14 = [NSNumber numberWithInteger:v7];
  v74[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  v77[2] = v15;
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:3];
  v73.receiver = self;
  v73.super_class = (Class)NUTestPatternSourceNode;
  uint64_t v17 = [(NUSourceNode *)&v73 initWithSettings:v16];

  v17->_size.int64_t width = v72;
  v17->_size.int64_t height = v70;
  v17->_int64_t orientation = a4;
  v17->_scale.numerator = v69;
  v17->_scale.denominator = v7;
  uint64_t v18 = +[NUColorSpace sRGBLinearColorSpace];
  colorSpace = v17->_colorSpace;
  v17->_colorSpace = (NUColorSpace *)v18;

  return v17;
}

- (NUTestPatternSourceNode)initWithSize:(id)a3 orientation:(int64_t)a4
{
  return -[NUTestPatternSourceNode initWithSize:orientation:scale:](self, "initWithSize:orientation:scale:", a3.var0, a3.var1, a4, NUScaleOne);
}

@end