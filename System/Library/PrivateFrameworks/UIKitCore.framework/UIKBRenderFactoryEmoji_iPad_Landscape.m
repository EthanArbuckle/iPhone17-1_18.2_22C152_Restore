@interface UIKBRenderFactoryEmoji_iPad_Landscape
- (double)keyCornerRadius;
- (id)messagesWriteboardKeyImageName;
@end

@implementation UIKBRenderFactoryEmoji_iPad_Landscape

- (double)keyCornerRadius
{
  return 7.0;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_landscape.png";
}

@end