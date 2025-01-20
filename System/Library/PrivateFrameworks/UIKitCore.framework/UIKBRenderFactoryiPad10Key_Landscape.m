@interface UIKBRenderFactoryiPad10Key_Landscape
- (double)controlColumnWidthFactor;
- (double)keyCornerRadius;
- (id)messagesWriteboardKeyImageName;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
@end

@implementation UIKBRenderFactoryiPad10Key_Landscape

- (id)multitapCompleteKeyImageName
{
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v2 <= 1.0) {
    v3 = @"kana_multitap_complete_arrow.png";
  }
  else {
    v3 = @"kana_multitap_complete_arrow-163r.png";
  }
  return v3;
}

- (id)muttitapReverseKeyImageName
{
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v2 <= 1.0) {
    v3 = @"kana_multitap_reverse_arrow.png";
  }
  else {
    v3 = @"kana_multitap_reverse_arrow-163r.png";
  }
  return v3;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_landscape.png";
}

- (double)controlColumnWidthFactor
{
  return 0.061;
}

@end