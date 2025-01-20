@interface NUProcessorCache
- (CIImage)inputImage;
- (CIImage)outputImage;
- (NSString)label;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)pixelFormat;
- (NUProcessorCache)init;
- (NUProcessorCache)initWithImage:(id)a3;
- (void)_render:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPixelFormat:(id)a3;
@end

@implementation NUProcessorCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_textureCachedEvent, 0);
  objc_storeStrong((id *)&self->_cachedTexture, 0);

  objc_storeStrong((id *)&self->_textureCacheQueue, 0);
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setPixelFormat:(id)a3
{
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)_render:(id)a3
{
  id v4 = a3;
  v5 = [(NUProcessorCache *)self inputImage];
  [v5 extent];
  v44.origin.x = v6;
  v44.origin.y = v7;
  v44.size.width = v8;
  v44.size.height = v9;
  NU::RectT<long>::RectT(&v43, &v44, 3);
  int64x2_t size = (int64x2_t)v43.size;
  int64x2_t origin = (int64x2_t)v43.origin;

  v10 = [v4 metalCommandBuffer];
  v11 = [v10 device];
  textureCacheQueue = self->_textureCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__NUProcessorCache__render___block_invoke;
  block[3] = &unk_1E5D94F78;
  int64x2_t v39 = origin;
  int64x2_t v40 = size;
  block[4] = self;
  id v36 = v11;
  id v37 = v4;
  id v38 = v10;
  id v13 = v10;
  id v14 = v4;
  id v15 = v11;
  dispatch_sync(textureCacheQueue, block);
  [v13 encodeWaitForEvent:self->_textureCachedEvent value:1];
  [v14 region];
  v44.origin.x = v16;
  v44.origin.y = v17;
  v44.size.width = v18;
  v44.size.height = v19;
  NU::RectT<long>::RectT(&v43, &v44, 3);
  CGPoint v25 = v43.origin;
  CGRect v44 = v43;
  v43.int64x2_t origin = (CGPoint)origin;
  v43.int64x2_t size = (CGSize)size;
  NU::RectT<long>::Intersection((uint64_t)&v41, (uint64_t *)&v44, (uint64_t *)&v43);
  v20.i64[0] = v41.i64[0];
  v21.i64[0] = origin.i64[0];
  int64x2_t v22 = vaddq_s64(size, origin);
  int64x2_t v27 = vsubq_s64(v41, (int64x2_t)v25);
  v20.i64[1] = v22.i64[1];
  v21.i64[1] = vaddq_s64(v41, v42).i64[1];
  cachedTexture = self->_cachedTexture;
  int64x2_t v31 = vsubq_s64(v20, v21);
  uint64_t v32 = 0;
  int64x2_t v33 = v42;
  uint64_t v34 = 1;
  v24 = [v14 metalTexture];
  int64x2_t v29 = v27;
  uint64_t v30 = 0;
  +[NUCopyKernel copyFromTexture:cachedTexture region:&v31 toTexture:v24 atPoint:&v29 withCommandBuffer:v13];
}

void __28__NUProcessorCache__render___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = *(id **)(a1 + 32);
  if (v2[2])
  {
    v3 = *(void **)(a1 + 40);
    id v4 = [v2[2] device];

    if (v3 != v4)
    {
      CGFloat v17 = NUAssertLogger_16313();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        CGFloat v18 = [NSString stringWithFormat:@"NUProcessorCache does not support multiple devices"];
        *(_DWORD *)buf = 138543362;
        id v36 = v18;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      int64x2_t v20 = NUAssertLogger_16313();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v21)
        {
          v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          CGPoint v25 = (void *)MEMORY[0x1E4F29060];
          id v26 = v24;
          int64x2_t v27 = [v25 callStackSymbols];
          v28 = [v27 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          id v36 = v24;
          __int16 v37 = 2114;
          id v38 = v28;
          _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v21)
      {
        int64x2_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v36 = v23;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUProcessorCache _render:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Performance/NUProcessorCache.m", 109, @"NUProcessorCache does not support multiple devices", v29, v30, v31, v32, v33);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F35330];
    CGFloat v6 = [v2 pixelFormat];
    objc_msgSend(v5, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v6, "metalFormat"), *(void *)(a1 + 80), *(void *)(a1 + 88), 0);
    id v34 = (id)objc_claimAutoreleasedReturnValue();

    [v34 setStorageMode:2];
    [v34 setUsage:3];
    uint64_t v7 = [*(id *)(a1 + 40) newTextureWithDescriptor:v34];
    uint64_t v8 = *(void *)(a1 + 32);
    CGFloat v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    uint64_t v10 = [*(id *)(a1 + 40) newEvent];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithMTLTexture:*(void *)(*(void *)(a1 + 32) + 16) commandBuffer:0];
    [v13 setFlipped:1];
    [v13 setColorSpace:0];
    [v13 setAlphaMode:0];
    id v14 = [*(id *)(a1 + 48) metalContext];
    id v15 = [*(id *)(a1 + 32) inputImage];
    id v16 = (id)[v14 startTaskToRender:v15 toDestination:v13 error:0];

    [*(id *)(a1 + 56) encodeSignalEvent:*(void *)(*(void *)(a1 + 32) + 24) value:1];
  }
}

