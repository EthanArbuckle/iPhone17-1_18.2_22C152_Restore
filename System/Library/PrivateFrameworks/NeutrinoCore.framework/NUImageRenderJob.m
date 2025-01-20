@interface NUImageRenderJob
- (BOOL)complete:(id *)a3;
- (BOOL)copyStorage:(id)a3 fromRect:(id *)a4 toImage:(id)a5 atPoint:(id)a6;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (CIRenderTask)renderTask;
- (NUColorSpace)colorSpace;
- (NUImageRenderJob)initWithImageRequest:(id)a3;
- (NUImageRenderJob)initWithRequest:(id)a3;
- (NUMutablePurgeableImage)targetImage;
- (NUPixelFormat)pixelFormat;
- (NUPurgeableImage)renderedImage;
- (NUPurgeableStoragePool)storagePool;
- (NURegion)regionToRender;
- (NURegion)renderedRegion;
- (NUStorageImageBuffer)renderBuffer;
- (float)contentHeadroom;
- (id)_HDRPixelFormatForColorSpace:(id)a3;
- (id)extentPolicy;
- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7;
- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3;
- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4;
- (id)renderBufferOfSize:(id)a3 format:(id)a4;
- (id)scalePolicy;
- (void)cleanUp;
- (void)setColorSpace:(id)a3;
- (void)setContentHeadroom:(float)a3;
- (void)setPixelFormat:(id)a3;
- (void)setRenderTask:(id)a3;
@end

@implementation NUImageRenderJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_renderBuffer, 0);
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_renderedRegion, 0);
  objc_storeStrong((id *)&self->_targetImage, 0);
  objc_storeStrong((id *)&self->_regionToRender, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);

  objc_storeStrong((id *)&self->_accessRegionGuard, 0);
}

- (void)setRenderTask:(id)a3
{
}

- (CIRenderTask)renderTask
{
  return self->_renderTask;
}

- (NUStorageImageBuffer)renderBuffer
{
  return self->_renderBuffer;
}

- (NUPurgeableImage)renderedImage
{
  return self->_renderedImage;
}

- (NURegion)renderedRegion
{
  return self->_renderedRegion;
}

- (NUMutablePurgeableImage)targetImage
{
  return self->_targetImage;
}

- (NURegion)regionToRender
{
  return self->_regionToRender;
}

- (void)setContentHeadroom:(float)a3
{
  self->_contentHeadroom = a3;
}

