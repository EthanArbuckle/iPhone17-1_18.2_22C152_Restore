@interface NUImageDataJob
- (BOOL)complete:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (id)cacheKey;
- (id)extractDataToDictionary:(id)a3 bounds:(id *)a4 dataExtractor:(id)a5 options:(id)a6 colorSpace:(CGColorSpace *)a7 error:(id *)a8;
- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3;
- (id)requestOptions;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
@end

@implementation NUImageDataJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_renderBuffer, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)cleanUp
{
  v5.receiver = self;
  v5.super_class = (Class)NUImageDataJob;
  [(NURenderJob *)&v5 cleanUp];
  data = self->_data;
  self->_data = 0;

  renderBuffer = self->_renderBuffer;
  self->_renderBuffer = 0;
}

- (id)result
{
  v3 = objc_alloc_init(_NUImageDataResult);
  [(_NUImageDataResult *)v3 setData:self->_data];
  v4 = [(NURenderJob *)self outputGeometry];
  [(_NUImageDataResult *)v3 setGeometry:v4];

  return v3;
}

- (id)extractDataToDictionary:(id)a3 bounds:(id *)a4 dataExtractor:(id)a5 options:(id)a6 colorSpace:(CGColorSpace *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v17 = [(NURenderJob *)self renderer:a8];
  if (v17)
  {
    double var0 = (double)a4->var0.var0;
    double var1 = (double)a4->var0.var1;
    double v20 = (double)a4->var1.var0;
    double v21 = (double)a4->var1.var1;
    [v14 extent];
    v35.origin.x = v22;
    v35.origin.y = v23;
    v35.size.width = v24;
    v35.size.height = v25;
    v34.origin.x = var0;
    v34.origin.y = var1;
    v34.size.width = v20;
    v34.size.height = v21;
    if (!CGRectEqualToRect(v34, v35))
    {
      memset(&v32, 0, sizeof(v32));
      CGAffineTransformMakeTranslation(&v32, -var0, -var1);
      v26 = [v14 imageByClampingToExtent];

      v27 = objc_msgSend(v26, "imageByCroppingToRect:", var0, var1, v20, v21);

      CGAffineTransform v31 = v32;
      id v14 = [v27 imageByApplyingTransform:&v31];
    }
    v28 = [v17 context];
    v29 = [MEMORY[0x1E4F1E040] extractDataToDictionary:v14 dataExtractor:v15 options:v16 context:v28 colorSpace:a7 error:a8];
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v20 = NUAssertLogger_10096();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      double v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGFloat v23 = NUAssertLogger_10096();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        CGAffineTransform v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      CGFloat v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageDataJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageDataRequest.m", 191, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  objc_super v5 = -[CIRenderTask waitUntilCompletedAndReturnError:](self->_renderTask, "waitUntilCompletedAndReturnError:");
  if (v5)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_166);
    }
    v6 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      v17 = v6;
      [v5 kernelExecutionTime];
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v18 * 1000.0;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v5 passCount];
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = (float)((float)[v5 pixelsProcessed] * 0.00000095367);
      _os_log_debug_impl(&dword_1A9892000, v17, OS_LOG_TYPE_DEBUG, "CIRenderInfo: exec=%0.3fms pass=%d pixels=%0.3fMpix", buf, 0x1Cu);
    }
    v7 = [(NURenderJob *)self renderer:a3];
    if (!v7)
    {
      BOOL v13 = 0;
LABEL_20:

      goto LABEL_21;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__10108;
    v47 = __Block_byref_object_dispose__10109;
    id v48 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__10108;
    v44 = __Block_byref_object_dispose__10109;
    id v45 = 0;
    v8 = [(NUImageDataJob *)self imageDataRequest];
    v9 = [(NUStorageImageBuffer *)self->_renderBuffer storage];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __27__NUImageDataJob_complete___block_invoke;
    v36[3] = &unk_1E5D94630;
    v38 = buf;
    v36[4] = self;
    id v10 = v8;
    id v37 = v10;
    v39 = &v40;
    uint64_t v11 = [v9 useAsCIImageWithOptions:0 renderer:v7 block:v36];

    if (v11 == 1)
    {
      v12 = *(void **)(*(void *)&buf[8] + 40);
      if (v12)
      {
        objc_storeStrong((id *)&self->_data, v12);
        BOOL v13 = 1;
LABEL_19:

        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_20;
      }
      if (v41[5]) {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, @"unable to extractDataToDictionary", v10);
      }
      else {
      id v16 = +[NUError unknownError:@"unable to extractDataToDictionary" object:v10];
      }
    }
    else
    {
      id v16 = +[NUError failureError:@"Failed to use render buffer as CIImage" object:self->_renderBuffer];
    }
    BOOL v13 = 0;
    *a3 = v16;
    goto LABEL_19;
  }
  id v14 = [(NURenderJob *)self request];
  id v15 = (void *)[v14 copy];
  *a3 = +[NUError errorWithCode:1 reason:@"failed to render" object:v15 underlyingError:*a3];

  BOOL v13 = 0;
