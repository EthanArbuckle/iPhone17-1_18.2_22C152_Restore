@interface PUAdjustmentsToolControllerSpec
- (double)sliderLength;
- (double)standardBottomBarHeight;
@end

@implementation PUAdjustmentsToolControllerSpec

- (double)sliderLength
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 294.0;
  if (v2 >= 5) {
    return 0.0;
  }
  return result;
}

- (double)standardBottomBarHeight
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 141.0;
  if (v2 >= 5) {
    return 0.0;
  }
  return result;
}

@end