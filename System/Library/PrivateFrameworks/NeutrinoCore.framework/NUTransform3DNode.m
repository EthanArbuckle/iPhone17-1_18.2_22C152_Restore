@interface NUTransform3DNode
- (NUTransform3DNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NUTransform3DNode)initWithTransform3D:(id)a3 input:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_transformWithError:(id *)a3;
- (id)debugQuickLookObject;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUTransform3DNode

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
    _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 433, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"error != nil");
  }
  transform = self->_transform;

  return transform;
}

- (id)debugQuickLookObject
{
  if ([(NURenderNode *)self isCached])
  {
    v5.receiver = self;
    v5.super_class = (Class)NUTransform3DNode;
    v3 = [(NURenderNode *)&v5 debugQuickLookObject];
  }
  else
  {
    uint64_t v6 = 0;
    v3 = [(NUTransform3DNode *)self _evaluateImage:&v6];
  }

  return v3;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v50 = NUAssertLogger_24871();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v51;
      _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v53 = NUAssertLogger_24871();
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        buf[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v57;
        buf[0].i16[6] = 2114;
        *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v61;
        _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v54)
    {
      v55 = [MEMORY[0x1E4F29060] callStackSymbols];
      v56 = [v55 componentsJoinedByString:@"\n"];
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v56;
      _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 349, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"error != NULL");
  }
  uint64_t v5 = *MEMORY[0x1E4F1E480];
  uint64_t v6 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  id v89 = 0;
  v7 = [v6 outputImage:&v89];
  id v8 = v89;
  if (v7)
  {
    id v88 = 0;
    BOOL v9 = [v6 outputImageGeometry:&v88];
    id v10 = v88;

    if (v9)
    {
      if ([v9 renderScale] < 1 || v11 <= 0)
      {
        v66 = NUAssertLogger_24871();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v67 = [NSString stringWithFormat:@"Invalid render scale"];
          buf[0].i32[0] = 138543362;
          *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v67;
          _os_log_error_impl(&dword_1A9892000, v66, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
        }
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = NUAssertLogger_24871();
        BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_ERROR);
        if (v68)
        {
          if (v70)
          {
            v73 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v74 = (void *)MEMORY[0x1E4F29060];
            id v75 = v73;
            v76 = [v74 callStackSymbols];
            v77 = [v76 componentsJoinedByString:@"\n"];
            buf[0].i32[0] = 138543618;
            *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v73;
            buf[0].i16[6] = 2114;
            *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v77;
            _os_log_error_impl(&dword_1A9892000, v69, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
          }
        }
        else if (v70)
        {
          v71 = [MEMORY[0x1E4F29060] callStackSymbols];
          v72 = [v71 componentsJoinedByString:@"\n"];
          buf[0].i32[0] = 138543362;
          *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v72;
          _os_log_error_impl(&dword_1A9892000, v69, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 374, @"Invalid render scale", v78, v79, v80, v81, v82);
      }
      v83 = a3;
      id v87 = v10;
      uint64_t v13 = [v9 renderScale];
      double v15 = NUScaleToDouble(v13, v14);
      memset(buf, 0, sizeof(buf));
      v84 = v9;
      [v9 extent];
      -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)buf[0].i64[0], (double)buf[0].i64[1]);
      double v17 = v16;
      double v19 = v18;
      -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)(buf[1].i64[0] + buf[0].i64[0]), (double)buf[0].i64[1]);
      double v21 = v20;
      double v23 = v22;
      -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)buf[0].i64[0], (double)(buf[1].i64[1] + buf[0].i64[1]));
      double v25 = v24;
      double v27 = v26;
      [(NUImageTransform3D *)self->_transform transformPoint:vcvtq_f64_s64(vaddq_s64(buf[1], buf[0]))];
      double v28 = v15 * v17;
      double v29 = v15 * v19;
      double v30 = v15 * v21;
      double v31 = v15 * v23;
      double v32 = v15 * v25;
      double v33 = v15 * v27;
      double v35 = v15 * v34;
      double v37 = v15 * v36;
      uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", v32, v33);
      uint64_t v39 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", v35, v37);
      objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", v30, v31);
      v41 = v40 = v7;
      v42 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", v28, v29);
      v43 = (void *)MEMORY[0x1E4F1E040];
      v90[0] = @"inputTopLeft";
      v90[1] = @"inputTopRight";
      v85 = (void *)v39;
      v86 = (void *)v38;
      v91[0] = v38;
      v91[1] = v39;
      v90[2] = @"inputBottomRight";
      v90[3] = @"inputBottomLeft";
      v91[2] = v41;
      v91[3] = v42;
      v90[4] = v5;
      v91[4] = v40;
      v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:5];
      v45 = [v43 filterWithName:@"CIPerspectiveTransform" withInputParameters:v44];

      if (v45)
      {
        v46 = [v45 outputImage];
        v47 = v46;
        if (v46)
        {
          id v48 = v46;
        }
        else
        {
          id *v83 = +[NUError errorWithCode:2 reason:@"Core Image returned invalid output for filter" object:v45];
        }
        id v10 = v87;
        BOOL v9 = v84;
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"Cannot create CIPerspectiveTransform filter" object:self->_transform];
        v47 = 0;
        BOOL v9 = v84;
        id *v83 = (id)objc_claimAutoreleasedReturnValue();
        id v10 = v87;
      }

      v7 = v40;
    }
    else
    {
      +[NUError errorWithCode:2 reason:@"Cannot evaluate input geometry" object:v6 underlyingError:v10];
      v47 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:2 reason:@"Cannot evaluate input image" object:v6 underlyingError:v8];
    v47 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v8;
  }

  return v47;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)NUTransform3DNode;
  id v41 = 0;
  uint64_t v5 = [(NURenderNode *)&v40 _evaluateImageGeometry:&v41];
  if (v5)
  {
    id v6 = v41;
    [v5 extent];
    -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)0, (double)0);
    float64_t v8 = v7;
    float64_t v10 = v9;
    -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)0, (double)0);
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)0, (double)0);
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    [(NUImageTransform3D *)self->_transform transformPoint:vcvtq_f64_s64(vaddq_s64((int64x2_t)0, (int64x2_t)0))];
    uint64_t v20 = v19;
    uint64_t v22 = v21;

    v44.f64[0] = v8;
    v44.f64[1] = v10;
    uint64_t v45 = v12;
    uint64_t v46 = v14;
    uint64_t v47 = v16;
    uint64_t v48 = v18;
    uint64_t v49 = v20;
    uint64_t v50 = v22;
    uint64_t v23 = 16;
    float64x2_t v24 = v44;
    CGPoint v25 = (CGPoint)v44;
    do
    {
      float64x2_t v26 = *(float64x2_t *)((char *)&v44 + v23);
      float64x2_t v24 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v26, v24), (int8x16_t)v26, (int8x16_t)v24);
      CGPoint v25 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v26, (float64x2_t)v25), (int8x16_t)v25, (int8x16_t)v26);
      v23 += 16;
    }
    while (v23 != 64);
    v43.origin = v25;
    v43.size = (CGSize)vsubq_f64(v24, (float64x2_t)v25);
    NU::RectT<long>::RectT(v42, &v43, 0);
    CGSize v38 = (CGSize)v42[1];
    CGPoint v39 = (CGPoint)v42[0];
    double v27 = [NUImageGeometry alloc];
    uint64_t v28 = [v5 renderScale];
    uint64_t v30 = v29;
    uint64_t v31 = [v5 orientation];
    v43.origin = v39;
    v43.size = v38;
    double v32 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v27, "initWithExtent:renderScale:orientation:", &v43, v28, v30, v31);
  }
  else
  {
    double v33 = (void *)MEMORY[0x1E4F1CA98];
    id v34 = v41;
    double v35 = [v33 null];
    id v36 = +[NUError errorWithCode:1 reason:@"Cannot evaluate image geometry" object:v35 underlyingError:v34];

    *a3 = v36;
    double v32 = 0;
  }

  return v32;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NUTransform3DNode;
  uint64_t v7 = [(NURenderNode *)&v10 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  float64_t v8 = (void *)v7;
  if (v7) {
    objc_storeStrong((id *)(v7 + 168), self->_transform);
  }

  return v8;
}

- (NUTransform3DNode)initWithTransform3D:(id)a3 input:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_transform, a3);
  id v7 = a3;
  id v8 = a4;
  uint64_t v16 = @"transform";
  v17[0] = v7;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = *MEMORY[0x1E4F1E480];
  id v15 = v8;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v13.receiver = self;
  v13.super_class = (Class)NUTransform3DNode;
  uint64_t v11 = [(NURenderNode *)&v13 initWithSettings:v9 inputs:v10];

  return v11;
}

- (NUTransform3DNode)initWithSettings:(id)a3 inputs:(id)a4
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
    double v9 = NSString;
    objc_super v10 = v8;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    objc_super v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    id v34 = v14;
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
    uint64_t v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    id v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  uint64_t v18 = v21;
  CGPoint v25 = [v23 callStackSymbols];
  float64x2_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  id v34 = specific;
  __int16 v35 = 2114;
  id v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  double v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 294, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end