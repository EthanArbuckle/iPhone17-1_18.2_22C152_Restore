@interface _UIStatusBarVisualProvider_RoundedPad
+ (BOOL)regionCursorIsPill;
+ (NSDirectionalEdgeInsets)edgeInsets;
+ (UIEdgeInsets)regionCursorInsets;
+ (double)baselineOffset;
+ (double)cornerRadius;
+ (double)height;
- (CGSize)pillSize;
- (CGSize)smallPillSize;
- (id)pillFont;
- (id)pillSmallFont;
@end

@implementation _UIStatusBarVisualProvider_RoundedPad

+ (double)height
{
  return 24.0;
}

+ (double)cornerRadius
{
  return 20.0;
}

+ (double)baselineOffset
{
  return 16.0;
}

- (CGSize)pillSize
{
  double v2 = 48.0;
  double v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2 = 18.0;
  double v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)pillFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25B480;
  if (unk_1EB25B480) {
    BOOL v4 = byte_1EB25B455 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25B455 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:12.0 weight:*(double *)off_1E52D6C00];
    v6 = (void *)unk_1EB25B480;
    unk_1EB25B480 = v5;

    double v3 = (void *)unk_1EB25B480;
  }
  return v3;
}

- (id)pillSmallFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25B488;
  if (unk_1EB25B488) {
    BOOL v4 = byte_1EB25B456 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25B456 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:11.0 weight:*(double *)off_1E52D6BD8];
    v6 = (void *)unk_1EB25B488;
    unk_1EB25B488 = v5;

    double v3 = (void *)unk_1EB25B488;
  }
  return v3;
}

+ (NSDirectionalEdgeInsets)edgeInsets
{
  double v2 = 0.0;
  double v3 = 16.0;
  double v4 = 0.0;
  double v5 = 15.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)regionCursorInsets
{
  double v2 = -2.0;
  double v3 = -8.0;
  double v4 = -2.0;
  double v5 = -8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)regionCursorIsPill
{
  return 1;
}

@end