- (float)contentHeadroom
{
  return self->_contentHeadroom;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setPixelFormat:(id)a3
{
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)cleanUp
{
  accessRegionGuard = self->_accessRegionGuard;
  self->_accessRegionGuard = 0;

  renderedImage = self->_renderedImage;
  self->_renderedImage = 0;

  renderBuffer = self->_renderBuffer;
  self->_renderBuffer = 0;
}

- (BOOL)copyStorage:(id)a3 fromRect:(id *)a4 toImage:(id)a5 atPoint:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v11 = a3;
  id v12 = a5;
  if ([(NURenderJob *)self rendererType] == 1 || [(NURenderJob *)self rendererType] == 2)
  {
    v13 = [(NURenderJob *)self device];
    $0AC6E346AE4835514AAA8AC86D8F4844 v14 = a4->var1;
    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = a4->var0;
    $0AC6E346AE4835514AAA8AC86D8F4844 v19 = v14;
    char v15 = objc_msgSend(v12, "copySurfaceStorage:fromRect:toPoint:device:", v11, &v18, var0, var1, v13);
  }
  else
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v16 = a4->var1;
    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = a4->var0;
    $0AC6E346AE4835514AAA8AC86D8F4844 v19 = v16;
    char v15 = objc_msgSend(v12, "copyBufferStorage:fromRect:toPoint:", v11, &v18, var0, var1);
  }

  return v15;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v22 = NUAssertLogger_10780();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_10780();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 354, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"error != NULL");
  }
  v5 = [(NUImageRenderJob *)self renderTask];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 waitUntilCompletedAndReturnError:a3];
    if (!v7)
    {
      v17 = [(NURenderJob *)self request];
      $0AC6E346AE4835514AAA8AC86D8F4844 v18 = (void *)[v17 copy];
      *a3 = +[NUError errorWithCode:1 reason:@"failed to render" object:v18 underlyingError:*a3];

      BOOL v11 = 0;
      goto LABEL_20;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_238);
    }
    v8 = (void *)_NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
    {
      v20 = v8;
      [v7 kernelExecutionTime];
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v21 * 1000.0;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v7 passCount];
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = (float)((float)[v7 pixelsProcessed] * 0.00000095367);
      _os_log_debug_impl(&dword_1A9892000, v20, OS_LOG_TYPE_DEBUG, "CIRenderInfo: exec=%0.3fms pass=%d pixels=%0.3fMpix", buf, 0x1Cu);
    }
  }
  v9 = [(NUImageRenderJob *)self renderedRegion];
  v10 = [(NUImageRenderJob *)self targetImage];
  if (v9)
  {
    [v9 bounds];
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  BOOL v11 = 1;
  buf[24] = 1;
  if (v10)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __29__NUImageRenderJob_complete___block_invoke;
    v53[3] = &unk_1E5D94748;
    long long v56 = v57;
    v55 = buf;
    v53[4] = self;
    id v12 = v10;
    id v54 = v12;
    [v9 enumerateRects:v53];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v13 = [v12 purgeableImageCopy];
      renderedImage = self->_renderedImage;
      self->_renderedImage = v13;

      char v15 = self->_renderedImage;
      if (!v15)
      {
        v38 = NUAssertLogger_10780();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = [NSString stringWithFormat:@"Couldn't make purgeable image copy"];
          *(_DWORD *)v59 = 138543362;
          v60 = v39;
          _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v59, 0xCu);
        }
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = NUAssertLogger_10780();
        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v40)
        {
          if (v42)
          {
            v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v46 = [MEMORY[0x1E4F29060] callStackSymbols];
            v47 = [v46 componentsJoinedByString:@"\n"];
            *(_DWORD *)v59 = 138543618;
            v60 = v45;
            __int16 v61 = 2114;
            v62 = v47;
            _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v59, 0x16u);
          }
        }
        else if (v42)
        {
          v43 = [MEMORY[0x1E4F29060] callStackSymbols];
          v44 = [v43 componentsJoinedByString:@"\n"];
          *(_DWORD *)v59 = 138543362;
          v60 = v44;
          _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v59, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 383, @"Couldn't make purgeable image copy", v48, v49, v50, v51, v52);
      }
      $0AC6E346AE4835514AAA8AC86D8F4844 v16 = [(NUImageRenderJob *)self regionToRender];
      [(NUPurgeableImage *)v15 beginAccessRegion:v16];
    }
    else
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v16 = [(NUImageRenderJob *)self renderBuffer];
      *a3 = +[NUError failureError:@"Failed to copy image" object:v16];
    }

    BOOL v11 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  }
  _Block_object_dispose(buf, 8);

LABEL_20:
  return v11;
}

void __29__NUImageRenderJob_complete___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v5 = *(void *)(a2 + 8) - a1[8];
    uint64_t v6 = *(void *)a2 - a1[7];
    long long v11 = *(_OWORD *)(a2 + 16);
    v7 = (void *)a1[4];
    v8 = [v7 renderBuffer];
    v9 = [v8 storage];
    uint64_t v10 = a1[5];
    v12[0] = v6;
    v12[1] = v5;
    long long v13 = v11;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(v7, "copyStorage:fromRect:toImage:atPoint:", v9, v12, v10, *(void *)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 0;
  }
}

