@interface _PIPosterInactiveFrameLayoutJob
- (BOOL)complete:(id *)a3;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderStage;
- (CGRect)inactiveRect;
- (CIImage)matteImage;
- (PFParallaxLayoutConfiguration)layoutConfiguration;
- (PFPosterOrientedLayout)layout;
- (_PIPosterInactiveFrameLayoutJob)initWithInactiveFrameLayoutRequest:(id)a3;
- (_PIPosterInactiveFrameLayoutJob)initWithRequest:(id)a3;
- (id)result;
- (id)scalePolicy;
- (void)setInactiveRect:(CGRect)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutConfiguration:(id)a3;
- (void)setMatteImage:(id)a3;
@end

@implementation _PIPosterInactiveFrameLayoutJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)setInactiveRect:(CGRect)a3
{
  self->_inactiveRect = a3;
}

- (CGRect)inactiveRect
{
  double x = self->_inactiveRect.origin.x;
  double y = self->_inactiveRect.origin.y;
  double width = self->_inactiveRect.size.width;
  double height = self->_inactiveRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
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
  v3 = objc_alloc_init(_PIPosterInactiveFrameLayoutResult);
  [(_PIPosterInactiveFrameLayoutJob *)self inactiveRect];
  -[_PIPosterInactiveFrameLayoutResult setInactiveRect:](v3, "setInactiveRect:");
  return v3;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v42 = NUAssertLogger_22987();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v60 = v43;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v44 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v46 = NUAssertLogger_22987();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v50 = dispatch_get_specific(*v44);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v53 = [v51 callStackSymbols];
        v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = v50;
        __int16 v61 = 2114;
        v62 = v54;
        _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v47)
    {
      v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v49;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = (void *)MEMORY[0x1E4F8CCC8];
  v5 = [(_PIPosterInactiveFrameLayoutJob *)self layout];
  [v5 visibleFrame];
  double v57 = v7;
  double v58 = v6;
  double v55 = v9;
  double v56 = v8;
  v10 = [(_PIPosterInactiveFrameLayoutJob *)self layoutInactiveFrameRequest];
  v11 = [v10 segmentationItem];
  v12 = [v11 regions];
  [v12 acceptableCropRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(_PIPosterInactiveFrameLayoutJob *)self layoutConfiguration];
  [v21 unsafeRect];
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  v30 = [(_PIPosterInactiveFrameLayoutJob *)self layout];
  [v30 imageSize];
  objc_msgSend(v4, "computeInactiveAvoidingRectForVisibleRect:acceptableFrame:unsafeRect:imageSize:considerHeadroom:newVisibleRect:", 1, 0, v58, v57, v56, v55, v14, v16, v18, v20, v23, v25, v27, v29, v31, v32);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  -[_PIPosterInactiveFrameLayoutJob setInactiveRect:](self, "setInactiveRect:", v34, v36, v38, v40);
  return 1;
}

- (BOOL)render:(id *)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NURenderJob *)self renderer:a3];
  if (!v4)
  {
    v46 = NUAssertLogger_22987();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      BOOL v47 = [NSString stringWithFormat:@"Missing renderer"];
      int v77 = 138543362;
      v78 = v47;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v77, 0xCu);
    }
    v48 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v50 = NUAssertLogger_22987();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v64 = dispatch_get_specific(*v48);
        v65 = (void *)MEMORY[0x1E4F29060];
        id v66 = v64;
        v48 = [v65 callStackSymbols];
        v67 = [v48 componentsJoinedByString:@"\n"];
        int v77 = 138543618;
        v78 = (const void **)v64;
        __int16 v79 = 2114;
        v80 = v67;
        _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v77, 0x16u);
      }
    }
    else if (v51)
    {
      id v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      v48 = [v52 componentsJoinedByString:@"\n"];
      int v77 = 138543362;
      v78 = v48;
      _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v77, 0xCu);
    }
    int v56 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v5 = (void *)v4;
  uint64_t v6 = [(_PIPosterInactiveFrameLayoutJob *)self layout];
  if (!v6)
  {
    v53 = NUAssertLogger_22987();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = [NSString stringWithFormat:@"Missing poster layout"];
      int v77 = 138543362;
      v78 = v54;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v77, 0xCu);
    }
    v48 = (const void **)MEMORY[0x1E4F7A308];
    double v55 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v50 = NUAssertLogger_22987();
    int v56 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (!v55)
    {
      if (v56)
      {
        double v57 = [MEMORY[0x1E4F29060] callStackSymbols];
        v48 = [v57 componentsJoinedByString:@"\n"];
        int v77 = 138543362;
        v78 = v48;
        _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v77, 0xCu);
      }
