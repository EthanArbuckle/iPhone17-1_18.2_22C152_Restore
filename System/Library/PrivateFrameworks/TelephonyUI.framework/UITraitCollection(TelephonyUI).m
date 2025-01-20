@interface UITraitCollection(TelephonyUI)
- (uint64_t)isPreferredContentSizeCategoryAccessible;
- (uint64_t)preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells;
@end

@implementation UITraitCollection(TelephonyUI)

- (uint64_t)preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells
{
  v2 = [a1 preferredContentSizeCategory];
  if (([a1 isPreferredContentSizeCategoryAccessible] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4FB27C0]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4FB27B8]] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4FB27B0]];
  }

  return v3;
}

- (uint64_t)isPreferredContentSizeCategoryAccessible
{
  v1 = [a1 preferredContentSizeCategory];
  if (([v1 isEqualToString:*MEMORY[0x1E4FB2798]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4FB2790]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4FB2788]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4FB2780]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4FB2778]];
  }

  return v2;
}

@end