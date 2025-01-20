@interface _PIParallaxClockMaterialJob
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderStage;
- (NSNumber)luminanceValue;
- (id)result;
- (id)scalePolicy;
- (void)setLuminanceValue:(id)a3;
@end

@implementation _PIParallaxClockMaterialJob

- (void).cxx_destruct
{
}

- (void)setLuminanceValue:(id)a3
{
}

- (NSNumber)luminanceValue
{
  return self->_luminanceValue;
}

- (id)result
{
  v3 = [_PIParallaxClockMaterialResult alloc];
  v4 = [(_PIParallaxClockMaterialJob *)self luminanceValue];
  [v4 doubleValue];
  v5 = -[_PIParallaxClockMaterialResult initWithClockAreaLuminance:](v3, "initWithClockAreaLuminance:");

  return v5;
}

- (BOOL)render:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v15 = NUAssertLogger_3232();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_3232();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v23;
        __int16 v30 = 2114;
        v31 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = -[NURenderJob renderer:](self, "renderer:");
  if (v5)
  {
    v6 = [(_PIParallaxClockMaterialJob *)self clockMaterialRequest];
    v7 = objc_alloc_init(PIParallaxLuminanceCalculator);
    v8 = [v6 layerStack];

    if (v8)
    {
      v9 = [v6 layerStack];
      v10 = [v6 style];
      v11 = [(PIParallaxLuminanceCalculator *)v7 calculateClockLuminanceValuesForLayerStack:v9 style:v10 renderer:v5 error:a3];
      [(_PIParallaxClockMaterialJob *)self setLuminanceValue:v11];

      v12 = [(_PIParallaxClockMaterialJob *)self luminanceValue];
      BOOL v13 = v12 != 0;
    }
    else
    {
      [MEMORY[0x1E4F7A438] missingError:@"Request needs either a layerStack or a segmentationItem" object:v6];
      BOOL v13 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)scalePolicy
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x80000];
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
  return 1;
}

@end