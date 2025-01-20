@interface _UIBadgePhoneLandscapeVisualStyle
- (double)cornerRadius;
- (double)edgePadding;
- (double)fontSize;
- (double)minWidth;
- (id)font;
@end

@implementation _UIBadgePhoneLandscapeVisualStyle

- (double)fontSize
{
  return 10.0;
}

- (id)font
{
  [(_UIBadgePhoneLandscapeVisualStyle *)self fontSize];
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:weight:");
}

- (double)edgePadding
{
  return 4.0;
}

- (double)minWidth
{
  return 22.0;
}

- (double)cornerRadius
{
  return 7.0;
}

@end