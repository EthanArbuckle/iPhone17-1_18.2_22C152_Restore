@interface UIKBRenderFactoryiPhoneTruffleLandscape
- (BOOL)isTallPopup;
- (CGPoint)boldKeyOffset;
- (CGPoint)copyKeyOffset;
- (CGPoint)cutKeyOffset;
- (CGPoint)deleteKeyOffset;
- (CGPoint)dictationKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)leftArrowKeyOffset;
- (CGPoint)more123KeyOffset;
- (CGPoint)moreABCKeyOffset;
- (CGPoint)pasteKeyOffset;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)realEmojiKeyOffset;
- (CGPoint)returnKeyOffset;
- (CGPoint)rightArrowKeyOffset;
- (CGPoint)stringKeyOffset;
- (CGPoint)undoKeyOffset;
- (CGPoint)variantAnnotationTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (UIEdgeInsets)dynamicInsets;
- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3;
- (UIEdgeInsets)variantPaddedFrameInsets;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)_row4ControlSegmentWidthLeft;
- (double)assistKeyFontSize;
- (double)dynamicBottomRowMultiplier;
- (double)moreABCKeyFontSize;
- (double)moreKeyFontSize;
- (double)popupFontSize;
- (double)stringKeyFontSize;
- (double)symbolImageControlKeyFontSize;
- (id)lightKeycapsFontName;
@end

@implementation UIKBRenderFactoryiPhoneTruffleLandscape

- (double)stringKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSize];
  }
  return result;
}

- (double)moreABCKeyFontSize
{
  return 14.0;
}

- (double)moreKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 16.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 moreKeyFontSize];
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
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 assistKeyFontSize];
  }
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 19.0;
  if (v2) {
    return 20.0;
  }
  return result;
}

- (CGPoint)stringKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    double v3 = 0.0;
    double v4 = 1.3333;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyOffset];
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)returnKeyOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = -1.3333;
  if (!v2) {
    double v3 = -0.6666;
  }
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = -0.3333;
  double v4 = 0.0;
  if (v2) {
    double v4 = -0.3333;
  }
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = -0.6;
  if (v2) {
    double v3 = -0.3333;
  }
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = -0.3333;
  if (v2) {
    double v3 = 0.0;
  }
  double v4 = v3;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)more123KeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhoneLandscape *)&v5 more123KeyOffset];
  }
  result.y = v4;
  result.x = v3;
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
    double v4 = 0.6666;
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
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 realEmojiKeyOffset];
  }
  else
  {
    double v3 = 0.0;
    double v4 = -0.3333;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)cutKeyOffset
{
  double v2 = -0.3333;
  double v3 = 0.3333;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)copyKeyOffset
{
  double v2 = -0.3333;
  double v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)pasteKeyOffset
{
  double v2 = 0.3333;
  double v3 = -0.6666;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)boldKeyOffset
{
  double v2 = -0.6666;
  double v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)undoKeyOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftArrowKeyOffset
{
  double v2 = -0.3333;
  double v3 = -0.6666;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightArrowKeyOffset
{
  double v2 = 0.6666;
  double v3 = -0.6666;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2 = 0.6666;
  double v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double v3 = 4.3333;
  if (v2) {
    double v3 = -11.0;
  }
  double v4 = 9.0;
  if (!v2) {
    double v4 = -3.0;
  }
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    double v3 = 4.0;
    double v4 = 29.0;
    double v5 = 6.0;
    double v6 = 18.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhoneLandscape *)&v7 wideShadowPaddleInsets];
  }
  result.right = v3;
  result.bottom = v4;
  result.left = v5;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    double v3 = 0.0;
    double v4 = -5.0;
    double v5 = 5.0;
    double v6 = 0.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhoneLandscape *)&v7 variantPaddedFrameInsets];
  }
  result.right = v6;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  [(UIKBRenderFactory *)self dynamicFactory];
  double v2 = 0.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double v4 = 4.0;
  double v5 = 4.0;
  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    [(UIKBRenderFactoryiPhoneLandscape *)&v6 variantAnnotationTextOffset];
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  [(UIKBRenderFactory *)self dynamicFactory];
  double v2 = 0.0;
  double v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)popupFontSize
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 46.0;
  if (v2) {
    return 38.0;
  }
  return result;
}

- (BOOL)isTallPopup
{
  return 1;
}

- (UIEdgeInsets)dynamicInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory]) {
    double v2 = 7.0;
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
    [(UIKBRenderFactoryiPhoneTruffleLandscape *)self dynamicInsets];
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
    BOOL v2 = @".KeycapsA-Keys";
  }
  return v2;
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.3;
}

@end