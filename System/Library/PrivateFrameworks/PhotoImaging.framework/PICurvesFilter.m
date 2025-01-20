@interface PICurvesFilter
+ (id)curvesKernel;
- (CIImage)inputImage;
- (CIImage)inputTableImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputTableImage:(id)a3;
@end

@implementation PICurvesFilter

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
  v23[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(PICurvesFilter *)self inputImage];
  uint64_t v4 = [(PICurvesFilter *)self inputTableImage];
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:2.0];
    v8 = [MEMORY[0x1E4F1E080] vectorWithX:0.998046875 Y:0.0009765625];
    v9 = [v3 imageByUnpremultiplyingAlpha];

    v10 = +[PICurvesFilter curvesKernel];
    [v9 extent];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v23[0] = v9;
    v23[1] = v5;
    v23[2] = v7;
    v23[3] = v8;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    v20 = objc_msgSend(v10, "applyWithExtent:arguments:", v19, v12, v14, v16, v18);

    v21 = [v20 imageByPremultiplyingAlpha];

    id v3 = v21;
    v6 = v3;
  }

  return v6;
}

+ (id)curvesKernel
{
  if (+[PICurvesFilter curvesKernel]::onceToken != -1) {
    dispatch_once(&+[PICurvesFilter curvesKernel]::onceToken, &__block_literal_global_17213);
  }
  v2 = (void *)+[PICurvesFilter curvesKernel]::curvesKernel;
  return v2;
}

uint64_t __30__PICurvesFilter_curvesKernel__block_invoke()
{
  +[PICurvesFilter curvesKernel]::curvesKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"vec4 curve_sample(float x, sampler2D table, vec2 domain, vec2 normalizer)\n{\nx = (x - domain.x) / (domain.y - domain.x)\nx = clamp(x, 0.0001, 0.9999);\nx = normalizer.x * x + normalizer.y;\nreturn texture2D(table, vec2(x, 0.5));\n}\nkernel vec4 curves_rgb_lum(__sample color, sampler2D table, vec2 domain, vec2 normalizer)\n{\nvec4 pixel = color;\npixel.r = curve_sample(pixel.r, table, domain, normalizer).r;\npixel.g = curve_sample(pixel.g, table, domain, normalizer).g;\npixel.b = curve_sample(pixel.b, table, domain, normalizer).b;\nfloat lum0 = dot(pixel.rgb, vec3(0.3, 0.59, 0.11));\nfloat lum1 = curve_sample(lum0, table, domain, normalizer).a;\nfloat lum1c = clamp(lum1, -8.0 * abs(lum0), 8.0 * abs(lum0));\nfloat lum_scale = (lum0 == 0.0 ? 0.0 : lum1c / lum0);\nfloat lum_offset = lum1 - lum1c;\npixel.rgb = lum_scale * pixel.rgb + lum_offset;\nreturn pixel;\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
}

@end