@interface PIColorBalanceFilter
+ (id)PPtogHDRKernel;
+ (id)colorBalanceKernel;
+ (id)colorBalanceKernels;
+ (id)customAttributes;
+ (id)gHDRtoPPKernel;
- (CIImage)inputImage;
- (NSNumber)inputHasFace;
- (NSNumber)inputIsRaw;
- (NSNumber)inputStrength;
- (NSNumber)inputWarmTemp;
- (NSNumber)inputWarmTint;
- (id)applyInputConversion:(id)a3;
- (id)applyOutputConversion:(id)a3;
- (id)outputImage;
- (void)setInputHasFace:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIsRaw:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWarmTemp:(id)a3;
- (void)setInputWarmTint:(id)a3;
@end

@implementation PIColorBalanceFilter

+ (id)colorBalanceKernel
{
  v2 = [a1 colorBalanceKernels];
  v3 = [v2 objectForKeyedSubscript:@"colorBalance"];

  return v3;
}

+ (id)PPtogHDRKernel
{
  v2 = [a1 colorBalanceKernels];
  v3 = [v2 objectForKeyedSubscript:@"PPtogHDR"];

  return v3;
}

+ (id)gHDRtoPPKernel
{
  v2 = [a1 colorBalanceKernels];
  v3 = [v2 objectForKeyedSubscript:@"gHDRtoPP"];

  return v3;
}

