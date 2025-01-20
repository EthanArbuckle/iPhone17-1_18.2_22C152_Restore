@interface _PIParallaxRenderCacheEntry
- (BOOL)render:(id)a3 error:(id *)a4;
- (BOOL)waitForRender:(id *)a3;
- (CIImage)cachedImage;
- (CIImage)image;
- (CIRenderInfo)renderInfo;
- (CIRenderTask)renderTask;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)pixelFormat;
- (_PIParallaxRenderCacheEntry)initWithImage:(id)a3 format:(id)a4 colorSpace:(id)a5;
- (unint64_t)sizeInBytes;
@end

@implementation _PIParallaxRenderCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_renderInfo, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);
}

- (CIImage)cachedImage
{
  return self->_cachedImage;
}

- (CIRenderInfo)renderInfo
{
  return self->_renderInfo;
}

- (CIRenderTask)renderTask
{
  return self->_renderTask;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (CIImage)image
{
  return self->_image;
}

- (BOOL)waitForRender:(id *)a3
{
  renderInfo = self->_renderInfo;
  if (!renderInfo)
  {
    v5 = [(CIRenderTask *)self->_renderTask waitUntilCompletedAndReturnError:a3];
    v6 = self->_renderInfo;
    self->_renderInfo = v5;

    renderInfo = self->_renderInfo;
  }
  return renderInfo != 0;
}

- (BOOL)render:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v17 = NUAssertLogger_19382();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "renderer != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_19382();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v30 = dispatch_get_specific(*v19);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v19 = [v31 callStackSymbols];
        v33 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v27 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  if (!a4)
  {
    v24 = NUAssertLogger_19382();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_19382();
    int v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_19:
    if (v27)
    {
      v34 = dispatch_get_specific(*v19);
      v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      v37 = [v35 callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v38;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_21:

    _NUAssertFailHandler();
  }
  v7 = v6;
  renderTask = self->_renderTask;
  if (!renderTask)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"));
    v10 = [(_PIParallaxRenderCacheEntry *)self colorSpace];
    objc_msgSend(v9, "setColorSpace:", objc_msgSend(v10, "CGColorSpace"));

    memset(buf, 0, 32);
    v11 = [(_PIParallaxRenderCacheEntry *)self image];
    [v11 extent];
    NUPixelRectFromCGRect();

    v12 = [(_PIParallaxRenderCacheEntry *)self image];
    memset(v39, 0, sizeof(v39));
    objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v12, v39, v9, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), a4);
    v13 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
    v14 = self->_renderTask;
    self->_renderTask = v13;

    renderTask = self->_renderTask;
  }
  BOOL v15 = renderTask != 0;

  return v15;
}

- (unint64_t)sizeInBytes
{
  uint64_t v3 = [(NUCVPixelBuffer *)self->_pixelBuffer size];
  uint64_t v5 = v4;
  id v6 = [(NUCVPixelBuffer *)self->_pixelBuffer format];
  unint64_t v7 = v3 * v5 * [v6 bytesPerPixel];

  return v7;
}

- (_PIParallaxRenderCacheEntry)initWithImage:(id)a3 format:(id)a4 colorSpace:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v9 = a3;
  id specific = a4;
  v11 = (const void **)a5;
  if (!v9)
  {
    v26 = NUAssertLogger_19382();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)v55 = 138543362;
      *(void *)&v55[4] = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_19382();
    BOOL v28 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        id specific = dispatch_get_specific(*v12);
        v38 = (void *)MEMORY[0x1E4F29060];
        self = (_PIParallaxRenderCacheEntry *)specific;
        v12 = [v38 callStackSymbols];
        v39 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)v55 = 138543618;
        *(void *)&v55[4] = specific;
        *(_WORD *)&v55[12] = 2114;
        *(void *)&v55[14] = v39;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);
      }
    }
    else if (v28)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)v55 = 138543362;
      *(void *)&v55[4] = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);
    }
    int v31 = _NUAssertFailHandler();
    goto LABEL_35;
  }
  if (!specific)
  {
    v29 = NUAssertLogger_19382();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      *(_DWORD *)v55 = 138543362;
      *(void *)&v55[4] = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_19382();
    int v31 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v31)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)v55 = 138543362;
        *(void *)&v55[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);
      }
LABEL_37:

      int v34 = _NUAssertFailHandler();
      goto LABEL_38;
    }
