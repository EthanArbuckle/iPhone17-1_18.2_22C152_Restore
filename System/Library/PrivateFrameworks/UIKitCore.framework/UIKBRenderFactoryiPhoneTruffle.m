@interface UIKBRenderFactoryiPhoneTruffle
- (BOOL)isTallPopup;
- (CGPoint)deleteKeyOffset;
- (CGPoint)dictationKeyOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)more123KeyOffset;
- (CGPoint)moreABCKeyOffset;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)returnKeyOffset;
- (CGPoint)stringKeyOffset;
- (CGPoint)variantAnnotationTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (UIEdgeInsets)variantPaddedFrameInsets;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)moreABCKeyFontSize;
- (double)popupFontSize;
- (double)symbolImageControlKeyFontSize;
- (id)lightKeycapsFontName;
@end

@implementation UIKBRenderFactoryiPhoneTruffle

- (double)moreABCKeyFontSize
{
  return 14.0;
}

- (CGPoint)stringKeyOffset
{
  double v2 = 1.3333;
  double v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)returnKeyOffset
{
  double v2 = -1.3333;
  double v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2 = -0.3333;
  double v3 = -0.3333;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)more123KeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  double v2 = 0.6666;
  double v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v2 = -0.3333;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

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
  double v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)popupFontSize
{
  return 38.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
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