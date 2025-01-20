@interface NSDate(VK)
- (BOOL)vk_isEarlierThanDate:()VK;
- (BOOL)vk_isLaterThanDate:()VK;
- (id)vk_briefFormattedDate:()VK;
- (id)vk_shortFormattedDate;
- (uint64_t)vk_briefFormattedDate;
- (uint64_t)vk_briefFormattedDateForAccessibility;
- (uint64_t)vk_isToday;
- (uint64_t)vk_isYesterday;
- (uint64_t)vk_localDateWithSeconds;
@end

@implementation NSDate(VK)

- (uint64_t)vk_isToday
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 components:28 fromDate:a1];
  v4 = [v2 dateFromComponents:v3];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [v2 components:28 fromDate:v5];

  v7 = [v2 dateFromComponents:v6];
  uint64_t v8 = [v4 isEqualToDate:v7];

  return v8;
}

- (uint64_t)vk_isYesterday
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 components:28 fromDate:a1];
  v4 = [v2 dateFromComponents:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setDay:-1];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v2 dateByAddingComponents:v5 toDate:v6 options:0];

  uint64_t v8 = [v2 components:28 fromDate:v7];
  v9 = [v2 dateFromComponents:v8];

  uint64_t v10 = [v4 isEqualToDate:v9];
  return v10;
}

- (uint64_t)vk_localDateWithSeconds
{
  if (vk_localDateWithSeconds_localFormatterOnceToken != -1) {
    dispatch_once(&vk_localDateWithSeconds_localFormatterOnceToken, &__block_literal_global_1);
  }
  v2 = (void *)vk_localDateWithSeconds_localFormatter;
  return [v2 stringFromDate:a1];
}

- (id)vk_shortFormattedDate
{
  if ((objc_msgSend(a1, "vk_isToday") & 1) != 0 || objc_msgSend(a1, "vk_isYesterday"))
  {
    if (vk_shortFormattedDate_shortRelativeOnceToken != -1) {
      dispatch_once(&vk_shortFormattedDate_shortRelativeOnceToken, &__block_literal_global_5);
    }
    v2 = &vk_shortFormattedDate_shortRelativeformatter;
  }
  else
  {
    if (vk_shortFormattedDate_shortStandardOnceToken != -1) {
      dispatch_once(&vk_shortFormattedDate_shortStandardOnceToken, &__block_literal_global_7);
    }
    v2 = &vk_shortFormattedDate_shortStandardformatter;
  }
  v3 = [(id)*v2 stringFromDate:a1];
  return v3;
}

- (uint64_t)vk_briefFormattedDate
{
  return objc_msgSend(a1, "vk_briefFormattedDate:", 0);
}

- (uint64_t)vk_briefFormattedDateForAccessibility
{
  return objc_msgSend(a1, "vk_briefFormattedDate:", 1);
}

- (id)vk_briefFormattedDate:()VK
{
  id v4 = a1;
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];

    id v4 = (id)v7;
  }
  if (objc_msgSend(v4, "vk_isToday"))
  {
    if (vk_briefFormattedDate__briefTodayOnceToken != -1) {
      dispatch_once(&vk_briefFormattedDate__briefTodayOnceToken, &__block_literal_global_9);
    }
    uint64_t v8 = [(id)vk_briefFormattedDate__briefTodayFormatter stringFromDate:v4];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = [v9 components:28 fromDate:v10];

    v12 = [v9 dateFromComponents:v11];
    v13 = [v9 dateByAddingUnit:16 value:-1 toDate:v12 options:0];
    v14 = [v9 dateByAddingUnit:0x2000 value:-1 toDate:v12 options:0];
    if ([v4 compare:v13] == 1 || objc_msgSend(v4, "compare:", v14) != 1)
    {
      if (a3)
      {
        if (vk_briefFormattedDate__templateOnceToken_14 != -1) {
          dispatch_once(&vk_briefFormattedDate__templateOnceToken_14, &__block_literal_global_16);
        }
        v15 = &vk_briefFormattedDate__accessibilityDateFormatter;
      }
      else
      {
        if (vk_briefFormattedDate__briefRelativeOnceToken != -1) {
          dispatch_once(&vk_briefFormattedDate__briefRelativeOnceToken, &__block_literal_global_18);
        }
        v15 = &vk_briefFormattedDate__briefRelativeFormatter;
      }
    }
    else
    {
      if (vk_briefFormattedDate__templateOnceToken != -1) {
        dispatch_once(&vk_briefFormattedDate__templateOnceToken, &__block_literal_global_11);
      }
      v15 = &vk_briefFormattedDate__templateFormatter;
    }
    uint64_t v8 = [(id)*v15 stringFromDate:v4];
  }
  return v8;
}

- (BOOL)vk_isEarlierThanDate:()VK
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)vk_isLaterThanDate:()VK
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end