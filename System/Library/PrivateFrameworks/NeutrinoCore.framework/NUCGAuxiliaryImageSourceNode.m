@interface NUCGAuxiliaryImageSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (NUAuxiliaryImageProperties)auxiliaryImageProperties;
- (NUCGAuxiliaryImageSourceNode)initWithSettings:(id)a3;
- (NUCGAuxiliaryImageSourceNode)initWithSourceNode:(id)a3 auxiliaryImageType:(int64_t)a4 auxiliaryImageProperties:(id)a5;
- (NUCGImageSourceNode)sourceNode;
- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)pipelineOptionsForPipelineState:(id)a3 error:(id *)a4;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)auxiliaryImageType;
- (int64_t)sourceOrientation;
- (void)setSourceNode:(id)a3;
@end

@implementation NUCGAuxiliaryImageSourceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceNode, 0);

  objc_storeStrong((id *)&self->_auxiliaryImageProperties, 0);
}

- (NUAuxiliaryImageProperties)auxiliaryImageProperties
{
  return self->_auxiliaryImageProperties;
}

- (void)setSourceNode:(id)a3
{
}

- (NUCGImageSourceNode)sourceNode
{
  return (NUCGImageSourceNode *)objc_getProperty(self, a2, 200, 1);
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  return [(NUCGImageSourceNode *)self->_sourceNode _evaluateImagePropertiesWithSourceOptions:a3 error:a4];
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    v28 = NUAssertLogger_9299();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_9299();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v35;
        __int16 v49 = 2114;
        v50 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 223, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  v9 = v8;
  if ([(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType] == 10)
  {
    *(void *)buf = 1;
    auxiliaryImageProperties = self->_auxiliaryImageProperties;
    id v45 = 0;
    v11 = [(NUAuxiliaryImageProperties *)auxiliaryImageProperties auxiliaryImageWithSourceOptions:v9 subsampleFactor:buf error:&v45];
    id v12 = v45;
    if (!v11)
    {
LABEL_4:
      v13 = +[NUError errorWithCode:1 reason:@"Failed to retrieve auxiliary image" object:self->_auxiliaryImageProperties underlyingError:v12];
LABEL_12:
      v20 = 0;
      *a5 = v13;
      goto LABEL_20;
    }
  }
  else
  {
    v14 = self->_auxiliaryImageProperties;
    id v44 = 0;
    v11 = [(NUAuxiliaryImageProperties *)v14 auxiliaryImageWithSourceOptions:v9 subsampleFactor:a4 error:&v44];
    id v12 = v44;
    if (!v11) {
      goto LABEL_4;
    }
  }
  uint64_t v15 = [v11 cvPixelBufferRef];
  if (!v15)
  {
    v13 = +[NUError unknownError:@"Unable to retrieve cvPixelBufferRef" object:v11];
    goto LABEL_12;
  }
  v16 = (__CVBuffer *)v15;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType] == 7)
  {
    v18 = (CGColorSpace *)CVBufferCopyAttachment(v16, (CFStringRef)*MEMORY[0x1E4F24A00], 0);
    if (!v18)
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1E390]];
    }
    CGColorSpaceRelease(v18);
  }
  else
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
    [v17 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F1E390]];
  }
  v22 = [self nu_digest];
  [v17 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F1E398]];

  v20 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v16 options:v17];
  uint64_t v23 = [v11 metadata];
  if (v23)
  {
    uint64_t v46 = *MEMORY[0x1E4F2F380];
    uint64_t v47 = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    uint64_t v25 = [v20 imageBySettingPropertiesNoCopy:v24];

    v20 = (void *)v25;
  }
  if (v20)
  {
    id v26 = v20;
  }
  else
  {
    *a5 = +[NUError unknownError:@"[CIImage imageWithCVPixelBuffer:cvPixelBufferRef options:options] failed." object:v16];
  }

