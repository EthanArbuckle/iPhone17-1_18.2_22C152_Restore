@interface NUPixelBufferSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- (NUPixelBufferSourceNode)initWithPixelBuffer:(__CVBuffer *)a3 settings:(id)a4 orientation:(int64_t)a5;
- (NUPixelBufferSourceNode)initWithSettings:(id)a3 orientation:(int64_t)a4;
- (__CVBuffer)pixelBuffer;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation NUPixelBufferSourceNode

- (void).cxx_destruct
{
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NUSourceNode *)self auxiliaryImageType];
  int64_t v6 = [(NUSourceNode *)self auxiliaryImageType];
  if (!v5 || (int64_t v7 = v6, v8 = [(NUSourceNode *)self auxiliaryImageType], v7 == 1) || v8 == 11)
  {
    v11 = [v4 objectForKeyedSubscript:@"applyCleanAperture"];
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "nu_pixelRect");
      size_t Width = v19;
      size_t Height = v20;
    }
    else
    {
      [(NUVideoFrameSourceNode *)self originalExtent];
      if (v17 && v18)
      {
        [(NUVideoFrameSourceNode *)self originalExtent];
        size_t Width = v15;
        size_t Height = v16;
      }
      else
      {
        size_t Width = CVPixelBufferGetWidth(self->_pixelBuffer);
        size_t Height = CVPixelBufferGetHeight(self->_pixelBuffer);
      }
    }
  }
  else
  {
    size_t Width = CVPixelBufferGetWidth(self->_pixelBuffer);
    size_t Height = CVPixelBufferGetHeight(self->_pixelBuffer);
  }

  int64_t v13 = Width;
  int64_t v14 = Height;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    uint64_t v17 = NUAssertLogger_554();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v54 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    size_t v20 = NUAssertLogger_554();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v54 = v31;
        __int16 v55 = 2114;
        v56 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v54 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1154, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"error != NULL");
  }
  if (!a4)
  {
    v24 = NUAssertLogger_554();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)buf = 138543362;
      v54 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_554();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v54 = v40;
        __int16 v55 = 2114;
        v56 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v54 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1156, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  if ([(NUSourceNode *)self auxiliaryImageType] == 2
    || [(NUSourceNode *)self auxiliaryImageType] == 11
    || [(NUSourceNode *)self auxiliaryImageType] == 10
    || [(NUSourceNode *)self auxiliaryImageType] == 9
    || [(NUSourceNode *)self auxiliaryImageType] == 3
    || [(NUSourceNode *)self auxiliaryImageType] == 4)
  {
    uint64_t v51 = *MEMORY[0x1E4F1E390];
    v10 = [MEMORY[0x1E4F1CA98] null];
    v52 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
LABEL_10:
    v12 = (void *)v11;

    goto LABEL_11;
  }
  if ([(NUSourceNode *)self auxiliaryImageType] == 1
    && +[NUColorSpace shouldTagAsDisplayP3:self->_pixelBuffer])
  {
    uint64_t v49 = *MEMORY[0x1E4F1E390];
    v10 = +[NUColorSpace displayP3ColorSpace];
    uint64_t v50 = [v10 CGColorSpace];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    goto LABEL_10;
  }
  v12 = (void *)MEMORY[0x1E4F1CC08];
LABEL_11:
  int64_t v13 = self;
  objc_sync_enter(v13);
  int64_t v14 = v13->_image;
  if (!v14)
  {
    int64_t v14 = (CIImage *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:v13->_pixelBuffer options:v12];
    if (!v14)
    {
      *a5 = +[NUError errorWithCode:3 reason:@"Unable to produce CIImage from CVPixelBuffer" object:v13];
    }
    objc_storeStrong((id *)&v13->_image, v14);
  }
  size_t v15 = [(NUVideoFrameSourceNode *)v13 applySourceOptions:v9 image:v14];

  objc_sync_exit(v13);

  return v15;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)NUPixelBufferSourceNode;
  [(NUPixelBufferSourceNode *)&v3 dealloc];
}

- (NUPixelBufferSourceNode)initWithSettings:(id)a3 orientation:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
  }
  int64_t v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v7 = NSString;
    id v8 = v6;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(a2);
    v12 = [v7 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v10, v11];
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
      }
      goto LABEL_8;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    int64_t v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    size_t v15 = (void *)MEMORY[0x1E4F29060];
    size_t v16 = v14;
    uint64_t v17 = [v15 callStackSymbols];
    uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  size_t v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v21 = (void *)MEMORY[0x1E4F29060];
  id v22 = specific;
  size_t v16 = v19;
  v23 = [v21 callStackSymbols];
  v24 = [v23 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v32 = specific;
  __int16 v33 = 2114;
  v34 = v24;
  _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode initWithSettings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1144, @"Initializer not available: -[%@ %@], use designated initializer instead.", v27, v28, v29, v30, v26);
}

- (NUPixelBufferSourceNode)initWithPixelBuffer:(__CVBuffer *)a3 settings:(id)a4 orientation:(int64_t)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!a3)
  {
    uint64_t v17 = NUAssertLogger_554();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelBuffer != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    size_t v20 = NUAssertLogger_554();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v24;
        __int16 v36 = 2114;
        uint64_t v37 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      id v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode initWithPixelBuffer:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1123, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"pixelBuffer != nil");
  }
  v9 = v8;
  v10 = (void *)[v8 mutableCopy];
  IOSurface = CVPixelBufferGetIOSurface(a3);
  uint64_t Seed = IOSurfaceGetSeed(IOSurface);
  uint64_t v13 = [NSNumber numberWithUnsignedInt:IOSurfaceGetID(IOSurface)];
  [v10 setObject:v13 forKeyedSubscript:@"surfaceID"];

  int64_t v14 = [NSNumber numberWithUnsignedInt:Seed];
  [v10 setObject:v14 forKeyedSubscript:@"seed"];

  v33.receiver = self;
  v33.super_class = (Class)NUPixelBufferSourceNode;
  size_t v15 = [(NUVideoFrameSourceNode *)&v33 initWithSettings:v10 orientation:a5];
  v15->_pixelBuffer = CVPixelBufferRetain(a3);

  return v15;
}

@end