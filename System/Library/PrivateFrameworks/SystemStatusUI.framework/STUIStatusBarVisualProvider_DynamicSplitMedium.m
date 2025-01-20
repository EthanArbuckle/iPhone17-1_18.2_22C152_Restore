@interface STUIStatusBarVisualProvider_DynamicSplitMedium
+ (double)baseFontSize;
+ (double)expandedFontSize;
- (double)bottomLeadingTopOffset;
- (double)expandedIconScale;
- (double)lowerExpandedBaselineOffset;
- (double)normalIconScale;
- (id)leadingItemCutoffWidths;
- (id)trailingItemCutoffWidths;
@end

@implementation STUIStatusBarVisualProvider_DynamicSplitMedium

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
  if (qword_1EC05F068 != -1) {
    dispatch_once(&qword_1EC05F068, &__block_literal_global_219);
  }
  v2 = (void *)qword_1EC05F070;
  return v2;
}

- (id)trailingItemCutoffWidths
{
  if (qword_1EC05F078 != -1) {
    dispatch_once(&qword_1EC05F078, &__block_literal_global_230);
  }
  v2 = (void *)qword_1EC05F080;
  return v2;
}

@end