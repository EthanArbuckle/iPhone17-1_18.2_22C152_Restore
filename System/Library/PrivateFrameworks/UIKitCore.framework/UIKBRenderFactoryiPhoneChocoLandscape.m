@interface UIKBRenderFactoryiPhoneChocoLandscape
- (BOOL)isTallPopup;
- (CGPoint)dictationKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)leftArrowKeyOffset;
- (CGPoint)more123KeyOffset;
- (CGPoint)moreABCKeyOffset;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)realEmojiKeyOffset;
- (CGPoint)returnKeyOffset;
- (CGPoint)rightArrowKeyOffset;
- (CGPoint)undoKeyOffset;
- (CGPoint)variantSymbolTextOffset;
- (UIEdgeInsets)dynamicInsets;
- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (UIEdgeInsets)wideShadowPopupMenuInsets;
- (double)_row4ControlSegmentWidthLeft;
- (double)assistKeyFontSize;
- (double)dynamicBottomRowMultiplier;
- (double)moreABCKeyFontSize;
- (double)moreKeyFontSize;
- (double)popupFontSize;
- (double)stringKeyFontSize;
- (id)lightKeycapsFontName;
@end

@implementation UIKBRenderFactoryiPhoneChocoLandscape

- (double)stringKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSize];
  }
  return result;
}

- (double)assistKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 assistKeyFontSize];
  }
  return result;
}

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
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = -0.5;
  if (!v2) {
    double v3 = -1.0;
  }
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
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
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!v2)
  {
    double v3 = 0.0;
    double v4 = -1.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)more123KeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    double v3 = 0.5;
    double v4 = 0.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    [(UIKBRenderFactoryiPhoneLandscape *)&v5 more123KeyOffset];
  }
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v2)
  {
    double v3 = 0.0;
    double v4 = -0.5;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)realEmojiKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 realEmojiKeyOffset];
  }
  else
  {
    double v4 = -0.5;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)undoKeyOffset
{
  double v2 = -0.5;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftArrowKeyOffset
{
  double v2 = 0.5;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightArrowKeyOffset
{
  double v2 = 1.5;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2 = 0.0;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    double v3 = 4.0;
    double v4 = 28.0;
    double v5 = 6.0;
    double v6 = 18.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    [(UIKBRenderFactoryiPhoneLandscape *)&v7 wideShadowPaddleInsets];
  }
  result.right = v3;
  result.bottom = v4;
  result.left = v5;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)wideShadowPopupMenuInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory]) {
    double v2 = 28.0;
  }
  else {
    double v2 = 22.0;
  }
  double v3 = 18.0;
  double v4 = 6.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = 4.5;
  if (v2) {
    double v3 = -7.0;
  }
  double v4 = 7.5;
  if (!v2) {
    double v4 = -1.5;
  }
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = 1.0;
  if (!v2) {
    double v3 = 2.0;
  }
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = -7.0;
  if (!v2) {
    double v3 = -6.0;
  }
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (double)popupFontSize
{
  if (![(UIKBRenderFactory *)self dynamicFactory]) {
    return 46.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
  [(UIKBRenderFactoryiPhoneLandscape *)&v4 popupFontSize];
  return result;
}

- (BOOL)isTallPopup
{
  return 1;
}

- (UIEdgeInsets)dynamicInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory]) {
    double v2 = 8.0;
  }
  else {
    double v2 = 4.0;
  }
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 0.1;
  if (v2) {
    return 0.125;
  }
  return result;
}

- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3
{
  if (a3 > 4)
  {
    BOOL v8 = [(UIKBRenderFactory *)self dynamicFactory];
    double v4 = 0.0;
    if (v8) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    if (v8) {
      double v9 = 2.0;
    }
    else {
      double v9 = 1.0;
    }
    double v3 = 0.0;
    if (a3 == 5)
    {
      double v5 = v9;
    }
    else
    {
      double v3 = 0.0;
      double v5 = v6;
    }
    if (a3 == 5) {
      double v6 = v9;
    }
  }
  else
  {
    [(UIKBRenderFactoryiPhoneChocoLandscape *)self dynamicInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)lightKeycapsFontName
{
  if ([(UIKBRenderFactory *)self boldTextEnabled]) {
    BOOL v2 = @".PhoneKeyCaps";
  }
  else {
    BOOL v2 = @".KeycapsB-Keys";
  }
  return v2;
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.315;
}

@end