LABEL_21:

  return v13;
}

void __27__NUImageDataJob_complete___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v4 extent];
  v20.origin.x = v5;
  v20.origin.y = v6;
  v20.size.width = v7;
  v20.size.height = v8;
  NU::RectT<long>::RectT(v19, &v20, 3);
  v18[0] = v19[0];
  v18[1] = v19[1];
  v9 = [*(id *)(a1 + 40) dataExtractor];
  id v10 = [*(id *)(a1 + 32) requestOptions];
  uint64_t v11 = [*(id *)(a1 + 40) colorSpace];
  id v17 = 0;
  uint64_t v12 = objc_msgSend(v3, "extractDataToDictionary:bounds:dataExtractor:options:colorSpace:error:", v4, v18, v9, v10, objc_msgSend(v11, "CGColorSpace"), &v17);

  id v13 = v17;
  id v14 = v17;
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
  }
}

- (BOOL)render:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  CGFloat v5 = [(NUImageDataJob *)self imageDataRequest];
  CGFloat v6 = [v5 regionPolicy];
  CGFloat v7 = [(NURenderJob *)self outputGeometry];
  CGFloat v8 = [v6 regionForGeometry:v7];

  if (v8) {
    [v8 bounds];
  }
  v9 = +[NUFactory sharedFactory];
  id v10 = [v9 surfaceStoragePool];

  uint64_t v11 = +[NUPixelFormat RGBAh];
  uint64_t v12 = (void *)[v10 newStorageWithSize:(unsigned __int128)0 format:v11];

  if (!v12)
  {
    BOOL v24 = NUAssertLogger_10096();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      CGFloat v25 = [NSString stringWithFormat:@"No storage allocated"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_10096();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        CGAffineTransform v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v31;
        __int16 v43 = 2114;
        v44 = v35;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageDataJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageDataRequest.m", 180, @"No storage allocated", v36, v37, v38, v39, v40);
  }
  id v13 = [[NUStorageImageBuffer alloc] initWithStorage:v12 fromPool:v10];
  renderBuffer = self->_renderBuffer;
  self->_renderBuffer = v13;

  uint64_t v15 = [(NURenderJob *)self outputImage];
  id v16 = [(NUStorageImageBuffer *)self->_renderBuffer storage];
  id v17 = +[NUColorSpace workingColorSpace];
  uint64_t v18 = [(NURenderJob *)self imageSize];
  -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v15, v16, v17, v8, v18, v19, a3);
  CGRect v20 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  renderTask = self->_renderTask;
  self->_renderTask = v20;

  BOOL v22 = self->_renderTask != 0;
  return v22;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUImageDataJob;
  id v4 = [(NURenderJob *)&v7 newRenderPipelineStateForEvaluationMode:a3];
  CGFloat v5 = [(NURenderJob *)self request];
  objc_msgSend(v4, "setEnableTransparency:", objc_msgSend(v5, "wantsAlpha"));

  return v4;
}

- (id)requestOptions
{
  v2 = [(NUImageDataJob *)self imageDataRequest];
  v3 = [v2 options];

  return v3;
}

- (id)cacheKey
{
  v3 = objc_alloc_init(NUDigest);
  id v4 = [(NURenderJob *)self renderNode];
  objc_msgSend(v4, "nu_updateDigest:", v3);

  CGFloat v5 = [(NUImageDataJob *)self imageDataRequest];
  CGFloat v6 = [v5 dataExtractor];
  objc_msgSend(v6, "nu_updateDigest:", v3);

  objc_super v7 = [v5 options];
  objc_msgSend(v7, "nu_updateDigest:", v3);

  CGFloat v8 = [v5 colorSpace];
  objc_msgSend(v8, "nu_updateDigest:", v3);

  v9 = [v5 regionPolicy];
  id v10 = [(NURenderJob *)self outputGeometry];
  uint64_t v11 = [v9 regionForGeometry:v10];

  long long v14 = 0u;
  long long v15 = 0u;
  if (v11) {
    objc_msgSend(v11, "bounds", v14, v15);
  }
  [(NUDigest *)v3 addBytes:&v14 length:32];
  [(NUDigest *)v3 finalize];
  uint64_t v12 = [(NUDigest *)v3 stringValue];

  return v12;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (id)scalePolicy
{
  v2 = [(NUImageDataJob *)self imageDataRequest];
  v3 = [v2 scalePolicy];

  return v3;
}

@end