- (CIImage)outputImage
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v3 = [(NUProcessorCache *)self inputImage];
  id v4 = [(NUProcessorCache *)self pixelFormat];
  uint64_t v5 = [v4 CIFormat];

  uint64_t v6 = *MEMORY[0x1E4F1E3B8];
  v25[0] = *MEMORY[0x1E4F1E3C0];
  v25[1] = v6;
  v26[0] = MEMORY[0x1E4F1CC28];
  v26[1] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  uint64_t v8 = [MEMORY[0x1E4F1E050] emptyImage];
  [v3 extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  CGFloat v17 = [(NUProcessorCache *)self label];
  uint64_t v18 = [v3 digest];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __31__NUProcessorCache_outputImage__block_invoke_2;
  v24[3] = &unk_1E5D94F50;
  v24[4] = self;
  CGFloat v19 = objc_msgSend(v8, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v17, v18, 0, v5, v7, &__block_literal_global_16330, v10, v12, v14, v16, v24);

  int64x2_t v20 = [(NUProcessorCache *)self pixelFormat];
  uint64_t v21 = [v20 numberOfComponents];

  if (v21 == 1)
  {
    uint64_t v22 = [v19 _imageByApplyingColorMatrixRed:COERCE_DOUBLE(1065353216) green:COERCE_DOUBLE(1065353216) blue:COERCE_DOUBLE(1065353216) bias:0.0];

    CGFloat v19 = (void *)v22;
  }

  return (CIImage *)v19;
}

uint64_t __31__NUProcessorCache_outputImage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_render:");
}

double __31__NUProcessorCache_outputImage__block_invoke()
{
  return 0.0;
}

- (NUProcessorCache)initWithImage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (CIImage *)a3;
  if (!v4)
  {
    CGFloat v19 = NUAssertLogger_16313();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int64x2_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v37 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_16313();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int64x2_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v26;
        __int16 v38 = 2114;
        uint64_t v39 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGPoint v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v37 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUProcessorCache initWithImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Performance/NUProcessorCache.m", 43, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"image != nil");
  }
  uint64_t v5 = v4;
  v35.receiver = self;
  v35.super_class = (Class)NUProcessorCache;
  uint64_t v6 = [(NUProcessorCache *)&v35 init];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  label = v6->_label;
  v6->_label = (NSString *)v8;

  inputImage = v6->_inputImage;
  v6->_inputImage = v5;
  double v11 = v5;

  uint64_t v12 = +[NUPixelFormat RGBAh];
  pixelFormat = v6->_pixelFormat;
  v6->_pixelFormat = (NUPixelFormat *)v12;

  uint64_t v14 = +[NUColorSpace workingColorSpace];
  colorSpace = v6->_colorSpace;
  v6->_colorSpace = (NUColorSpace *)v14;

  dispatch_queue_t v16 = dispatch_queue_create("NUProcessorCache", 0);
  textureCacheQueue = v6->_textureCacheQueue;
  v6->_textureCacheQueue = (OS_dispatch_queue *)v16;

  return v6;
}

- (NUProcessorCache)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_99);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    uint64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    double v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_99);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_99);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    double v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    double v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    double v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  dispatch_queue_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  double v13 = v16;
  int64x2_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUProcessorCache init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Performance/NUProcessorCache.m", 39, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end