LABEL_20:

  return v20;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v11 = NUAssertLogger_9299();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_9299();
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
      id v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode _evaluateAuxiliaryImageForType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 211, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if ([(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType] == a3)
  {
    v7 = [(NUAuxiliaryImageProperties *)self->_auxiliaryImageProperties auxiliaryImage:a4];
  }
  else
  {
    if ((unint64_t)a3 > 0xB) {
      id v8 = @"Invalid";
    }
    else {
      id v8 = off_1E5D94190[a3];
    }
    v9 = v8;
    *a4 = +[NUError mismatchError:@"Incompatible auxiliary image type" object:v9];

    v7 = 0;
  }

  return v7;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  if ([(NUCGAuxiliaryImageSourceNode *)self supportsPipelineState:a5 error:a6]) {
    v7 = self;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    id v12 = NUAssertLogger_9299();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_9299();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v29 = v19;
        __int16 v30 = 2114;
        uint64_t v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 184, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != nil");
  }
  v7 = v6;
  if ([v6 mediaComponentType] != 1)
  {
    v10 = @"expected an image mediaComponentType";
LABEL_7:
    +[NUError mismatchError:v10 object:v7];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  uint64_t v8 = [v7 auxiliaryImageType];
  if (v8 != [(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType])
  {
    v10 = @"Incompatible auxiliary image type";
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  return [(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType] == a3;
}

- (int64_t)sourceOrientation
{
  return [(NUCGImageSourceNode *)self->_sourceNode sourceOrientation];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  int64_t v3 = [(NUAuxiliaryImageProperties *)self->_auxiliaryImageProperties size];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)pipelineOptionsForPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v13 = NUAssertLogger_9299();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_9299();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        id v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v20;
        __int16 v33 = 2114;
        v34 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode pipelineOptionsForPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 148, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"error != NULL");
  }
  v7 = v6;
  unint64_t v8 = [(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType];
  __int16 v29 = @"auxiliaryImageType";
  if (v8 > 0xB) {
    BOOL v9 = @"Invalid";
  }
  else {
    BOOL v9 = off_1E5D94190[v8];
  }
  v10 = v9;
  __int16 v30 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];

  return v11;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (NUCGAuxiliaryImageSourceNode)initWithSourceNode:(id)a3 auxiliaryImageType:(int64_t)a4 auxiliaryImageProperties:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (NUCGImageSourceNode *)a3;
  BOOL v9 = (NUAuxiliaryImageProperties *)a5;
  if (!v8)
  {
    id v21 = NUAssertLogger_9299();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceNode != nil");
      *(_DWORD *)buf = 138543362;
      v57 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_9299();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v57 = v35;
        __int16 v58 = 2114;
        v59 = v39;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v57 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 126, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"sourceNode != nil");
  }
  if (!v9)
  {
    uint64_t v28 = NUAssertLogger_9299();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "auxiliaryImageProperties != nil");
      *(_DWORD *)buf = 138543362;
      v57 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_9299();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        id v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        uint64_t v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v57 = v44;
        __int16 v58 = 2114;
        v59 = v48;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      __int16 v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v57 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 127, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"auxiliaryImageProperties != nil");
  }
  auxiliaryImageProperties = self->_auxiliaryImageProperties;
  self->_auxiliaryImageProperties = v9;
  v11 = v9;

  self->_auxiliaryImageType = a4;
  sourceNode = self->_sourceNode;
  self->_sourceNode = v8;
  v13 = v8;

  v54[0] = @"sourceSettings";
  v14 = [(NURenderNode *)v13 settings];
  v54[1] = @"auxiliaryImageType";
  v55[0] = v14;
  unint64_t v15 = [(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType];
  if (v15 > 0xB) {
    BOOL v16 = @"Invalid";
  }
  else {
    BOOL v16 = off_1E5D94190[v15];
  }
  BOOL v17 = v16;
  v55[1] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];

  v53.receiver = self;
  v53.super_class = (Class)NUCGAuxiliaryImageSourceNode;
  v19 = [(NUSourceNode *)&v53 initWithSettings:v18];

  [(NUSourceNode *)v19 setOriginalNode:v13];
  return v19;
}

- (NUCGAuxiliaryImageSourceNode)initWithSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9324);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    v7 = v5;
    unint64_t v8 = (objc_class *)objc_opt_class();
    BOOL v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_9324);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9324);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    unint64_t v15 = v13;
    BOOL v16 = [v14 callStackSymbols];
    BOOL v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  unint64_t v15 = v18;
  id v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v31 = specific;
  __int16 v32 = 2114;
  __int16 v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 121, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

@end