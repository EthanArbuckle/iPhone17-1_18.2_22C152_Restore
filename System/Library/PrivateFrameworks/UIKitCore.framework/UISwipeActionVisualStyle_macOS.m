@interface UISwipeActionVisualStyle_macOS
- (double)horizontalPadding;
- (double)maxFontSize;
- (double)titleFontWeight;
@end

@implementation UISwipeActionVisualStyle_macOS

- (double)maxFontSize
{
  return 13.0;
}

- (double)titleFontWeight
{
  return *(double *)off_1E52D6BF8;
}

- (double)horizontalPadding
{
  return 15.0;
}

@end