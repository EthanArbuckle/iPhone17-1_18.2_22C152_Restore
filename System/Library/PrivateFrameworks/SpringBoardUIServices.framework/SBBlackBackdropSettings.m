@interface SBBlackBackdropSettings
- (double)blurRadius;
- (id)combinedTintColor;
@end

@implementation SBBlackBackdropSettings

- (id)combinedTintColor
{
  return (id)[MEMORY[0x1E4F428B8] blackColor];
}

- (double)blurRadius
{
  return 5.0;
}

@end