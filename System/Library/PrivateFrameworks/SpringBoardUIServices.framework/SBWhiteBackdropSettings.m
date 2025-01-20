@interface SBWhiteBackdropSettings
- (double)blurRadius;
- (id)combinedTintColor;
@end

@implementation SBWhiteBackdropSettings

- (id)combinedTintColor
{
  return (id)[MEMORY[0x1E4F428B8] whiteColor];
}

- (double)blurRadius
{
  return 5.0;
}

@end