@interface PUPosterSettingsController
- (CGSize)preferredContentSize;
@end

@implementation PUPosterSettingsController

- (CGSize)preferredContentSize
{
  double v2 = 520.0;
  double v3 = 600.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end