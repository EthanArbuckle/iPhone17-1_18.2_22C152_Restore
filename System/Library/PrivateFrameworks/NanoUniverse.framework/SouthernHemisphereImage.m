@interface SouthernHemisphereImage
@end

@implementation SouthernHemisphereImage

uint64_t ___SouthernHemisphereImage_block_invoke(int a1, id a2)
{
  v2 = (void *)MEMORY[0x263F827E8];
  id v3 = a2;
  uint64_t v4 = [v3 CGImage];
  [v3 scale];
  double v6 = v5;

  return [v2 imageWithCGImage:v4 scale:1 orientation:v6];
}

@end