@interface UIKBRenderFactory50On_Landscape
- (UIEdgeInsets)symbolFrameInsets;
- (double)deleteKeyFontSize;
- (double)keyCornerRadius;
- (double)keyplaneSwitchKeyFontSize;
- (double)returnKeyFontSize;
- (double)spaceKeyFontSize;
- (id)messagesWriteboardKeyImageName;
@end

@implementation UIKBRenderFactory50On_Landscape

- (double)keyplaneSwitchKeyFontSize
{
  return 22.0;
}

- (double)returnKeyFontSize
{
  return 23.0;
}

- (double)spaceKeyFontSize
{
  return 22.0;
}

- (double)deleteKeyFontSize
{
  return 18.0;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_landscape.png";
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 6.0;
  double v3 = 6.0;
  double v4 = 6.0;
  double v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end