@interface _PIParallaxClockLayoutJob
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderStage;
- (CIImage)matteImage;
- (NSString)clockLayerOrder;
- (PFParallaxLayoutConfiguration)layoutConfiguration;
- (PFPosterOrientedLayout)layout;
- (_PIParallaxClockLayoutJob)initWithParallaxClockLayoutRequest:(id)a3;
- (_PIParallaxClockLayoutJob)initWithRequest:(id)a3;
- (id)result;
- (id)scalePolicy;
- (unint64_t)clockIntersection;
- (void)setClockIntersection:(unint64_t)a3;
- (void)setClockLayerOrder:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutConfiguration:(id)a3;
- (void)setMatteImage:(id)a3;
@end

@implementation _PIParallaxClockLayoutJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockLayerOrder, 0);
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)setClockIntersection:(unint64_t)a3
{
  self->_clockIntersection = a3;
}

- (unint64_t)clockIntersection
{
  return self->_clockIntersection;
}

- (void)setClockLayerOrder:(id)a3
{
}

- (NSString)clockLayerOrder
{
  return self->_clockLayerOrder;
}

- (void)setMatteImage:(id)a3
{
}

- (CIImage)matteImage
{
  return self->_matteImage;
}

- (void)setLayoutConfiguration:(id)a3
{
}

- (PFParallaxLayoutConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayout:(id)a3
{
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (id)result
{
  v3 = objc_alloc_init(_PIParallaxClockLayoutResult);
  v4 = [(_PIParallaxClockLayoutJob *)self clockLayerOrder];
  [(_PIParallaxClockLayoutResult *)v3 setClockLayerOrder:v4];

  [(_PIParallaxClockLayoutResult *)v3 setClockIntersection:[(_PIParallaxClockLayoutJob *)self clockIntersection]];
  return v3;
}

- (BOOL)render:(id *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v4 = [(NURenderJob *)self renderer:a3];
  if (!v4)
  {
    v18 = NUAssertLogger_930();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [NSString stringWithFormat:@"Missing renderer"];
      int v51 = 138543362;
      v52 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v51, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_930();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v36 = dispatch_get_specific(*v20);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        int v51 = 138543618;
        v52 = v36;
        __int16 v53 = 2114;
        *(void *)v54 = v40;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v51, 0x16u);
      }
      goto LABEL_28;
    }
    if (!v23) {
      goto LABEL_28;
    }
LABEL_19:
    v34 = [MEMORY[0x1E4F29060] callStackSymbols];
    v35 = [v34 componentsJoinedByString:@"\n"];
    int v51 = 138543362;
    v52 = v35;
    _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v51, 0xCu);

    goto LABEL_28;
  }
  v5 = [(_PIParallaxClockLayoutJob *)self layout];
  if (!v5)
  {
    v24 = NUAssertLogger_930();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [NSString stringWithFormat:@"Missing parallax layout"];
      int v51 = 138543362;
      v52 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v51, 0xCu);
    }
    v26 = (const void **)MEMORY[0x1E4F7A308];
    v27 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_930();
    BOOL v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v28)
      {
        v41 = dispatch_get_specific(*v26);
        v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        v44 = [v42 callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        int v51 = 138543618;
        v52 = v41;
        __int16 v53 = 2114;
        *(void *)v54 = v45;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v51, 0x16u);
      }
      goto LABEL_28;
    }
    if (!v28) {
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  v6 = [(_PIParallaxClockLayoutJob *)self layoutConfiguration];
  v7 = [(_PIParallaxClockLayoutJob *)self matteImage];
  if (!v7)
  {
    v29 = NUAssertLogger_930();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = [NSString stringWithFormat:@"Missing matte image"];
      int v51 = 138543362;
      v52 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v51, 0xCu);
    }
    v31 = (const void **)MEMORY[0x1E4F7A308];
    v32 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_930();
    BOOL v33 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (!v33) {
        goto LABEL_28;
      }
      goto LABEL_19;
    }
    if (v33)
    {
      v46 = dispatch_get_specific(*v31);
      v47 = (void *)MEMORY[0x1E4F29060];
      id v48 = v46;
      v49 = [v47 callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      int v51 = 138543618;
      v52 = v46;
      __int16 v53 = 2114;
      *(void *)v54 = v50;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v51, 0x16u);
    }
