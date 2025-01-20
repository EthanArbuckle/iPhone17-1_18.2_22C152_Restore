@interface NUCISourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (NUCISourceNode)initWithImage:(id)a3 identifier:(id)a4 orientation:(int64_t)a5;
- (NUCISourceNode)initWithImage:(id)a3 settings:(id)a4 orientation:(int64_t)a5;
- (NUCISourceNode)initWithSettings:(id)a3;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)sourceOrientation;
@end

@implementation NUCISourceNode

- (void).cxx_destruct
{
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NUSourceNode *)self load:a4])
  {
    v7 = objc_alloc_init(_NUImageProperties);
    [(_NUImageProperties *)v7 setMetadata:MEMORY[0x1E4F1CC08]];
    v8 = [(CIImage *)self->_image colorSpace];
    if (v8)
    {
      v9 = [[NUColorSpace alloc] initWithCGColorSpace:v8];
    }
    else
    {
      v9 = +[NUColorSpace workingColorSpace];
    }
    v10 = v9;
    [(_NUImageProperties *)v7 setColorSpace:v9];

    uint64_t v11 = [(NUCISourceNode *)self pixelSizeWithSourceOptions:v6];
    -[_NUImageProperties setSize:](v7, "setSize:", v11, v12);
    [(_NUImageProperties *)v7 setOrientation:[(NUCISourceNode *)self sourceOrientation]];
    if ([(CIImage *)self->_image isOpaque]) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    [(_NUImageProperties *)v7 setAlphaInfo:v13];
    [(_NUImageProperties *)v7 setComponentInfo:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  [(CIImage *)self->_image extent];
  int64_t v4 = vcvtmd_s64_f64(v3);
  int64_t v6 = vcvtmd_s64_f64(v5);
  result.var1 = v6;
  result.var0 = v4;
  return result;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a4)
  {
    uint64_t v11 = NUAssertLogger_17689();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_17689();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        __int16 v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCISourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 166, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"subsampleFactor != NULL");
  }
  v8 = v7;
  *a4 = 1;
  v9 = self->_image;

  return v9;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    v16 = NUAssertLogger_17689();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_17689();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        uint64_t v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        __int16 v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCISourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 154, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"error != nil");
  }
  uint64_t v13 = v12;
  if ([(NUCISourceNode *)self supportsPipelineState:v12 error:a6]) {
    v14 = self;
  }
  else {
    v14 = 0;
  }

  return v14;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    v14 = NUAssertLogger_17689();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_17689();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        id v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCISourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 120, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"error != NULL");
  }
  int64_t v6 = v5;
  uint64_t v7 = [v5 auxiliaryImageType];
  if ((unint64_t)(v7 - 3) >= 9)
  {
    if (v7 == 2)
    {
      uint64_t v13 = +[NUError invalidError:@"depth is not supported on CIImages" object:v6];
    }
    else
    {
      if ([v6 mediaComponentType] == 1)
      {
        BOOL v11 = 1;
        goto LABEL_7;
      }
      uint64_t v13 = +[NUError mismatchError:@"expected an image mediaComponentType" object:v6];
    }
    BOOL v11 = 0;
    *a4 = v13;
    goto LABEL_7;
  }
  unint64_t v8 = [v6 auxiliaryImageType];
  if (v8 > 0xB) {
    v9 = @"Invalid";
  }
  else {
    v9 = off_1E5D94190[v8];
  }
  id v10 = v9;
  *a4 = +[NUError unsupportedError:@"Auxiliary image type is not supported" object:v10];

  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (int64_t)sourceOrientation
{
  return self->_orientation;
}

- (NUCISourceNode)initWithSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17703);
  }
  id v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v6 = NSString;
    uint64_t v7 = v5;
    unint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    BOOL v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_17703);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_17703);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    BOOL v15 = v13;
    v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  BOOL v15 = v18;
  v22 = [v20 callStackSymbols];
  id v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCISourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 97, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUCISourceNode)initWithImage:(id)a3 settings:(id)a4 orientation:(int64_t)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (CIImage *)a3;
  id v9 = a4;
  if (!v8)
  {
    v17 = NUAssertLogger_17689();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      v67 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_17689();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v67 = v38;
        __int16 v68 = 2114;
        v69 = v42;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v67 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCISourceNode initWithImage:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 77, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"image != nil");
  }
  id v10 = v9;
  if (!v9)
  {
    uint64_t v24 = NUAssertLogger_17689();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      *(_DWORD *)buf = 138543362;
      v67 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_17689();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v50 = [v48 callStackSymbols];
        v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v67 = v47;
        __int16 v68 = 2114;
        v69 = v51;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v67 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCISourceNode initWithImage:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 78, @"Invalid parameter not satisfying: %s", v52, v53, v54, v55, (uint64_t)"settings != nil");
  }
  if ((unint64_t)(a5 - 1) >= 8)
  {
    uint64_t v31 = NUAssertLogger_17689();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      *(_DWORD *)buf = 138543362;
      v67 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v34 = NUAssertLogger_17689();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        v59 = [v57 callStackSymbols];
        v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v67 = v56;
        __int16 v68 = 2114;
        v69 = v60;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      uint64_t v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v67 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCISourceNode initWithImage:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 79, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  BOOL v11 = (void *)[v9 mutableCopy];
  uint64_t v12 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  [v11 setObject:v12 forKeyedSubscript:@"_image"];

  uint64_t v13 = [NSNumber numberWithInteger:a5];
  [v11 setObject:v13 forKeyedSubscript:@"_orientation"];

  v65.receiver = self;
  v65.super_class = (Class)NUCISourceNode;
  v14 = [(NUSourceNode *)&v65 initWithSettings:v11];
  image = v14->_image;
  v14->_image = v8;

  v14->_orientation = a5;
  return v14;
}

- (NUCISourceNode)initWithImage:(id)a3 identifier:(id)a4 orientation:(int64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v14 = NUAssertLogger_17689();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_17689();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v21;
        __int16 v34 = 2114;
        BOOL v35 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCISourceNode initWithImage:identifier:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CIImage.m", 70, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"identifier != nil");
  }
  id v10 = v9;
  uint64_t v30 = @"identifier";
  id v31 = v9;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  uint64_t v12 = [(NUCISourceNode *)self initWithImage:v8 settings:v11 orientation:a5];

  return v12;
}

@end