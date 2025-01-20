@interface NSDictionary(SBSwitcherModifierDebugTimelineDescription)
- (__CFString)sb_switcherModifierDebugTimelineDescription;
@end

@implementation NSDictionary(SBSwitcherModifierDebugTimelineDescription)

- (__CFString)sb_switcherModifierDebugTimelineDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a1 count])
  {
    v2 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = a1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v9 = [v3 objectForKey:v8];
          v10 = objc_msgSend(v9, "sb_switcherModifierDebugTimelineDescription");
          [v2 setObject:v10 forKey:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    v11 = NSString;
    uint64_t v12 = [v3 count];
    unint64_t v13 = [v3 count];
    v14 = &stru_1F3084718;
    if (v13 > 1) {
      v14 = @"s";
    }
    v15 = [v11 stringWithFormat:@"%lu object%@:\n%@", v12, v14, v2];
  }
  else
  {
    v15 = @"(Empty dict)";
  }
  return v15;
}

@end