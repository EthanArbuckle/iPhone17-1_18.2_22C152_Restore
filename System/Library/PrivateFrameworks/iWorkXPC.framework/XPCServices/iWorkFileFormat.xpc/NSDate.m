@interface NSDate
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)tsu_DOSTime;
- (BOOL)p_localeUses24HourTimeCycle;
- (BOOL)tsu_isEqualToDate:(id)a3;
- (BOOL)tsu_isEqualToFileModificationDateAccountingForTruncation:(id)a3;
- (id)dateFormatterFromTemplate12Hour:(id)a3 template24Hour:(id)a4 withDateFormatter:(id)a5;
- (id)p_rule1To23HoursAgo:(int64_t)a3 withDateFormatter:(id)a4 lowercase:(BOOL)a5;
- (id)p_rule1To59MinutesAgo:(int64_t)a3 withDateFormatter:(id)a4 lowercase:(BOOL)a5;
- (id)p_ruleForOverAWeekAgoForDate:(id)a3 withDateFormatter:(id)a4;
- (id)p_ruleForOverAYearAgoForDate:(id)a3 withDateFormatter:(id)a4;
- (id)p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:(id)a3 withDateFormatter:(id)a4;
- (id)p_ruleForYesterday:(id)a3 withDateFormatter:(id)a4 lowercase:(BOOL)a5;
- (id)p_stringWithString:(id)a3 lowercase:(BOOL)a4 dateFormatter:(id)a5;
- (id)tsu_fullFormattedDate;
- (id)tsu_initWithDOSTime:(id)a3;
- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3;
- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4;
- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4 shortAsPossible:(BOOL)a5;
- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4 shortAsPossible:(BOOL)a5 lowercaseIfNeeded:(BOOL)a6;
- (id)tsu_shortFormattedDate;
@end

@implementation NSDate

- (id)tsu_initWithDOSTime:(id)a3
{
  v4 = 0;
  memset(&v9.tm_wday, 0, 32);
  v9.tm_isdst = -1;
  v9.tm_sec = (*(unsigned int *)&a3 >> 15) & 0x3E;
  v9.tm_min = (*(unsigned int *)&a3 >> 21) & 0x3F;
  v9.tm_hour = *(unsigned int *)&a3 >> 27;
  v9.tm_mday = a3.var0 & 0x1F;
  int32x2_t v5 = (int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*(_DWORD *)&a3), (uint32x2_t)0xFFFFFFF7FFFFFFFBLL), (int8x8_t)0x7F0000000FLL);
  *(int32x2_t *)&v9.tm_mon = vadd_s32(v5, (int32x2_t)0x50FFFFFFFFLL);
  BOOL v7 = (v5.i32[0] - 13) < 0xFFFFFFF4 || (a3.var0 & 0x1F) == 0 || *(unsigned int *)&a3 >> 30 == 3;
  if (!v7 && ((*(unsigned int *)&a3 >> 21) & 0x3F) <= 0x3B && ((*(unsigned int *)&a3 >> 15) & 0x3E) <= 0x3B) {
    v4 = [(NSDate *)self initWithTimeIntervalSince1970:(double)mktime(&v9)];
  }

  return v4;
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)tsu_DOSTime
{
  [(NSDate *)self timeIntervalSince1970];
  time_t v6 = (uint64_t)v2;
  v3 = localtime(&v6);
  int tm_year = v3->tm_year;
  if (tm_year <= 81) {
    LOWORD(tm_year) = 81;
  }
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)((unsigned __int16)((32 * v3->tm_mon + 32) | v3->tm_mday | (((_WORD)tm_year << 9) + 24576)) | ((unsigned __int16)((32 * LOWORD(v3->tm_min)) | ((unsigned __int16)v3->tm_hour << 11) | ((unsigned __int16)v3->tm_sec >> 1)) << 16));
}

- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4 shortAsPossible:(BOOL)a5 lowercaseIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v18 = @" ";
    goto LABEL_28;
  }
  if ([(NSDate *)self compare:v10] == NSOrderedAscending)
  {
    v18 = [(NSDate *)self tsu_fullFormattedDate];
    goto LABEL_28;
  }
  v12 = +[NSCalendar currentCalendar];
  v13 = [v12 components:240 fromDate:v10 toDate:self options:0];
  v14 = [v12 components:752 fromDate:v10];
  v15 = [v12 components:512 fromDate:self];
  v16 = [v15 weekday];
  if (v16 - (unsigned char *)[v14 weekday] == 1) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = [v14 weekday] == (id)7 && objc_msgSend(v15, "weekday") == (id)1;
  }
  if ((uint64_t)[v13 day] < 365)
  {
    if ((uint64_t)[v13 day] < 8)
    {
      if ((uint64_t)[v13 day] <= 1 && (objc_msgSend(v13, "day") != (id)1 || v17))
      {
        if ([v13 day] == (id)1 && v17)
        {
          if (!v7)
          {
            uint64_t v19 = [(NSDate *)self p_ruleForYesterday:v10 withDateFormatter:v11 lowercase:v6];
            goto LABEL_26;
          }
          v22 = SFUMainBundle();
          v23 = v22;
          CFStringRef v24 = @"Yesterday";
        }
        else
        {
          if ((uint64_t)[v13 hour] >= 1)
          {
            uint64_t v19 = -[NSDate p_rule1To23HoursAgo:withDateFormatter:lowercase:](self, "p_rule1To23HoursAgo:withDateFormatter:lowercase:", [v13 hour], v11, v6);
            goto LABEL_26;
          }
          if ((uint64_t)[v13 minute] >= 1)
          {
            uint64_t v19 = -[NSDate p_rule1To59MinutesAgo:withDateFormatter:lowercase:](self, "p_rule1To59MinutesAgo:withDateFormatter:lowercase:", [v13 minute], v11, v6);
            goto LABEL_26;
          }
          v22 = SFUMainBundle();
          v23 = v22;
          CFStringRef v24 = @"Just now";
        }
        v27 = [v22 localizedStringForKey:v24 value:&stru_1001D3790 table:@"TSUtility"];
        v25 = [(NSDate *)self p_stringWithString:v27 lowercase:v6 dateFormatter:v11];

        goto LABEL_27;
      }
      uint64_t v19 = [(NSDate *)self p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:v10 withDateFormatter:v11];
    }
    else
    {
      uint64_t v19 = [(NSDate *)self p_ruleForOverAWeekAgoForDate:v10 withDateFormatter:v11];
    }
  }
  else
  {
    uint64_t v19 = [(NSDate *)self p_ruleForOverAYearAgoForDate:v10 withDateFormatter:v11];
  }
LABEL_26:
  v25 = (void *)v19;
LABEL_27:
  v18 = v25;

LABEL_28:
  return v18;
}

- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4 shortAsPossible:(BOOL)a5
{
  return [(NSDate *)self tsu_relativeAnnotationStringForEarlierDate:a3 withDateFormatter:a4 shortAsPossible:a5 lowercaseIfNeeded:0];
}

- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4
{
  return [(NSDate *)self tsu_relativeAnnotationStringForEarlierDate:a3 withDateFormatter:a4 shortAsPossible:0];
}

- (id)tsu_relativeAnnotationStringForEarlierDate:(id)a3
{
  return [(NSDate *)self tsu_relativeAnnotationStringForEarlierDate:a3 withDateFormatter:0 shortAsPossible:0];
}

- (id)p_rule1To59MinutesAgo:(int64_t)a3 withDateFormatter:(id)a4 lowercase:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  tm v9 = SFUMainBundle();
  id v10 = [v9 localizedStringForKey:@"%d min ago" value:&stru_1001D3790 table:@"TSUtility"];

  id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a3);
  v12 = [(NSDate *)self p_stringWithString:v11 lowercase:v5 dateFormatter:v8];

  return v12;
}

