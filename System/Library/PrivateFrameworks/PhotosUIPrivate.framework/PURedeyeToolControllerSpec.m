@interface PURedeyeToolControllerSpec
- (BOOL)displaysTooltipAtTopInPortrait;
- (double)tooltipLandscapeMargin;
- (double)tooltipPortraitMargin;
@end

@implementation PURedeyeToolControllerSpec

- (BOOL)displaysTooltipAtTopInPortrait
{
  return (unint64_t)[(PUViewControllerSpec *)self currentLayoutStyle] < 4;
}

- (double)tooltipLandscapeMargin
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 0.0;
  if (v2 <= 4) {
    return dbl_1AEFF8470[v2];
  }
  return result;
}

- (double)tooltipPortraitMargin
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 0.0;
  if (v2 <= 4) {
    return dbl_1AEFF8448[v2];
  }
  return result;
}

@end