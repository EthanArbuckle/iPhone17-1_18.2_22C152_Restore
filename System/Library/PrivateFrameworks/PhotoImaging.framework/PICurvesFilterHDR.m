@interface PICurvesFilterHDR
- (CIImage)inputImage;
- (CIImage)inputTableImage;
- (id)curvesKernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputTableImage:(id)a3;
@end

@implementation PICurvesFilterHDR

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputTableImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputTableImage:(id)a3
{
}

- (CIImage)inputTableImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
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
  v59[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(PICurvesFilterHDR *)self inputImage];
  uint64_t v4 = [(PICurvesFilterHDR *)self inputTableImage];
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:2.0];
    v8 = [MEMORY[0x1E4F1E080] vectorWithX:0.998046875 Y:0.0009765625];
    [MEMORY[0x1E4F7A4A0] HLGOpticalScale];
    double v10 = v9;
    unint64_t v11 = 0x1E4F7A000;
    if (v9 > 1.0)
    {
      v58[0] = @"inputRVector";
      v12 = [MEMORY[0x1E4F1E080] vectorWithX:4.92610837 / v9 Y:0.0 Z:0.0 W:0.0];
      v59[0] = v12;
      v58[1] = @"inputGVector";
      v13 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:4.92610837 / v10 Z:0.0 W:0.0];
      v59[1] = v13;
      v58[2] = @"inputBVector";
      v14 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:4.92610837 / v10 W:0.0];
      v59[2] = v14;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
      v15 = v52 = v7;
      v16 = [v3 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v15];

      v17 = [MEMORY[0x1E4F7A400] itur2100HLGColorSpace];
      v18 = [v17 linearized];
      v19 = [v18 extended];

      v20 = objc_msgSend(v16, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v19, "CGColorSpace"));

      v56[0] = @"inputMinComponents";
      v21 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
      v56[1] = @"inputMaxComponents";
      v57[0] = v21;
      v22 = [MEMORY[0x1E4F1E080] vectorWithX:4.92610837 Y:4.92610837 Z:4.92610837 W:1.0];
      v57[1] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
      v24 = [v20 imageByApplyingFilter:@"CIColorClamp" withInputParameters:v23];

      unint64_t v11 = 0x1E4F7A000uLL;
      objc_msgSend(v24, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v19, "CGColorSpace"));
      id v3 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v52;
    }
    v25 = [v3 imageByUnpremultiplyingAlpha];

    v26 = [*(id *)(v11 + 1024) itur2100HLGColorSpace];
    v27 = objc_msgSend(v25, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v26, "CGColorSpace"));

    v28 = [(PICurvesFilterHDR *)self curvesKernel];
    [v27 extent];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v55[0] = v27;
    v55[1] = v5;
    v55[2] = v7;
    v55[3] = v8;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
    v38 = objc_msgSend(v28, "applyWithExtent:arguments:", v37, v30, v32, v34, v36);

    v39 = [*(id *)(v11 + 1024) itur2100HLGColorSpace];
    v40 = objc_msgSend(v38, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v39, "CGColorSpace"));

    v41 = [v40 imageByPremultiplyingAlpha];

    if (v10 > 1.0)
    {
      v53[0] = @"inputRVector";
      double v42 = v10 / 4.92610837;
      v43 = [MEMORY[0x1E4F1E080] vectorWithX:v42 Y:0.0 Z:0.0 W:0.0];
      v54[0] = v43;
      v53[1] = @"inputGVector";
      v44 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:v42 Z:0.0 W:0.0];
      v54[1] = v44;
      v53[2] = @"inputBVector";
      v45 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:v42 W:0.0];
      v54[2] = v45;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
      v47 = unint64_t v46 = v11;
      uint64_t v48 = [v41 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v47];

      unint64_t v11 = v46;
      v41 = (void *)v48;
    }
    v49 = [*(id *)(v11 + 1024) workingColorSpace];
    v50 = objc_msgSend(v41, "imageByTaggingWithColorSpace:", objc_msgSend(v49, "CGColorSpace"));

    id v3 = v50;
    v6 = v3;
  }

  return v6;
}

- (id)curvesKernel
{
  if (curvesKernel_once != -1) {
    dispatch_once(&curvesKernel_once, &__block_literal_global_13462);
  }
  v2 = (void *)curvesKernel_singleton;
  return v2;
}

uint64_t __33__PICurvesFilterHDR_curvesKernel__block_invoke()
{
  curvesKernel_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"vec4 _curve_sample_HDR(float x, sampler2D table, vec2 domain, vec2 normalizer) { x = (x - domain.x) / (domain.y - domain.x) x = clamp(x, 0.0001, 0.9999); x = normalizer.x * x + normalizer.y; return texture2D(table, vec2(x, 0.5)); } kernel vec4 _curves_rgb_lum_HDR(__sample color, sampler2D table, vec2 domain, vec2 normalizer) { vec4 pixel = color; pixel.r = _curve_sample_HDR(pixel.r, table, domain, normalizer).r; pixel.g = _curve_sample_HDR(pixel.g, table, domain, normalizer).g; pixel.b = _curve_sample_HDR(pixel.b, table, domain, normalizer).b; float lum0 = dot(pixel.rgb, vec3(0.3, 0.59, 0.11)); float lum1 = _curve_sample_HDR(lum0, table, domain, normalizer).a; float lum1c = clamp(lum1, -8.0 * abs(lum0), 8.0 * abs(lum0)); float lum_scale = (lum0 == 0.0 ? 0.0 : lum1c / lum0); float lum_offset = lum1 - lum1c; pixel.rgb = lum_scale * pixel.rgb + lum_offset; pixel.rgb = min(pixel.rgb, 1.0); return pixel; }"];;
  return MEMORY[0x1F41817F8]();
}

@end