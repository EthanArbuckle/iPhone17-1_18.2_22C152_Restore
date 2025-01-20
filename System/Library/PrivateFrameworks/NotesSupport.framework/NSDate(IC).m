@interface NSDate(IC)
- (BOOL)ic_isEarlierThanDate:()IC;
- (BOOL)ic_isLaterThanDate:()IC;
- (id)ic_briefFormattedDate;
- (id)ic_briefFormattedDate:()IC locale:;
- (id)ic_briefFormattedDateForAccessibility;
- (id)ic_endOfDay;
- (id)ic_shortFormattedDateForAccessibility:()IC;
- (id)ic_startOfDay;
- (uint64_t)ic_briefFormattedDateForSiriLocale:()IC forAccessibility:;
- (uint64_t)ic_isLaterThanUnitsAgo:()IC value:;
- (uint64_t)ic_isSameDayAsDate:()IC;
- (uint64_t)ic_isToday;
- (uint64_t)ic_isWithinInclusiveDayIntervalBeginning:()IC ending:;
- (uint64_t)ic_isWithinSameMonth:()IC;
- (uint64_t)ic_isWithinSameYear:()IC;
- (uint64_t)ic_isYesterday;
- (uint64_t)ic_iso8601Date;
- (uint64_t)ic_localDateWithSeconds;
- (uint64_t)ic_shortFormattedDate;
- (uint64_t)ic_shortFormattedDateForAccessibility;
- (uint64_t)ic_truncated;
- (unint64_t)ic_numberOfDaysFromDate:()IC;
@end

@implementation NSDate(IC)

- (uint64_t)ic_isToday
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [v2 components:28 fromDate:a1];
  v4 = [v2 dateFromComponents:v3];
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [v2 components:28 fromDate:v5];

  v7 = [v2 dateFromComponents:v6];
  uint64_t v8 = [v4 isEqualToDate:v7];

  return v8;
}

- (uint64_t)ic_isYesterday
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [v2 components:28 fromDate:a1];
  v4 = [v2 dateFromComponents:v3];
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setDay:-1];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [v2 dateByAddingComponents:v5 toDate:v6 options:0];

  uint64_t v8 = [v2 components:28 fromDate:v7];
  v9 = [v2 dateFromComponents:v8];

  uint64_t v10 = [v4 isEqualToDate:v9];
  return v10;
}

- (uint64_t)ic_localDateWithSeconds
{
  if (ic_localDateWithSeconds_localFormatterOnceToken != -1) {
    dispatch_once(&ic_localDateWithSeconds_localFormatterOnceToken, &__block_literal_global_24);
  }
  v2 = (void *)ic_localDateWithSeconds_localFormatter;
  return [v2 stringFromDate:a1];
}

- (id)ic_startOfDay
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [v2 startOfDayForDate:a1];

  return v3;
}

- (id)ic_endOfDay
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [v2 components:28 fromDate:a1];
  [v3 setHour:23];
  [v3 setMinute:59];
  [v3 setSecond:59];
  v4 = [v2 dateFromComponents:v3];

  return v4;
}

- (uint64_t)ic_iso8601Date
{
  if (ic_iso8601Date_onceToken != -1) {
    dispatch_once(&ic_iso8601Date_onceToken, &__block_literal_global_5_0);
  }
  v2 = (void *)ic_iso8601Date_dateFormatter;
  return [v2 stringFromDate:a1];
}

- (uint64_t)ic_shortFormattedDate
{
  return objc_msgSend(a1, "ic_shortFormattedDateForAccessibility:", 0);
}

- (uint64_t)ic_shortFormattedDateForAccessibility
{
  return objc_msgSend(a1, "ic_shortFormattedDateForAccessibility:", 1);
}

- (id)ic_shortFormattedDateForAccessibility:()IC
{
  if ((objc_msgSend(a1, "ic_isToday") & 1) != 0 || objc_msgSend(a1, "ic_isYesterday"))
  {
    if (ic_shortFormattedDateForAccessibility__shortRelativeOnceToken != -1) {
      dispatch_once(&ic_shortFormattedDateForAccessibility__shortRelativeOnceToken, &__block_literal_global_8_1);
    }
    id v5 = &ic_shortFormattedDateForAccessibility__shortRelativeformatter;
  }
  else if (a3)
  {
    if (ic_shortFormattedDateForAccessibility__shortAccessibilityStandardOnceToken != -1) {
      dispatch_once(&ic_shortFormattedDateForAccessibility__shortAccessibilityStandardOnceToken, &__block_literal_global_10_1);
    }
    id v5 = &ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter;
  }
  else
  {
    if (ic_shortFormattedDateForAccessibility__shortStandardOnceToken != -1) {
      dispatch_once(&ic_shortFormattedDateForAccessibility__shortStandardOnceToken, &__block_literal_global_12_0);
    }
    id v5 = &ic_shortFormattedDateForAccessibility__shortStandardformatter;
  }
  v6 = [(id)*v5 stringFromDate:a1];
  return v6;
}

- (id)ic_briefFormattedDate
{
  if (ic_briefFormattedDate_cachedDateString) {
    BOOL v2 = ic_briefFormattedDate_cachedDate == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || ([(id)ic_briefFormattedDate_cachedDate timeIntervalSinceDate:a1], fabs(v3) >= 1.0))
  {
    v4 = [MEMORY[0x263EFF960] currentLocale];
    id v5 = (void *)[v4 copy];
    uint64_t v6 = objc_msgSend(a1, "ic_briefFormattedDate:locale:", 0, v5);
    v7 = (void *)ic_briefFormattedDate_cachedDateString;
    ic_briefFormattedDate_cachedDateString = v6;

    objc_storeStrong((id *)&ic_briefFormattedDate_cachedDate, a1);
  }
  uint64_t v8 = (void *)ic_briefFormattedDate_cachedDateString;
  return v8;
}

