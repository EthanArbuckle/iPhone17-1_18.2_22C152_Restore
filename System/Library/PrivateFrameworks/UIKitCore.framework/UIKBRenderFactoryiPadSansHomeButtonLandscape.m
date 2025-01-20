@interface UIKBRenderFactoryiPadSansHomeButtonLandscape
- (CGPoint)dualStringKeyBottomTextOffset;
- (CGPoint)dualStringKeyTopTextOffset;
- (CGPoint)iPadFudgeControlKeyOffset;
- (CGPoint)symbolImageControlKeyOffset;
- (UIEdgeInsets)dynamicInsets;
- (double)bottomRowDefaultFontSize;
- (double)controlKeyFontSize;
- (double)dualStringKeyBottomFontSize;
- (double)dualStringKeyTopFontSize;
- (double)dynamicBottomRowMultiplier;
- (double)fallbackFontSize;
- (double)fontSizeAdjustmentForNonAlphanumericKeycaps;
- (double)keyCornerRadius;
- (double)messagesTypeKeyplanSwitchKeyFontSize;
- (double)stringKeyFontSize;
- (double)symbolImageControlKeyFontSize;
@end

@implementation UIKBRenderFactoryiPadSansHomeButtonLandscape

- (CGPoint)iPadFudgeControlKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 iPadFudgeControlKeyOffset];
  }
  else
  {
    double v4 = 11.0;
    double v3 = 13.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double v4 = 13.0;
  double v5 = 13.0;
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v6 symbolImageControlKeyOffset];
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)controlKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 controlKeyFontSize];
  }
  return result;
}

- (double)keyCornerRadius
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 8.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 keyCornerRadius];
  }
  return result;
}

- (double)stringKeyFontSize
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v4 stringKeyFontSize];
  }
  else
  {
    [(UIKBRenderFactory *)self RivenFactor:27.0];
  }
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 24.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 symbolImageControlKeyFontSize];
  }
  return result;
}

- (double)dualStringKeyBottomFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 28.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 dualStringKeyBottomFontSize];
  }
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 dualStringKeyBottomTextOffset];
  }
  else
  {
    double v4 = 11.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)dualStringKeyTopFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 31.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 dualStringKeyTopFontSize];
  }
  return result;
}

- (CGPoint)dualStringKeyTopTextOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPadSansHomeButton *)&v5 dualStringKeyTopTextOffset];
  }
  else
  {
    double v4 = -11.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)bottomRowDefaultFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 24.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPad *)&v5 bottomRowDefaultFontSize];
  }
  return result;
}

- (double)fontSizeAdjustmentForNonAlphanumericKeycaps
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 6.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPad *)&v5 fontSizeAdjustmentForNonAlphanumericKeycaps];
  }
  return result;
}

- (double)fallbackFontSize
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPad *)&v4 fallbackFontSize];
  }
  else
  {
    [(UIKBRenderFactory *)self RivenFactor:28.0];
  }
  return result;
}

- (double)messagesTypeKeyplanSwitchKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    [(UIKBRenderFactoryiPad *)&v5 messagesTypeKeyplanSwitchKeyFontSize];
  }
  return result;
}

- (UIEdgeInsets)dynamicInsets
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  if (v2) {
    double v3 = 4.0;
  }
  else {
    double v3 = 7.0;
  }
  if (v2) {
    double v4 = 4.0;
  }
  else {
    double v4 = 8.0;
  }
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v4;
  result.bottom = v3;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 1.115;
  if (v2) {
    return 1.08;
  }
  return result;
}

@end