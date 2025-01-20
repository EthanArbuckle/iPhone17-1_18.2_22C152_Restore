@interface PUVFXImageGenerator
- (CGRect)extent;
- (CIFilter)backgroundCompositingFilter;
- (CIFilter)gradientCompositingFilter;
- (CIFilter)gradientFilter;
- (CIImage)generatedFieldImage;
- (CIImage)inputImage;
- (NSNumber)innerParticleSize;
- (NSNumber)particleSize;
- (PUVFXImageGenerator)init;
- (double)maxEDR;
- (id)_outputImageWithForeground:(id)a3;
- (id)blendForeground:(id)a3 withBackground:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)outputImage;
- (id)outputImages;
- (void)generateFieldWithColors:(id)a3 count:(unint64_t)a4;
- (void)setBackgroundCompositingFilter:(id)a3;
- (void)setExtent:(CGRect)a3;
- (void)setGeneratedFieldImage:(id)a3;
- (void)setGradientCompositingFilter:(id)a3;
- (void)setGradientFilter:(id)a3;
- (void)setInnerParticleSize:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setMaxEDR:(double)a3;
- (void)setParticleSize:(id)a3;
@end

@implementation PUVFXImageGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCompositingFilter, 0);
  objc_storeStrong((id *)&self->_gradientCompositingFilter, 0);
  objc_storeStrong((id *)&self->_innerParticleSize, 0);
  objc_storeStrong((id *)&self->_particleSize, 0);
  objc_storeStrong((id *)&self->_gradientFilter, 0);
  objc_storeStrong((id *)&self->_generatedFieldImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setMaxEDR:(double)a3
{
  self->_maxEDR = a3;
}

- (double)maxEDR
{
  return self->_maxEDR;
}

- (void)setBackgroundCompositingFilter:(id)a3
{
}

- (CIFilter)backgroundCompositingFilter
{
  return self->_backgroundCompositingFilter;
}

- (void)setGradientCompositingFilter:(id)a3
{
}

- (CIFilter)gradientCompositingFilter
{
  return self->_gradientCompositingFilter;
}

- (CGRect)extent
{
  double x = self->_extent.origin.x;
  double y = self->_extent.origin.y;
  double width = self->_extent.size.width;
  double height = self->_extent.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInnerParticleSize:(id)a3
{
}

- (NSNumber)innerParticleSize
{
  return self->_innerParticleSize;
}

- (void)setParticleSize:(id)a3
{
}

- (NSNumber)particleSize
{
  return self->_particleSize;
}

- (void)setGradientFilter:(id)a3
{
}

- (CIFilter)gradientFilter
{
  return self->_gradientFilter;
}

- (void)setGeneratedFieldImage:(id)a3
{
}

- (CIImage)generatedFieldImage
{
  return self->_generatedFieldImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)blendForeground:(id)a3 withBackground:(id)a4
{
  v5 = NSString;
  double maxEDR = self->_maxEDR;
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v5, "stringWithFormat:", @"kernel vec4 customBlend(__sample foreground, __sample background) {   vec4 result;   result.r = min(min(1.0, foreground.r + background.r) * %f, %f);   result.g = min(min(1.0, foreground.g + background.g) * %f, %f);   result.b = min(min(1.0, foreground.b + background.b) * %f, %f);   result.a = background.a;   return result;}",
    *(void *)&maxEDR,
    *(void *)&maxEDR,
    *(void *)&maxEDR,
    *(void *)&maxEDR,
    *(void *)&maxEDR,
  v9 = *(void *)&maxEDR);
  v10 = [MEMORY[0x1E4F1E000] kernelWithString:v9];
  v11 = [v10 applyWithForeground:v8 background:v7];

  return v11;
}

- (id)outputImage
{
  return [(PUVFXImageGenerator *)self _outputImageWithForeground:self->_generatedFieldImage];
}

- (id)_outputImageWithForeground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUVFXImageGenerator *)self inputImage];
  id v6 = (id)v5;
  if (v4)
  {
    if (v5)
    {
      id v7 = [(PUVFXImageGenerator *)self blendForeground:v4 withBackground:v5];

      id v8 = [(PUVFXImageGenerator *)self inputImage];
      [v8 extent];
      objc_msgSend(v7, "imageByCroppingToRect:");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = v4;
    }
  }

  return v6;
}

- (id)outputImages
{
  v3 = objc_opt_new();
  id v4 = [(PUVFXImageGenerator *)self outputImage];
  [v3 addObject:v4];

  uint64_t v5 = [(CIImage *)self->_generatedFieldImage imageByApplyingCGOrientation:3];
  id v6 = [(PUVFXImageGenerator *)self _outputImageWithForeground:v5];
  [v3 addObject:v6];

  return v3;
}

