@interface PINeutralGrayWhiteBalanceFilter
+ (id)PPtogHDRKernel;
+ (id)RGBToYIQKernel;
+ (id)YIQToRGBKernel;
+ (id)colorBalanceKernels;
+ (id)customAttributes;
+ (id)gHDRtoPPKernel;
+ (id)whiteBalanceKernel;
- (BOOL)isDefaultWarmth:(double)a3;
- (CIImage)inputImage;
- (NSNumber)i;
- (NSNumber)q;
- (NSNumber)strength;
- (NSNumber)warmth;
- (NSNumber)y;
- (id)applyInputConversion:(id)a3;
- (id)applyOutputConversion:(id)a3;
- (id)outputImage;
- (void)setI:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setQ:(id)a3;
- (void)setStrength:(id)a3;
- (void)setWarmth:(id)a3;
- (void)setY:(id)a3;
@end

@implementation PINeutralGrayWhiteBalanceFilter

+ (id)whiteBalanceKernel
{
  v2 = [a1 colorBalanceKernels];
  v3 = [v2 objectForKeyedSubscript:@"whiteBalance"];

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

+ (id)YIQToRGBKernel
{
  v2 = [a1 colorBalanceKernels];
  v3 = [v2 objectForKeyedSubscript:@"convertFromYIQToRGB"];

  return v3;
}

+ (id)RGBToYIQKernel
{
  v2 = [a1 colorBalanceKernels];
  v3 = [v2 objectForKeyedSubscript:@"convertFromRGBToYIQ"];

  return v3;
}

+ (id)colorBalanceKernels
{
  if (colorBalanceKernels_onceToken_24654 != -1) {
    dispatch_once(&colorBalanceKernels_onceToken_24654, &__block_literal_global_18);
  }
  v2 = (void *)colorBalanceKernels_colorBalanceKernels_24655;
  return v2;
}

uint64_t __54__PINeutralGrayWhiteBalanceFilter_colorBalanceKernels__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:@"kernel vec4 convertFromRGBToYIQ(sampler src, float gamma)\n{\nvec4 pix \nvec3 pix2;\npix = sample(src, samplerCoord(src));\npix.rgb = sign(pix.rgb)*pow(abs(pix.rgb), vec3(1.0/gamma)) ;\npix2.rgb = pix.r * vec3(0.299, 0.595716, 0.211456) +\npix.g * vec3(0.587, -0.274453, -0.522591) +\npix.b * vec3(0.114, -0.321263, 0.311135);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 convertFromYIQToRGB(sampler src, float gamma)\n{\nvec4 color, pix;\npix = sample(src, samplerCoord(src));\ncolor.rgb = pix.rrr +\npix.g * vec3(0.956296, -0.272122, -1.10699) +\npix.b * vec3(0.621024, -0.647381, 1.70461);\ncolor.rgb = sign(color.rgb)*pow(abs(color.rgb), vec3(gamma, gamma, gamma));\ncolor.a = pix.a;\nreturn color;\n}\nkernel vec4 whiteBalance(sampler image, float grayY, float grayI, float grayQ, float strength)\n{\nvec4 im = sample(image, samplerCoord(image)) ;\nvec2 grayOffset = vec2(grayI, grayQ) ;\nvec4 result ;\nfloat newStrength = 1.0 + (strength-1.0)*(1.0-im.r) ;\nresult.r = im.r ;\nresult.gb = im.gb + newStrength*grayOffset ;\nfloat damp = max(min(1.0, im.r/(grayY+0.00001)),0.0) ;\nresult.rgb = mix(im.rgb, result.rgb, damp) ;\nresult.a = im.a ;\nreturn result ;\n}\nkernel vec4 gHDRtoPP(sampler image)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(0.615429622407401, 0.114831839141528, 0.011544126697221) +\npix.g * vec3(0.367479646665836, 0.797943554457996, 0.064077744191180) +\npix.b * vec3(  0.016956659608091, 0.087783443422360, 0.924405601458102);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 PPtogHDR(sampler image)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(1.777445503202045, -0.255296595099306, -0.004500433755654) +\npix.g * vec3( -0.822224875430495, 1.380948853784730, -0.085456231694984) +\npix.b * vec3(0.045475917061484, -0.126454737973025, 1.089973874037625);\nreturn vec4(pix2, pix.a);\n}\n\n"];;
  uint64_t v1 = colorBalanceKernels_colorBalanceKernels_24655;
  colorBalanceKernels_colorBalanceKernels_24655 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)customAttributes
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = @"strength";
  uint64_t v3 = *MEMORY[0x1E4F1E0E8];
  v15[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v2 = v15[0];
  v15[1] = v3;
  v20[0] = &unk_1F000A978;
  v20[1] = &unk_1F000A978;
  uint64_t v5 = *MEMORY[0x1E4F1E098];
  uint64_t v16 = *MEMORY[0x1E4F1E0E0];
  uint64_t v4 = v16;
  uint64_t v17 = v5;
  v20[2] = &unk_1F000A988;
  v20[3] = &unk_1F000A998;
  uint64_t v7 = *MEMORY[0x1E4F1E0F0];
  uint64_t v18 = *MEMORY[0x1E4F1E0C8];
  uint64_t v6 = v18;
  uint64_t v19 = v7;
  uint64_t v8 = *MEMORY[0x1E4F1E158];
  v20[4] = &unk_1F000A9A8;
  v20[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v15 count:6];
  v21[1] = @"warmth";
  v22[0] = v9;
  v13[0] = v2;
  v13[1] = v3;
  v14[0] = &unk_1F000A978;
  v14[1] = &unk_1F000A978;
  v13[2] = v4;
  v13[3] = v5;
  v14[2] = &unk_1F000A998;
  v14[3] = &unk_1F000A9B8;
  v13[4] = v6;
  v13[5] = v7;
  v14[4] = &unk_1F000A9A8;
  v14[5] = v8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  v22[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_i, 0);
  objc_storeStrong((id *)&self->_y, 0);
  objc_storeStrong((id *)&self->_warmth, 0);
  objc_storeStrong((id *)&self->_strength, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setQ:(id)a3
{
}

- (NSNumber)q
{
  return self->_q;
}

- (void)setI:(id)a3
{
}

- (NSNumber)i
{
  return self->_i;
}

- (void)setY:(id)a3
{
}

- (NSNumber)y
{
  return self->_y;
}

- (void)setWarmth:(id)a3
{
}

- (NSNumber)warmth
{
  return self->_warmth;
}

- (void)setStrength:(id)a3
{
}

- (NSNumber)strength
{
  return self->_strength;
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
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    v35 = NUAssertLogger_24718();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      *(_DWORD *)buf = 138543362;
      v50 = v36;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v37 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v39 = NUAssertLogger_24718();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v40)
      {
        v43 = dispatch_get_specific(*v37);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v43;
        __int16 v51 = 2114;
        v52 = v47;
        _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v42;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v4 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
  uint64_t v5 = [(PINeutralGrayWhiteBalanceFilter *)self applyInputConversion:v4];
  uint64_t v6 = [MEMORY[0x1E4F1E078] samplerWithImage:v5];
  [(NSNumber *)self->_y floatValue];
  float v8 = v7;
  [(NSNumber *)self->_i floatValue];
  float v10 = v9;
  [(NSNumber *)self->_q floatValue];
  float v12 = v11;
  [(NSNumber *)self->_warmth floatValue];
  float v14 = v13;
  double v15 = v13;
  if (v10 == 0.0 && v12 == 0.0 && [(PINeutralGrayWhiteBalanceFilter *)self isDefaultWarmth:v13])
  {
    uint64_t v16 = self->_inputImage;
  }
  else
  {
    double v17 = v8;
    double v18 = (float)-v10;
    if (v14 >= 0.5)
    {
      double v19 = v15 + -0.5 + v15 + -0.5;
      double v20 = v18 + v19 * 0.100000001;
      double v21 = -0.0399999991;
    }
    else
    {
      double v19 = 0.5 - v15 + 0.5 - v15;
      double v20 = v18 + v19 * -0.0500000007;
      double v21 = 0.0199999996;
    }
    double v22 = (float)-v12 + v19 * v21;
    v48[0] = v6;
    v23 = [MEMORY[0x1E4F1E080] vectorWithX:v17];
    v48[1] = v23;
    v24 = [MEMORY[0x1E4F1E080] vectorWithX:v20];
    v48[2] = v24;
    v25 = [MEMORY[0x1E4F1E080] vectorWithX:v22];
    v48[3] = v25;
    v26 = (void *)MEMORY[0x1E4F1E080];
    [(NSNumber *)self->_strength floatValue];
    v28 = [v26 vectorWithX:v27];
    v48[4] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:5];

    v30 = [(id)objc_opt_class() whiteBalanceKernel];
    [v6 extent];
    v31 = objc_msgSend(v30, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_24730, v29);

    v32 = [(PINeutralGrayWhiteBalanceFilter *)self applyOutputConversion:v31];
    [(CIImage *)self->_inputImage extent];
    v33 = objc_msgSend(v32, "imageByCroppingToRect:");
    uint64_t v16 = [v33 imageByPremultiplyingAlpha];
  }
  return v16;
}

- (BOOL)isDefaultWarmth:(double)a3
{
  return fabs(a3 + -0.5) < 0.00001;
}

- (id)applyOutputConversion:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1E078] samplerWithImage:a3];
  v14[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1E080] vectorWithX:4.0];
  v14[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  uint64_t v6 = [(id)objc_opt_class() YIQToRGBKernel];
  [v3 extent];
  float v7 = objc_msgSend(v6, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_24730, v5);

  float v8 = [MEMORY[0x1E4F1E078] samplerWithImage:v7];

  float v13 = v8;
  float v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];

  float v10 = [(id)objc_opt_class() PPtogHDRKernel];
  [v8 extent];
  float v11 = objc_msgSend(v10, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_24730, v9);

  return v11;
}

- (id)applyInputConversion:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1E078] samplerWithImage:a3];
  v14[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v5 = [(id)objc_opt_class() gHDRtoPPKernel];
  [v3 extent];
  uint64_t v6 = objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_24730, v4);

  float v7 = [MEMORY[0x1E4F1E078] samplerWithImage:v6];

  float v8 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:", 4.0, v7);
  v13[1] = v8;
  float v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  float v10 = [(id)objc_opt_class() RGBToYIQKernel];
  [v7 extent];
  float v11 = objc_msgSend(v10, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_24730, v9);

  return v11;
}

@end