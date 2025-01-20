@interface NUMaskSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)croppedExtent;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (NUMaskSourceNode)initWithImage:(id)a3 croppedExtent:(id *)a4 scale:(id)a5 identifier:(id)a6 orientation:(int64_t)a7;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)sourceImage:(id *)a3;
@end

@implementation NUMaskSourceNode

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  int64x2_t v13 = 0u;
  long long v14 = 0u;
  [(NUMaskSourceNode *)self croppedExtent];
  uint64_t v5 = [(NUMaskSourceNode *)self scale];
  NUPixelRectScaleRational(v12, v5, v6, 0, &v13);
  v7 = [NUImageGeometry alloc];
  int64_t v8 = [(NUCISourceNode *)self sourceOrientation];
  v11[0] = v13;
  v11[1] = v14;
  v9 = [(NUImageGeometry *)v7 initWithExtent:v11 renderScale:NUScaleOne orientation:v8];

  return v9;
}

- (id)_evaluateImage:(id *)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)NUMaskSourceNode;
  uint64_t v4 = [(NUSourceNode *)&v25 _evaluateImage:a3];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    [(NUMaskSourceNode *)self croppedExtent];
    uint64_t v6 = objc_msgSend(v5, "imageByCroppingToRect:", (double)v21, (double)v22, (double)v23, (double)v24);

    uint64_t v7 = [(NUMaskSourceNode *)self scale];
    double v9 = NUScaleToDouble(v7, v8);
    v10 = [v6 imageByClampingToExtent];

    if (v9 <= 1.0)
    {
      memset(&v20, 0, sizeof(v20));
      CGAffineTransformMakeScale(&v20, v9, v9);
      CGAffineTransform v19 = v20;
      long long v14 = [v10 imageByApplyingTransform:&v19];
    }
    else
    {
      uint64_t v26 = *MEMORY[0x1E4F1E4F0];
      v11 = [NSNumber numberWithDouble:v9];
      v27[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      int64x2_t v13 = [v10 imageByApplyingFilter:@"CISoftCubicUpsample" withInputParameters:v12];

      long long v14 = [v13 imageByApplyingFilter:@"CIColorThreshold" withInputParameters:&unk_1F004A320];
    }
    [(NUMaskSourceNode *)self croppedExtent];
    *(_OWORD *)&v20.a = v17;
    *(_OWORD *)&v20.c = v18;
    NU::RectT<long>::scale((uint64_t *)&v20, 3, v9, v9);
    v15 = objc_msgSend(v14, "imageByCroppingToRect:", (double)*(uint64_t *)&v20.a, (double)*(uint64_t *)&v20.b, (double)*(uint64_t *)&v20.c, (double)*(uint64_t *)&v20.d);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)sourceImage:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUMaskSourceNode;
  v3 = [(NUSourceNode *)&v5 _evaluateImage:a3];

  return v3;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUMaskSourceNode;
  uint64_t v6 = [(NUCISourceNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    double v9 = NUAssertLogger_23719();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_23719();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        CGAffineTransform v19 = [v17 callStackSymbols];
        CGAffineTransform v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      long long v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 66, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 mediaComponentType];
  if (v7 != 1)
  {
    *a4 = +[NUError mismatchError:@"expected an image mediaComponentType" object:v6];
  }

  return v7 == 1;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"scale"];

  if (!v3)
  {
    objc_super v8 = NUAssertLogger_23719();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = [NSString stringWithFormat:@"missing scale"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_23719();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        objc_super v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)v40 = 138543618;
        *(void *)&v40[4] = v22;
        *(_WORD *)&v40[12] = 2114;
        *(void *)&v40[14] = v26;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);
      }
    }
    else if (v12)
    {
      BOOL v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 59, @"missing scale", v27, v28, v29, v30, *(uint64_t *)v40);
  }
  id v4 = v3;
  if (strncmp((const char *)[v4 objCType], "{?=qq}", 6uLL))
  {
    v15 = NUAssertLogger_23719();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [NSString stringWithFormat:@"wrong value type"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);
    }
    long long v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v18 = NUAssertLogger_23719();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)v40 = 138543618;
        *(void *)&v40[4] = v31;
        *(_WORD *)&v40[12] = 2114;
        *(void *)&v40[14] = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);
      }
    }
    else if (v19)
    {
      CGAffineTransform v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 60, @"wrong value type", v36, v37, v38, v39, *(uint64_t *)v40);
  }
  *(_OWORD *)v40 = NUScaleUnknown;
  [v4 getValue:v40];
  unsigned long long v5 = *(_OWORD *)v40;

  int64_t v7 = v5 >> 64;
  int64_t v6 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)croppedExtent
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(NURenderNode *)self settings];
  id v4 = [v3 objectForKeyedSubscript:@"croppedExtent"];

  if (!v4)
  {
    int64_t v6 = NUAssertLogger_23719();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int64_t v7 = [NSString stringWithFormat:@"missing croppedExtent"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v9 = NUAssertLogger_23719();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CGAffineTransform v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        id v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v20;
        __int16 v42 = 2114;
        v43 = v24;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode croppedExtent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 51, @"missing croppedExtent", v25, v26, v27, v28, v38);
  }
  id v39 = v4;
  if (strncmp((const char *)[v39 objCType], "{?={?=qq}{?=qq}}", 0x10uLL))
  {
    BOOL v13 = NUAssertLogger_23719();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = [NSString stringWithFormat:@"wrong value type"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_23719();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        id v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v29;
        __int16 v42 = 2114;
        v43 = v33;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode croppedExtent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 52, @"wrong value type", v34, v35, v36, v37, v38);
  }
  objc_msgSend(v39, "nu_pixelRect");

  return result;
}

- (NUMaskSourceNode)initWithImage:(id)a3 croppedExtent:(id *)a4 scale:(id)a5 identifier:(id)a6 orientation:(int64_t)a7
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  v24[3] = *MEMORY[0x1E4F143B8];
  v24[0] = a6;
  v23[0] = @"identifier";
  v23[1] = @"croppedExtent";
  BOOL v12 = (void *)MEMORY[0x1E4F29238];
  $0AC6E346AE4835514AAA8AC86D8F4844 v13 = a4->var1;
  v22[0] = a4->var0;
  v22[1] = v13;
  id v14 = a6;
  id v15 = a3;
  v16 = objc_msgSend(v12, "nu_valueWithPixelRect:", v22);
  v24[1] = v16;
  v23[2] = @"scale";
  BOOL v17 = NUScaleToValue(var0, var1);
  v24[2] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  v21.receiver = self;
  v21.super_class = (Class)NUMaskSourceNode;
  BOOL v19 = [(NUCISourceNode *)&v21 initWithImage:v15 settings:v18 orientation:a7];

  return v19;
}

@end