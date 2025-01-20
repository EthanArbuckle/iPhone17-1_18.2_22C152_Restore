@interface PIFalseColorHDRDebug
+ (id)kernel;
- (CIImage)inputImage;
- (double)inputCutoff;
- (id)outputImage;
- (void)setInputCutoff:(double)a3;
- (void)setInputImage:(id)a3;
@end

@implementation PIFalseColorHDRDebug

+ (id)kernel
{
  if (kernel_onceToken_2207 != -1) {
    dispatch_once(&kernel_onceToken_2207, &__block_literal_global_2208);
  }
  v2 = (void *)kernel_kernel_2209;
  return v2;
}

void __30__PIFalseColorHDRDebug_kernel__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _falseColorHDRDebug(sampler image, float cutoff){   vec4 im = sample(image, samplerCoord(image))   if (im.x < 0.0 && im.y < 0.0 && im.z < 0.0) {        return vec4(0.0, 0.6, 0.2, 1.0);   }   if (im.x > cutoff && im.y > cutoff && im.z > cutoff) {        return vec4(1.0, 0.0, 1.0, 1.0);   }   if (im.x > cutoff || im.y > cutoff || im.z > cutoff) {        return vec4(0.6, 0.0, 0.6, 1.0);   }   return im;}"];;
  v1 = (void *)kernel_kernel_2209;
  kernel_kernel_2209 = v0;

  if (!kernel_kernel_2209)
  {
    v2 = NUAssertLogger_2213();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [NSString stringWithFormat:@"s_falseColorHDRDebugKernelSource kernel is nil"];
      int v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A9680000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v4 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v6 = NUAssertLogger_2213();
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
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputCutoff:(double)a3
{
  self->_inputCutoff = a3;
}

- (double)inputCutoff
{
  return self->_inputCutoff;
}

- (id)outputImage
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    uint64_t v19 = NUAssertLogger_2213();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v23 = NUAssertLogger_2213();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        __int16 v35 = 2114;
        v36 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
  v5 = [(id)objc_opt_class() kernel];
  [(CIImage *)self->_inputImage extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = objc_msgSend(NSNumber, "numberWithDouble:", self->_inputCutoff, v4);
  v32[1] = v14;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v16 = objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);

  __int16 v17 = [v16 imageByPremultiplyingAlpha];

  return v17;
}

@end