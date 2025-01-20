@interface SBUISystemApertureLayoutMetrics
+ (BOOL)_screenPixelWidthIsEven;
+ (CGSize)_deviceNativeScreenSizeInPoints;
+ (id)sharedInstanceForEmbeddedDisplay;
- (CGRect)interSensorRegionInWindowSpace;
- (CGSize)compactConcentricAreaSize;
- (CGSize)expandedConcentricAreaSize;
- (CGSize)maximumCompactSize;
- (CGSize)maximumExpandedSize;
- (CGSize)maximumHorizontalMinimalViewSize;
- (CGSize)maximumLeadingTrailingViewSize;
- (CGSize)maximumMicroNoticeSize;
- (CGSize)maximumPossibleSizeWhilePresentingMenu;
- (CGSize)microNoticeConcentricAreaSize;
- (CGSize)minimumExpandedSize;
- (CGSize)minimumMicroNoticeSize;
- (CGSize)minimumMinimalSize;
- (CGSize)sensorRegionSize;
- (NSDirectionalEdgeInsets)compactLegibleAreaInsets;
- (NSDirectionalEdgeInsets)expandedControlsAreaInsets;
- (NSDirectionalEdgeInsets)expandedLegibleAreaInsets;
- (NSDirectionalEdgeInsets)minimumScreenEdgeInsets;
- (double)_maximumWidth;
- (double)_minimumScreenEdgeInset;
- (double)maximumContinuousCornerRadius;
- (double)minimumContinuousCornerRadius;
@end

@implementation SBUISystemApertureLayoutMetrics

+ (id)sharedInstanceForEmbeddedDisplay
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SBUISystemApertureLayoutMetrics_sharedInstanceForEmbeddedDisplay__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstanceForEmbeddedDisplay_onceToken != -1) {
    dispatch_once(&sharedInstanceForEmbeddedDisplay_onceToken, block);
  }
  v2 = (void *)sharedInstanceForEmbeddedDisplay_sharedInstanceForEmbeddedDisplay;
  return v2;
}

- (CGRect)interSensorRegionInWindowSpace
{
  [(id)objc_opt_class() _deviceNativeScreenSizeInPoints];
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self sensorRegionSize];
  double v6 = v4 + (v4 - v5) * -0.5 + -9.0 + -36.6666667;
  [(SBUISystemApertureLayoutMetrics *)self _minimumScreenEdgeInset];
  double v8 = v7;
  double v9 = 36.6666667;
  double v10 = 9.0;
  double v11 = v6;
  result.size.height = v9;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v11;
  return result;
}

- (CGSize)sensorRegionSize
{
  int v2 = [(id)objc_opt_class() _screenPixelWidthIsEven];
  double v3 = 125.0;
  if (v2) {
    double v3 = 125.333333;
  }
  double v4 = 36.6666667;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)_screenPixelWidthIsEven
{
  if (_screenPixelWidthIsEven___onceToken != -1) {
    dispatch_once(&_screenPixelWidthIsEven___onceToken, &__block_literal_global_2);
  }
  return _screenPixelWidthIsEven___isEvenWidth;
}

- (double)maximumContinuousCornerRadius
{
  double v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 _displayCornerRadiusIgnoringZoom];
  double v5 = v4;
  [(SBUISystemApertureLayoutMetrics *)self _minimumScreenEdgeInset];
  double v7 = v5 - v6;

  return v7;
}

- (NSDirectionalEdgeInsets)minimumScreenEdgeInsets
{
  [(SBUISystemApertureLayoutMetrics *)self _minimumScreenEdgeInset];
  double v3 = v2;
  double v4 = v2;
  double v5 = v2;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)_minimumScreenEdgeInset
{
  uint64_t v2 = SBFEffectiveArtworkSubtype();
  BOOL v3 = v2 == 2622 || v2 == 2868;
  double result = 11.3333333;
  if (v3) {
    return 14.0;
  }
  return result;
}

