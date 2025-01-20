@interface PIIPTHueChromaFilter
+ (id)convertHueChromaImageToIPT:(id)a3;
+ (id)convertHueChromaImageToRGB:(id)a3;
+ (id)convertIPTImageToHueChroma:(id)a3;
+ (id)convertIPTImageToRGB:(id)a3;
+ (id)convertRGBImageToHueChroma:(id)a3;
+ (id)convertRGBImageToIPT:(id)a3;
+ (id)denormalizeHueChromaImage:(id)a3;
+ (id)hueChromaKernels;
+ (id)kernelNamed:(id)a3;
+ (id)normalizeHueChromaImage:(id)a3;
+ (id)scaleHueKernel;
@end

@implementation PIIPTHueChromaFilter

+ (id)convertHueChromaImageToRGB:(id)a3
{
  v4 = [a1 convertHueChromaImageToIPT:a3];
  v5 = [a1 convertIPTImageToRGB:v4];

  return v5;
}

+ (id)convertRGBImageToHueChroma:(id)a3
{
  v4 = [a1 convertRGBImageToIPT:a3];
  v5 = [a1 convertIPTImageToHueChroma:v4];

  return v5;
}

+ (id)convertHueChromaImageToIPT:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    v4 = [(id)objc_opt_class() kernelNamed:@"ipt_from_hue_chroma"];
    [v3 extent];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v16[0] = v3;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    v14 = objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)convertIPTImageToHueChroma:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    v4 = [(id)objc_opt_class() kernelNamed:@"ipt_to_hue_chroma"];
    [v3 extent];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v16[0] = v3;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    v14 = objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)convertIPTImageToRGB:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    v4 = [(id)objc_opt_class() kernelNamed:@"ipt_to_srgb"];
    [v3 extent];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v16[0] = v3;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    v14 = objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)convertRGBImageToIPT:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    v4 = [(id)objc_opt_class() kernelNamed:@"ipt_from_srgb"];
    [v3 extent];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v16[0] = v3;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    v14 = objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)denormalizeHueChromaImage:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v18 = NUAssertLogger_2645();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_2645();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        __int16 v34 = 2114;
        v35 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  double v5 = [(id)objc_opt_class() scaleHueKernel];
  [v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v31[0] = v4;
  v14 = [MEMORY[0x1E4F1E080] vectorWithX:6.28318531 Y:-3.14159265];
  v31[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v16 = objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);

  return v16;
}

+ (id)normalizeHueChromaImage:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v18 = NUAssertLogger_2645();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_2645();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        __int16 v34 = 2114;
        v35 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  double v5 = [(id)objc_opt_class() scaleHueKernel];
  [v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v31[0] = v4;
  v14 = [MEMORY[0x1E4F1E080] vectorWithX:0.159154943 Y:0.5];
  v31[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v16 = objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);

  return v16;
}

+ (id)scaleHueKernel
{
  return (id)[a1 kernelNamed:@"ipt_hue_chroma_scale_hue"];
}

+ (id)kernelNamed:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    double v9 = NUAssertLogger_2645();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v23 = v10;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v11 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v13 = NUAssertLogger_2645();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific(*v11);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v23 = v17;
        __int16 v24 = 2114;
        v25 = v21;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v23 = v16;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v5 = v4;
  double v6 = [a1 hueChromaKernels];
  double v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

+ (id)hueChromaKernels
{
  if (hueChromaKernels_onceToken != -1) {
    dispatch_once(&hueChromaKernels_onceToken, &__block_literal_global_2671);
  }
  v2 = (void *)hueChromaKernels_kernels;
  return v2;
}

uint64_t __40__PIIPTHueChromaFilter_hueChromaKernels__block_invoke()
{
  hueChromaKernels_kernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:@"kernel vec4 ipt_from_srgb(__sample im)\n{\nvec3 lms = im.r * vec3(0.3139902162, 0.15537240628, 0.01775238698) +\nim.g * vec3(0.63951293834, 0.75789446163, 0.1094420944) +\nim.b * vec3(0.04649754622, 0.08670141862, 0.87256922462)\nlms = sign(lms)*pow(abs(lms), vec3(0.43));\nvec3 ipt = lms.r * vec3(0.4, 4.455, 0.8056) +\nlms.g * vec3(0.4, -4.851, 0.3572) +\nlms.b * vec3(0.2, 0.396,-1.1628);\nreturn vec4(ipt, im.a);\n}\nkernel vec4 ipt_to_srgb(__sample ipt)\n{\nvec3 lms = ipt.r * vec3(1.0000, 1.0000, 1.0000) +\nipt.g * vec3(0.0976,-0.1139, 0.0326) +\nipt.b * vec3(0.2052, 0.1332,-0.6769);\nlms = sign(lms)*pow(abs(lms), vec3(1.0/.43));\nvec3 im = lms.r * vec3(5.472212058380287, -1.125241895533569, 0.029801651173470) +\nlms.g * vec3(-4.641960098354471, 2.293170938060623, -0.193180728257140) +\nlms.b * vec3(0.169637076827974, -0.167895202223709, 1.163647892783812);\nreturn vec4(im, ipt.a);\n}\nkernel vec4 ipt_to_hue_chroma(__sample im)\n{\nvec4 ihc = im;\nihc.g = atan(im.b, im.g);\nihc.b = sqrt(im.g*im.g+im.b*im.b);\nreturn ihc;\n}\nkernel vec4 ipt_from_hue_chroma(__sample ihc)\n{\nvec4 ipt = ihc;\nipt.g = ihc.b * cos(ihc.g);\nipt.b = ihc.b * sin(ihc.g);\nreturn ipt;\n}\nkernel vec4 ipt_hue_chroma_scale_hue(__sample ihc, vec2 hso) {\nfloat luma = ihc.r;\nfloat hue = ihc.g;\nfloat chroma = ihc.b;\nfloat alpha = ihc.a;\nfloat hueScale = hso.x;\nfloat hueOffset = hso.y;\nhue = hueScale * hue + hueOffset;\nreturn vec4(luma, hue, chroma, alpha);\n}\nkernel vec4 ipt_hue_chroma_filter_hue(__sample ihc, vec4 hcr) {\nfloat luma = ihc.r;\nfloat hue = ihc.g;\nfloat chroma = ihc.b;\nfloat alpha = ihc.a;\nfloat hueTarget = hcr.x;\nfloat hueRange = hcr.y;\nfloat hueModulo = hcr.z;\nfloat chromaMin = hcr.w;\nfloat chromaFactor = step(chromaMin, chroma);\nfloat hueDelta = min(abs(hue - hueTarget), min(abs(hue + hueModulo - hueTarget), abs(hue - hueModulo - hueTarget)));\nfloat hueFactor = 1.0 - smoothstep(0.0, hueRange, hueDelta);\nalpha *= hueFactor * chromaFactor;\nreturn vec4(luma, hue, chroma, alpha);\n}\nkernel vec4 ipt_hue_chroma_filter_luma(__sample ihc, vec3 hcr) {\nfloat luma = ihc.r;\nfloat hue = ihc.g;\nfloat chroma = ihc.b;\nfloat alpha = ihc.a;\nfloat lumaTarget = hcr.x;\nfloat lumaRange = hcr.y;\nfloat chromaMax = hcr.z;\nfloat chromaFactor = 1.0 - step(chromaMax, chroma);\nfloat lumaDelta = abs(luma - lumaTarget);\nfloat lumaFactor = 1.0 - smoothstep(0.0, lumaRange, lumaDelta);\nalpha *= lumaFactor * chromaFactor;\nreturn vec4(luma, hue, chroma, alpha);\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
}

@end