+ (id)colorBalanceKernels
{
  if (colorBalanceKernels_onceToken != -1) {
    dispatch_once(&colorBalanceKernels_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)colorBalanceKernels_colorBalanceKernels;
  return v2;
}

uint64_t __43__PIColorBalanceFilter_colorBalanceKernels__block_invoke()
{
  colorBalanceKernels_colorBalanceKernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:@"kernel vec4 gHDRtoPP(sampler image)\n{\nvec4 pix \nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(0.615429622407401, 0.114831839141528, 0.011544126697221) +\npix.g * vec3(0.367479646665836, 0.797943554457996, 0.064077744191180) +\npix.b * vec3(  0.016956659608091, 0.087783443422360, 0.924405601458102);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 PPtogHDR(sampler image)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(1.777445503202045, -0.255296595099306, -0.004500433755654) +\npix.g * vec3( -0.822224875430495, 1.380948853784730, -0.085456231694984) +\npix.b * vec3(0.045475917061484, -0.126454737973025, 1.089973874037625);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 colorBalance(__sample image, float colorI, float colorQ, float str, vec2 gamma)\n{\nvec4 pix = image;\nvec3 neg = min(pix.rgb, 0.0);\nvec3 pos = max(pix.rgb, 1.0) - 1.0;\npix.rgb = pow(clamp(pix.rgb, 0.0, 1.0), vec3(gamma.x));\npix.rgb = pix.r * vec3(0.299, 0.595716, 0.211456) +\npix.g * vec3(0.587, -0.274453, -0.522591) +\npix.b * vec3(0.114, -0.321263, 0.311135);\nvec4 orig = pix ;\nfloat chroma = min(1.0, 2.0*sqrt(pix.g*pix.g + pix.b*pix.b));\npix.gb += vec2(colorI,colorQ);\nfloat strength = str*pow(chroma, .4) ;\npix.gb = mix(orig.gb, pix.gb, strength) ;\npix.rgb = pix.rrr +\npix.g * vec3(0.956296, -0.272122, -1.10699) +\npix.b * vec3(0.621024, -0.647381, 1.70461);\npix.rgb = pow(max(pix.rgb, 0.0), vec3(gamma.y));\npix.rgb += pos + neg;\nreturn pix;\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
}

+ (id)customAttributes
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29[0] = @"inputStrength";
  uint64_t v3 = *MEMORY[0x1E4F1E0E8];
  v23[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v2 = v23[0];
  v23[1] = v3;
  v28[0] = &unk_1F000A598;
  v28[1] = &unk_1F000A598;
  uint64_t v5 = *MEMORY[0x1E4F1E098];
  uint64_t v24 = *MEMORY[0x1E4F1E0E0];
  uint64_t v4 = v24;
  uint64_t v25 = v5;
  v28[2] = &unk_1F000A5A8;
  v28[3] = &unk_1F000A5B8;
  uint64_t v7 = *MEMORY[0x1E4F1E0F0];
  uint64_t v26 = *MEMORY[0x1E4F1E0C8];
  uint64_t v6 = v26;
  uint64_t v27 = v7;
  uint64_t v8 = *MEMORY[0x1E4F1E158];
  v28[4] = &unk_1F000A598;
  v28[5] = v8;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v23 count:6];
  v30[0] = v16;
  v29[1] = @"inputWarmTemp";
  v21[0] = v2;
  v21[1] = v3;
  v22[0] = &unk_1F000A5C8;
  v22[1] = &unk_1F000A5D8;
  uint64_t v9 = *MEMORY[0x1E4F1E0D0];
  v21[2] = v4;
  v21[3] = v9;
  v22[2] = &unk_1F000A5E8;
  v22[3] = &unk_1F000A5A8;
  v21[4] = v5;
  v21[5] = v6;
  v22[4] = &unk_1F000A598;
  v22[5] = &unk_1F000A598;
  v21[6] = v7;
  v22[6] = v8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v30[1] = v10;
  v29[2] = @"inputWarmTint";
  v19[0] = v2;
  v19[1] = v3;
  v20[0] = &unk_1F000A5C8;
  v20[1] = &unk_1F000A5F8;
  v19[2] = v4;
  v19[3] = v9;
  v20[2] = &unk_1F000A5B8;
  v20[3] = &unk_1F000A5A8;
  v19[4] = v5;
  v19[5] = v6;
  v20[4] = &unk_1F000A598;
  v20[5] = &unk_1F000A598;
  v19[6] = v7;
  v20[6] = v8;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:7];
  v30[2] = v11;
  v29[3] = @"inputHasFace";
  v17[0] = v5;
  v17[1] = v7;
  uint64_t v12 = *MEMORY[0x1E4F1E100];
  v18[0] = MEMORY[0x1E4F1CC28];
  v18[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v30[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputIsRaw, 0);
  objc_storeStrong((id *)&self->_inputHasFace, 0);
  objc_storeStrong((id *)&self->_inputStrength, 0);
  objc_storeStrong((id *)&self->_inputWarmTint, 0);
  objc_storeStrong((id *)&self->_inputWarmTemp, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputIsRaw:(id)a3
{
}

- (NSNumber)inputIsRaw
{
  return self->_inputIsRaw;
}

- (void)setInputHasFace:(id)a3
{
}

- (NSNumber)inputHasFace
{
  return self->_inputHasFace;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->_inputStrength;
}

- (void)setInputWarmTint:(id)a3
{
}

- (NSNumber)inputWarmTint
{
  return self->_inputWarmTint;
}

- (void)setInputWarmTemp:(id)a3
{
}

- (NSNumber)inputWarmTemp
{
  return self->_inputWarmTemp;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)outputImage
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!self->_inputImage)
  {
    v28 = NUAssertLogger_17311();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v32 = NUAssertLogger_17311();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        __int16 v44 = 2114;
        v45 = v40;
        _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  [(NSNumber *)self->_inputWarmTemp floatValue];
  double v4 = v3 * 0.25;
  [(NSNumber *)self->_inputWarmTint floatValue];
  double v6 = v5 * 0.25;
  double v7 = v6 * 0.0385 + v4 * 0.9615;
  double v8 = v6 * 0.1923 + v4 * -0.1923;
  inputImage = self->_inputImage;
  if (fabs(v7) + fabs(v8) >= 0.00000001)
  {
    v11 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
    if ([(NSNumber *)self->_inputHasFace BOOLValue])
    {
      if ([(NSNumber *)self->_inputIsRaw BOOLValue])
      {
        uint64_t v12 = objc_msgSend(v11, "imageByColorMatchingWorkingSpaceToColorSpace:", +[PIRAWFaceBalance linearWideGamutColorSpace](PIRAWFaceBalance, "linearWideGamutColorSpace"));
        v13 = [MEMORY[0x1E4F1E078] samplerWithImage:v12];
      }
      else
      {
        v13 = [MEMORY[0x1E4F1E078] samplerWithImage:v11];
      }
    }
    else
    {
      uint64_t v15 = [(PIColorBalanceFilter *)self applyInputConversion:v11];

      v13 = [MEMORY[0x1E4F1E078] samplerWithImage:v15];
      v11 = (void *)v15;
    }
    v41[0] = v13;
    *(float *)&double v14 = v7;
    v16 = [NSNumber numberWithFloat:v14];
    v41[1] = v16;
    *(float *)&double v17 = v8;
    v18 = [NSNumber numberWithFloat:v17];
    inputStrength = self->_inputStrength;
    v41[2] = v18;
    v41[3] = inputStrength;
    v20 = [MEMORY[0x1E4F1E080] vectorWithX:0.25 Y:4.0];
    v41[4] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];

    v22 = [(id)objc_opt_class() colorBalanceKernel];
    [v13 extent];
    v23 = objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_17325, v21);

    if ([(NSNumber *)self->_inputHasFace BOOLValue])
    {
      if ([(NSNumber *)self->_inputIsRaw BOOLValue])
      {
        objc_msgSend(v23, "imageByColorMatchingColorSpaceToWorkingSpace:", +[PIRAWFaceBalance linearWideGamutColorSpace](PIRAWFaceBalance, "linearWideGamutColorSpace"));
        id v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v24 = v23;
      }
    }
    else
    {
      id v24 = [(PIColorBalanceFilter *)self applyOutputConversion:v23];
    }
    uint64_t v25 = v24;
    [(CIImage *)self->_inputImage extent];
    uint64_t v26 = objc_msgSend(v25, "imageByCroppingToRect:");
    v10 = [v26 imageByPremultiplyingAlpha];
  }
  else
  {
    v10 = inputImage;
  }
  return v10;
}

- (id)applyOutputConversion:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  float v3 = [MEMORY[0x1E4F1E078] samplerWithImage:a3];
  v8[0] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  float v5 = [(id)objc_opt_class() PPtogHDRKernel];
  [v3 extent];
  double v6 = objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_17325, v4);

  return v6;
}

- (id)applyInputConversion:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  float v3 = [MEMORY[0x1E4F1E078] samplerWithImage:a3];
  v8[0] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  float v5 = [(id)objc_opt_class() gHDRtoPPKernel];
  [v3 extent];
  double v6 = objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_17325, v4);

  return v6;
}

@end