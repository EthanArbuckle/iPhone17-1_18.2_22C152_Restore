@interface SBUILegibilityMetalEngineConfiguration
@end

@implementation SBUILegibilityMetalEngineConfiguration

void __80___SBUILegibilityMetalEngineConfiguration__prepareImageForConvolution_settings___block_invoke(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  id v3 = [MEMORY[0x1E4F428B8] blackColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v3 CGColor]);

  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -*(double *)(a1 + 48));
  v4 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  CGContextDrawImage(CurrentContext, *(CGRect *)&v5, v4);
}

@end