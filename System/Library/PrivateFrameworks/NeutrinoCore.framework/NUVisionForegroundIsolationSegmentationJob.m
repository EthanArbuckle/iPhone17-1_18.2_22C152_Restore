@interface NUVisionForegroundIsolationSegmentationJob
- ($0AC6E346AE4835514AAA8AC86D8F4844)idealModelSize;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (NUImageBuffer)maskBuffer;
- (id)result;
- (id)scalePolicy;
@end

@implementation NUVisionForegroundIsolationSegmentationJob

- (void).cxx_destruct
{
}

- (NUImageBuffer)maskBuffer
{
  return self->_maskBuffer;
}

- (id)result
{
  v3 = [_NUVisionForegroundIsolationSegmentationResult alloc];
  v4 = [(NUVisionForegroundIsolationSegmentationJob *)self maskBuffer];
  v5 = [(_NUVisionForegroundIsolationSegmentationResult *)v3 initWithMaskBuffer:v4];

  return v5;
}

- (BOOL)render:(id *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v32 = NUAssertLogger_23898();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v52 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_23898();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v39;
        __int16 v53 = 2114;
        v54 = v43;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionForegroundIsolationSegmentationJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionForegroundIsolationSegmentationRequest.m", 75, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"error != nil");
  }
  v5 = [(NURenderJob *)self outputImage];
  v6 = [(NURenderJob *)self outputGeometry];
  uint64_t v7 = [v6 orientation];
  v8 = [v5 imageByApplyingOrientation:v7];

  id v9 = [(NUVisionBasedRenderJob *)self newRequestHandlerForImage:v8 error:a3];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F45828]);
    id v50 = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    int v12 = [v9 performRequests:v11 error:a3];

    if (!v12)
    {
      BOOL v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v13 = [v10 results];
    if ((unint64_t)[v13 count] >= 2)
    {
      v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      id v14 = +[NUError invalidError:@"Unexpected number of observations" object:v49];
LABEL_12:
      BOOL v15 = 0;
      *a3 = v14;
LABEL_22:

      goto LABEL_23;
    }
    v49 = [v13 firstObject];
    v16 = [v49 allInstances];
    v17 = (__CVBuffer *)[v49 generateMaskForInstances:v16 error:a3];

    if (!v17)
    {
      id v14 = +[NUError errorWithCode:1 reason:@"Failed to generate a mask for foreground instances" object:v13 underlyingError:*a3];
      goto LABEL_12;
    }
    if (v7 == 1)
    {
      v18 = [[NUCVPixelBuffer alloc] initWithCVPixelBuffer:v17];
      maskBuffer = self->_maskBuffer;
      self->_maskBuffer = (NUImageBuffer *)v18;

      CVPixelBufferRelease(v17);
LABEL_19:
      BOOL v15 = 1;
      goto LABEL_22;
    }
    v20 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v17];
    CVPixelBufferRelease(v17);
    if (v7 == 6)
    {
      uint64_t v7 = 8;
    }
    else if (v7 == 8)
    {
      uint64_t v7 = 6;
    }
    v48 = [v20 imageByApplyingOrientation:v7];

    [v48 extent];
    v23 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", vcvtpd_s64_f64(v21), vcvtpd_s64_f64(v22), 1278226534);
    v24 = self->_maskBuffer;
    self->_maskBuffer = v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", -[NUImageBuffer CVPixelBuffer](self->_maskBuffer, "CVPixelBuffer"));
    id v26 = objc_alloc_init(MEMORY[0x1E4F1E018]);
    v27 = [v26 startTaskToRender:v48 toDestination:v25 error:a3];
    v28 = v27;
    if (v27)
    {
      v29 = [v27 waitUntilCompletedAndReturnError:a3];
      BOOL v30 = v29 == 0;

      if (!v30) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    BOOL v15 = 0;
    goto LABEL_22;
  }
  BOOL v15 = 0;
LABEL_24:

  return v15;
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
  uint64_t v2 = [(NUVisionForegroundIsolationSegmentationJob *)self idealModelSize];
  v4 = [[NUPixelCountScalePolicy alloc] initWithTargetPixelCount:v2 * v3];

  return v4;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)idealModelSize
{
  int64_t v2 = 512;
  int64_t v3 = 512;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end