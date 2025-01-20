@interface NUClassifyPipelineImageCorrectionJob
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (NUClassifyPipelineImageCorrectionJob)initWithClassifyPipelineImageCorrectionRequest:(id)a3;
- (NUClassifyPipelineImageCorrectionJob)initWithRequest:(id)a3;
- (id)cacheKey;
- (id)detectClassifyPipelineImageCorrectionInBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
@end

@implementation NUClassifyPipelineImageCorrectionJob

- (void).cxx_destruct
{
}

- (void)cleanUp
{
  v4.receiver = self;
  v4.super_class = (Class)NUClassifyPipelineImageCorrectionJob;
  [(NURenderJob *)&v4 cleanUp];
  observation = self->_observation;
  self->_observation = 0;
}

- (id)result
{
  v3 = objc_alloc_init(_NUClassifyPipelineImageCorrectionResult);
  [(VNObservation *)self->_observation confidence];
  -[_NUClassifyPipelineImageCorrectionResult setConfidence:](v3, "setConfidence:");

  return v3;
}

- (BOOL)render:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v29 = NUAssertLogger_15096();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v32 = NUAssertLogger_15096();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v36;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v40;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 179, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != nil");
  }
  v5 = -[NURenderJob renderer:](self, "renderer:");
  if (v5)
  {
    v6 = [(NURenderJob *)self outputImage];
    [v6 extent];
    buf.origin.x = v7;
    buf.origin.y = v8;
    buf.size.width = v9;
    buf.size.height = v10;
    NU::RectT<long>::RectT(&v47, &buf, 0);
    CGSize v45 = v48;
    CGPoint v46 = v47;
    id v11 = +[NUVideoUtilities newPixelBufferOfSize:v48 format:1111970369];
    if (!v11)
    {
      +[NUError failureError:@"failed to allocate buffer for image" object:v6];
      BOOL v24 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    v12 = +[NUColorSpace sRGBColorSpace];
    v13 = (__CVBuffer *)[v11 CVPixelBuffer];
    CVBufferSetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F24A00], (CFTypeRef)[v12 CGColorSpace], kCVAttachmentMode_ShouldPropagate);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", objc_msgSend(v11, "CVPixelBuffer"));
    v15 = NSString;
    v16 = [(NURenderJob *)self request];
    v17 = [v16 name];
    v18 = [v15 stringWithFormat:@"%@-j%lld", v17, -[NURenderJob jobNumber](self, "jobNumber")];
    [v14 setLabel:v18];

    v19 = [(NURenderJob *)self outputImage];
    buf.origin = v46;
    buf.size = v45;
    v20 = objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v19, &buf, v14, 0, 0, a3);

    if (v20)
    {
      v21 = [v20 waitUntilCompletedAndReturnError:a3];

      if (v21)
      {
        -[NUClassifyPipelineImageCorrectionJob detectClassifyPipelineImageCorrectionInBuffer:error:](self, "detectClassifyPipelineImageCorrectionInBuffer:error:", [v11 CVPixelBuffer], a3);
        v22 = (VNObservation *)objc_claimAutoreleasedReturnValue();
        observation = self->_observation;
        self->_observation = v22;
        BOOL v24 = 1;
LABEL_12:

        goto LABEL_13;
      }
      observation = [(NURenderJob *)self request];
      v25 = (void *)[observation copy];
      id v26 = *a3;
      v27 = @"failed to render for image correction detection. Error completing task.";
    }
    else
    {
      observation = [(NURenderJob *)self request];
      v25 = (void *)[observation copy];
      id v26 = *a3;
      v27 = @"failed to render for image correction detection. Error creating task.";
    }
    *a3 = +[NUError errorWithCode:1 reason:v27 object:v25 underlyingError:v26];

    BOOL v24 = 0;
    goto LABEL_12;
  }
  BOOL v24 = 0;
LABEL_14:

  return v24;
}

- (id)detectClassifyPipelineImageCorrectionInBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v18 = NUAssertLogger_15096();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CGRect buf = 138543362;
      v53 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_15096();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v53 = v25;
        __int16 v54 = 2114;
        v55 = v29;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v53 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob detectClassifyPipelineImageCorrectionInBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 157, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"error != NULL");
  }
  id v6 = objc_alloc_init(NSClassFromString(&cfstr_Vnclassifypipe.isa));
  [v6 setRevision:1];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F45890]);
    CGFloat v8 = +[NUFactory sharedFactory];
    CGFloat v9 = [v8 visionSession];
    CGFloat v10 = (void *)[v7 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08] session:v9];

    id v51 = v6;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    int v12 = [v10 performRequests:v11 error:a4];

    if (v12)
    {
      v13 = [v6 results];

      if (!v13)
      {
        v34 = NUAssertLogger_15096();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = [NSString stringWithFormat:@"successful correction request has nil results"];
          *(_DWORD *)CGRect buf = 138543362;
          v53 = v35;
          _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = NUAssertLogger_15096();
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
        if (v36)
        {
          if (v38)
          {
            uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            uint64_t v42 = (void *)MEMORY[0x1E4F29060];
            id v43 = v41;
            uint64_t v44 = [v42 callStackSymbols];
            CGSize v45 = [v44 componentsJoinedByString:@"\n"];
            *(_DWORD *)CGRect buf = 138543618;
            v53 = v41;
            __int16 v54 = 2114;
            v55 = v45;
            _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v38)
        {
          v39 = [MEMORY[0x1E4F29060] callStackSymbols];
          v40 = [v39 componentsJoinedByString:@"\n"];
          *(_DWORD *)CGRect buf = 138543362;
          v53 = v40;
          _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob detectClassifyPipelineImageCorrectionInBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 172, @"successful correction request has nil results", v46, v47, v48, v49, v50);
      }
      v14 = [v6 results];
      v15 = [v14 firstObject];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
    *a4 = +[NUError failureError:@"unable to create correction request" object:v16];

    v15 = 0;
  }

  return v15;
}

- (id)cacheKey
{
  v3 = objc_alloc_init(NUDigest);
  objc_super v4 = [(NURenderJob *)self renderNode];
  objc_msgSend(v4, "nu_updateDigest:", v3);

  [(NUDigest *)v3 finalize];
  v5 = [(NUDigest *)v3 stringValue];

  return v5;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (id)scalePolicy
{
  v2 = [(NUClassifyPipelineImageCorrectionJob *)self classifyPipelineImageCorrectionRequest];
  v3 = [v2 scalePolicy];

  return v3;
}

- (NUClassifyPipelineImageCorrectionJob)initWithRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15125);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    id v7 = v5;
    CGFloat v8 = (objc_class *)objc_opt_class();
    CGFloat v9 = NSStringFromClass(v8);
    CGFloat v10 = NSStringFromSelector(a2);
    id v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)CGRect buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15125);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15125);
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
    v15 = v13;
    v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)CGRect buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  v15 = v18;
  BOOL v22 = [v20 callStackSymbols];
  v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)CGRect buf = 138543618;
  uint64_t v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 118, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUClassifyPipelineImageCorrectionJob)initWithClassifyPipelineImageCorrectionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUClassifyPipelineImageCorrectionJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

@end