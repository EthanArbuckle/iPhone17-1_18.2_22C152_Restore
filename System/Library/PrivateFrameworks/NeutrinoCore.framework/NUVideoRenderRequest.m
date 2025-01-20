@interface NUVideoRenderRequest
- (NUColorSpace)colorSpace;
- (NUScalePolicy)scalePolicy;
- (NUVideoRenderRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setColorSpace:(id)a3;
- (void)setScalePolicy:(id)a3;
- (void)submit:(id)a3;
@end

@implementation NUVideoRenderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);

  objc_storeStrong((id *)&self->_colorSpace, 0);
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 160, 1);
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)submit:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NURenderRequest *)self renderContext];
  if ([v5 purpose] == 1)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19307);
    }
    v6 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = NSString;
      v8 = v6;
      v9 = [v7 stringWithFormat:@"submitting a video render request on a still image purpose context"];
      *(_DWORD *)v26 = 138543362;
      *(void *)&v26[4] = v9;
      _os_log_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v26, 0xCu);

      uint64_t v10 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v10 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_19307);
        }
LABEL_9:
        v11 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v17 = (void *)MEMORY[0x1E4F29060];
          id v18 = specific;
          v19 = v11;
          v20 = [v17 callStackSymbols];
          v21 = [v20 componentsJoinedByString:@"\n"];
          *(_DWORD *)v26 = 138543618;
          *(void *)&v26[4] = specific;
          __int16 v27 = 2114;
          v28 = v21;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19307);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v22 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E4F29060];
      v19 = v22;
      v24 = [v23 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)v26 = 138543362;
      *(void *)&v26[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUVideoRenderRequest submit:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoRenderRequest.m", 91, @"submitting a video render request on a still image purpose context", v12, v13, v14, v15, *(uint64_t *)v26);
  }

  [(NURenderRequest *)self submitGeneric:v4];
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)newRenderJob
{
  v3 = [NUVideoRenderJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUVideoRenderRequest;
  id v4 = [(NURenderRequest *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 19, self->_colorSpace);
  objc_storeStrong(v4 + 20, self->_scalePolicy);
  return v4;
}

- (NUVideoRenderRequest)initWithComposition:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NUVideoRenderRequest;
  id v3 = a3;
  id v4 = [(NURenderRequest *)&v10 initWithComposition:v3];
  uint64_t v5 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v4->_scalePolicy;
  v4->_scalePolicy = (NUScalePolicy *)v5;

  uint64_t v7 = +[NUVideoUtilities defaultOutputColorSpaceForComposition:v3];

  colorSpace = v4->_colorSpace;
  v4->_colorSpace = (NUColorSpace *)v7;

  return v4;
}

@end