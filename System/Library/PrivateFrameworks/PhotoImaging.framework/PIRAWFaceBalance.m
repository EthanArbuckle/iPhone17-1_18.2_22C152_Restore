@interface PIRAWFaceBalance
+ (CGColorSpace)linearWideGamutColorSpace;
+ (CGColorSpace)newLinearWideGamutColorSpace;
+ (id)faceBalanceKernels;
- (CIImage)inputImage;
- (double)inputOrigI;
- (double)inputOrigQ;
- (double)inputStrength;
- (double)inputWarmth;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputOrigI:(double)a3;
- (void)setInputOrigQ:(double)a3;
- (void)setInputStrength:(double)a3;
- (void)setInputWarmth:(double)a3;
@end

@implementation PIRAWFaceBalance

+ (CGColorSpace)linearWideGamutColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PIRAWFaceBalance_linearWideGamutColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (linearWideGamutColorSpace_onceToken != -1) {
    dispatch_once(&linearWideGamutColorSpace_onceToken, block);
  }
  return (CGColorSpace *)linearWideGamutColorSpace_s_linearWideGamutColorSpaceRef;
}

uint64_t __45__PIRAWFaceBalance_linearWideGamutColorSpace__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) newLinearWideGamutColorSpace];
  linearWideGamutColorSpace_s_linearWideGamutColorSpaceRef = result;
  return result;
}

+ (CGColorSpace)newLinearWideGamutColorSpace
{
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&newLinearWideGamutColorSpace_data length:529];
  v3 = (CGColorSpace *)MEMORY[0x1AD0F79E0]();

  return v3;
}

+ (id)faceBalanceKernels
{
  if (faceBalanceKernels_onceToken != -1) {
    dispatch_once(&faceBalanceKernels_onceToken, &__block_literal_global_17037);
  }
  v2 = (void *)faceBalanceKernels_faceBalanceKernels;
  return v2;
}

uint64_t __38__PIRAWFaceBalance_faceBalanceKernels__block_invoke()
{
  faceBalanceKernels_faceBalanceKernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:@"kernel vec4 facebalance(__sample src, vec2 gamma, vec3 matchMinusOrigStrength)\n{\nvec4 pix = src\npix.rgb = pow(max(pix.rgb, 0.0), vec3(gamma.x));\npix.rgb = pix.r * vec3(0.299, 0.595716, 0.211456) +\npix.g * vec3(0.587, -0.274453, -0.522591) +\npix.b * vec3(0.114, -0.321263, 0.311135);\nvec4 orig = pix ;\nfloat chroma = min(1.0, 2.0*sqrt(pix.g*pix.g + pix.b*pix.b));\npix.gb +=  matchMinusOrigStrength.rg;\nfloat strength = matchMinusOrigStrength.z*pow(chroma, .4) ;\npix.gb = mix(orig.gb, pix.gb, strength) ;\npix.rgb = pix.rrr +\npix.g * vec3(0.956296, -0.272122, -1.10699) +\npix.b * vec3(0.621024, -0.647381, 1.70461);\npix.rgb = max(pix.rgb, vec3(0.0));\npix.rgb = pow(pix.rgb, vec3(gamma.y));\nreturn pix;\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (void)setInputWarmth:(double)a3
{
  self->_inputWarmth = a3;
}

- (double)inputWarmth
{
  return self->_inputWarmth;
}

- (void)setInputStrength:(double)a3
{
  self->_inputStrength = a3;
}

- (double)inputStrength
{
  return self->_inputStrength;
}

- (void)setInputOrigQ:(double)a3
{
  self->_inputOrigQ = a3;
}

- (double)inputOrigQ
{
  return self->_inputOrigQ;
}

- (void)setInputOrigI:(double)a3
{
  self->_inputOrigI = a3;
}

- (double)inputOrigI
{
  return self->_inputOrigI;
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
  v41[3] = *MEMORY[0x1E4F143B8];
  v3 = [(PIRAWFaceBalance *)self inputImage];
  [(PIRAWFaceBalance *)self inputWarmth];
  double v5 = v4;
  [(PIRAWFaceBalance *)self inputWarmth];
  double v7 = (1.0 - v6) * 0.005 + v5 * 0.105;
  [(PIRAWFaceBalance *)self inputWarmth];
  double v9 = v8;
  [(PIRAWFaceBalance *)self inputWarmth];
  double v11 = (1.0 - v10) * 0.01 + v9 * -0.01;
  [(PIRAWFaceBalance *)self inputOrigI];
  double v13 = v12;
  [(PIRAWFaceBalance *)self inputOrigQ];
  if (vabdd_f64(v7, v13) + vabdd_f64(v11, v14) >= 0.00000001)
  {
    double v16 = v7 - v13;
    double v17 = v11 - v14;
    uint64_t v18 = [(id)objc_opt_class() linearWideGamutColorSpace];
    v19 = [(id)objc_opt_class() faceBalanceKernels];
    v20 = [v19 objectForKeyedSubscript:@"facebalance"];

    v21 = [(PIRAWFaceBalance *)self inputImage];
    v22 = [v21 imageByColorMatchingWorkingSpaceToColorSpace:v18];

    [v22 extent];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    v31 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:", 0.25, 4.0, v22);
    v41[1] = v31;
    v32 = (void *)MEMORY[0x1E4F1E080];
    [(PIRAWFaceBalance *)self inputStrength];
    v34 = [v32 vectorWithX:v16 Y:v17 Z:v33];
    v41[2] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
    v36 = objc_msgSend(v20, "applyWithExtent:arguments:", v35, v24, v26, v28, v30);

    v37 = [v36 imageByColorMatchingColorSpaceToWorkingSpace:v18];

    v38 = [(PIRAWFaceBalance *)self inputImage];
    [v38 extent];
    v39 = objc_msgSend(v37, "imageByCroppingToRect:");

    id v15 = v39;
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

@end