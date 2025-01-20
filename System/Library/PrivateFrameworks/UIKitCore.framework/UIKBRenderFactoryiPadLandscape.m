@interface UIKBRenderFactoryiPadLandscape
- (CGPoint)deleteKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)dualStringKeyOffset;
- (CGPoint)shiftKeyOffset;
- (CGPoint)symbolImageControlKeyOffset;
- (CGPoint)tinyPunctuationGlyphOffset;
- (CGRect)dismissKeySymbolFrame;
- (CGRect)shiftKeySymbolFrame;
- (UIEdgeInsets)dynamicInsets;
- (double)bottomRowDefaultFontSize;
- (double)defaultVariantSizeThreshold;
- (double)deleteKeyFontSize;
- (double)dictationKeyFontSize;
- (double)dismissKeyFontSize;
- (double)dualStringKeyFontSizeAdjustment;
- (double)dynamicBottomRowMultiplier;
- (double)emailDotKeyFontSize;
- (double)facemarkKeyFontSize;
- (double)fallbackFontSize;
- (double)fontSizeAdjustmentForNonAlphanumericKeycaps;
- (double)internationalKeyFontSize;
- (double)keyCornerRadius;
- (double)messagesTypeKeyplanSwitchKeyFontSize;
- (double)moreKeyFontSize;
- (double)shiftKeyFontSize;
- (double)skinnyKeyThreshold;
- (double)smallKanaKeyFontSize;
- (double)spaceKeyFontSize;
- (double)stringKeyFontSize;
- (double)symbolImageControlKeyFontSize;
- (double)tinyPunctuationGlyphFontSize;
- (double)zhuyinFirstToneKeyFontSize;
- (id)ZWNJKeyImageName;
- (id)messagesWriteboardKeyImageName;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
@end

@implementation UIKBRenderFactoryiPadLandscape

- (double)keyCornerRadius
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 7.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 keyCornerRadius];
  }
  return result;
}

- (CGRect)shiftKeySymbolFrame
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v7 shiftKeySymbolFrame];
  }
  else
  {
    double v6 = 23.0;
    double v5 = 26.0;
    double v3 = 0.0;
    double v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)dismissKeySymbolFrame
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v7 dismissKeySymbolFrame];
  }
  else
  {
    double v3 = 0.0;
    double v6 = 79.0;
    double v5 = 83.0;
    double v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)stringKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 27.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 stringKeyFontSize];
  }
  return result;
}

- (double)dualStringKeyFontSizeAdjustment
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = -5.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 dualStringKeyFontSizeAdjustment];
  }
  return result;
}

- (double)bottomRowDefaultFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 24.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
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
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 fontSizeAdjustmentForNonAlphanumericKeycaps];
  }
  return result;
}

- (double)shiftKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 shiftKeyFontSize];
  }
  return result;
}

- (double)deleteKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 17.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 deleteKeyFontSize];
  }
  return result;
}

- (double)moreKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 moreKeyFontSize];
  }
  return result;
}

- (double)internationalKeyFontSize
{
  if (![(UIKBRenderFactory *)self dynamicFactory]) {
    return 39.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadLandscape;
  [(UIKBRenderFactoryiPad *)&v4 internationalKeyFontSize];
  return result;
}

- (double)dictationKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 25.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 dictationKeyFontSize];
  }
  return result;
}

- (double)spaceKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 spaceKeyFontSize];
  }
  return result;
}

- (double)dismissKeyFontSize
{
  if (![(UIKBRenderFactory *)self dynamicFactory]) {
    return 47.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadLandscape;
  [(UIKBRenderFactoryiPad *)&v4 dismissKeyFontSize];
  return result;
}

- (double)smallKanaKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 18.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 smallKanaKeyFontSize];
  }
  return result;
}

- (double)emailDotKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 12.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 emailDotKeyFontSize];
  }
  return result;
}

- (double)facemarkKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 28.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 facemarkKeyFontSize];
  }
  return result;
}

- (double)zhuyinFirstToneKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 zhuyinFirstToneKeyFontSize];
  }
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 26.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 symbolImageControlKeyFontSize];
  }
  return result;
}

- (double)fallbackFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 28.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 fallbackFontSize];
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
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 messagesTypeKeyplanSwitchKeyFontSize];
  }
  return result;
}

- (double)tinyPunctuationGlyphFontSize
{
  if (![(UIKBRenderFactory *)self dynamicFactory]) {
    return 50.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadLandscape;
  [(UIKBRenderFactoryiPad *)&v4 tinyPunctuationGlyphFontSize];
  return result;
}

- (CGPoint)tinyPunctuationGlyphOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 tinyPunctuationGlyphOffset];
  }
  else
  {
    double v4 = -2.5;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)dualStringKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 dualStringKeyOffset];
  }
  else
  {
    double v4 = 2.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 dismissKeyOffset];
  }
  else
  {
    double v4 = 1.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 deleteKeyOffset];
  }
  else
  {
    double v4 = -1.0;
    double v3 = 1.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)shiftKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 shiftKeyOffset];
  }
  else
  {
    double v4 = -2.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    [(UIKBRenderFactoryiPad *)&v5 symbolImageControlKeyOffset];
  }
  else
  {
    double v4 = -1.0;
    double v3 = 1.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)multitapCompleteKeyImageName
{
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v2 <= 1.0) {
    double v3 = @"kana_multitap_complete_arrow.png";
  }
  else {
    double v3 = @"kana_multitap_complete_arrow-163r.png";
  }
  return v3;
}

- (id)muttitapReverseKeyImageName
{
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v2 <= 1.0) {
    double v3 = @"kana_multitap_reverse_arrow.png";
  }
  else {
    double v3 = @"kana_multitap_reverse_arrow-163r.png";
  }
  return v3;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_landscape.png";
}

- (id)ZWNJKeyImageName
{
  return @"ZWNJ_landscape.png";
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (double)defaultVariantSizeThreshold
{
  return 83.0;
}

- (UIEdgeInsets)dynamicInsets
{
  BOOL v2 = [(UIKBRenderFactory *)self dynamicFactory];
  if (v2) {
    double v3 = 4.0;
  }
  else {
    double v3 = 6.0;
  }
  if (v2) {
    double v4 = 6.0;
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
  return 1.115;
}

@end