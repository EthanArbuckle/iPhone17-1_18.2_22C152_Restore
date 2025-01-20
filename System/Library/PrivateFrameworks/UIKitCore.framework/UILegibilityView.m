@interface UILegibilityView
@end

@implementation UILegibilityView

CGImage *__51___UILegibilityView_setSettings_image_shadowImage___block_invoke(void *a1)
{
  result = (CGImage *)[a1 CGImage];
  if (result)
  {
    v2 = result;
    size_t BitsPerPixel = CGImageGetBitsPerPixel(result);
    return (CGImage *)(BitsPerPixel == CGImageGetBitsPerComponent(v2));
  }
  return result;
}

@end