- (id)p_rule1To23HoursAgo:(int64_t)a3 withDateFormatter:(id)a4 lowercase:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  tm v9 = SFUMainBundle();
  id v10 = [v9 localizedStringForKey:@"%ld hour(s) ago" value:&stru_1001D3790 table:@"TSUtility"];
  id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a3);

  v12 = [(NSDate *)self p_stringWithString:v11 lowercase:v5 dateFormatter:v8];

  return v12;
}

- (id)p_ruleForYesterday:(id)a3 withDateFormatter:(id)a4 lowercase:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NSDate *)self dateFormatterFromTemplate12Hour:@"hhmma" template24Hour:@"HHmm" withDateFormatter:v8];
  id v11 = SFUMainBundle();
  v12 = [v11 localizedStringForKey:@"Yesterday, %@", &stru_1001D3790, @"TSUtility" value table];

  v13 = [(NSDate *)self p_stringWithString:v12 lowercase:v5 dateFormatter:v8];

  v14 = [v10 stringFromDate:v9];

  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14);

  return v15;
}

- (id)p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:(id)a3 withDateFormatter:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(NSDate *)self dateFormatterFromTemplate12Hour:@"eeehhmma" template24Hour:@"eeeHHmm" withDateFormatter:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

- (id)p_ruleForOverAWeekAgoForDate:(id)a3 withDateFormatter:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(NSDate *)self dateFormatterFromTemplate12Hour:@"MMMdhhmma" template24Hour:@"MMMdHHmm" withDateFormatter:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

- (id)p_ruleForOverAYearAgoForDate:(id)a3 withDateFormatter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init((Class)NSDateFormatter);
  }
  id v9 = v8;
  [v8 setLocalizedDateFormatFromTemplate:@"Mdy"];
  id v10 = [v9 stringFromDate:v5];

  return v10;
}

- (id)tsu_fullFormattedDate
{
  v3 = [(NSDate *)self dateFormatterFromTemplate12Hour:@"MMMMddyyyyhhmma" template24Hour:@"MMMMddyyyyHHmm" withDateFormatter:0];
  v4 = [v3 stringFromDate:self];

  return v4;
}

- (id)tsu_shortFormattedDate
{
  v3 = [(NSDate *)self dateFormatterFromTemplate12Hour:@"MMMdyhhmma" template24Hour:@"MMMdyHHmm" withDateFormatter:0];
  v4 = [v3 stringFromDate:self];

  return v4;
}

- (id)dateFormatterFromTemplate12Hour:(id)a3 template24Hour:(id)a4 withDateFormatter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init((Class)NSDateFormatter);
  }
  v13 = v12;
  if ([(NSDate *)self p_localeUses24HourTimeCycle]) {
    id v14 = v9;
  }
  else {
    id v14 = v8;
  }
  [v13 setLocalizedDateFormatFromTemplate:v14];

  return v13;
}

- (BOOL)p_localeUses24HourTimeCycle
{
  double v2 = +[NSLocale autoupdatingCurrentLocale];
  v3 = +[NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:v2];
  BOOL v4 = [v3 rangeOfString:@"a"] == (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)tsu_isEqualToDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSDate *)self timeIntervalSince1970];
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

- (id)p_stringWithString:(id)a3 lowercase:(BOOL)a4 dateFormatter:(id)a5
{
  id v7 = a3;
  BOOL v8 = v7;
  if (a4)
  {
    id v9 = [a5 locale];
    id v10 = [v8 lowercaseStringWithLocale:v9];
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (BOOL)tsu_isEqualToFileModificationDateAccountingForTruncation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSDate *)self isEqual:v4])
    {
      BOOL v5 = 1;
    }
    else
    {
      [(NSDate *)self timeIntervalSinceReferenceDate];
      double v7 = v6;
      [v4 timeIntervalSinceReferenceDate];
      BOOL v5 = 1;
      BOOL v9 = v7 == floor(v8) || v7 == v8;
      if (!v9 && vabdd_f64(v7, v8) >= 0.001) {
        BOOL v5 = floor(v7) == v8;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end