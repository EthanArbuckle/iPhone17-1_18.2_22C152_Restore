@interface NUVideoPlaybackFrameJob
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputVideoFrame;
- (BOOL)wantsPrepareNodeCached;
- (BOOL)wantsRenderNodeCached;
- (NUVideoPlaybackFrameJob)initWithRequest:(id)a3;
- (NUVideoPlaybackFrameJob)initWithVideoFrameRequest:(id)a3;
- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3;
- (id)renderer:(id *)a3;
- (id)result;
- (id)scalePolicy;
@end

@implementation NUVideoPlaybackFrameJob

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (id)result
{
  v3 = objc_alloc_init(_NUVideoPlaybackFrameRequestResponse);
  v4 = [(NUVideoPlaybackFrameJob *)self frameRequest];
  -[_NUVideoPlaybackFrameRequestResponse setFrame:](v3, "setFrame:", [v4 destinationBuffer]);

  return v3;
}

- (BOOL)render:(id *)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v48 = NUAssertLogger_27250();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v49;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v51 = NUAssertLogger_27250();
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v55;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v59;
        _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v52)
    {
      v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      v54 = [v53 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v54;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoPlaybackFrameJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 145, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"error != NULL");
  }
  v5 = -[NUVideoPlaybackFrameJob renderer:](self, "renderer:");
  if (v5)
  {
    v6 = [(NUVideoPlaybackFrameJob *)self frameRequest];
    v7 = [v6 colorSpace];
    uint64_t v8 = [v6 destinationBuffer];
    if (!v8)
    {
      +[NUError errorWithCode:2 reason:@"Non-existent destination buffer on request" object:v6];
      BOOL v37 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    v9 = (__CVBuffer *)v8;
    v10 = [(NURenderJob *)self prepareNode];
    v11 = [v10 videoProperties:a3];

    if (!v11)
    {
      v38 = [(NURenderJob *)self prepareNode];
      *a3 = +[NUError errorWithCode:1 reason:@"Failed to get video properties" object:v38 underlyingError:*a3];

      BOOL v37 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v12 = [(NURenderJob *)self prepareNode];
    v13 = [v12 outputImageGeometry:a3];

    if (!v13)
    {
      v39 = [(NURenderJob *)self prepareNode];
      *a3 = +[NUError errorWithCode:1 reason:@"Failed to get output image geometry" object:v39 underlyingError:*a3];

      BOOL v37 = 0;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v14 = [(NURenderJob *)self renderScale];
    uint64_t v16 = v15;
    uint64_t v17 = [v13 renderScale];
    uint64_t v19 = NUScaleDivide(v14, v16, v17, v18);
    uint64_t v21 = v20;
    CGPoint v68 = (CGPoint)0;
    CGSize v69 = (CGSize)0;
    [v11 cleanAperture];
    NUPixelRectScaleRational(v67, v19, v21, 1, (int64x2_t *)&v68);
    buf.origin = v68;
    buf.size = v69;
    NUCVImageBufferSetCleanRect(v9, (uint64_t *)&buf);
    [v7 applyAttachmentsToCVPixelBuffer:v9];
    v22 = [(NURenderJob *)self outputImage];
    [v22 extent];
    buf.origin.x = v23;
    buf.origin.y = v24;
    buf.size.width = v25;
    buf.size.height = v26;
    NU::RectT<long>::RectT(v70, &buf, 0);
    v66.origin = (CGPoint)v70[0];
    v66.size = (CGSize)v70[1];

    size_t Width = CVPixelBufferGetWidth(v9);
    size_t Height = CVPixelBufferGetHeight(v9);
    if (*(_OWORD *)&v66.size != __PAIR128__(Height, Width))
    {
      v34 = [NSString stringWithFormat:@"Obsolete video frame request - bad bounds. buffer(%ld,%ld) CIExtent(%ld,%ld) buffer:%@", Width, Height, *(_OWORD *)&v66.size, v9];
      +[NUError invalidError:v34 object:v6];
      BOOL v37 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    v64 = v13;
    v65 = v11;
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:v9];
    v30 = NSString;
    v31 = [(NURenderJob *)self request];
    v32 = [v31 name];
    v33 = [v30 stringWithFormat:@"%@-j%lld", v32, -[NURenderJob jobNumber](self, "jobNumber")];
    [v29 setLabel:v33];

    v34 = v29;
    if (+[NUColorSpace shouldTagAsDisplayP3:v9])
    {
      v35 = +[NUColorSpace displayP3ColorSpace];
      objc_msgSend(v29, "setColorSpace:", objc_msgSend(v35, "CGColorSpace"));
    }
    v11 = v65;
    if (v7)
    {
      objc_msgSend(v34, "setColorSpace:", objc_msgSend(v7, "CGColorSpace"));
      uint64_t v36 = [v7 isHDR] ^ 1;
    }
    else
    {
      if (!CGColorSpaceUsesITUR_2100TF((CGColorSpaceRef)[v34 colorSpace])) {
        goto LABEL_19;
      }
      uint64_t v36 = 0;
    }
    [v34 setClamped:v36];
LABEL_19:
    v40 = [(NURenderJob *)self outputImage];
    CGRect buf = v66;
    v41 = objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v40, &buf, v34, 0, 0, a3);

    if (v41)
    {
      v42 = [v41 waitUntilCompletedAndReturnError:a3];

      if (v42)
      {
        BOOL v37 = 1;
LABEL_25:
        v13 = v64;

        goto LABEL_26;
      }
      v43 = [(NURenderJob *)self request];
      v44 = (void *)[v43 copy];
      id v45 = *a3;
      v46 = @"Failed to render playback frame. Error completing task.";
    }
    else
    {
      v43 = [(NURenderJob *)self request];
      v44 = (void *)[v43 copy];
      id v45 = *a3;
      v46 = @"Failed to render playback frame. Task creation failed";
    }
    *a3 = +[NUError errorWithCode:1 reason:v46 object:v44 underlyingError:v45];

    BOOL v37 = 0;
    goto LABEL_25;
  }
  BOOL v37 = 0;
LABEL_30:

  return v37;
}

- (id)renderer:(id *)a3
{
  v5 = [(NURenderJob *)self priority];
  int v6 = [v5 isLow];

  v7 = [(NURenderJob *)self device];
  uint64_t v8 = v7;
  if (v6) {
    [v7 lowPriorityRendererWithoutIntermediateCaching:a3];
  }
  else {
  v9 = [v7 rendererWithoutIntermediateCaching:a3];
  }

  return v9;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NUVideoPlaybackFrameJob;
  id v5 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v20, sel_newRenderPipelineStateForEvaluationMode_);
  if (a3 == 3)
  {
    int v6 = [(NUVideoPlaybackFrameJob *)self frameRequest];
    v7 = v6;
    if (v6)
    {
      [v6 evaluationTime];
    }
    else
    {
      long long v18 = 0uLL;
      uint64_t v19 = 0;
    }
    long long v16 = v18;
    uint64_t v17 = v19;
    [v5 setTime:&v16];

    uint64_t v8 = [(NUVideoPlaybackFrameJob *)self frameRequest];
    v9 = [v8 videoFrames];
    [v5 setVideoFrames:v9];

    v10 = [(NUVideoPlaybackFrameJob *)self frameRequest];
    v11 = [v10 videoMetadataSamples];
    [v5 setVideoMetadataSamples:v11];

    v12 = [(NUVideoPlaybackFrameJob *)self frameRequest];
    v13 = [v12 videoSampleSlices];
    [v5 setVideoSampleSlices:v13];

    uint64_t v14 = [(NUVideoPlaybackFrameJob *)self frameRequest];
    objc_msgSend(v5, "setPlaybackDirection:", objc_msgSend(v14, "playbackDirection"));
  }
  return v5;
}

