@interface NUColorSampler
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)shouldCoalesceUpdates;
- (NSString)name;
- (NUColorSampler)initWithComposition:(id)a3;
- (NUColorSampler)initWithComposition:(id)a3 responseQueue:(id)a4;
- (NUColorSpace)colorSpace;
- (NUComposition)composition;
- (NUImageDataRequest)request;
- (OS_dispatch_queue)responseQueue;
- (id)_pipelineFilters;
- (int64_t)sampleRadius;
- (void)cancel;
- (void)configureRequest:(id)a3 forSamplingAtPoint:(id)a4;
- (void)sampleColorAt:(id)a3 completion:(id)a4;
- (void)setColorSpace:(id)a3;
- (void)setComposition:(id)a3;
- (void)setName:(id)a3;
- (void)setResponseQueue:(id)a3;
- (void)setSampleRadius:(int64_t)a3;
- (void)setShouldCoalesceUpdates:(BOOL)a3;
- (void)setTime:(id *)a3;
@end

@implementation NUColorSampler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);

  objc_storeStrong((id *)&self->_composition, 0);
}

- (NUImageDataRequest)request
{
  return self->_request;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)shouldCoalesceUpdates
{
  return self->_shouldCoalesceUpdates;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setSampleRadius:(int64_t)a3
{
  self->_sampleRadius = a3;
}

- (int64_t)sampleRadius
{
  return self->_sampleRadius;
}

- (void)setResponseQueue:(id)a3
{
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setComposition:(id)a3
{
}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)cancel
{
  id v2 = [(NURenderRequest *)self->_request renderContext];
  [v2 cancelAllRequests];
}

- (id)_pipelineFilters
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)configureRequest:(id)a3 forSamplingAtPoint:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v7 = a3;
  v8 = +[NUFixedScalePolicy oneToOneScalePolicy];
  [v7 setScalePolicy:v8];

  [v7 setSampleMode:2];
  [v7 setColorSpace:self->_colorSpace];
  [v7 setResponseQueue:self->_responseQueue];
  int64_t sampleRadius = self->_sampleRadius;
  v12[0] = var0 - sampleRadius;
  v12[1] = var1 - sampleRadius;
  uint64_t v13 = (2 * sampleRadius) | 1;
  uint64_t v14 = v13;
  v10 = [[NUFixedRegionPolicy alloc] initWithRect:v12];
  [v7 setRegionPolicy:v10];

  v11 = [(NUColorSampler *)self _pipelineFilters];
  [v7 setPipelineFilters:v11];
}

- (void)setShouldCoalesceUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NUColorSampler *)self request];
  [v4 setShouldCoalesceUpdates:v3];
}

- (void)sampleColorAt:(id)a3 completion:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v11 = NUAssertLogger_25255();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completionBlock != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_25255();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        __int16 v33 = 2114;
        v34 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler sampleColorAt:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 72, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"completionBlock != nil");
  }
  v8 = v7;
  -[NUColorSampler configureRequest:forSamplingAtPoint:](self, "configureRequest:forSamplingAtPoint:", self->_request, var0, var1);
  request = self->_request;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __43__NUColorSampler_sampleColorAt_completion___block_invoke;
  v27[3] = &unk_1E5D95850;
  int64_t v29 = var0;
  int64_t v30 = var1;
  id v28 = v8;
  id v10 = v8;
  [(NUImageDataRequest *)request submit:v27];
}

void __43__NUColorSampler_sampleColorAt_completion___block_invoke(void *a1, void *a2)
{
  id v9 = 0;
  BOOL v3 = [a2 result:&v9];
  id v4 = (NUResponse *)v9;
  v5 = [v3 data];

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"color"];

    id v7 = objc_alloc_init(_NUColorSamplerResult);
    [(_NUColorSamplerResult *)v7 setColor:v6];
    -[_NUColorSamplerResult setPoint:](v7, "setPoint:", a1[5], a1[6]);
    v8 = [[NUResponse alloc] initWithResult:v7];
    (*(void (**)(void))(a1[4] + 16))();

    id v4 = v8;
  }
  else
  {
    id v7 = [[NUResponse alloc] initWithError:v4];
    (*(void (**)(void))(a1[4] + 16))();
  }
}

- (void)setTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(NURenderRequest *)self->_request setTime:&v3];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_request;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result time];
  }
  retstr->int64_t var0 = 0;
  *(void *)&retstr->int64_t var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  if (!v4)
  {
    id v7 = NUAssertLogger_25255();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v10 = NUAssertLogger_25255();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        uint64_t v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v14;
        __int16 v26 = 2114;
        v27 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler setName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 54, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"name != nil");
  }
  name = self->_name;
  self->_name = v4;
  v6 = v4;

  id v23 = [NSString stringWithFormat:@"%@-Image-Data-Request", self->_name];
  -[NURenderRequest setName:](self->_request, "setName:");
}

- (NUColorSampler)initWithComposition:(id)a3 responseQueue:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (OS_dispatch_queue *)a4;
  if (!v6)
  {
    uint64_t v19 = NUAssertLogger_25255();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_25255();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        __int16 v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v33;
        __int16 v54 = 2114;
        v55 = v37;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler initWithComposition:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 37, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"composition != nil");
  }
  v8 = v7;
  if (!v7)
  {
    __int16 v26 = NUAssertLogger_25255();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "responseQueue != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v29 = NUAssertLogger_25255();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v42;
        __int16 v54 = 2114;
        v55 = v46;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler initWithComposition:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 38, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"responseQueue != nil");
  }
  v51.receiver = self;
  v51.super_class = (Class)NUColorSampler;
  id v9 = [(NUColorSampler *)&v51 init];
  uint64_t v10 = [v6 copy];
  composition = v9->_composition;
  v9->_composition = (NUComposition *)v10;

  v9->_int64_t sampleRadius = 2;
  uint64_t v12 = +[NUColorSpace sRGBColorSpace];
  colorSpace = v9->_colorSpace;
  v9->_colorSpace = (NUColorSpace *)v12;

  responseQueue = v9->_responseQueue;
  v9->_responseQueue = v8;
  BOOL v15 = v8;

  id v16 = [[NUImageDataRequest alloc] initWithComposition:v6 dataExtractor:@"CIAreaAverage" options:0];
  request = v9->_request;
  v9->_request = v16;

  [(NURenderRequest *)v9->_request setShouldCoalesceUpdates:1];
  [(NUColorSampler *)v9 setName:@"NUColorSampler"];

  return v9;
}

- (NUColorSampler)initWithComposition:(id)a3
{
  return [(NUColorSampler *)self initWithComposition:a3 responseQueue:MEMORY[0x1E4F14428]];
}

@end