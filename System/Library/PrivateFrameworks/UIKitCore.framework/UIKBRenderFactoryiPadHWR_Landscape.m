@interface UIKBRenderFactoryiPadHWR_Landscape
- (CGPoint)dismissKeyOffset;
- (CGPoint)spaceReturnKeyTextOffset;
- (double)controlColumnWidthFactor;
- (double)deleteKeyFontSize;
- (double)dictationKeyFontSize;
- (double)dismissKeyFontSize;
- (double)internationalKeyFontSize;
- (double)keyCornerRadius;
- (double)moreKeyFontSize;
- (double)spaceKeyFontSize;
- (id)messagesWriteboardKeyImageName;
@end

@implementation UIKBRenderFactoryiPadHWR_Landscape

- (double)deleteKeyFontSize
{
  return 22.0;
}

- (double)moreKeyFontSize
{
  return 22.0;
}

- (double)internationalKeyFontSize
{
  return 40.0;
}

- (double)dictationKeyFontSize
{
  return 37.0;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)dismissKeyFontSize
{
  return 47.0;
}

- (CGPoint)dismissKeyOffset
{
  double v2 = 0.0;
  double v3 = 8.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceReturnKeyTextOffset
{
  [(UIKBRenderFactory *)self scale];
  double v2 = 2.0;
  if (v3 == 2.0) {
    double v2 = 2.5;
  }
  double v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
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
  return 0.27;
}

@end