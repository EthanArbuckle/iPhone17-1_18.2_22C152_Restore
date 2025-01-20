@interface UIKBRenderFactoryiPhonePasscodeChoco
- (BOOL)isTallPopup;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (id)lightKeycapsFontName;
@end

@implementation UIKBRenderFactoryiPhonePasscodeChoco

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 28.0;
  double v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  double v2 = -7.0;
  double v3 = 0.0;
  double v4 = 7.5;
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
  double v3 = -7.0;
  result.y = v3;
  result.x = v2;
  return result;
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
    double v2 = @".KeycapsB-Keys";
  }
  return v2;
}

@end