- (BOOL)render:(id *)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v55 = NUAssertLogger_10780();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      long long v56 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v56;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v58 = NUAssertLogger_10780();
    BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v59)
      {
        v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v63 = (void *)MEMORY[0x1E4F29060];
        id v64 = v62;
        v65 = [v63 callStackSymbols];
        v66 = [v65 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v66;
        _os_log_error_impl(&dword_1A9892000, v58, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v59)
    {
      v60 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v61 = [v60 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v61;
      _os_log_error_impl(&dword_1A9892000, v58, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 290, @"Invalid parameter not satisfying: %s", v67, v68, v69, v70, (uint64_t)"error != NULL");
  }
  uint64_t v5 = [(NUImageRenderJob *)self pixelFormat];
  v73 = [(NUImageRenderJob *)self colorSpace];
  uint64_t v6 = [(NUImageRenderJob *)self regionToRender];
  v7 = [(NUImageRenderJob *)self targetImage];
  if (v7)
  {
    v8 = [[NUPurgeableImageAccessGuard alloc] initWithRegion:v6 image:v7];
    accessRegionGuard = self->_accessRegionGuard;
    self->_accessRegionGuard = v8;

    uint64_t v10 = [v7 validRegion];
    uint64_t v11 = [v6 regionByRemovingRegion:v10];

    uint64_t v6 = (void *)v11;
  }
  if ([v6 isEmpty])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_238);
    }
    id v12 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = self;
      _os_log_debug_impl(&dword_1A9892000, v12, OS_LOG_TYPE_DEBUG, "job %p region to render is empty", buf, 0xCu);
    }
  }
  else
  {
    memset(buf, 0, 32);
    if (v6)
    {
      [v6 bounds];
      uint64_t v14 = *(void *)&buf[24];
      uint64_t v13 = *(void *)&buf[16];
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v13 = 0;
    }
    v71 = a3;
    -[NUImageRenderJob renderBufferOfSize:format:](self, "renderBufferOfSize:format:", v13, v14, v5);
    char v15 = (NUStorageImageBuffer *)objc_claimAutoreleasedReturnValue();
    renderBuffer = self->_renderBuffer;
    self->_renderBuffer = v15;

    v17 = +[NUGlobalSettings debugRenderBlue];
    if (v17)
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v18 = [(NURenderJob *)self request];
      $0AC6E346AE4835514AAA8AC86D8F4844 v19 = [v18 name];
      v20 = +[NUGlobalSettings debugRenderBlue];
      int v21 = [v19 containsString:v20];

      if (v21)
      {
        v17 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
      }
      else
      {
        v17 = 0;
      }
    }
    v72 = v5;
    uint64_t v22 = +[NUGlobalSettings debugRenderPurple];
    if (v22)
    {
      v23 = (void *)v22;
      v24 = [(NURenderJob *)self request];
      v25 = [v24 name];
      BOOL v26 = +[NUGlobalSettings debugRenderPurple];
      int v27 = [v25 containsString:v26];

      if (v27)
      {
        uint64_t v28 = [MEMORY[0x1E4F1E008] colorWithRed:0.8 green:0.0 blue:0.8 alpha:0.5];

        v17 = (void *)v28;
      }
    }
    uint64_t v29 = +[NUGlobalSettings debugRenderYellow];
    if (v29)
    {
      v30 = (void *)v29;
      id v31 = [(NURenderJob *)self request];
      v32 = [v31 name];
      v33 = +[NUGlobalSettings debugRenderYellow];
      int v34 = [v32 containsString:v33];

      if (v34)
      {
        uint64_t v35 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:0.0 alpha:0.5];

        v17 = (void *)v35;
      }
    }
    if (v17)
    {
      uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithColor:v17];
      uint64_t v37 = [(NURenderJob *)self outputImage];
      v38 = [v36 imageByCompositingOverImage:v37];

      v39 = [MEMORY[0x1E4F1E040] textImageGeneratorFilter];
      v40 = objc_msgSend(NSString, "stringWithFormat:", @"%lli", -[NURenderJob jobNumber](self, "jobNumber"));
      [v39 setText:v40];

      LODWORD(v41) = 6.0;
      [v39 setScaleFactor:v41];
      BOOL v42 = [v39 outputImage];
      v43 = [v42 imageByClampingToExtent];

      v44 = objc_msgSend(v43, "imageByCroppingToRect:", 0.0, 0.0, 350.0, 150.0);
      v45 = [v44 imageByApplyingFilter:@"CIAffineTile"];
      v46 = [v45 imageByCompositingOverImage:v38];
      [(NURenderJob *)self setOutputImage:v46];
    }
    v47 = [(NURenderJob *)self outputImage];
    uint64_t v48 = [(NUStorageImageBuffer *)self->_renderBuffer storage];
    uint64_t v49 = [(NURenderJob *)self imageSize];
    uint64_t v51 = -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v47, v48, v73, v6, v49, v50, v71);
    [(NUImageRenderJob *)self setRenderTask:v51];

    uint64_t v52 = [(NUImageRenderJob *)self renderTask];

    uint64_t v5 = v72;
    if (!v52)
    {
      BOOL v53 = 0;
      goto LABEL_26;
    }
  }
  objc_storeStrong((id *)&self->_renderedRegion, v6);
  BOOL v53 = 1;
