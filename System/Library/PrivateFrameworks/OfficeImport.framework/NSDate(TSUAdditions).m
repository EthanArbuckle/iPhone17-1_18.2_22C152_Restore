@interface NSDate(TSUAdditions)
- (BOOL)tsu_isEqualToDate:()TSUAdditions;
- (__CFString)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions withDateFormatter:shortAsPossible:;
- (id)p_rule1To23HoursAgo:()TSUAdditions;
- (id)p_rule1To59MinutesAgo:()TSUAdditions;
- (id)p_ruleForOverAWeekAgoForDate:()TSUAdditions withDateFormatter:;
- (id)p_ruleForOverAYearAgoForDate:()TSUAdditions withDateFormatter:;
- (id)p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:()TSUAdditions withDateFormatter:;
- (id)p_ruleForYesterday:()TSUAdditions withDateFormatter:;
- (id)p_ruleForYesterdayShortAsPossible:()TSUAdditions;
- (id)tsu_fullFormattedDateWithPeriod;
- (id)tsu_initWithDOSTime:()TSUAdditions;
- (uint64_t)tsu_DOSTime;
- (uint64_t)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions;
- (uint64_t)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions withDateFormatter:;
@end

@implementation NSDate(TSUAdditions)

- (id)tsu_initWithDOSTime:()TSUAdditions
{
  v4 = 0;
  memset(&v9.tm_wday, 0, 32);
  v9.tm_isdst = -1;
  v9.tm_sec = (a3 >> 15) & 0x3E;
  v9.tm_min = (a3 >> 21) & 0x3F;
  v9.tm_hour = a3 >> 27;
  v9.tm_mday = a3 & 0x1F;
  int32x2_t v5 = (int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF7FFFFFFFBLL), (int8x8_t)0x7F0000000FLL);
  *(int32x2_t *)&v9.tm_mon = vadd_s32(v5, (int32x2_t)0x50FFFFFFFFLL);
  BOOL v7 = (v5.i32[0] - 13) < 0xFFFFFFF4 || (a3 & 0x1F) == 0 || a3 >> 30 == 3;
  if (!v7 && ((a3 >> 21) & 0x3F) <= 0x3B && ((a3 >> 15) & 0x3E) <= 0x3B) {
    v4 = (void *)[a1 initWithTimeIntervalSince1970:(double)mktime(&v9)];
  }

  return v4;
}

- (uint64_t)tsu_DOSTime
{
  [a1 timeIntervalSince1970];
  time_t v5 = (uint64_t)v1;
  v2 = localtime(&v5);
  int tm_year = v2->tm_year;
  if (tm_year <= 81) {
    LOWORD(tm_year) = 81;
  }
  return (unsigned __int16)((32 * v2->tm_mon + 32) | v2->tm_mday | (((_WORD)tm_year << 9) + 24576)) | ((unsigned __int16)((32 * LOWORD(v2->tm_min)) | ((unsigned __int16)v2->tm_hour << 11) | ((unsigned __int16)v2->tm_sec >> 1)) << 16);
}

