@interface NSSet(SBSwitcherModifierDebugTimelineDescription)
- (__CFString)sb_switcherModifierDebugTimelineDescription;
@end

@implementation NSSet(SBSwitcherModifierDebugTimelineDescription)

- (__CFString)sb_switcherModifierDebugTimelineDescription
{
  if ([a1 count])
  {
    v2 = objc_msgSend(a1, "bs_map:", &__block_literal_global_590);
    v3 = NSString;
    uint64_t v4 = [a1 count];
    unint64_t v5 = [a1 count];
    v6 = &stru_1F3084718;
    if (v5 > 1) {
      v6 = @"s";
    }
    v7 = [v3 stringWithFormat:@"%lu object%@:\n%@", v4, v6, v2];
  }
  else
  {
    v7 = @"(Empty set)";
  }
  return v7;
}

@end