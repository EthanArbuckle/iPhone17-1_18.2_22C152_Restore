@interface PIDisparitySampleJob
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputVideo;
- (BOOL)wantsRenderStage;
- (CGRect)sampleRect;
- (float)sampledDisparityValue;
- (id)result;
- (id)scalePolicy;
- (void)setSampleRect:(CGRect)a3;
- (void)setSampleTime:(id *)a3;
- (void)setSampledDisparityValue:(float)a3;
@end

@implementation PIDisparitySampleJob

- (void)setSampledDisparityValue:(float)a3
{
  self->_sampledDisparityValue = a3;
}

- (float)sampledDisparityValue
{
  return self->_sampledDisparityValue;
}

- (void)setSampleRect:(CGRect)a3
{
  self->_sampleRect = a3;
}

- (CGRect)sampleRect
{
  double x = self->_sampleRect.origin.x;
  double y = self->_sampleRect.origin.y;
  double width = self->_sampleRect.size.width;
  double height = self->_sampleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSampleTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)(&self->_sampledDisparityValue + 1) = *(_OWORD *)&a3->var0;
  *(void *)&self->_sampleTime.flags = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[9].var3 + 4);
  retstr->int64_t var3 = *(void *)&self[10].var2;
  return self;
}

- (BOOL)render:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v19 = NUAssertLogger_566();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v23 = NUAssertLogger_566();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        __int16 v35 = 2114;
        v36 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderJob *)self outputVideo];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F921E0]) initWithAsset:v5];
    if (v6)
    {
      [(PIDisparitySampleJob *)self sampleTime];
      if ([v6 startReadingFrames:2 atTime:v32 error:a3])
      {
        v7 = (void *)[v6 nextFrame];
        if (v7)
        {
          [v6 stopReadingFrames];
          v8 = (__CVBuffer *)[v7 disparityBuffer];
          if (v8 && CVPixelBufferGetPixelFormatType(v8) == 1751411059)
          {
            [(PIDisparitySampleJob *)self sampleRect];
            PTDisparityInNormalizedRectFromPixelBuffer();
            -[PIDisparitySampleJob setSampledDisparityValue:](self, "setSampledDisparityValue:");
            BOOL v9 = 1;
LABEL_15:

            goto LABEL_16;
          }
          v14 = (void *)MEMORY[0x1E4F7A438];
          v15 = [v5 description];
          v16 = [v14 invalidError:@"Incompatible disparity buffer" object:v15];
        }
        else
        {
          v17 = (void *)MEMORY[0x1E4F7A438];
          v15 = [v5 description];
          v16 = [v17 failureError:@"Failed to read video frame" object:v15];
        }
        *a3 = v16;

        BOOL v9 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F7A438];
      v13 = [v5 description];
      *a3 = [v12 failureError:@"Failed to make asset reader for video" object:v13];
    }
    BOOL v9 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v10 = (void *)MEMORY[0x1E4F7A438];
  v11 = [(NURenderJob *)self description];
  *a3 = [v10 failureError:@"Failed to find output video asset" object:v11];

  BOOL v9 = 0;
LABEL_17:

  return v9;
}

- (id)result
{
  v3 = [_PIDisparitySampleResult alloc];
  [(PIDisparitySampleJob *)self sampledDisparityValue];
  v4 = -[_PIDisparitySampleResult initWithDisparityValue:](v3, "initWithDisparityValue:");
  return v4;
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
  return 1;
}

@end