- (__CFString)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions withDateFormatter:shortAsPossible:
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = @" ";
    goto LABEL_29;
  }
  if ([a1 compare:v8] == -1)
  {
    objc_msgSend(a1, "tsu_fullFormattedDateWithPeriod");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  v11 = [v10 components:240 fromDate:v8 toDate:a1 options:0];
  v12 = [v10 components:752 fromDate:v8];
  v13 = [v10 components:512 fromDate:a1];
  uint64_t v14 = [v13 weekday];
  if (v14 - [v12 weekday] == 1) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = [v12 weekday] == 7 && objc_msgSend(v13, "weekday") == 1;
  }
  if ([v11 day] < 365)
  {
    if ([v11 day] < 8)
    {
      if ([v11 day] <= 1 && (objc_msgSend(v11, "day") != 1 ? (char v18 = 1) : (char v18 = v15), (v18 & 1) != 0))
      {
        if ([v11 day] == 1 && v15)
        {
          if (a5) {
            objc_msgSend(a1, "p_ruleForYesterdayShortAsPossible:", v8);
          }
          else {
          uint64_t v17 = objc_msgSend(a1, "p_ruleForYesterday:withDateFormatter:", v8, v9);
          }
        }
        else if ([v11 hour] < 1)
        {
          if ([v11 minute] < 1)
          {
            v22 = SFUBundle();
            v20 = [v22 localizedStringForKey:@"Just now" value:&stru_26EBF24D8 table:@"TSUtility"];

            goto LABEL_28;
          }
          uint64_t v17 = objc_msgSend(a1, "p_rule1To59MinutesAgo:", objc_msgSend(v11, "minute"));
        }
        else
        {
          uint64_t v17 = objc_msgSend(a1, "p_rule1To23HoursAgo:", objc_msgSend(v11, "hour"));
        }
      }
      else
      {
        uint64_t v17 = objc_msgSend(a1, "p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:withDateFormatter:", v8, v9);
      }
    }
    else
    {
      uint64_t v17 = objc_msgSend(a1, "p_ruleForOverAWeekAgoForDate:withDateFormatter:", v8, v9);
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend(a1, "p_ruleForOverAYearAgoForDate:withDateFormatter:", v8, v9);
  }
  v20 = (void *)v17;
LABEL_28:
  v16 = v20;

LABEL_29:
  return v16;
}

- (uint64_t)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions withDateFormatter:
{
  return objc_msgSend(a1, "tsu_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:", a3, a4, 0);
}

- (uint64_t)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:", a3, 0, 0);
}

- (id)p_rule1To59MinutesAgo:()TSUAdditions
{
  v4 = SFUBundle();
  time_t v5 = [v4 localizedStringForKey:@"%ld min ago" value:&stru_26EBF24D8 table:@"TSUtility"];

  v6 = objc_msgSend(NSString, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (id)p_rule1To23HoursAgo:()TSUAdditions
{
  v4 = NSString;
  time_t v5 = SFUBundle();
  v6 = [v5 localizedStringForKey:@"%ld hour(s) ago" value:&stru_26EBF24D8 table:@"TSUtility"];
  BOOL v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (id)p_ruleForYesterdayShortAsPossible:()TSUAdditions
{
  v0 = SFUBundle();
  double v1 = [v0 localizedStringForKey:@"Yesterday" value:&stru_26EBF24D8 table:@"TSUtility"];

  return v1;
}

- (id)p_ruleForYesterday:()TSUAdditions withDateFormatter:
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  }
  [v6 setLocalizedDateFormatFromTemplate:@"hhmma"];
  BOOL v7 = SFUBundle();
  id v8 = [v7 localizedStringForKey:@"Yesterday, %@", &stru_26EBF24D8, @"TSUtility" value table];

  id v9 = NSString;
  v10 = [v6 stringFromDate:v5];
  v11 = objc_msgSend(v9, "stringWithFormat:", v8, v10);

  return v11;
}

- (id)p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:()TSUAdditions withDateFormatter:
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  }
  [v6 setLocalizedDateFormatFromTemplate:@"eeehhmma"];
  BOOL v7 = [v6 stringFromDate:v5];

  return v7;
}

- (id)p_ruleForOverAWeekAgoForDate:()TSUAdditions withDateFormatter:
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  }
  [v6 setLocalizedDateFormatFromTemplate:@"MMMdhhmma"];
  BOOL v7 = [v6 stringFromDate:v5];

  return v7;
}

- (id)p_ruleForOverAYearAgoForDate:()TSUAdditions withDateFormatter:
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  }
  [v6 setLocalizedDateFormatFromTemplate:@"Mdy"];
  BOOL v7 = [v6 stringFromDate:v5];

  return v7;
}

- (id)tsu_fullFormattedDateWithPeriod
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setLocalizedDateFormatFromTemplate:@"MMMMddyyyyhhmma"];
  v3 = [v2 stringFromDate:a1];

  return v3;
}

- (BOOL)tsu_isEqualToDate:()TSUAdditions
{
  id v4 = a3;
  if (v4)
  {
    [a1 timeIntervalSince1970];
    double v6 = v5;
    [v4 timeIntervalSince1970];
    BOOL v8 = v6 == v7 || vabdd_f64(v6, v7) < fabs(v7 * 1.0e-10);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end