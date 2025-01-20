@interface PIParallaxInfillJob
- (BOOL)complete:(id *)a3;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderStage;
- (CIImage)matteImage;
- (PIParallaxInfillJob)initWithParallaxInfillRequest:(id)a3;
- (PIParallaxInfillJob)initWithRequest:(id)a3;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
- (void)setMatteImage:(id)a3;
@end

@implementation PIParallaxInfillJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_infilledImageBuffer, 0);
}

- (void)setMatteImage:(id)a3
{
}

- (CIImage)matteImage
{
  return self->_matteImage;
}

- (void)cleanUp
{
  self->_infilledImageBuffer = 0;
  MEMORY[0x1F41817F8]();
}

- (id)result
{
  v3 = objc_alloc_init(_PIParallaxInfillResult);
  [(_PIParallaxInfillResult *)v3 setInfilledImage:self->_infilledImageBuffer];
  return v3;
}

- (BOOL)complete:(id *)a3
{
  renderTask = self->_renderTask;
  id v11 = 0;
  v6 = [(CIRenderTask *)renderTask waitUntilCompletedAndReturnError:&v11];
  id v7 = v11;
  if (v6)
  {
    v8 = self->_renderTask;
    self->_renderTask = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F7A438];
    v8 = [(NURenderJob *)self request];
    *a3 = [v9 errorWithCode:1 reason:@"failed to render" object:v8 underlyingError:v7];
  }

  return v6 != 0;
}

- (BOOL)render:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NURenderJob *)self outputImage];
  if (!v5)
  {
    v33 = NUAssertLogger_153();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = [NSString stringWithFormat:@"Output image must not be nil"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v37 = NUAssertLogger_153();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v38)
      {
        v46 = dispatch_get_specific(*v35);
        v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        v35 = [v47 callStackSymbols];
        v49 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v49;
        _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v43 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(PIParallaxInfillJob *)self matteImage];
  if (!v7)
  {
    v40 = NUAssertLogger_153();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = [NSString stringWithFormat:@"Matte image must not be nil"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = (const void **)MEMORY[0x1E4F7A308];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v37 = NUAssertLogger_153();
    int v43 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (!v42)
    {
      if (v43)
      {
        v44 = [MEMORY[0x1E4F29060] callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v45;
        _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_25;
    }
LABEL_23:
    if (v43)
    {
      v50 = dispatch_get_specific(*v35);
      v51 = (void *)MEMORY[0x1E4F29060];
      id v52 = v50;
      v53 = [v51 callStackSymbols];
      v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v54;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_25:

    _NUAssertFailHandler();
  }
  v8 = (void *)v7;
  v9 = objc_alloc_init(PISegmentationInfillFilter);
  v10 = +[PIGlobalSettings globalSettings];
  -[PISegmentationInfillFilter setInfillAlgorithm:](v9, "setInfillAlgorithm:", [v10 segmentationInfillAlgorithm]);

  [(PISegmentationInfillFilter *)v9 setInputImage:v6];
  [(PISegmentationInfillFilter *)v9 setInputMatteImage:v8];
  id v11 = [(PISegmentationInfillFilter *)v9 outputImage];
  if (v11)
  {
    v55 = a3;
    v12 = [(PIParallaxInfillJob *)self infillRequest];
    v13 = [v12 pixelFormat];

    v14 = [(PIParallaxInfillJob *)self infillRequest];
    v15 = [v14 colorSpace];

    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    *(void *)&buf[16] = [(NURenderJob *)self imageSize];
    uint64_t v57 = v16;
    v17 = [MEMORY[0x1E4F7A5F8] regionWithRect:buf];
    v18 = [MEMORY[0x1E4F7A448] sharedFactory];
    v19 = [v18 surfaceStoragePool];

    v20 = (void *)MEMORY[0x1E4F7A6B0];
    uint64_t v21 = [(NURenderJob *)self imageSize];
    objc_msgSend(v20, "imageBufferWithSize:format:fromPool:", v21, v22, v13, v19);
    v23 = (NUStorageImageBuffer *)objc_claimAutoreleasedReturnValue();
    infilledImageBuffer = self->_infilledImageBuffer;
    self->_infilledImageBuffer = v23;

    v25 = self->_infilledImageBuffer;
    if (v25)
    {
      v26 = [(NUStorageImageBuffer *)v25 storage];
      uint64_t v27 = [(NURenderJob *)self imageSize];
      -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v11, v26, v15, v17, v27, v28, v55);
      v29 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
      renderTask = self->_renderTask;
      self->_renderTask = v29;

      BOOL v31 = self->_renderTask != 0;
    }
    else
    {
      [MEMORY[0x1E4F7A438] failureError:@"Failed to allocate buffer from pool" object:v19];
      BOOL v31 = 0;
      id *v55 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] failureError:@"Failed to generate background infill image" object:0];
    BOOL v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v31;
}

- (BOOL)prepare:(id *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)PIParallaxInfillJob;
  if (-[NURenderJob prepare:](&v28, sel_prepare_))
  {
    uint64_t v5 = [(PIParallaxInfillJob *)self infillRequest];
    v6 = [v5 segmentationMatte];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1E050] imageWithNUImageBuffer:v6];
      [v7 extent];
      if (v8 >= 1.0 && v9 >= 1.0)
      {
        double v14 = v8;
        double v15 = v9;
        uint64_t v16 = [(PIParallaxInfillJob *)self infillRequest];
        int v17 = [v16 shouldInfillForeground];

        if (v17)
        {
          uint64_t v18 = +[PISegmentationHelper invertImage:v7];

          uint64_t v7 = (void *)v18;
        }
        v19 = v7;
        uint64_t v7 = +[PISegmentationHelper infillMaskForSegmentationMatte:v7];

        v20 = [(NURenderJob *)self outputImage];
        [v20 extent];
        if (v21 == v14 && v22 == v15)
        {
          [(PIParallaxInfillJob *)self setMatteImage:v7];
        }
        else
        {
          memset(&v27, 0, sizeof(v27));
          CGAffineTransformMakeScale(&v27, v21 / v14, v22 / v15);
          CGAffineTransform v26 = v27;
          v23 = [v7 imageByApplyingTransform:&v26];
          [(PIParallaxInfillJob *)self setMatteImage:v23];
        }
        v24 = [(PIParallaxInfillJob *)self matteImage];
        BOOL v12 = v24 != 0;

        if (!v24)
        {
          *a3 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid matte image" object:v7];
        }

        goto LABEL_21;
      }
      id v11 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid matte image size" object:v7];
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F7A438];
      uint64_t v7 = [(PIParallaxInfillJob *)self infillRequest];
      id v11 = [v13 missingError:@"Missing matte image" object:v7];
    }
    BOOL v12 = 0;
    *a3 = v11;
LABEL_21:

    return v12;
  }
  return 0;
}

- (id)scalePolicy
{
  v2 = [(PIParallaxInfillJob *)self infillRequest];
  v3 = [v2 scalePolicy];

  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (PIParallaxInfillJob)initWithParallaxInfillRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIParallaxInfillJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

- (PIParallaxInfillJob)initWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      double v8 = NSString;
      double v9 = v7;
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      BOOL v12 = NSStringFromSelector(a2);
      v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      objc_super v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_160);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = (void *)MEMORY[0x1E4F29060];
          int v17 = v15;
          uint64_t v18 = [v16 callStackSymbols];
          v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          objc_super v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_160);
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
      int v17 = v20;
      v24 = [v22 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      objc_super v28 = specific;
      __int16 v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    CGAffineTransform v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_160);
  }
}

@end