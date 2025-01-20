@interface NSDate(WBSNSDateExtras)
+ (double)safari_timeIntervalSinceSystemStart;
+ (id)safari_dateOfMidnightNumberOfDaysAgo:()WBSNSDateExtras;
+ (void)safari_dateFromNTPServerWithTimeout:()WBSNSDateExtras completionHandler:;
- (BOOL)safari_isEarlierThanDate:()WBSNSDateExtras;
- (BOOL)safari_isInclusivelyBetweenDate:()WBSNSDateExtras andDate:;
- (BOOL)safari_isLaterThanDate:()WBSNSDateExtras;
- (double)safari_timeIntervalUntilNow;
- (id)_safari_stringWithDashSeparatorWithDateFormatter:()WBSNSDateExtras;
- (id)safari_startOfDay;
- (id)safari_stringsFromDateForLocaleIdentifiers:()WBSNSDateExtras;
- (uint64_t)safari_filenameFormattedString;
- (uint64_t)safari_isInSameDayAsDate:()WBSNSDateExtras;
- (uint64_t)safari_isInToday;
- (uint64_t)safari_isNowOrInRecentPast;
- (uint64_t)safari_numberOfDaysUntilDate:()WBSNSDateExtras;
- (uint64_t)safari_numberOfWeeksUntilDate:()WBSNSDateExtras;
@end

@implementation NSDate(WBSNSDateExtras)

+ (double)safari_timeIntervalSinceSystemStart
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  [v0 systemUptime];
  double v2 = v1;

  return v2;
}

+ (id)safari_dateOfMidnightNumberOfDaysAgo:()WBSNSDateExtras
{
  id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v5 components:28 fromDate:v6];

  objc_msgSend(v7, "setDay:", objc_msgSend(v7, "day") - a3);
  v8 = [v5 dateFromComponents:v7];

  return v8;
}

+ (void)safari_dateFromNTPServerWithTimeout:()WBSNSDateExtras completionHandler:
{
  id v6 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke;
  aBlock[3] = &unk_1E615B4B0;
  v21 = v23;
  uint64_t v22 = a1;
  id v20 = v6;
  id v7 = v6;
  v8 = _Block_copy(aBlock);

  _Block_object_dispose(v23, 8);
  v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v10 = dispatch_queue_create("com.apple.SafariShared.NTPQueue", v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_2;
  block[3] = &unk_1E615A620;
  id v11 = v8;
  id v18 = v11;
  dispatch_async(v10, block);
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  v13 = dispatch_get_global_queue(21, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_5;
  v15[3] = &unk_1E615A620;
  id v16 = v11;
  id v14 = v11;
  dispatch_after(v12, v13, v15);
}

- (uint64_t)safari_numberOfWeeksUntilDate:()WBSNSDateExtras
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [v5 components:8208 fromDate:a1 toDate:v4 options:0];
  uint64_t v7 = [v6 day];
  if (v7 >= 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = -v7;
  }
  [v5 maximumRangeOfUnit:512];
  if (v8 >= v9 - 1)
  {
    id v11 = [v5 components:512 fromDate:a1];
    dispatch_time_t v12 = [v5 components:512 fromDate:v4];
    uint64_t v13 = [v11 weekday];
    if (v13 == [v12 weekday])
    {
      uint64_t v14 = [v6 day];
      uint64_t v15 = [v6 weekOfYear];
      if (v14 >= 1) {
        uint64_t v10 = v15 + 1;
      }
      else {
        uint64_t v10 = v15 - 1;
      }
    }
    else
    {
      uint64_t v10 = [v6 weekOfYear];
    }
  }
  else
  {
    uint64_t v10 = [v6 weekOfYear];
  }

  return v10;
}

- (uint64_t)safari_numberOfDaysUntilDate:()WBSNSDateExtras
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 components:16 fromDate:a1 toDate:v5 options:0];

  uint64_t v8 = [v7 day];
  return v8;
}

- (uint64_t)safari_isInToday
{
  double v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 isDateInToday:a1];

  return v3;
}

- (uint64_t)safari_isInSameDayAsDate:()WBSNSDateExtras
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 inSameDayAsDate:v5];

  return v7;
}

- (id)safari_startOfDay
{
  double v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 startOfDayForDate:a1];

  return v3;
}

- (BOOL)safari_isInclusivelyBetweenDate:()WBSNSDateExtras andDate:
{
  id v6 = a4;
  uint64_t v7 = [a3 compare:a1];
  uint64_t v8 = [a1 compare:v6];

  return v7 <= 0 && v8 < 1 || (v7 | v8) >= 0;
}

- (uint64_t)safari_isNowOrInRecentPast
{
  double v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [v2 dateByAddingTimeInterval:-2.0];
  uint64_t v4 = objc_msgSend(a1, "safari_isInclusivelyBetweenDate:andDate:", v3, v2);

  return v4;
}

- (double)safari_timeIntervalUntilNow
{
  [a1 timeIntervalSinceNow];
  return -v1;
}

- (uint64_t)safari_filenameFormattedString
{
  if (safari_filenameFormattedString_onceToken != -1) {
    dispatch_once(&safari_filenameFormattedString_onceToken, &__block_literal_global_19);
  }
  double v2 = (void *)safari_filenameFormattedString_dateFormatter;
  return [v2 stringFromDate:a1];
}

- (id)_safari_stringWithDashSeparatorWithDateFormatter:()WBSNSDateExtras
{
  id v4 = a3;
  id v5 = [v4 dateFormat];
  id v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"./, "];
  uint64_t v7 = [v5 componentsSeparatedByCharactersInSet:v6];
  uint64_t v8 = [v7 componentsJoinedByString:@"-"];

  [v4 setDateFormat:v8];
  uint64_t v9 = [v4 stringFromDate:a1];

  return v9;
}

- (id)safari_stringsFromDateForLocaleIdentifiers:()WBSNSDateExtras
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v4;
  uint64_t v24 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * v7)];
        [v6 setLocale:v8];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v9 = [&unk_1F10866D8 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(&unk_1F10866D8);
              }
              [v6 setLocalizedDateFormatFromTemplate:*(void *)(*((void *)&v29 + 1) + 8 * i)];
              uint64_t v13 = [v6 stringFromDate:a1];
              [v5 addObject:v13];

              uint64_t v14 = objc_msgSend(a1, "_safari_stringWithDashSeparatorWithDateFormatter:", v6);
              [v5 addObject:v14];
            }
            uint64_t v10 = [&unk_1F10866D8 countByEnumeratingWithState:&v29 objects:v38 count:16];
          }
          while (v10);
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        if (_dateFormatTemplatesWithLongMonth_onceToken != -1) {
          dispatch_once(&_dateFormatTemplatesWithLongMonth_onceToken, &__block_literal_global_66_0);
        }
        id v15 = (id)_dateFormatTemplatesWithLongMonth_dateFormats;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v15);
              }
              [v6 setLocalizedDateFormatFromTemplate:*(void *)(*((void *)&v25 + 1) + 8 * j)];
              id v20 = [v6 stringFromDate:a1];
              [v5 addObject:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
          }
          while (v17);
        }

        ++v7;
      }
      while (v7 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v24);
  }

  return v5;
}

- (BOOL)safari_isEarlierThanDate:()WBSNSDateExtras
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)safari_isLaterThanDate:()WBSNSDateExtras
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end