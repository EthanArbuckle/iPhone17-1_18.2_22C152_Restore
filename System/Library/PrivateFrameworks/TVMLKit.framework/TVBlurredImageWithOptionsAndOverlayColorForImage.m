@interface TVBlurredImageWithOptionsAndOverlayColorForImage
@end

@implementation TVBlurredImageWithOptionsAndOverlayColorForImage

void ___TVBlurredImageWithOptionsAndOverlayColorForImage_block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F00628];
  uint64_t v5 = *MEMORY[0x263F00858];
  v1 = [MEMORY[0x263EFF9D0] null];
  v6[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 contextWithOptions:v2];
  v4 = (void *)_TVBlurredImageWithOptionsAndOverlayColorForImage___ciContext;
  _TVBlurredImageWithOptionsAndOverlayColorForImage___ciContext = v3;
}

@end