+ (CGSize)_deviceNativeScreenSizeInPoints
{
  if (_deviceNativeScreenSizeInPoints___onceToken != -1) {
    dispatch_once(&_deviceNativeScreenSizeInPoints___onceToken, &__block_literal_global_30);
  }
  double v2 = *(double *)&_deviceNativeScreenSizeInPoints___screenSize_0;
  double v3 = *(double *)&_deviceNativeScreenSizeInPoints___screenSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __67__SBUISystemApertureLayoutMetrics_sharedInstanceForEmbeddedDisplay__block_invoke(uint64_t a1)
{
  sharedInstanceForEmbeddedDisplay_sharedInstanceForEmbeddedDisplay = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (CGSize)minimumMinimalSize
{
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)maximumHorizontalMinimalViewSize
{
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v3 = 45.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (CGSize)maximumCompactSize
{
  [(id)objc_opt_class() _deviceNativeScreenSizeInPoints];
  double v4 = v3 + -73.3333333;
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)maximumLeadingTrailingViewSize
{
  [(SBUISystemApertureLayoutMetrics *)self maximumCompactSize];
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  UIFloorToScale();
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)compactConcentricAreaSize
{
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (NSDirectionalEdgeInsets)compactLegibleAreaInsets
{
  double v2 = 0.0;
  double v3 = 10.0;
  double v4 = 0.0;
  double v5 = 10.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (CGSize)minimumMicroNoticeSize
{
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  double v3 = v2 + 185.333333;
  double v4 = 66.6666667;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)maximumMicroNoticeSize
{
  [(id)objc_opt_class() _deviceNativeScreenSizeInPoints];
  double v4 = v3 + -66.6666667;
  [(SBUISystemApertureLayoutMetrics *)self minimumMicroNoticeSize];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)microNoticeConcentricAreaSize
{
  [(SBUISystemApertureLayoutMetrics *)self minimumMicroNoticeSize];
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self minimumMicroNoticeSize];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)minimumExpandedSize
{
  [(SBUISystemApertureLayoutMetrics *)self _maximumWidth];
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self expandedConcentricAreaSize];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)maximumExpandedSize
{
  [(SBUISystemApertureLayoutMetrics *)self _maximumWidth];
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self _maximumWidth];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)expandedConcentricAreaSize
{
  double v2 = 82.0;
  double v3 = 84.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSDirectionalEdgeInsets)expandedLegibleAreaInsets
{
  double v2 = 29.0;
  double v3 = 29.0;
  double v4 = 17.0;
  double v5 = 29.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)expandedControlsAreaInsets
{
  double v2 = 0.0;
  double v3 = 20.0;
  double v4 = 17.0;
  double v5 = 20.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)minimumContinuousCornerRadius
{
  [(SBUISystemApertureLayoutMetrics *)self _inertSize];
  return v2 * 0.5;
}

- (CGSize)maximumPossibleSizeWhilePresentingMenu
{
  [(id)objc_opt_class() _deviceNativeScreenSizeInPoints];
  double v3 = v2 + v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_maximumWidth
{
  [(id)objc_opt_class() _deviceNativeScreenSizeInPoints];
  double v4 = v3;
  [(SBUISystemApertureLayoutMetrics *)self _minimumScreenEdgeInset];
  return v4 + v5 * -2.0;
}

double __66__SBUISystemApertureLayoutMetrics__deviceNativeScreenSizeInPoints__block_invoke()
{
  v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 nativeBounds];
  double v2 = v1;
  double v4 = v3;

  double v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 scale];
  double v7 = v6;

  double result = v2 / v7;
  *(double *)&_deviceNativeScreenSizeInPoints___screenSize_0 = v2 / v7;
  *(double *)&_deviceNativeScreenSizeInPoints___screenSize_1 = v4 / v7;
  return result;
}

void __58__SBUISystemApertureLayoutMetrics__screenPixelWidthIsEven__block_invoke()
{
  v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 nativeBounds];
  double v2 = v1;

  _screenPixelWidthIsEven___isEvenWidth = ((unint64_t)v2 & 1) == 0;
}

@end