LABEL_25:

      int v61 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v56)
    {
      v68 = dispatch_get_specific(*v48);
      v69 = (void *)MEMORY[0x1E4F29060];
      id v70 = v68;
      v48 = [v69 callStackSymbols];
      v71 = [v48 componentsJoinedByString:@"\n"];
      int v77 = 138543618;
      v78 = (const void **)v68;
      __int16 v79 = 2114;
      v80 = v71;
      _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v77, 0x16u);
    }
    goto LABEL_25;
  }
  double v7 = (void *)v6;
  uint64_t v8 = [(_PIPosterInactiveFrameLayoutJob *)self matteImage];
  if (!v8)
  {
    double v58 = NUAssertLogger_22987();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = [NSString stringWithFormat:@"Missing matte image"];
      int v77 = 138543362;
      v78 = v59;
      _os_log_error_impl(&dword_1A9680000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v77, 0xCu);
    }
    v48 = (const void **)MEMORY[0x1E4F7A308];
    v60 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v50 = NUAssertLogger_22987();
    int v61 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (!v60)
    {
      if (v61)
      {
        v62 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v63 = [v62 componentsJoinedByString:@"\n"];
        int v77 = 138543362;
        v78 = v63;
        _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v77, 0xCu);
      }
      goto LABEL_28;
    }
LABEL_26:
    if (v61)
    {
      v72 = dispatch_get_specific(*v48);
      v73 = (void *)MEMORY[0x1E4F29060];
      id v74 = v72;
      v75 = [v73 callStackSymbols];
      v76 = [v75 componentsJoinedByString:@"\n"];
      int v77 = 138543618;
      v78 = (const void **)v72;
      __int16 v79 = 2114;
      v80 = v76;
      _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v77, 0x16u);
    }
