@interface _UIStatusBarVisualProvider_DynamicSplitMedium
+ (double)baseFontSize;
+ (double)expandedFontSize;
- (double)bottomLeadingTopOffset;
- (double)expandedIconScale;
- (double)lowerExpandedBaselineOffset;
- (double)normalIconScale;
- (id)leadingItemCutoffWidths;
- (id)trailingItemCutoffWidths;
@end

@implementation _UIStatusBarVisualProvider_DynamicSplitMedium

+ (double)baseFontSize
{
  return 15.0;
}

+ (double)expandedFontSize
{
  return 15.0;
}

- (double)bottomLeadingTopOffset
{
  return 7.33333333;
}

- (double)lowerExpandedBaselineOffset
{
  return 22.0;
}

- (double)normalIconScale
{
  return 1.12;
}

- (double)expandedIconScale
{
  return 1.16;
}

- (id)leadingItemCutoffWidths
{
  if (qword_1EB25D3F0 != -1) {
    dispatch_once(&qword_1EB25D3F0, &__block_literal_global_248_0);
  }
  v2 = (void *)qword_1EB25D3F8;
  return v2;
}

- (id)trailingItemCutoffWidths
{
  if (qword_1EB25D400 != -1) {
    dispatch_once(&qword_1EB25D400, &__block_literal_global_259);
  }
  v2 = (void *)qword_1EB25D408;
  return v2;
}

@end