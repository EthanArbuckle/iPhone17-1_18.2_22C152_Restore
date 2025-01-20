@interface _UIBadgeCarplayVisualStyle
- (double)cornerRadius;
- (double)edgePadding;
- (double)fontSize;
- (id)defaultBadgeColor;
@end

@implementation _UIBadgeCarplayVisualStyle

- (id)defaultBadgeColor
{
  return +[UIColor externalSystemRedColor];
}

- (double)fontSize
{
  return 10.0;
}

- (double)edgePadding
{
  return 5.0;
}

- (double)cornerRadius
{
  return 6.0;
}

@end