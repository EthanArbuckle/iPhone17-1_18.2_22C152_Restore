@interface STUIStatusBarVisualProvider_RoundedPad
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

@implementation STUIStatusBarVisualProvider_RoundedPad

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
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = *(void **)&algn_1EC05EFC8[32];
  if (*(void *)&algn_1EC05EFC8[32]) {
    BOOL v4 = byte_1EC05EFAD == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05EFAD = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09E0]];
    v6 = *(void **)&algn_1EC05EFC8[32];
    *(void *)&algn_1EC05EFC8[32] = v5;

    double v3 = *(void **)&algn_1EC05EFC8[32];
  }
  return v3;
}

- (id)pillSmallFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = *(void **)&algn_1EC05EFC8[40];
  if (*(void *)&algn_1EC05EFC8[40]) {
    BOOL v4 = byte_1EC05EFAE == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05EFAE = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB09B8]];
    v6 = *(void **)&algn_1EC05EFC8[40];
    *(void *)&algn_1EC05EFC8[40] = v5;

    double v3 = *(void **)&algn_1EC05EFC8[40];
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