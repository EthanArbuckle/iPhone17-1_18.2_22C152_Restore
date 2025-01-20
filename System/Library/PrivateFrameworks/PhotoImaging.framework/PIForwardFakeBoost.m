@interface PIForwardFakeBoost
+ (id)kernelFB0;
+ (id)kernelFB3;
@end

@implementation PIForwardFakeBoost

+ (id)kernelFB3
{
  if (kernelFB3_onceToken != -1) {
    dispatch_once(&kernelFB3_onceToken, &__block_literal_global_81);
  }
  v2 = (void *)kernelFB3_kernel;
  return v2;
}

void __31__PIForwardFakeBoost_kernelFB3__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 forwardBoost3(__sample im, float boost, vec4 abcd, vec3 p0, vec3 p1) {\nfloat a = abcd.x\nfloat b = abcd.y;\nfloat c = abcd.z;\nfloat d = abcd.w;\nvec3 x = im.rgb;\nvec3 f = (a * x + b) / (c * x + d);\nfloat x0 = p0.x;\nfloat y0 = p0.y;\nfloat s0 = p0.z;\nfloat a0 = y0*y0;\nfloat c0 = y0 - s0*x0;\nfloat d0 = s0*x0*x0;\nvec3 f0 = (a0 * x) / (c0 * x + d0);\nvec3 l0 = (a0 / d0) * x;\nf0 = compare(x, l0, f0);\nfloat x1 = p1.x;\nfloat y1 = p1.y;\nfloat s1 = p1.z;\nfloat a1 = (1.f-y1)*(1.f-y1);\nfloat c1 = (1.f-y1) - s1*(1.f-x1);\nfloat d1 = s1 *(1.f-x1)*(1.f-x1);\nvec3 f1 = 1.f - (a1 * (1.f - x)) / (c1 * (1.f - x) + d1);\nvec3 l1 = 1.f - (a1 / d1) * (1.f - x);\nf1 = compare(1.f - x, l1, f1);\nf = compare(x - p0.x, f0, compare(x - p1.x, f, f1));\nim.rgb = mix(im.rgb, f, boost);\nreturn im;\n}\n\n"];;
  v1 = (void *)kernelFB3_kernel;
  kernelFB3_kernel = v0;

  if (!kernelFB3_kernel)
  {
    v2 = NUAssertLogger_12800();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [NSString stringWithFormat:@"boost kernel is nil"];
      int v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A9680000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v4 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v6 = NUAssertLogger_12800();
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

+ (id)kernelFB0
{
  if (kernelFB0_onceToken != -1) {
    dispatch_once(&kernelFB0_onceToken, &__block_literal_global_12900);
  }
  v2 = (void *)kernelFB0_kernel;
  return v2;
}

void __31__PIForwardFakeBoost_kernelFB0__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 forwardBoostWithBoost(sampler image, float boost) {\nvec4 im = sample(image, samplerCoord(image))\nvec4 orig = im;\nfloat n = 1.8;\nfloat k = 0.8;\nvec3 pos = max(im.rgb, k) - k;\nvec3 neg = min(im.rgb, 0.0);\nneg *= 2.8;\nim.rgb = clamp(im.rgb, 0.0, k);\nim.rgb = ((1.0+n)*im.rgb)/(1.0+(n*im.rgb)) + neg;\nim.r = pos.r > 0.0 ? (.91803 + .470304*pos.r) : im.r;\nim.g = pos.g > 0.0 ? (.91803 + .470304*pos.g) : im.g;\nim.b = pos.b > 0.0 ? (.91803 + .470304*pos.b) : im.b;\nim.rgb = mix(orig.rgb, im.rgb, boost);\nreturn im;\n}\n\n"];;
  v1 = (void *)kernelFB0_kernel;
  kernelFB0_kernel = v0;

  if (!kernelFB0_kernel)
  {
    v2 = NUAssertLogger_12800();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [NSString stringWithFormat:@"boost kernel is nil"];
      int v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A9680000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v4 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v6 = NUAssertLogger_12800();
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

@end