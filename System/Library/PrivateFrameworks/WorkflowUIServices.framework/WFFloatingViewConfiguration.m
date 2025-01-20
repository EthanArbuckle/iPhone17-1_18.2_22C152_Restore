@interface WFFloatingViewConfiguration
+ (id)bannerImageConfiguration;
+ (id)materialWorkflowConfiguration;
+ (id)paletteColorConfiguration;
+ (id)widgetWorkflowConfiguration;
- (BOOL)appliesCornerRadiusDuringTouchDownOnly;
- (BOOL)colorizesShadow;
- (BOOL)usePillCornerRadius;
- (CGSize)shadowOffset;
- (WFFloatingViewConfiguration)init;
- (double)cornerRadius;
- (double)scalingFactor;
- (double)shadowRadius;
- (float)shadowOpacity;
- (int64_t)gradientDirection;
- (void)setAppliesCornerRadiusDuringTouchDownOnly:(BOOL)a3;
- (void)setColorizesShadow:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setGradientDirection:(int64_t)a3;
- (void)setScalingFactor:(double)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(float)a3;
- (void)setShadowRadius:(double)a3;
- (void)setUsePillCornerRadius:(BOOL)a3;
@end

@implementation WFFloatingViewConfiguration

- (double)cornerRadius
{
  return self->_cornerRadius;
}

+ (id)materialWorkflowConfiguration
{
  v2 = objc_opt_new();
  [v2 setCornerRadius:19.0];
  [v2 setShadowOpacity:0.0];
  [v2 setGradientDirection:4];
  return v2;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setShadowOpacity:(float)a3
{
  self->_shadowOpacity = a3;
}

- (void)setGradientDirection:(int64_t)a3
{
  self->_gradientDirection = a3;
}

- (WFFloatingViewConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFFloatingViewConfiguration;
  v2 = [(WFFloatingViewConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 0.970000029;
    v4 = v2;
  }

  return v3;
}

+ (id)paletteColorConfiguration
{
  v2 = objc_opt_new();
  [v2 setUsePillCornerRadius:1];
  [v2 setColorizesShadow:1];
  objc_msgSend(v2, "setShadowOffset:", 0.0, 2.0);
  LODWORD(v3) = 1036831949;
  [v2 setShadowOpacity:v3];
  [v2 setShadowRadius:5.0];
  [v2 setGradientDirection:4];
  return v2;
}

+ (id)bannerImageConfiguration
{
  v2 = objc_opt_new();
  [v2 setCornerRadius:13.0];
  [v2 setShadowOpacity:0.0];
  return v2;
}

+ (id)widgetWorkflowConfiguration
{
  v2 = objc_opt_new();
  [v2 setCornerRadius:9.0];
  [v2 setShadowOpacity:0.0];
  [v2 setGradientDirection:4];
  return v2;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setColorizesShadow:(BOOL)a3
{
  self->_colorizesShadow = a3;
}

- (BOOL)colorizesShadow
{
  return self->_colorizesShadow;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setAppliesCornerRadiusDuringTouchDownOnly:(BOOL)a3
{
  self->_appliesCornerRadiusDuringTouchDownOnly = a3;
}

- (BOOL)appliesCornerRadiusDuringTouchDownOnly
{
  return self->_appliesCornerRadiusDuringTouchDownOnly;
}

- (void)setUsePillCornerRadius:(BOOL)a3
{
  self->_usePillCornerRadius = a3;
}

- (BOOL)usePillCornerRadius
{
  return self->_usePillCornerRadius;
}

- (int64_t)gradientDirection
{
  return self->_gradientDirection;
}

@end