LABEL_35:
    if (v31)
    {
      id specific = dispatch_get_specific(*v12);
      v40 = (void *)MEMORY[0x1E4F29060];
      self = (_PIParallaxRenderCacheEntry *)specific;
      v12 = [v40 callStackSymbols];
      uint64_t v41 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)v55 = 138543618;
      *(void *)&v55[4] = specific;
      *(_WORD *)&v55[12] = 2114;
      *(void *)&v55[14] = v41;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);
    }
    goto LABEL_37;
  }
  v12 = v11;
  if (!v11)
  {
    id v32 = NUAssertLogger_19382();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "space != nil");
      *(_DWORD *)v55 = 138543362;
      *(void *)&v55[4] = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_19382();
    int v34 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v34)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)v55 = 138543362;
        *(void *)&v55[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);
      }
LABEL_40:

      int v37 = _NUAssertFailHandler();
      goto LABEL_41;
    }
LABEL_38:
    if (v34)
    {
      id specific = dispatch_get_specific(*v12);
      v42 = (void *)MEMORY[0x1E4F29060];
      self = (_PIParallaxRenderCacheEntry *)specific;
      v12 = [v42 callStackSymbols];
      v43 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)v55 = 138543618;
      *(void *)&v55[4] = specific;
      *(_WORD *)&v55[12] = 2114;
      *(void *)&v55[14] = v43;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);
    }
    goto LABEL_40;
  }
  [v9 extent];
  if (CGRectIsInfinite(v57))
  {
    v35 = NUAssertLogger_19382();
    self = (_PIParallaxRenderCacheEntry *)&unk_1A980A000;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = [NSString stringWithFormat:@"Invalid image extent"];
      *(_DWORD *)v55 = 138543362;
      *(void *)&v55[4] = v36;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_19382();
    int v37 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v37)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)v55 = 138543362;
        *(void *)&v55[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);
      }
LABEL_43:

      _NUAssertFailHandler();
LABEL_44:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_19344);
      goto LABEL_8;
    }
LABEL_41:
    if (v37)
    {
      id specific = dispatch_get_specific(*v12);
      v44 = (void *)MEMORY[0x1E4F29060];
      self = (_PIParallaxRenderCacheEntry *)specific;
      v12 = [v44 callStackSymbols];
      v45 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)v55 = 138543618;
      *(void *)&v55[4] = specific;
      *(_WORD *)&v55[12] = 2114;
      *(void *)&v55[14] = v45;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);
    }
    goto LABEL_43;
  }
  memset(v55, 0, 32);
  NUPixelRectFromCGRect();
  v46.receiver = self;
  v46.super_class = (Class)_PIParallaxRenderCacheEntry;
  self = [(_PIParallaxRenderCacheEntry *)&v46 init];
  objc_storeStrong((id *)&self->_pixelFormat, a4);
  objc_storeStrong((id *)&self->_colorSpace, a5);
  objc_storeStrong((id *)&self->_image, a3);
  v13 = (void *)MEMORY[0x1E4F7A718];
  uint64_t v14 = [specific CVPixelFormat];
  BOOL v15 = (NUCVPixelBuffer *)[v13 newPixelBufferOfSize:*(_OWORD *)&v55[16] format:v14];
  pixelBuffer = self->_pixelBuffer;
  self->_pixelBuffer = v15;

  if (self->_pixelBuffer)
  {
    uint64_t v47 = *MEMORY[0x1E4F1E390];
    uint64_t v48 = [v12 CGColorSpace];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"), v17);
    v18 = (CIImage *)objc_claimAutoreleasedReturnValue();
    cachedImage = self->_cachedImage;
    self->_cachedImage = v18;

    v20 = self;
    goto LABEL_11;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_44;
  }
LABEL_8:
  v21 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    long long v23 = *(_OWORD *)&v55[16];
    v24 = v21;
    v25 = [specific name];
    *(_DWORD *)buf = 134218498;
    uint64_t v50 = v23;
    __int16 v51 = 2048;
    uint64_t v52 = *((void *)&v23 + 1);
    __int16 v53 = 2114;
    v54 = v25;
    _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Failed to allocate pixel buffer for render cache entry (size=%ldx%ld, format=%{public}@)", buf, 0x20u);
  }
  v20 = 0;
LABEL_11:

  return v20;
}

@end