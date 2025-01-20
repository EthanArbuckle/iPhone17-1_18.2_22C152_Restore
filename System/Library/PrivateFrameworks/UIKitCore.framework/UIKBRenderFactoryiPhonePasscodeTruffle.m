@interface UIKBRenderFactoryiPhonePasscodeTruffle
- (BOOL)isTallPopup;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (UIEdgeInsets)variantPaddedFrameInsets;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)popupFontSize;
- (id)lightKeycapsFontName;
@end

@implementation UIKBRenderFactoryiPhonePasscodeTruffle

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 29.0;
  double v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  double v2 = 5.0;
  double v3 = 0.0;
  double v4 = -5.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  double v2 = -11.0;
  double v3 = 0.0;
  double v4 = 9.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  double v2 = 0.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  double v2 = 0.0;
  double v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)popupFontSize
{
  return 38.0;
}

- (BOOL)isTallPopup
{
  return 1;
}

- (id)lightKeycapsFontName
{
  if ([(UIKBRenderFactory *)self boldTextEnabled]) {
    double v2 = @".PhoneKeyCaps";
  }
  else {
    double v2 = @".KeycapsA-Keys";
  }
  return v2;
}

@end