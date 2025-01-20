@interface UIDevice(SXAdditions)
+ (uint64_t)sx_isSpectreDevice;
@end

@implementation UIDevice(SXAdditions)

+ (uint64_t)sx_isSpectreDevice
{
  if (sx_isSpectreDevice_onceToken != -1) {
    dispatch_once(&sx_isSpectreDevice_onceToken, &__block_literal_global_76);
  }
  return sx_isSpectreDevice_hasExtendedColorDisplay;
}

@end