- (void)generateFieldWithColors:(id)a3 count:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __53__PUVFXImageGenerator_generateFieldWithColors_count___block_invoke;
  v31 = &unk_1E5F29FD8;
  v32 = self;
  id v7 = PFMap();
  id v8 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
  v9 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [v8 setValue:v9 forKey:*MEMORY[0x1E4F1E448]];

  v25 = v8;
  uint64_t v10 = [v8 outputImage];
  v11 = (void *)v10;
  if (a4 < 2)
  {
    v22 = (void *)v10;
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F1E480];
    uint64_t v13 = *MEMORY[0x1E4F1E418];
    unint64_t v14 = a4 - 1;
    do
    {
      double v15 = (double)arc4random() / 4294967300.0;
      [(PUVFXImageGenerator *)self extent];
      CGFloat v16 = v15 * CGRectGetWidth(v33);
      double v17 = (double)arc4random() / 4294967300.0;
      [(PUVFXImageGenerator *)self extent];
      CGFloat Height = CGRectGetHeight(v34);
      memset(&v27, 0, sizeof(v27));
      CGAffineTransformMakeTranslation(&v27, v16, v17 * Height);
      v19 = objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random() % (unint64_t)objc_msgSend(v6, "count"));
      CGAffineTransform v26 = v27;
      v20 = [v19 imageByApplyingTransform:&v26];

      v21 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
      [v21 setValue:v20 forKey:v12];
      [v21 setValue:v11 forKey:v13];
      v22 = [v21 outputImage];

      v11 = v22;
      --v14;
    }
    while (v14);
  }
  [(PUVFXImageGenerator *)self extent];
  objc_msgSend(v22, "imageByCroppingToRect:");
  v23 = (CIImage *)objc_claimAutoreleasedReturnValue();
  generatedFieldImage = self->_generatedFieldImage;
  self->_generatedFieldImage = v23;
}

id __53__PUVFXImageGenerator_generateFieldWithColors_count___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1E080];
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v6 = a2;
  id v7 = objc_msgSend(v3, "vectorWithCGPoint:", v4, v5);
  id v8 = [MEMORY[0x1E4F1E040] radialGradientFilter];
  [v8 setValue:*(void *)(*(void *)(a1 + 32) + 104) forKey:@"inputRadius1"];
  [v8 setValue:*(void *)(*(void *)(a1 + 32) + 112) forKey:@"inputRadius0"];
  [v8 setValue:v7 forKey:@"inputCenter"];
  v9 = (void *)MEMORY[0x1E4F1E008];
  id v10 = v6;
  uint64_t v11 = [v10 CGColor];

  uint64_t v12 = [v9 colorWithCGColor:v11];
  [v8 setValue:v12 forKey:@"inputColor0"];

  uint64_t v13 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [v8 setValue:v13 forKey:@"inputColor1"];

  unint64_t v14 = [v8 outputImage];

  return v14;
}

- (void)setExtent:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_extent = &self->_extent;
  if (!CGRectEqualToRect(a3, self->_extent))
  {
    p_extent->origin.CGFloat x = x;
    p_extent->origin.CGFloat y = y;
    p_extent->size.CGFloat width = width;
    p_extent->size.CGFloat height = height;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  double v4 = objc_opt_new();
  objc_msgSend(v4, "setExtent:", self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height);
  double v5 = [(PUVFXImageGenerator *)self particleSize];
  [v4 setParticleSize:v5];

  id v6 = [(PUVFXImageGenerator *)self innerParticleSize];
  [v4 setInnerParticleSize:v6];

  id v7 = [(PUVFXImageGenerator *)self backgroundCompositingFilter];
  [v4 setBackgroundCompositingFilter:v7];

  id v8 = [(PUVFXImageGenerator *)self gradientCompositingFilter];
  [v4 setGradientCompositingFilter:v8];

  return v4;
}

- (PUVFXImageGenerator)init
{
  v15.receiver = self;
  v15.super_class = (Class)PUVFXImageGenerator;
  v2 = [(PUVFXImageGenerator *)&v15 init];
  particleSize = v2->_particleSize;
  v2->_particleSize = (NSNumber *)&unk_1F078CA40;

  innerParticleSize = v2->_innerParticleSize;
  v2->_innerParticleSize = (NSNumber *)&unk_1F078CA58;

  v2->_double maxEDR = 1.0;
  double v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  id v7 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  uint64_t v8 = objc_msgSend(v5, "filterWithName:keysAndValues:", @"CIRadialGradient", @"inputColor0", v6, @"inputColor1", v7, @"inputRadius0", v2->_innerParticleSize, @"inputRadius1", v2->_particleSize, 0);
  gradientFilter = v2->_gradientFilter;
  v2->_gradientFilter = (CIFilter *)v8;

  uint64_t v10 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
  gradientCompositingFilter = v2->_gradientCompositingFilter;
  v2->_gradientCompositingFilter = (CIFilter *)v10;

  uint64_t v12 = [MEMORY[0x1E4F1E040] filterWithName:@"CILinearDodgeBlendMode"];
  backgroundCompositingFilter = v2->_backgroundCompositingFilter;
  v2->_backgroundCompositingFilter = (CIFilter *)v12;

  return v2;
}

@end