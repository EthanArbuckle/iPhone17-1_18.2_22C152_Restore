@interface NSArray(SBHistorianDescription)
- (__CFString)sb_switcherModifierDebugTimelineDescription;
@end

@implementation NSArray(SBHistorianDescription)

- (__CFString)sb_switcherModifierDebugTimelineDescription
{
  if ([a1 count])
  {
    v2 = objc_opt_new();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __78__NSArray_SBHistorianDescription__sb_switcherModifierDebugTimelineDescription__block_invoke;
    v13 = &unk_1E6B0A8E0;
    id v14 = v2;
    id v3 = v2;
    [a1 enumerateObjectsUsingBlock:&v10];
    v4 = NSString;
    uint64_t v5 = [a1 count];
    unint64_t v6 = [a1 count];
    v7 = &stru_1F3084718;
    if (v6 > 1) {
      v7 = @"s";
    }
    v8 = [v4 stringWithFormat:@"%lu object%@:\n%@", v5, v7, v3, v10, v11, v12, v13];
  }
  else
  {
    v8 = @"(Empty array)";
  }
  return v8;
}

@end