LABEL_28:

    _NUAssertFailHandler();
  }
  double v9 = (void *)v8;
  id v10 = objc_alloc(MEMORY[0x1E4F7A468]);
  [v9 extent];
  uint64_t v11 = NUPixelSizeFromCGSize();
  double v13 = objc_msgSend(v10, "initWithTargetPixelSize:", v11, v12);
  [v7 imageSize];
  uint64_t v14 = NUPixelSizeFromCGSize();
  objc_msgSend(v13, "scaleForImageSize:", v14, v15);
  NUScaleToDouble();
  double v17 = v16;
  double v18 = 1.0 / v16;
  double v19 = [(_PIPosterInactiveFrameLayoutJob *)self layout];
  [v19 visibleFrame];
  double v21 = v17 * v20;
  double v23 = v17 * v22;
  double v25 = v17 * v24;
  double v27 = v17 * v26;

  uint64_t v28 = [(_PIPosterInactiveFrameLayoutJob *)self layout];
  [v28 imageSize];
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  double v33 = [(_PIPosterInactiveFrameLayoutJob *)self layout];
  [v33 visibleFrame];
  v83.origin.double x = v34;
  v83.origin.double y = v35;
  v83.size.double width = v36;
  v83.size.double height = v37;
  v82.origin.double x = 0.0;
  v82.origin.double y = 0.0;
  v82.size.double width = v30;
  v82.size.double height = v32;
  BOOL v38 = !CGRectContainsRect(v82, v83);

  objc_msgSend(v9, "extent", 0, 0, 0, 0);
  double v40 = v39;
  double v42 = v41;
  v43 = [(_PIPosterInactiveFrameLayoutJob *)self layoutConfiguration];
  v44 = [v5 context];
  +[PISegmentationHelper computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:", 0, v38, v9, v43, v44, v21, v23, v25, v27, v40, v42);

  -[_PIPosterInactiveFrameLayoutJob setInactiveRect:](self, "setInactiveRect:", v18 * 0.0, v18 * 0.0, v18 * 0.0, v18 * 0.0);
  return 1;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)_PIPosterInactiveFrameLayoutJob;
  BOOL v4 = [(NURenderJob *)&v44 prepare:a3];
  if (!v4) {
    return v4;
  }
  v5 = [(_PIPosterInactiveFrameLayoutJob *)self layoutInactiveFrameRequest];
  uint64_t v6 = [v5 segmentationItem];

  if (!v6)
  {
    double v22 = NUAssertLogger_22987();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      double v23 = [NSString stringWithFormat:@"Missing segmentation item"];
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v26 = NUAssertLogger_22987();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        CGFloat v35 = dispatch_get_specific(*v24);
        CGFloat v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        double v24 = [v36 callStackSymbols];
        BOOL v38 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v46 = (const void **)v35;
        __int16 v47 = 2114;
        v48 = v38;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v24 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v32 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  double v7 = [(_PIPosterInactiveFrameLayoutJob *)self layoutInactiveFrameRequest];
  uint64_t v8 = [v7 layout];
  if (!v8)
  {
    id v10 = [v6 originalLayout];
    double v9 = [v10 portraitLayout];

    if (v9) {
      goto LABEL_6;
    }
    double v29 = NUAssertLogger_22987();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      CGFloat v30 = [NSString stringWithFormat:@"Missing poster layout"];
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v24 = (const void **)MEMORY[0x1E4F7A308];
    double v31 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v26 = NUAssertLogger_22987();
    int v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v31)
    {
      if (v32)
      {
        double v33 = [MEMORY[0x1E4F29060] callStackSymbols];
        CGFloat v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v46 = v34;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_31;
    }
LABEL_29:
    if (v32)
    {
      double v39 = dispatch_get_specific(*v24);
      double v40 = (void *)MEMORY[0x1E4F29060];
      id v41 = v39;
      double v42 = [v40 callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v39;
      __int16 v47 = 2114;
      v48 = v43;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_31:

    _NUAssertFailHandler();
  }
  double v9 = (void *)v8;

LABEL_6:
  uint64_t v11 = [v6 layoutConfiguration];
  uint64_t v12 = [v11 portraitConfiguration];
  double v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
    id v14 = [v15 portraitConfiguration];
  }
  double v16 = [v6 segmentationMatte];

  if (v16)
  {
    double v17 = (void *)MEMORY[0x1E4F1E050];
    double v18 = [v6 segmentationMatte];
    double v19 = [v17 imageWithNUImageBuffer:v18];

    if ((unint64_t)([v6 classification] - 3) <= 1)
    {
      uint64_t v20 = +[PISegmentationHelper invertImage:v19];

      double v19 = (void *)v20;
    }
    [(_PIPosterInactiveFrameLayoutJob *)self setMatteImage:v19];
  }
  else
  {
    -[_PIPosterInactiveFrameLayoutJob setInactiveRect:](self, "setInactiveRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
  [(_PIPosterInactiveFrameLayoutJob *)self setLayout:v9];
  [(_PIPosterInactiveFrameLayoutJob *)self setLayoutConfiguration:v14];

  return v4;
}

- (id)scalePolicy
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:3048192];
  return v2;
}

- (BOOL)wantsCompleteStage
{
  v2 = [(_PIPosterInactiveFrameLayoutJob *)self matteImage];
  BOOL v3 = v2 == 0;

  return v3;
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
  v2 = [(_PIPosterInactiveFrameLayoutJob *)self matteImage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_PIPosterInactiveFrameLayoutJob)initWithInactiveFrameLayoutRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PIPosterInactiveFrameLayoutJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

- (_PIPosterInactiveFrameLayoutJob)initWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    double v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSString;
      double v9 = v7;
      id v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(a2);
      double v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_23001);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          double v16 = (void *)MEMORY[0x1E4F29060];
          double v17 = v15;
          double v18 = [v16 callStackSymbols];
          double v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_23001);
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
      double v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      double v17 = v20;
      double v24 = [v22 callStackSymbols];
      double v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = specific;
      __int16 v29 = 2114;
      CGFloat v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    double v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_23001);
  }
}

@end