LABEL_26:

  return v53;
}

- (id)renderBufferOfSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(NUImageRenderJob *)self storagePool];
  uint64_t v9 = objc_msgSend(v8, "newStorageWithMinimumSize:format:", var0, var1, v7);
  if (!v9)
  {
    uint64_t v13 = NUAssertLogger_10780();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [NSString stringWithFormat:@"No storage allocated"];
      *(_DWORD *)uint64_t v29 = 138543362;
      *(void *)&v29[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v29, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    $0AC6E346AE4835514AAA8AC86D8F4844 v16 = NUAssertLogger_10780();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v29 = 138543618;
        *(void *)&v29[4] = v20;
        __int16 v30 = 2114;
        id v31 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v29, 0x16u);
      }
    }
    else if (v17)
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      $0AC6E346AE4835514AAA8AC86D8F4844 v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v29 = 138543362;
      *(void *)&v29[4] = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v29, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob renderBufferOfSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 283, @"No storage allocated", v25, v26, v27, v28, *(uint64_t *)v29);
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [[NUStorageImageBuffer alloc] initWithStorage:v9 fromPool:v8];

  return v11;
}

- (NUPurgeableStoragePool)storagePool
{
  if ([(NURenderJob *)self rendererType] == 1 || [(NURenderJob *)self rendererType] == 2)
  {
    v3 = +[NUFactory sharedFactory];
    uint64_t v4 = [v3 surfaceStoragePool];
  }
  else
  {
    v3 = +[NUFactory sharedFactory];
    uint64_t v4 = [v3 bufferStoragePool];
  }
  uint64_t v5 = (void *)v4;

  return (NUPurgeableStoragePool *)v5;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v91 = NUAssertLogger_10780();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v92 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v92;
      _os_log_error_impl(&dword_1A9892000, v91, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v94 = NUAssertLogger_10780();
    BOOL v95 = os_log_type_enabled(v94, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v95)
      {
        v98 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v99 = (void *)MEMORY[0x1E4F29060];
        id v100 = v98;
        v101 = [v99 callStackSymbols];
        v102 = [v101 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v98;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v102;
        _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v95)
    {
      v96 = [MEMORY[0x1E4F29060] callStackSymbols];
      v97 = [v96 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v97;
      _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 179, @"Invalid parameter not satisfying: %s", v103, v104, v105, v106, (uint64_t)"error != NULL");
  }
  v129.receiver = self;
  v129.super_class = (Class)NUImageRenderJob;
  if (!-[NURenderJob prepare:](&v129, sel_prepare_)) {
    return 0;
  }
  uint64_t v5 = [(NURenderJob *)self outputImage];

  if (v5)
  {
    uint64_t v6 = [(NUImageRenderJob *)self imageRequest];
    id v7 = [v6 regionPolicy];

    v8 = [(NURenderJob *)self outputGeometry];
    uint64_t v9 = [v7 regionForGeometry:v8];
    regionToRender = self->_regionToRender;
    self->_regionToRender = v9;

    if (!self->_regionToRender)
    {
      v107 = NUAssertLogger_10780();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        v108 = [NSString stringWithFormat:@"No region to render"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v108;
        _os_log_error_impl(&dword_1A9892000, v107, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v109 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v110 = NUAssertLogger_10780();
      BOOL v111 = os_log_type_enabled(v110, OS_LOG_TYPE_ERROR);
      if (v109)
      {
        if (v111)
        {
          v114 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v115 = (void *)MEMORY[0x1E4F29060];
          id v116 = v114;
          v117 = [v115 callStackSymbols];
          v118 = [v117 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v114;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v118;
          _os_log_error_impl(&dword_1A9892000, v110, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v111)
      {
        v112 = [MEMORY[0x1E4F29060] callStackSymbols];
        v113 = [v112 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v113;
        _os_log_error_impl(&dword_1A9892000, v110, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 190, @"No region to render", v119, v120, v121, v122, v123);
    }
    int64x2_t v127 = 0u;
    int64x2_t v128 = 0u;
    uint64_t v11 = [(NURenderJob *)self outputGeometry];
    id v12 = v11;
    if (v11)
    {
      [v11 physicalScaledExtent];
    }
    else
    {
      int64x2_t v127 = 0u;
      int64x2_t v128 = 0u;
    }

    uint64_t v14 = self->_regionToRender;
    if (v14)
    {
      [(NURegion *)v14 bounds];
      int64x2_t v16 = v125;
      int64x2_t v15 = v126;
    }
    else
    {
      int64x2_t v15 = 0uLL;
      int64x2_t v16 = 0uLL;
    }
    *(int64x2_t *)buf = v127;
    *(int64x2_t *)&buf[16] = v128;
    int64x2_t v130 = v16;
    int64x2_t v131 = v15;
    NU::RectT<long>::add(v130.i64, (uint64_t *)buf);
    if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v127, v130), (int32x4_t)vceqq_s64(v128, v131))), 0xFuLL))))
    {
LABEL_28:
      int v34 = [(NUImageRenderJob *)self imageRequest];
      uint64_t v35 = [v34 colorSpace];

      uint64_t v36 = [(NUImageRenderJob *)self imageRequest];
      uint64_t v37 = [v36 pixelFormat];

      v38 = [(NUImageRenderJob *)self imageRequest];
      [v38 maxEDRHeadroom];
      double v40 = v39;

      double v41 = [(NUImageRenderJob *)self imageRequest];
      [v41 currentEDRHeadroom];
      double v43 = v42;

      v44 = [(NUImageRenderJob *)self imageRequest];
      uint64_t v45 = [v44 auxiliaryImageType];

      float v46 = 0.0;
      if (v45 != 1
        || !+[NUGlobalSettings enableHDRSupport]
        || (float v47 = v40,
            double v48 = v47,
            +[NUGlobalSettings thresholdDisplayHeadroom],
            v49 >= v48))
      {
        v124 = v37;
        long long v56 = v7;
        goto LABEL_35;
      }
      uint64_t v51 = [(NURenderJob *)self prepareNode];
      uint64_t v52 = [v51 imageProperties:a3];

      if ([v52 isHDR])
      {
        uint64_t v53 = +[NUColorSpace extendedSRGBLinearColorSpace];

        uint64_t v54 = [(NUImageRenderJob *)self _HDRPixelFormatForColorSpace:v53];

        [v52 contentHeadroom];
      }
      else
      {
        if (!+[NUGlobalSettings renderMeteorPlusAsHDR]) {
          goto LABEL_56;
        }
        if (![v52 hasGainMap]) {
          goto LABEL_56;
        }
        [v52 gainMapHeadroom];
        if (v86 <= 1.0) {
          goto LABEL_56;
        }
        if (+[NUGlobalSettings renderEDRAsPQ]) {
          +[NUColorSpace itur2100PQColorSpace];
        }
        else {
        uint64_t v53 = +[NUColorSpace extendedSRGBLinearColorSpace];
        }

        uint64_t v54 = [(NUImageRenderJob *)self _HDRPixelFormatForColorSpace:v53];

        [v52 gainMapHeadroom];
        float v55 = v90;
      }
      float v50 = v43;
      float v46 = fminf(v55, v50);
      uint64_t v35 = (void *)v53;
      uint64_t v37 = (void *)v54;
LABEL_56:
      v124 = v37;
      long long v56 = v7;

LABEL_35:
      long long v57 = [(NUImageRenderJob *)self imageRequest];
      uint64_t v58 = [v57 tileSize];
      uint64_t v60 = v59;

      __int16 v61 = [(NUImageRenderJob *)self imageRequest];
      uint64_t v62 = [v61 borderSize];
      uint64_t v64 = v63;

      v65 = [(NUImageRenderJob *)self imageRequest];
      v66 = [v65 targetImage];

      if (v66)
      {
        uint64_t v67 = [v66 colorSpace];
        char v68 = [v67 isEqual:v35];

        if ((v68 & 1) == 0)
        {
          +[NUError mismatchError:@"Incompatible target image color space" object:v66];
          BOOL v13 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v70 = v124;
          goto LABEL_49;
        }
        uint64_t v69 = [v66 format];
        uint64_t v70 = v124;
        char v71 = [v69 isEqual:v124];

        if (v71)
        {
          uint64_t v72 = [v66 size];
          uint64_t v74 = v73;
          if (v72 == [(NURenderJob *)self imageSize] && v74 == v75)
          {
            v76 = v66;
            targetImage = self->_targetImage;
            self->_targetImage = v76;
LABEL_44:

            [(NUImageRenderJob *)self setColorSpace:v35];
            [(NUImageRenderJob *)self setPixelFormat:v70];
            *(float *)&double v83 = v46;
            [(NUImageRenderJob *)self setContentHeadroom:v83];
            BOOL v13 = 1;
LABEL_49:

            return v13;
          }
          v84 = @"Incompatible target image size";
        }
        else
        {
          v84 = @"Incompatible target image format";
        }
        +[NUError mismatchError:v84 object:v66];
        BOOL v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      }
      uint64_t v78 = [(NURenderJob *)self imageSize];
      targetImage = -[NUImageRenderJob imageAccumulationNodeWithImageSize:tileSize:borderSize:format:colorSpace:](self, "imageAccumulationNodeWithImageSize:tileSize:borderSize:format:colorSpace:", v78, v79, v58, v60, v62, v64, v124, v35);
      if (targetImage)
      {
        v80 = +[NURenderNode nodeFromCache:targetImage];
        [(NURenderJob *)self setRenderNode:v80];
        v81 = [v80 image];
        v82 = self->_targetImage;
        self->_targetImage = v81;
      }
      uint64_t v70 = v124;
      goto LABEL_44;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
    }
    BOOL v17 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v18 = NSString;
      $0AC6E346AE4835514AAA8AC86D8F4844 v19 = v17;
      v20 = [v18 stringWithFormat:@"Render region extends beyond valid extent"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v20;
      _os_log_impl(&dword_1A9892000, v19, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v21 = _NULogOnceToken;
    }
    else
    {
      uint64_t v21 = -1;
    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v21 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
      }
      id v22 = (void *)_NUAssertLogger;
      if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v28 = (void *)MEMORY[0x1E4F29060];
      id v29 = v27;
      __int16 v30 = v22;
      id v31 = [v28 callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v32;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    else
    {
      if (v21 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
      }
      v33 = (void *)_NUAssertLogger;
      if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      v87 = (void *)MEMORY[0x1E4F29060];
      __int16 v30 = v33;
      v88 = [v87 callStackSymbols];
      v89 = [v88 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v89;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_27:
    _NUAssertContinueHandler((uint64_t)"-[NUImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 192, @"Render region extends beyond valid extent", v23, v24, v25, v26, v123);
    goto LABEL_28;
  }
  return 1;
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NUImageRenderJob;
  id v7 = [(NURenderJob *)&v29 prepareNodeWithPipelineState:v6 error:a4];
  if (v7 && [v6 auxiliaryImageType] == 1)
  {
    uint64_t v8 = [v7 imageProperties:a4];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(NUImageRenderJob *)self imageRequest];
      [v10 maxEDRHeadroom];
      double v12 = v11;

      BOOL v13 = [(NUImageRenderJob *)self imageRequest];
      [v13 currentEDRHeadroom];
      double v15 = v14;

      if (+[NUGlobalSettings enableHDRSupport])
      {
        +[NUGlobalSettings thresholdDisplayHeadroom];
        BOOL v17 = v12 > v16;
      }
      else
      {
        BOOL v17 = 0;
      }
      if ([v9 isHDR])
      {
        $0AC6E346AE4835514AAA8AC86D8F4844 v18 = [NUHDRToneMapNode alloc];
        [v9 contentHeadroom];
        double v20 = v19;
        double v21 = 1.0;
        if (v17) {
          double v21 = v15;
        }
        id v22 = v18;
        uint64_t v23 = v7;
      }
      else
      {
        if (![v9 hasGainMap]) {
          goto LABEL_20;
        }
        [v9 gainMapHeadroom];
        BOOL v26 = v25 > 1.0 && v17;
        if (!v26 || !+[NUGlobalSettings renderMeteorPlusAsHDR]) {
          goto LABEL_20;
        }
        uint64_t v27 = [NUHDRGainMapNode alloc];
        [v9 gainMapHeadroom];
        id v22 = v27;
        uint64_t v23 = v7;
        double v21 = v15;
      }
      uint64_t v24 = [v22 initWithInput:v23 contentHeadroom:v20 displayHeadroom:v21];

      id v7 = (void *)v24;
    }
    else
    {
      uint64_t v9 = v7;
      id v7 = 0;
    }
LABEL_20:
  }

  return v7;
}

- (id)_HDRPixelFormatForColorSpace:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isHDR])
  {
    uint64_t v5 = +[NUPixelFormat A2RGB10];
    v33[0] = v5;
    id v6 = +[NUPixelFormat RGBAh];
    v33[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__NUImageRenderJob__HDRPixelFormatForColorSpace___block_invoke;
    v28[3] = &unk_1E5D94720;
    v28[4] = self;
    uint64_t v8 = [v7 indexOfObjectPassingTest:v28];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v11 = NUAssertLogger_10780();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        double v12 = [NSString stringWithFormat:@"Could not find supported HDR pixel format!"];
        *(_DWORD *)buf = 138543362;
        __int16 v30 = v12;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      double v14 = NUAssertLogger_10780();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v15)
        {
          $0AC6E346AE4835514AAA8AC86D8F4844 v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          float v19 = (void *)MEMORY[0x1E4F29060];
          id v20 = v18;
          double v21 = [v19 callStackSymbols];
          id v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          __int16 v30 = v18;
          __int16 v31 = 2114;
          uint64_t v32 = v22;
          _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v15)
      {
        double v16 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        __int16 v30 = v17;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob _HDRPixelFormatForColorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 141, @"Could not find supported HDR pixel format!", v23, v24, v25, v26, v27);
    }
    uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
  }
  else
  {
    uint64_t v9 = +[NUPixelFormat RGBAh];
  }

  return v9;
}

uint64_t __49__NUImageRenderJob__HDRPixelFormatForColorSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 device];
  uint64_t v5 = [v4 supportsPixelFormat:v3];

  return v5;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUImageRenderJob;
  id v4 = [(NURenderJob *)&v7 newRenderPipelineStateForEvaluationMode:a3];
  uint64_t v5 = [(NUImageRenderJob *)self imageRequest];
  objc_msgSend(v4, "setAuxiliaryImageType:", objc_msgSend(v5, "auxiliaryImageType"));

  return v4;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (id)extentPolicy
{
  uint64_t v2 = [(NUImageRenderJob *)self imageRequest];
  id v3 = [v2 extentPolicy];

  return v3;
}

- (id)scalePolicy
{
  uint64_t v2 = [(NUImageRenderJob *)self imageRequest];
  id v3 = [v2 scalePolicy];

  return v3;
}

- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  id v8 = a7;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
  }
  uint64_t v9 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = NSString;
    double v11 = v9;
    double v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    double v14 = [v10 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v13];
    *(_DWORD *)buf = 138543362;
    int v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    double v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v17 = (void *)MEMORY[0x1E4F29060];
    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = v16;
    float v19 = [v17 callStackSymbols];
    id v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    int v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  double v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  $0AC6E346AE4835514AAA8AC86D8F4844 v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  int v34 = specific;
  __int16 v35 = 2114;
  uint64_t v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob imageAccumulationNodeWithImageSize:tileSize:borderSize:format:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 92, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v29, v30, v31, v32, v28);
}

- (NUImageRenderJob)initWithRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
  }
  uint64_t v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    id v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    double v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    double v14 = (void *)MEMORY[0x1E4F29060];
    uint64_t v15 = v13;
    double v16 = [v14 callStackSymbols];
    BOOL v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  uint64_t v15 = v18;
  id v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 87, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUImageRenderJob)initWithImageRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUImageRenderJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

@end