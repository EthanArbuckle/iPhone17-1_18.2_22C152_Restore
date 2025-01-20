@interface NUAffineTransformNode
- (NUAffineTransformNode)initWithAffineTransform:(id)a3 input:(id)a4;
- (NUAffineTransformNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_transformWithError:(id *)a3;
- (id)debugQuickLookObject;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUAffineTransformNode

- (void).cxx_destruct
{
}

- (id)_transformWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v5 = NUAssertLogger_24871();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v8 = NUAssertLogger_24871();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v22 = v12;
        __int16 v23 = 2114;
        v24 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 279, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"error != nil");
  }
  transform = self->_transform;

  return transform;
}

- (id)debugQuickLookObject
{
  if ([(NURenderNode *)self isCached])
  {
    v5.receiver = self;
    v5.super_class = (Class)NUAffineTransformNode;
    v3 = [(NURenderNode *)&v5 debugQuickLookObject];
  }
  else
  {
    uint64_t v6 = 0;
    v3 = [(NUAffineTransformNode *)self _evaluateImage:&v6];
  }

  return v3;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v26 = NUAssertLogger_24871();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v29 = NUAssertLogger_24871();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v37;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 212, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  uint64_t v5 = *MEMORY[0x1E4F1E480];
  uint64_t v6 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  id v61 = 0;
  v7 = [v6 outputImage:&v61];
  id v8 = v61;
  if (v7)
  {
    id v60 = 0;
    BOOL v9 = [v6 outputImageGeometry:&v60];
    id v10 = v60;

    if (v9)
    {
      if ([v9 renderScale] < 1 || v11 <= 0)
      {
        v42 = NUAssertLogger_24871();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = [NSString stringWithFormat:@"Invalid render scale"];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v43;
          _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = NUAssertLogger_24871();
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
        if (v44)
        {
          if (v46)
          {
            v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v50 = (void *)MEMORY[0x1E4F29060];
            id v51 = v49;
            v52 = [v50 callStackSymbols];
            v53 = [v52 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v49;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v53;
            _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v46)
        {
          v47 = [MEMORY[0x1E4F29060] callStackSymbols];
          v48 = [v47 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 237, @"Invalid render scale", v54, v55, v56, v57, v58);
      }
      uint64_t v13 = [v9 renderScale];
      double v15 = NUScaleToDouble(v13, v14);
      float64x2_t v16 = 0uLL;
      float64x2_t v65 = 0u;
      memset(buf, 0, sizeof(buf));
      transform = self->_transform;
      if (transform)
      {
        double v59 = v15;
        [(NUImageTransformAffine *)transform transform];
        double v15 = v59;
        float64x2_t v16 = v65;
      }
      else
      {
        memset(buf, 0, sizeof(buf));
      }
      float64x2_t v65 = vmulq_n_f64(v16, v15);
      uint64_t v19 = [MEMORY[0x1E4F29238] valueWithBytes:buf objCType:"{CGAffineTransform=dddddd}"];
      uint64_t v20 = (void *)MEMORY[0x1E4F1E040];
      v62[0] = *MEMORY[0x1E4F1E508];
      v62[1] = v5;
      v63[0] = v19;
      v63[1] = v7;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
      v22 = [v20 filterWithName:@"CIAffineTransform" withInputParameters:v21];

      if (v22)
      {
        __int16 v23 = [v22 outputImage];
        uint64_t v18 = v23;
        if (v23)
        {
          id v24 = v23;
        }
        else
        {
          *a3 = +[NUError errorWithCode:2 reason:@"Core Image returned invalid output for filter" object:v22];
        }
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"Cannot create CIAffineTransform filter" object:v19];
        uint64_t v18 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NUError errorWithCode:2 reason:@"Cannot evaluate input geometry" object:v6 underlyingError:v10];
      uint64_t v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:2 reason:@"Cannot evaluate input image" object:v6 underlyingError:v8];
    uint64_t v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v8;
  }

  return v18;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NUAffineTransformNode;
  id v24 = 0;
  uint64_t v5 = [(NURenderNode *)&v23 _evaluateImageGeometry:&v24];
  id v6 = v24;
  if (v5)
  {
    [v5 extent];
    transform = self->_transform;
    if (transform) {
      [(NUImageTransformAffine *)transform transform];
    }
    else {
      memset(&v18, 0, sizeof(v18));
    }
    v28.origin.x = (double)v19;
    v28.origin.y = (double)v20;
    v28.size.width = (double)v21;
    v28.size.height = (double)v22;
    CGRect v26 = CGRectApplyAffineTransform(v28, &v18);
    NU::RectT<long>::RectT(v25, &v26, 0);
    CGSize v16 = (CGSize)v25[1];
    CGPoint v17 = (CGPoint)v25[0];
    id v10 = [NUImageGeometry alloc];
    uint64_t v11 = [v5 renderScale];
    uint64_t v13 = v12;
    uint64_t v14 = [v5 orientation];
    v26.origin = v17;
    v26.size = v16;
    BOOL v9 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v10, "initWithExtent:renderScale:orientation:", &v26, v11, v13, v14);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    *a3 = +[NUError errorWithCode:1 reason:@"Cannot evaluate image geometry" object:v8 underlyingError:v6];

    BOOL v9 = 0;
  }

  return v9;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NUAffineTransformNode;
  uint64_t v7 = [(NURenderNode *)&v10 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  id v8 = (void *)v7;
  if (v7) {
    objc_storeStrong((id *)(v7 + 168), self->_transform);
  }

  return v8;
}

- (NUAffineTransformNode)initWithAffineTransform:(id)a3 input:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_transform, a3);
  id v7 = a3;
  id v8 = a4;
  CGSize v16 = @"transform";
  v17[0] = v7;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = *MEMORY[0x1E4F1E480];
  id v15 = v8;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v13.receiver = self;
  v13.super_class = (Class)NUAffineTransformNode;
  uint64_t v11 = [(NURenderNode *)&v13 initWithSettings:v9 inputs:v10];

  return v11;
}

- (NUAffineTransformNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24885);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    BOOL v9 = NSString;
    objc_super v10 = v8;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    objc_super v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24885);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24885);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    CGSize v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    CGPoint v17 = (void *)MEMORY[0x1E4F29060];
    CGAffineTransform v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  objc_super v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  CGAffineTransform v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  CGRect v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 166, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end