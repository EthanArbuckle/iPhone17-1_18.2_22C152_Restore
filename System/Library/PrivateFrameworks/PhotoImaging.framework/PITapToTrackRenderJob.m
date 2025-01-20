@interface PITapToTrackRenderJob
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (BOOL)clientRequestedStop;
- (BOOL)prepare:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputVideo;
- (BOOL)wantsRenderStage;
- (CGPoint)normalizedImagePoint;
- (PTCinematographyTrack)completedTrack;
- (id)progressHandler;
- (id)result;
- (id)scalePolicy;
- (void)_reportProgressAtTime:(id *)a3 rect:(CGRect)a4 confidence:(float)a5;
- (void)setClientRequestedStop:(BOOL)a3;
- (void)setCompletedTrack:(id)a3;
- (void)setNormalizedImagePoint:(CGPoint)a3;
- (void)setProgressHandler:(id)a3;
- (void)setStartTime:(id *)a3;
@end

@implementation PITapToTrackRenderJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedTrack, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)setClientRequestedStop:(BOOL)a3
{
  self->_clientRequestedStop = a3;
}

- (BOOL)clientRequestedStop
{
  return self->_clientRequestedStop;
}

- (void)setCompletedTrack:(id)a3
{
}

- (PTCinematographyTrack)completedTrack
{
  return self->_completedTrack;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setNormalizedImagePoint:(CGPoint)a3
{
  self->_normalizedImagePoint = a3;
}

- (CGPoint)normalizedImagePoint
{
  double x = self->_normalizedImagePoint.x;
  double y = self->_normalizedImagePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- (void)_reportProgressAtTime:(id *)a3 rect:(CGRect)a4 confidence:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v12 = [(PITapToTrackRenderJob *)self progressHandler];
  if (v12)
  {
    objc_initWeak(&location, self);
    v13 = [(NURenderJob *)self request];
    v14 = [v13 responseQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PITapToTrackRenderJob__reportProgressAtTime_rect_confidence___block_invoke;
    block[3] = &unk_1E5D7ED60;
    id v16 = v12;
    long long v18 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    v17[3] = *(id *)&width;
    v17[4] = *(id *)&height;
    float v20 = a5;
    objc_copyWeak(v17, &location);
    dispatch_async(v14, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
}

void __63__PITapToTrackRenderJob__reportProgressAtTime_rect_confidence___block_invoke(uint64_t a1)
{
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v57 = NUAssertLogger_267();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v82 = v58;
      _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v59 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v61 = NUAssertLogger_267();
    BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v62)
      {
        v65 = dispatch_get_specific(*v59);
        v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v65;
        v68 = [v66 callStackSymbols];
        v69 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v82 = v65;
        __int16 v83 = 2114;
        v84 = v69;
        _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v62)
    {
      v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      v64 = [v63 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v82 = v64;
      _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v80.receiver = self;
  v80.super_class = (Class)PITapToTrackRenderJob;
  if (-[NURenderJob prepare:](&v80, sel_prepare_))
  {
    v5 = [(NURenderJob *)self request];
    v6 = [v5 device];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v10 = [MEMORY[0x1E4F7A5E0] currentPlatform];
      id v8 = [v10 mainDevice];
    }
    v11 = [v8 metalDevice];
    v12 = v11;
    if (!v11)
    {
      [MEMORY[0x1E4F7A438] missingError:@"No metal device for request" object:v8];
      BOOL v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      return v9;
    }
    v13 = (void *)[v11 newCommandQueue];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F92260]) initWithCommandQueue:v13];
    v15 = [(NURenderJob *)self outputVideo];
    if (v15)
    {
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F921E0]) initWithAsset:v15];
      if (!v16)
      {
        v27 = (void *)MEMORY[0x1E4F7A438];
        long long v18 = [v15 description];
        v28 = @"Failed to make asset reader for video";
        goto LABEL_22;
      }
      [(PITapToTrackRenderJob *)self startTime];
      if ([v16 startReadingFrames:6 atTime:v79 error:a3])
      {
        uint64_t v17 = [v16 nextFrame];
        if (v17)
        {
          long long v18 = (void *)v17;
          [(PITapToTrackRenderJob *)self normalizedImagePoint];
          v21 = objc_msgSend(v14, "getRectForPoint:colorBuffer:", objc_msgSend(v18, "colorBuffer"), v19, v20);
          v74 = v21;
          if (v21 && (v22 = v21, [v21 rect], !CGRectIsEmpty(v86)))
          {
            [v22 rect];
            double v31 = v30;
            double v33 = v32;
            double v35 = v34;
            double v37 = v36;
            [v18 time];
            if (objc_msgSend(v14, "addDetectionAndStartTrackingRect:time:colorBuffer:disparityBuffer:", v78, objc_msgSend(v18, "colorBuffer"), objc_msgSend(v18, "disparityBuffer"), v31, v33, v35, v37))
            {
              v38 = &v77;
              v73 = v18;
              [v18 time];
              v39 = v74;
              for (i = v13; ; v13 = i)
              {
                [v39 rect];
                double v41 = v40;
                double v43 = v42;
                double v45 = v44;
                double v47 = v46;
                v74 = v39;
                [v39 confidence];
                LODWORD(v49) = v48;
                -[PITapToTrackRenderJob _reportProgressAtTime:rect:confidence:](self, "_reportProgressAtTime:rect:confidence:", v38, v41, v43, v45, v47, v49);
                if ([(PITapToTrackRenderJob *)self clientRequestedStop]) {
                  break;
                }
                v50 = v14;
                v51 = (void *)[v16 nextFrame];

                if (!v51)
                {
                  long long v18 = 0;
                  v14 = v50;
                  v13 = i;
                  goto LABEL_43;
                }
                [v51 time];
                v39 = objc_msgSend(v50, "addDetectionForNextFrameAt:colorBuffer:disparityBuffer:", v76, objc_msgSend(v51, "colorBuffer"), objc_msgSend(v51, "disparityBuffer"));

                if (!v39 || ([v39 rect], CGRectIsEmpty(v87)))
                {
                  log = NULogger();
                  v74 = v39;
                  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                  {
                    [v51 time];
                    v52 = NUStringFromTime();
                    *(_DWORD *)buf = 138412290;
                    v82 = v52;
                    v53 = log;
                    _os_log_impl(&dword_1A9680000, log, OS_LOG_TYPE_INFO, "Tap-to-track: tracking lost at %@", buf, 0xCu);

                    long long v18 = v51;
                    v14 = v50;
                  }
                  else
                  {
                    long long v18 = v51;
                    v14 = v50;
                    v53 = log;
                  }
                  v13 = i;
                  goto LABEL_42;
                }
                v38 = &v75;
                [v51 time];
                v73 = v51;
                v14 = v50;
              }
              v53 = NULogger();
              long long v18 = v73;
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                [v73 time];
                NUStringFromTime();
                v54 = loga = v53;
                *(_DWORD *)buf = 138412290;
                v82 = v54;
                _os_log_impl(&dword_1A9680000, loga, OS_LOG_TYPE_INFO, "Tap-to-track: client requested stop at %@", buf, 0xCu);

                v53 = loga;
              }
LABEL_42:

LABEL_43:
              [v16 stopReadingFrames];
              v55 = [v14 finalizeTrack];
              [(PITapToTrackRenderJob *)self setCompletedTrack:v55];

              v56 = [(PITapToTrackRenderJob *)self completedTrack];

              if (v56)
              {
                BOOL v9 = 1;
                goto LABEL_16;
              }
              v23 = (void *)MEMORY[0x1E4F7A438];
              v24 = [(NURenderJob *)self description];
              v25 = @"Failed to get finalized track from tracking session";
            }
            else
            {
              v23 = (void *)MEMORY[0x1E4F7A438];
              v24 = [(NURenderJob *)self description];
              v25 = @"Failed to add detection and start tracking";
            }
          }
          else
          {
            v23 = (void *)MEMORY[0x1E4F7A438];
            v24 = [(NURenderJob *)self description];
            v25 = @"Failed to find rect to track at initial point";
          }
          *a3 = [v23 missingError:v25 object:v24];

          BOOL v9 = 0;
LABEL_16:

LABEL_23:
          goto LABEL_24;
        }
        v27 = (void *)MEMORY[0x1E4F7A438];
        long long v18 = [v15 description];
        v28 = @"Failed to read first frame for video";
LABEL_22:
        [v27 missingError:v28 object:v18];
        BOOL v9 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      BOOL v9 = 0;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F7A438];
      id v16 = [(NURenderJob *)self description];
      [v26 missingError:@"Failed to find output video asset" object:v16];
      BOOL v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_24:

    goto LABEL_25;
  }
  return 0;
}

- (id)result
{
  v2 = [[_PITapToTrackRenderResult alloc] initWithCompletedTrack:self->_completedTrack];
  return v2;
}

- (id)scalePolicy
{
  return (id)[MEMORY[0x1E4F7A478] oneToOneScalePolicy];
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsRenderStage
{
  return 0;
}

@end