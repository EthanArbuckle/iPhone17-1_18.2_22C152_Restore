@interface PIPhotoEffectHDR
+ (id)hdrOffsetBlackAndWhiteKernel;
+ (id)hdrOffsetColorKernel;
- (BOOL)isBlackAndWhite;
- (CIImage)inputImage;
- (id)hdrOffsetKernel;
- (id)outputImage;
- (id)photoEffectName;
- (void)setInputImage:(id)a3;
@end

@implementation PIPhotoEffectHDR

+ (id)hdrOffsetBlackAndWhiteKernel
{
  if (hdrOffsetBlackAndWhiteKernel_onceToken != -1) {
    dispatch_once(&hdrOffsetBlackAndWhiteKernel_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)hdrOffsetBlackAndWhiteKernel_kernel;
  return v2;
}

void __48__PIPhotoEffectHDR_hdrOffsetBlackAndWhiteKernel__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _hdrOffsetPosBW(sampler image) { vec4 im = sample(image, samplerCoord(image)) float offset = (im.r + im.g + im.b) / 3.0f; offset = max(0.0f, offset - 1.0f); return vec4(offset, offset, offset, 0.0f); }"];;
  v1 = (void *)hdrOffsetBlackAndWhiteKernel_kernel;
  hdrOffsetBlackAndWhiteKernel_kernel = v0;

  if (!hdrOffsetBlackAndWhiteKernel_kernel)
  {
    v2 = NUAssertLogger_343();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [NSString stringWithFormat:@"s_hdrOffsetPos kernel is nil"];
      int v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A9680000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v4 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v6 = NUAssertLogger_343();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific(*v4);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        int v15 = 138543618;
        v16 = v10;
        __int16 v17 = 2114;
        v18 = v14;
        _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    else if (v7)
    {
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      v9 = [v8 componentsJoinedByString:@"\n"];
      int v15 = 138543362;
      v16 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v15, 0xCu);
    }
    _NUAssertFailHandler();
  }
}

+ (id)hdrOffsetColorKernel
{
  if (hdrOffsetColorKernel_onceToken != -1) {
    dispatch_once(&hdrOffsetColorKernel_onceToken, &__block_literal_global_355);
  }
  v2 = (void *)hdrOffsetColorKernel_kernel;
  return v2;
}

void __40__PIPhotoEffectHDR_hdrOffsetColorKernel__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _hdrOffsetPos(sampler image) { vec4 im = sample(image, samplerCoord(image)) float r = max(im.r - 1.0f, 0.0f); float g = max(im.g - 1.0f, 0.0f); float b = max(im.b - 1.0f, 0.0f); return vec4(r, g, b, 0.0f); }"];;
  v1 = (void *)hdrOffsetColorKernel_kernel;
  hdrOffsetColorKernel_kernel = v0;

  if (!hdrOffsetColorKernel_kernel)
  {
    v2 = NUAssertLogger_343();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [NSString stringWithFormat:@"s_hdrOffsetPos kernel is nil"];
      int v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A9680000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v4 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v6 = NUAssertLogger_343();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific(*v4);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        int v15 = 138543618;
        v16 = v10;
        __int16 v17 = 2114;
        v18 = v14;
        _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    else if (v7)
    {
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      v9 = [v8 componentsJoinedByString:@"\n"];
      int v15 = 138543362;
      v16 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v15, 0xCu);
    }
    _NUAssertFailHandler();
  }
}

- (void).cxx_destruct
{
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (id)outputImage
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    v24 = NUAssertLogger_343();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v28 = NUAssertLogger_343();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific(*v26);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        __int16 v40 = 2114;
        v41 = v36;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = [MEMORY[0x1E4F7A400] workingColorSpace];
  v5 = -[CIImage imageByTaggingWithColorSpace:](inputImage, "imageByTaggingWithColorSpace:", [v4 CGColorSpace]);

  v6 = [(PIPhotoEffectHDR *)self hdrOffsetKernel];
  [v5 extent];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v37 = v5;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v16 = objc_msgSend(v6, "applyWithExtent:arguments:", v15, v8, v10, v12, v14);

  __int16 v17 = (void *)MEMORY[0x1E4F1E040];
  v18 = [(PIPhotoEffectHDR *)self photoEffectName];
  uint64_t v19 = [v17 filterWithName:v18];

  [v19 setValue:v5 forKey:@"inputImage"];
  [(PIPhotoEffectHDR *)self configureFilter:v19];
  v20 = [v19 outputImage];
  v21 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAdditionCompositing"];
  [v21 setValue:v20 forKey:@"inputBackgroundImage"];
  [v21 setValue:v16 forKey:@"inputImage"];
  v22 = [v21 outputImage];

  return v22;
}

- (id)photoEffectName
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = [v3 stringByReplacingOccurrencesOfString:@"PI" withString:@"CI"];

  v5 = [v4 stringByReplacingOccurrencesOfString:@"HDR" withString:&stru_1EFFD8610];

  return v5;
}

- (BOOL)isBlackAndWhite
{
  return 0;
}

- (id)hdrOffsetKernel
{
  BOOL v2 = [(PIPhotoEffectHDR *)self isBlackAndWhite];
  v3 = objc_opt_class();
  if (v2) {
    [v3 hdrOffsetBlackAndWhiteKernel];
  }
  else {
  v4 = [v3 hdrOffsetColorKernel];
  }
  return v4;
}

@end