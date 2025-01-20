@interface PIHighKey
+ (id)kernel;
- (CIImage)inputImage;
- (NSNumber)inputStrength;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputStrength:(id)a3;
@end

@implementation PIHighKey

+ (id)kernel
{
  if (kernel_onceToken != -1) {
    dispatch_once(&kernel_onceToken, &__block_literal_global_1026);
  }
  v2 = (void *)kernel_kernel;
  return v2;
}

void __19__PIHighKey_kernel__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 highKey(__sample im, float str)\n{\nvec3 neg = min(im.rgb, 0.0)\nvec3 pos = max(im.rgb, 1.0) - 1.0;\nim = clamp(im, 0.0, 1.0);\nvec4 im2 = 1.0-((im-1.0)*(im-1.0));\nim2 = sqrt(im2);\nfloat y = dot(im.rgb, vec3(.333333));\nfloat y2 = sqrt(1.0-(y-1.0)*(y-1.0));\ny2 = mix(y2, smoothstep(0.0, 1.0, y2), 0.5);\nvec4 im3 = (y>0) ? im*y2/y : vec4(0.0, 0.0, 0.0, 1.0);\nim3 = mix(im3, im2, .7*sqrt(y2));\nim3 = mix(im, im3, sqrt(y));\nim.rgb = mix(im.rgb, im3.rgb, str) + pos + neg;\nreturn im;\n}\n\n"];;
  v1 = (void *)kernel_kernel;
  kernel_kernel = v0;

  if (!kernel_kernel)
  {
    v2 = NUAssertLogger_1030();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [NSString stringWithFormat:@"high key kernel is nil"];
      int v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A9680000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v4 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v6 = NUAssertLogger_1030();
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
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (id)outputImage
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage)
  {
    v16 = NUAssertLogger_1030();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      *(_DWORD *)buf = 138543362;
      v40 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_1030();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v29 = dispatch_get_specific(*v18);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v18 = [v30 callStackSymbols];
        v32 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = (const void **)v29;
        __int16 v41 = 2114;
        v42 = v32;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v26 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  if (!self->inputStrength)
  {
    v23 = NUAssertLogger_1030();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [NSString stringWithFormat:@"inputStrength cannot be nil"];
      *(_DWORD *)buf = 138543362;
      v40 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    v25 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_1030();
    int v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v40 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_19:
    if (v26)
    {
      v33 = dispatch_get_specific(*v18);
      v34 = (void *)MEMORY[0x1E4F29060];
      id v35 = v33;
      v36 = [v34 callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v40 = (const void **)v33;
      __int16 v41 = 2114;
      v42 = v37;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_21:

    _NUAssertFailHandler();
  }
  v3 = [(id)objc_opt_class() kernel];
  [(CIImage *)self->inputImage extent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  inputStrength = self->inputStrength;
  v38[0] = self->inputImage;
  v38[1] = inputStrength;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v14 = objc_msgSend(v3, "applyWithExtent:arguments:", v13, v5, v7, v9, v11);

  return v14;
}

@end