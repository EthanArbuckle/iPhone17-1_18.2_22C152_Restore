@interface NUHistogramRenderJob
- (BOOL)complete:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (NUHistogramRenderJob)initWithHistogramRequest:(id)a3;
- (NUHistogramRenderJob)initWithRequest:(id)a3;
- (id)cacheKey;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
@end

@implementation NUHistogramRenderJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_histogram, 0);
  objc_storeStrong((id *)&self->_renderDestination, 0);

  objc_storeStrong((id *)&self->_storagePool, 0);
}

- (id)scalePolicy
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)cleanUp
{
  if (self->_renderDestination)
  {
    -[NUPurgeableStoragePool returnStorage:](self->_storagePool, "returnStorage:");
    renderDestination = self->_renderDestination;
    self->_renderDestination = 0;

    storagePool = self->_storagePool;
    self->_storagePool = 0;
  }
  histogram = self->_histogram;
  self->_histogram = 0;
}

- (id)result
{
  v2 = [[_NUHistogramRenderResult alloc] initWithHistogram:self->_histogram];

  return v2;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v19 = NUAssertLogger_19855();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_19855();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 107, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != NULL");
  }
  v5 = -[CIRenderTask waitUntilCompletedAndReturnError:](self->_renderTask, "waitUntilCompletedAndReturnError:");

  if (v5)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    *(void *)&buf[16] = [(NURenderJob *)self imageSize];
    *(void *)&buf[24] = v6;
    v7 = +[NURegion regionWithRect:buf];
    v8 = [(NUHistogramRenderJob *)self histogramRequest];
    long long v47 = 0u;
    long long v48 = 0u;
    memset(buf, 0, sizeof(buf));
    v9 = [v8 parameters];
    v10 = v9;
    if (v9)
    {
      [v9 colorMatrix];
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
      memset(buf, 0, sizeof(buf));
    }

    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__19868;
    v44 = __Block_byref_object_dispose__19869;
    id v45 = 0;
    renderDestination = self->_renderDestination;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __33__NUHistogramRenderJob_complete___block_invoke;
    v35[3] = &unk_1E5D953B8;
    long long v36 = *(_OWORD *)buf;
    long long v37 = *(_OWORD *)&buf[16];
    long long v38 = v47;
    long long v39 = v48;
    v35[4] = self;
    v35[5] = &v40;
    [(NUPurgeableStorage *)renderDestination readBufferInRegion:v7 block:v35];
    histogram = self->_histogram;
    BOOL v13 = histogram != 0;
    if (!histogram)
    {
      v16 = [(NURenderJob *)self request];
      v17 = (void *)[v16 copy];
      *a3 = +[NUError errorWithCode:1 reason:@"Failed to compute histogram" object:v17 underlyingError:v41[5]];
    }
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    v11 = [(NURenderJob *)self request];
    v12 = (void *)[v11 copy];
    *a3 = +[NUError errorWithCode:1 reason:@"failed to render for histogram" object:v12 underlyingError:*a3];

    return 0;
  }
  return v13;
}

void __33__NUHistogramRenderJob_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(NUHistogramCalculator);
  long long v5 = *(_OWORD *)(a1 + 64);
  v12[0] = *(_OWORD *)(a1 + 48);
  v12[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 96);
  v12[2] = *(_OWORD *)(a1 + 80);
  v12[3] = v6;
  [(NUHistogramCalculator *)v4 setColorMatrix:v12];
  v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id obj = 0;
  uint64_t v8 = [(NUHistogramCalculator *)v4 computeHistogramFromBuffer:v3 error:&obj];

  objc_storeStrong(v7, obj);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 248);
  *(void *)(v9 + 248) = v8;
}

- (BOOL)render:(id *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v26 = NUAssertLogger_19855();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v29 = NUAssertLogger_19855();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        long long v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v50 = [v48 callStackSymbols];
        v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v51;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 77, @"Invalid parameter not satisfying: %s", v52, v53, v54, v55, (uint64_t)"error != NULL");
  }
  long long v5 = [(NUHistogramRenderJob *)self histogramRequest];
  long long v6 = [v5 histogramCalculationColorSpace];
  if ([v6 isHDR]) {
    +[NUPixelFormat RGBAh];
  }
  else {
  v7 = +[NUPixelFormat BGRA8];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  *(void *)&buf[16] = [(NURenderJob *)self imageSize];
  uint64_t v76 = v8;
  uint64_t v9 = +[NURegion regionWithRect:buf];
  v10 = +[NUFactory sharedFactory];
  v11 = [v10 surfaceStoragePool];
  storagePool = self->_storagePool;
  self->_storagePool = v11;

  BOOL v13 = self->_storagePool;
  if (!v13)
  {
    uint64_t v33 = NUAssertLogger_19855();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [NSString stringWithFormat:@"No storage pool"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v36 = NUAssertLogger_19855();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        v59 = [v57 callStackSymbols];
        v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v56;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v60;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      long long v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 87, @"No storage pool", v61, v62, v63, v64, v74);
  }
  uint64_t v14 = [(NURenderJob *)self imageSize];
  v16 = -[NUPurgeableStoragePool newStorageWithSize:format:](v13, "newStorageWithSize:format:", v14, v15, v7);
  renderDestination = self->_renderDestination;
  self->_renderDestination = v16;

  if (!self->_renderDestination)
  {
    uint64_t v40 = NUAssertLogger_19855();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = [NSString stringWithFormat:@"No storage allocated"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v43 = NUAssertLogger_19855();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v65;
        v68 = [v66 callStackSymbols];
        v69 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v65;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v69;
        _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      id v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v46;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 93, @"No storage allocated", v70, v71, v72, v73, v74);
  }
  v18 = [(NURenderJob *)self outputImage];
  v19 = self->_renderDestination;
  uint64_t v20 = [(NURenderJob *)self imageSize];
  -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v18, v19, v6, v9, v20, v21, a3);
  v22 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  renderTask = self->_renderTask;
  self->_renderTask = v22;

  BOOL v24 = self->_renderTask != 0;
  return v24;
}

- (id)cacheKey
{
  id v3 = objc_alloc_init(NUDigest);
  v4 = [(NURenderJob *)self renderNode];
  objc_msgSend(v4, "nu_updateDigest:", v3);

  long long v5 = [(NUHistogramRenderJob *)self histogramRequest];
  long long v6 = [v5 histogramCalculationColorSpace];
  objc_msgSend(v6, "nu_updateDigest:", v3);

  v7 = objc_msgSend(v5, "parameters", 0, 0, 0, 0, 0, 0, 0, 0);
  uint64_t v8 = v7;
  if (v7) {
    [v7 colorMatrix];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }

  [(NUDigest *)v3 addBytes:v11 length:64];
  [(NUDigest *)v3 finalize];
  uint64_t v9 = [(NUDigest *)v3 stringValue];

  return v9;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (NUHistogramRenderJob)initWithRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19881);
  }
  long long v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    long long v6 = NSString;
    v7 = v5;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19881);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19881);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F29060];
    uint64_t v15 = v13;
    v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  uint64_t v15 = v18;
  v22 = [v20 callStackSymbols];
  BOOL v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
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
  _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 41, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUHistogramRenderJob)initWithHistogramRequest:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUHistogramRenderJob;
  id v3 = a3;
  id v4 = [(NURenderJob *)&v8 initWithRequest:v3];
  uint64_t v5 = objc_msgSend(v3, "scalePolicy", v8.receiver, v8.super_class);

  scalePolicy = v4->_scalePolicy;
  v4->_scalePolicy = (NUScalePolicy *)v5;

  return v4;
}

@end