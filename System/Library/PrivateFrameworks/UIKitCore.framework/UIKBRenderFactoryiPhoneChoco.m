@interface UIKBRenderFactoryiPhoneChoco
- (BOOL)isTallPopup;
- (CGPoint)dictationKeyOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)more123KeyOffset;
- (CGPoint)moreABCKeyOffset;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)returnKeyOffset;
- (CGPoint)variantAnnotationTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (UIEdgeInsets)wideShadowPopupMenuInsets;
- (double)moreABCKeyFontSize;
- (double)moreKeyFontSize;
- (id)lightKeycapsFontName;
@end

@implementation UIKBRenderFactoryiPhoneChoco

- (double)moreKeyFontSize
{
  return 16.0;
}

- (double)moreABCKeyFontSize
{
  return 14.0;
}

- (CGPoint)returnKeyOffset
{
  double v2 = 0.0;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2 = 0.0;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)more123KeyOffset
{
  double v2 = 0.0;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  double v2 = 0.0;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

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

- (UIEdgeInsets)wideShadowPopupMenuInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 28.0;
  double v5 = 8.0;
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

- (CGPoint)variantAnnotationTextOffset
{
  double v2 = 4.0;
  double v3 = 4.0;
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