- (uint64_t)ic_briefFormattedDateForSiriLocale:()IC forAccessibility:
{
  return objc_msgSend(a1, "ic_briefFormattedDate:locale:", a4, a3);
}

- (id)ic_briefFormattedDateForAccessibility
{
  BOOL v2 = [MEMORY[0x263EFF960] currentLocale];
  double v3 = objc_msgSend(a1, "ic_briefFormattedDate:locale:", 1, v2);

  return v3;
}

- (id)ic_briefFormattedDate:()IC locale:
{
  id v6 = a4;
  id v7 = a1;
  uint64_t v8 = [MEMORY[0x263EFF910] distantFuture];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF910] date];

    id v7 = (id)v10;
  }
  if (objc_msgSend(v7, "ic_isToday"))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke;
    block[3] = &unk_2640CD3A8;
    id v37 = v6;
    if (ic_briefFormattedDate_locale__briefTodayOnceToken[0] != -1) {
      dispatch_once(ic_briefFormattedDate_locale__briefTodayOnceToken, block);
    }
    v11 = [(id)ic_briefFormattedDate_locale__briefTodayFormatter stringFromDate:v7];
    v12 = v37;
  }
  else
  {
    v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    v13 = [MEMORY[0x263EFF910] date];
    v14 = [v12 components:28 fromDate:v13];

    v15 = [v12 dateFromComponents:v14];
    v16 = [v12 dateByAddingUnit:16 value:-1 toDate:v15 options:0];
    v17 = [v12 dateByAddingUnit:0x2000 value:-1 toDate:v15 options:0];
    if ([v7 compare:v16] == 1 || objc_msgSend(v7, "compare:", v17) != 1)
    {
      if (a3)
      {
        uint64_t v26 = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        v28 = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_3;
        v29 = &unk_2640CD3A8;
        v18 = &v30;
        id v30 = v6;
        if (ic_briefFormattedDate_locale__templateOnceToken_15 != -1) {
          dispatch_once(&ic_briefFormattedDate_locale__templateOnceToken_15, &v26);
        }
        v19 = &ic_briefFormattedDate_locale__accessibilityDateFormatter;
      }
      else
      {
        uint64_t v21 = MEMORY[0x263EF8330];
        uint64_t v22 = 3221225472;
        v23 = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_4;
        v24 = &unk_2640CD3A8;
        v18 = &v25;
        id v25 = v6;
        if (ic_briefFormattedDate_locale__briefRelativeOnceToken != -1) {
          dispatch_once(&ic_briefFormattedDate_locale__briefRelativeOnceToken, &v21);
        }
        v19 = &ic_briefFormattedDate_locale__briefRelativeFormatter;
      }
    }
    else
    {
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      v33 = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_2;
      v34 = &unk_2640CD3A8;
      v18 = &v35;
      id v35 = v6;
      if (ic_briefFormattedDate_locale__templateOnceToken != -1) {
        dispatch_once(&ic_briefFormattedDate_locale__templateOnceToken, &v31);
      }
      v19 = &ic_briefFormattedDate_locale__templateFormatter;
    }
    v11 = objc_msgSend((id)*v19, "stringFromDate:", v7, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35);
  }
  return v11;
}

- (uint64_t)ic_truncated
{
  v1 = (void *)MEMORY[0x263EFF910];
  [a1 timeIntervalSince1970];
  double v3 = trunc(v2);
  return [v1 dateWithTimeIntervalSince1970:v3];
}

- (uint64_t)ic_isSameDayAsDate:()IC
{
  v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 inSameDayAsDate:v5];

  return v7;
}

- (BOOL)ic_isEarlierThanDate:()IC
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)ic_isLaterThanDate:()IC
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (uint64_t)ic_isLaterThanUnitsAgo:()IC value:
{
  uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v8 = [MEMORY[0x263EFF910] now];
  int v9 = [v7 dateByAddingUnit:a3 value:-a4 toDate:v8 options:0];

  uint64_t v10 = objc_msgSend(a1, "ic_isLaterThanDate:", v9);
  return v10;
}

- (uint64_t)ic_isWithinInclusiveDayIntervalBeginning:()IC ending:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  if (v6
    && objc_msgSend(a1, "ic_isEarlierThanDate:", v6)
    && ![v8 isDate:a1 inSameDayAsDate:v6])
  {
    uint64_t v9 = 0;
  }
  else if (v7 && objc_msgSend(a1, "ic_isLaterThanDate:", v7))
  {
    uint64_t v9 = [v8 isDate:a1 inSameDayAsDate:v7];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (uint64_t)ic_isWithinSameMonth:()IC
{
  v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 equalToDate:v5 toUnitGranularity:8];

  return v7;
}

- (uint64_t)ic_isWithinSameYear:()IC
{
  v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 equalToDate:v5 toUnitGranularity:4];

  return v7;
}

- (unint64_t)ic_numberOfDaysFromDate:()IC
{
  v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  unint64_t v7 = [v6 ordinalityOfUnit:16 inUnit:2 forDate:a1];
  unint64_t v8 = [v6 ordinalityOfUnit:16 inUnit:2 forDate:v5];

  if (v7 <= v8) {
    unint64_t v9 = v8 - v7;
  }
  else {
    unint64_t v9 = v7 - v8;
  }

  return v9;
}

@end