- (BOOL)wantsPrepareNodeCached
{
  return 0;
}

- (BOOL)wantsRenderNodeCached
{
  return 0;
}

- (BOOL)wantsOutputVideoFrame
{
  return 1;
}

- (id)scalePolicy
{
  v3 = [NUFixedScalePolicy alloc];
  uint64_t v4 = [(NURenderJob *)self renderScale];
  int v6 = -[NUFixedScalePolicy initWithScale:](v3, "initWithScale:", v4, v5);

  return v6;
}

- (NUVideoPlaybackFrameJob)initWithVideoFrameRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)NUVideoPlaybackFrameJob;
  id v3 = a3;
  uint64_t v4 = [(NURenderJob *)&v31 initWithRequest:v3];
  uint64_t v5 = [v3 composition];
  [(NURenderJob *)v4 setComposition:v5];

  uint64_t v6 = [v3 renderScale];
  -[NURenderJob setRenderScale:](v4, "setRenderScale:", v6, v7);
  uint64_t v8 = [v3 videoRenderPrepareNode];

  [(NURenderJob *)v4 setPrepareNode:v8];
  v9 = [(NURenderJob *)v4 prepareNode];
  if (!v9)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
    }
    v10 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSString;
      v12 = v10;
      v13 = objc_msgSend(v11, "stringWithFormat:", @"Expected the PlaybackFrameRequest to have a prepareNode", v31.receiver, v31.super_class);
      *(_DWORD *)CGRect buf = 138543362;
      v33 = v13;
      _os_log_impl(&dword_1A9892000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v14 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v14 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
        }
LABEL_9:
        uint64_t v15 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v21 = (void *)MEMORY[0x1E4F29060];
          id v22 = specific;
          CGFloat v23 = v15;
          CGFloat v24 = [v21 callStackSymbols];
          CGFloat v25 = [v24 componentsJoinedByString:@"\n"];
          *(_DWORD *)CGRect buf = 138543618;
          v33 = specific;
          __int16 v34 = 2114;
          v35 = v25;
          _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    CGFloat v26 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)MEMORY[0x1E4F29060];
      CGFloat v23 = v26;
      v29 = [v28 callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v33 = v30;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUVideoPlaybackFrameJob initWithVideoFrameRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 87, @"Expected the PlaybackFrameRequest to have a prepareNode", v16, v17, v18, v19, (uint64_t)v31.receiver);
  }

  return v4;
}

- (NUVideoPlaybackFrameJob)initWithRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
  }
  uint64_t v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSString;
    uint64_t v7 = v5;
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)CGRect buf = 138543362;
    objc_super v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F29060];
    uint64_t v15 = v13;
    uint64_t v16 = [v14 callStackSymbols];
    uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)CGRect buf = 138543362;
    objc_super v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  objc_super v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  uint64_t v15 = v18;
  id v22 = [v20 callStackSymbols];
  CGFloat v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)CGRect buf = 138543618;
  objc_super v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  CGFloat v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUVideoPlaybackFrameJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 75, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

@end