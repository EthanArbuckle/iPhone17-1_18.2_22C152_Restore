@interface NUHDRDivideGainMapFilter
+ (id)lightMapDivideKernel;
+ (id)lightMapDivideRGBKernel;
+ (id)lightMapLogDivideKernel;
+ (id)lightMapLogDivideRGBKernel;
- (CIImage)inputImage;
- (CIImage)inputLightMap;
- (NSNumber)inputMixFactor;
- (NSNumber)inputPreserveColor;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputLightMap:(id)a3;
- (void)setInputMixFactor:(id)a3;
- (void)setInputPreserveColor:(id)a3;
@end

@implementation NUHDRDivideGainMapFilter

+ (id)lightMapDivideRGBKernel
{
  if (lightMapDivideRGBKernel_once != -1) {
    dispatch_once(&lightMapDivideRGBKernel_once, &__block_literal_global_259);
  }
  v2 = (void *)lightMapDivideRGBKernel_s_lightMapDivideRGBKernel;

  return v2;
}

uint64_t __51__NUHDRDivideGainMapFilter_lightMapDivideRGBKernel__block_invoke()
{
  lightMapDivideRGBKernel_s_lightMapDivideRGBKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 lightMapDivideRGB(__sample im, __sample lm) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0) \n  float iml = dot(im.rgb, weq); \n  float imx = max(max(im.r, im.g), im.b); \n  float luma = 0.5 * (iml + imx); \n  float lml = dot(lm.rgb, weq); \n  float lmx = max(max(lm.r, lm.g), lm.b); \n  float light = 0.5 * (lml + lmx); \n  light = min(light, luma); \n  const float e = 0.01; \n  luma = (1 - e) * luma + e; \n  float gain = light/luma; \n  gain = (gain - e)/(1 - e); \n  return vec4(gain, gain, gain, 1.0); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

+ (id)lightMapDivideKernel
{
  if (lightMapDivideKernel_once != -1) {
    dispatch_once(&lightMapDivideKernel_once, &__block_literal_global_254);
  }
  v2 = (void *)lightMapDivideKernel_s_lightMapDivideKernel;

  return v2;
}

uint64_t __48__NUHDRDivideGainMapFilter_lightMapDivideKernel__block_invoke()
{
  lightMapDivideKernel_s_lightMapDivideKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 lightMapDivide(__sample im, __sample lm) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0) \n  float luma = dot(im.rgb, weq); \n  float maxRGB = max(max(im.r, im.g), im.b); \n  luma = 0.5 * (luma + maxRGB); \n  float light = lm.r; \n  light = min(light, luma); \n  const float e = 0.01; \n  luma = (1.f - e) * luma + e; \n  float gain = light/luma; \n  gain = (gain - e)/(1.f - e); \n  return vec4(gain, gain, gain, 1.0); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

+ (id)lightMapLogDivideRGBKernel
{
  if (lightMapLogDivideRGBKernel_once != -1) {
    dispatch_once(&lightMapLogDivideRGBKernel_once, &__block_literal_global_249);
  }
  v2 = (void *)lightMapLogDivideRGBKernel_s_lightMapDivideRGBKernel;

  return v2;
}

uint64_t __54__NUHDRDivideGainMapFilter_lightMapLogDivideRGBKernel__block_invoke()
{
  lightMapLogDivideRGBKernel_s_lightMapDivideRGBKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 lightMapDivideRGB(__sample im, __sample lm, float2 a) \n{ \n  float3 color = log2(1.0 + im.rgb) \n  float3 light = log2(1.0 + lm.rgb); \n  float3 glog2 = a.x * light + a.y * color; \n  float3 gain = exp2(glog2) - 1.0; \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0); \n  float g = dot(gain, weq); \n  return vec4(g, g, g, 1.0); \n }\n"];;

  return MEMORY[0x1F41817F8]();
}

+ (id)lightMapLogDivideKernel
{
  if (lightMapLogDivideKernel_once != -1) {
    dispatch_once(&lightMapLogDivideKernel_once, &__block_literal_global_244_9951);
  }
  v2 = (void *)lightMapLogDivideKernel_s_lightMapDivideKernel;

  return v2;
}

uint64_t __51__NUHDRDivideGainMapFilter_lightMapLogDivideKernel__block_invoke()
{
  lightMapLogDivideKernel_s_lightMapDivideKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 lightMapDivide(__sample im, __sample lm, float2 a) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0) \n  float luma = dot(im.rgb, weq); \n  float maxRGB = max(max(im.r, im.g), im.b); \n  luma = 0.5 * (luma + maxRGB); \n  luma = log2(1.0 + luma); \n  float light = dot(lm.rgb, weq); \n  light = log2(1.0 +light); \n  float glog2 = a.x * light + a.y * luma; \n  float g = exp2(glog2) - 1.0; \n  return vec4(g, g, g, 1.0); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMixFactor, 0);
  objc_storeStrong((id *)&self->_inputPreserveColor, 0);
  objc_storeStrong((id *)&self->_inputLightMap, 0);

  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputMixFactor:(id)a3
{
}

- (NSNumber)inputMixFactor
{
  return self->_inputMixFactor;
}

- (void)setInputPreserveColor:(id)a3
{
}

- (NSNumber)inputPreserveColor
{
  return self->_inputPreserveColor;
}

- (void)setInputLightMap:(id)a3
{
}

- (CIImage)inputLightMap
{
  return self->_inputLightMap;
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
  v29[3] = *MEMORY[0x1E4F143B8];
  v3 = [(NUHDRDivideGainMapFilter *)self inputImage];
  uint64_t v4 = [(NUHDRDivideGainMapFilter *)self inputLightMap];
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = [(NUHDRDivideGainMapFilter *)self inputPreserveColor];
    int v8 = [v7 BOOLValue];

    v9 = [(NUHDRDivideGainMapFilter *)self inputMixFactor];
    [v9 floatValue];
    float v11 = v10;

    v12 = objc_opt_class();
    if (v11 == 0.0)
    {
      if (v8) {
        [v12 lightMapDivideRGBKernel];
      }
      else {
        [v12 lightMapDivideKernel];
      }
    }
    else if (v8)
    {
      [v12 lightMapLogDivideRGBKernel];
    }
    else
    {
      [v12 lightMapLogDivideKernel];
    uint64_t v13 = };
    v14 = (void *)v13;
    [v5 extent];
    double v16 = v15;
    double v18 = v17;
    [v3 extent];
    CGAffineTransformMakeScale(&v27, v16 / v19, v18 / v20);
    uint64_t v21 = [v3 imageByApplyingTransform:&v27];
    v22 = (void *)v21;
    if (v11 == 0.0)
    {
      v28[0] = v21;
      v28[1] = v5;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    }
    else
    {
      float v23 = fmaxf(fminf(1.0 - v11, 1.0), 0.0);
      v29[0] = v21;
      v29[1] = v5;
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1E080]) initWithX:(float)(1.0 / (float)(1.0 - v23)) Y:(float)((float)-v23 / (float)(1.0 - v23))];
      v29[2] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    }
    [v5 extent];
    v6 = objc_msgSend(v14, "applyWithExtent:arguments:", v25);
  }

  return v6;
}

@end