LABEL_28:

    _NUAssertFailHandler();
    __break(1u);
  }
  [v5 imageSize];
  [v5 visibleFrame];
  NURectNormalize();
  [v7 extent];
  NURectDenormalize();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  *(_OWORD *)&v54[2] = 0u;
  v16 = [v4 context];
  +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v7, v6, v16, 1, v9, v11, v13, v15);

  [(_PIParallaxClockLayoutJob *)self setClockLayerOrder:0];
  [(_PIParallaxClockLayoutJob *)self setClockIntersection:0];

  return 1;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)_PIParallaxClockLayoutJob;
  BOOL v4 = [(NURenderJob *)&v45 prepare:a3];
  if (!v4) {
    return v4;
  }
  v5 = [(_PIParallaxClockLayoutJob *)self clockLayoutRequest];
  v6 = [v5 segmentationItem];

  if (!v6)
  {
    BOOL v23 = NUAssertLogger_930();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [NSString stringWithFormat:@"Missing segmentation item"];
      *(_DWORD *)buf = 138543362;
      v47 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v27 = NUAssertLogger_930();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v36 = dispatch_get_specific(*v25);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v25 = [v37 callStackSymbols];
        v39 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = (const void **)v36;
        __int16 v48 = 2114;
        v49 = v39;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v25;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v33 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  v7 = [(_PIParallaxClockLayoutJob *)self clockLayoutRequest];
  double v8 = [v7 layout];

  if (!v8)
  {
    v30 = NUAssertLogger_930();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = [NSString stringWithFormat:@"Missing parallax layout"];
      *(_DWORD *)buf = 138543362;
      v47 = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = (const void **)MEMORY[0x1E4F7A308];
    v32 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v27 = NUAssertLogger_930();
    int v33 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (v33)
      {
        v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v47 = v35;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_33;
    }
LABEL_31:
    if (v33)
    {
      v40 = dispatch_get_specific(*v25);
      v41 = (void *)MEMORY[0x1E4F29060];
      id v42 = v40;
      id v43 = [v41 callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v47 = (const void **)v40;
      __int16 v48 = 2114;
      v49 = v44;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_33:

    _NUAssertFailHandler();
  }
  uint64_t v9 = [v8 orientation];
  double v10 = [v6 layoutConfiguration];
  double v11 = v10;
  if (v9 == 2)
  {
    double v12 = [v10 landscapeConfiguration];
    if (!v12)
    {
      double v13 = (void *)MEMORY[0x1E4F8CCB0];
      uint64_t v14 = 2;
LABEL_10:
      v16 = [v13 deviceConfigurationForOrientation:v14];
      id v15 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    double v12 = [v10 portraitConfiguration];
    if (!v12)
    {
      double v13 = (void *)MEMORY[0x1E4F8CCB0];
      uint64_t v14 = 1;
      goto LABEL_10;
    }
  }
  id v15 = v12;
  v16 = v15;
LABEL_11:

  v17 = [v6 segmentationMatte];

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F1E050];
    v19 = [v6 segmentationMatte];
    v20 = [v18 imageWithNUImageBuffer:v19];

    if ((unint64_t)([v6 classification] - 3) <= 1)
    {
      uint64_t v21 = +[PISegmentationHelper invertImage:v20];

      v20 = (void *)v21;
    }
    [(_PIParallaxClockLayoutJob *)self setMatteImage:v20];
    [(_PIParallaxClockLayoutJob *)self setLayout:v8];
    [(_PIParallaxClockLayoutJob *)self setLayoutConfiguration:v16];
  }
  else
  {
    [(_PIParallaxClockLayoutJob *)self setClockLayerOrder:*MEMORY[0x1E4F8D098]];
    [(_PIParallaxClockLayoutJob *)self setClockIntersection:2];
  }

  return v4;
}

- (id)scalePolicy
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:3048192];
  return v2;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

- (BOOL)wantsOutputImage
{
  return 0;
}

- (BOOL)wantsRenderStage
{
  v2 = [(_PIParallaxClockLayoutJob *)self matteImage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_PIParallaxClockLayoutJob)initWithParallaxClockLayoutRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PIParallaxClockLayoutJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

- (_PIParallaxClockLayoutJob)initWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      double v8 = NSString;
      uint64_t v9 = v7;
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      double v12 = NSStringFromSelector(a2);
      double v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_941);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)MEMORY[0x1E4F29060];
          v17 = v15;
          v18 = [v16 callStackSymbols];
          v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          BOOL v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_941);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      v17 = v20;
      v24 = [v22 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      BOOL v28 = specific;
      __int16 v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_941);
  }
}

@end