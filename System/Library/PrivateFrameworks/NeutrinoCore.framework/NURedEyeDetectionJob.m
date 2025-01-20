@interface NURedEyeDetectionJob
- (BOOL)prepare:(id *)a3;
- (id)requestOptions;
- (void)cleanUp;
@end

@implementation NURedEyeDetectionJob

- (void).cxx_destruct
{
}

- (void)cleanUp
{
  v4.receiver = self;
  v4.super_class = (Class)NURedEyeDetectionJob;
  [(NUImageDataJob *)&v4 cleanUp];
  fullSizeImage = self->_fullSizeImage;
  self->_fullSizeImage = 0;
}

- (id)requestOptions
{
  v7.receiver = self;
  v7.super_class = (Class)NURedEyeDetectionJob;
  v3 = [(NUImageDataJob *)&v7 requestOptions];
  objc_super v4 = (void *)[v3 mutableCopy];

  [v4 setObject:self->_fullSizeImage forKeyedSubscript:@"fullSizeImage"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)NURedEyeDetectionJob;
  if (!-[NURenderJob prepare:](&v33, sel_prepare_)) {
    return 0;
  }
  v5 = [(NURenderJob *)self prepareNode];

  if (!v5)
  {
    v17 = NUAssertLogger_3410();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [NSString stringWithFormat:@"Missing prepare node"];
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_3410();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        __int16 v36 = 2114;
        v37 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURedEyeDetectionJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURedEyeDetectionRequest.m", 63, @"Missing prepare node", v29, v30, v31, v32, (uint64_t)v33.receiver);
  }
  [(NURenderJob *)self setRenderScale:NUScaleOne];
  id v6 = [(NUImageDataJob *)self newRenderPipelineStateForEvaluationMode:1];
  [v6 setScale:NUScaleOne];
  objc_super v7 = [(NURenderJob *)self renderNodeWithPipelineState:v6 error:a3];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 outputImage:a3];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      v11 = [v8 imageProperties:a3];
      v12 = v11;
      if (v11)
      {
        v13 = [v11 metadata];
        v14 = [v9 imageBySettingProperties:v13];
        fullSizeImage = self->_fullSizeImage;
        self->_fullSizeImage = v14;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end