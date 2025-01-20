@interface BCCardStackConfiguration
+ (id)createCardSetPresentationTimingParameters;
+ (id)createCardSetPresentationTimingParametersWithInitialVelocity:(CGVector)a3;
- (BCCardStackConfiguration)initWithEnvironment:(id)a3;
- (BOOL)cardsCanExpand;
- (double)animationExtraCardGap;
- (double)auxiliaryNavigationBarBlurBleedHeight;
- (double)auxiliaryNavigationBarHorizontalInset;
- (double)auxiliaryNavigationBarVerticalInset;
- (double)auxiliaryNavigationBarVisibilityOffset;
- (double)cardContractedScale;
- (double)cardCornerRadius;
- (double)cardExpandedTopOffset;
- (double)cardGap;
- (double)cardPeekWidth;
- (double)cardUnexpandedTopOffset;
- (double)contractedCardWidthForContainerWidth:(double)a3;
- (double)macOSCoverAnimationThreshold;
- (double)maxCardGap;
- (double)maxCardWidth;
- (double)minCardGap;
- (double)toolbarHeight;
- (int64_t)_viewport;
- (unint64_t)cardBufferCount;
- (void)setToolbarHeight:(double)a3;
@end

@implementation BCCardStackConfiguration

- (BCCardStackConfiguration)initWithEnvironment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCCardStackConfiguration;
  return [(BCLayoutConfiguration *)&v4 initWithViewController:0 configurationEnvironment:a3];
}

- (int64_t)_viewport
{
  v2 = [(BCLayoutConfiguration *)self environment];
  [v2 screenSize];
  int64_t v5 = BCViewportSize(v3, v4);

  return v5;
}

- (double)cardExpandedTopOffset
{
  unsigned int v2 = [(BCCardStackConfiguration *)self cardsCanExpand];
  double result = -100.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)cardUnexpandedTopOffset
{
  double v3 = [(BCLayoutConfiguration *)self environment];
  [v3 defaultStatusBarHeight];
  double v5 = v4;

  v6 = +[UIDevice currentDevice];
  if ([v6 userInterfaceIdiom] != (char *)&def_7D91C + 1) {
    goto LABEL_4;
  }
  v7 = [(BCLayoutConfiguration *)self environment];
  if ([v7 isCompactWidth])
  {

LABEL_4:
    double v8 = 0.0;
    goto LABEL_8;
  }
  int v9 = _os_feature_enabled_impl();

  if (v9) {
    double v8 = v5;
  }
  else {
    double v8 = 0.0;
  }
LABEL_8:
  unsigned int v10 = [(BCCardStackConfiguration *)self cardsCanExpand];
  double v11 = 44.0;
  if (v10) {
    double v11 = 13.0;
  }
  return v8 + v5 + v11;
}

- (double)cardGap
{
  unsigned __int8 v3 = [(BCCardStackConfiguration *)self cardsCanExpand];
  double result = 4.0;
  if ((v3 & 1) == 0)
  {
    int64_t v5 = [(BCCardStackConfiguration *)self _viewport];
    double result = 4.0;
    if (v5 == 2) {
      double result = 8.0;
    }
    if (v5 == 3) {
      return 12.0;
    }
  }
  return result;
}

- (double)cardCornerRadius
{
  unsigned int v2 = [(BCLayoutConfiguration *)self environment];
  if ([v2 isCompactWidth]) {
    double v3 = 12.0;
  }
  else {
    double v3 = 16.0;
  }

  return v3;
}

- (double)auxiliaryNavigationBarHorizontalInset
{
  unsigned int v2 = [(BCLayoutConfiguration *)self environment];
  if ([v2 isCompactWidth]) {
    double v3 = 12.0;
  }
  else {
    double v3 = 15.0;
  }

  return v3;
}

- (double)auxiliaryNavigationBarVerticalInset
{
  unsigned int v2 = [(BCLayoutConfiguration *)self environment];
  if ([v2 isCompactWidth]) {
    double v3 = 12.0;
  }
  else {
    double v3 = 15.0;
  }

  return v3;
}

- (double)auxiliaryNavigationBarVisibilityOffset
{
  if ([(BCCardStackConfiguration *)self cardsCanExpand])
  {
    double v3 = [(BCLayoutConfiguration *)self environment];
    [v3 defaultStatusBarHeight];
    double v5 = v4;

    return v5;
  }
  else
  {
    [(BCCardStackConfiguration *)self auxiliaryNavigationBarBlurBleedHeight];
  }
  return result;
}

- (double)auxiliaryNavigationBarBlurBleedHeight
{
  return 24.0;
}

- (double)cardPeekWidth
{
  return 12.0;
}

- (BOOL)cardsCanExpand
{
  char v3 = _os_feature_enabled_impl();
  double v4 = [(BCLayoutConfiguration *)self environment];
  unsigned __int8 v5 = [v4 isCompactWidth];
  char v6 = v3 ^ 1 | v5;
  if ((v3 & 1) == 0 && (v5 & 1) == 0)
  {
    [v4 size];
    double v8 = v7;
    [(BCCardStackConfiguration *)self maxCardWidth];
    char v6 = v8 <= v9;
  }

  return v6;
}

- (double)cardContractedScale
{
  unsigned int v3 = [(BCCardStackConfiguration *)self cardsCanExpand];
  double result = 1.0;
  if (v3)
  {
    unsigned __int8 v5 = [(BCLayoutConfiguration *)self environment];
    [v5 size];
    double v7 = v6;

    [(BCCardStackConfiguration *)self cardGap];
    double v9 = v8;
    [(BCCardStackConfiguration *)self cardPeekWidth];
    return (v7 + (v9 + v10) * -2.0) / v7;
  }
  return result;
}

- (unint64_t)cardBufferCount
{
  return 2;
}

- (double)maxCardWidth
{
  return 678.0;
}

+ (id)createCardSetPresentationTimingParameters
{
  unsigned int v2 = objc_opt_class();

  return [v2 createCardSetPresentationTimingParametersWithInitialVelocity:0.0, 0.0];
}

+ (id)createCardSetPresentationTimingParametersWithInitialVelocity:(CGVector)a3
{
  id v3 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:380.0 damping:32.0 initialVelocity:a3.dx, a3.dy];

  return v3;
}

- (double)contractedCardWidthForContainerWidth:(double)a3
{
  [(BCCardStackConfiguration *)self cardPeekWidth];
  double v6 = a3 - v5 * 2.0;
  [(BCCardStackConfiguration *)self cardGapForContainerWidth:a3];
  double v8 = v6 - v7 * 2.0;
  [(BCCardStackConfiguration *)self maxCardWidth];
  if (v8 < result) {
    return v8;
  }
  return result;
}

- (double)minCardGap
{
  return self->_minCardGap;
}

- (double)maxCardGap
{
  return self->_maxCardGap;
}

- (double)macOSCoverAnimationThreshold
{
  return self->_macOSCoverAnimationThreshold;
}

- (double)animationExtraCardGap
{
  return self->_animationExtraCardGap;
}

- (double)toolbarHeight
{
  return self->_toolbarHeight;
}

- (void)setToolbarHeight:(double)a3
{
  self->_toolbarHeight = a3;
}

@end