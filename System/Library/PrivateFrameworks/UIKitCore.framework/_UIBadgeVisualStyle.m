@interface _UIBadgeVisualStyle
- (UIColor)defaultBadgeColor;
- (UIFont)font;
- (double)cornerRadius;
- (double)edgePadding;
- (double)fontSize;
- (double)maxWidth;
- (double)minWidth;
@end

@implementation _UIBadgeVisualStyle

- (double)cornerRadius
{
  return 9.0;
}

- (UIFont)font
{
  [(_UIBadgeVisualStyle *)self fontSize];
  return (UIFont *)objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
}

- (double)fontSize
{
  return 13.0;
}

- (double)minWidth
{
  return 24.0;
}

- (double)maxWidth
{
  return 64.0;
}

- (double)edgePadding
{
  return 5.0;
}

- (UIColor)defaultBadgeColor
{
  return +[UIColor systemRedColor];
}

@end