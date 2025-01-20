@interface NSDate(FCAdditions)
+ (double)fc_timeIntervalOneDay;
+ (double)fc_timeIntervalOneHour;
+ (double)fc_timeIntervalOneWeek;
+ (id)_fr_sharedYearAndMonthDateFormatter;
+ (id)fc_dateFromString:()FCAdditions possibleFormats:;
+ (id)fc_dateFromStringWithHTTPHeaderFormat:()FCAdditions;
+ (id)fc_dateFromStringWithISO8601Format:()FCAdditions;
+ (id)fc_dateRoundedToNearestDayForDate:()FCAdditions;
+ (id)fc_dateRoundedToNearestMinuteForDate:()FCAdditions;
+ (id)fc_earlierDateAllowingNilWithDate:()FCAdditions andDate:;
+ (id)fc_laterDateAllowingNilWithDate:()FCAdditions andDate:;
+ (uint64_t)fc_dateWithMillisecondTimeIntervalSince1970:()FCAdditions;
+ (uint64_t)fc_dateWithTimeIntervalBeforeNow:()FCAdditions;
- (BOOL)fc_isEarlierThan:()FCAdditions;
- (BOOL)fc_isEarlierThan:()FCAdditions withPrecision:;
- (BOOL)fc_isEarlierThanOrEqualTo:()FCAdditions;
- (BOOL)fc_isLaterThan:()FCAdditions;
- (BOOL)fc_isLaterThan:()FCAdditions withPrecision:;
- (BOOL)fc_isLaterThanOrEqualTo:()FCAdditions;
- (BOOL)fc_isWeekend;
- (BOOL)fc_isWithinTimeInterval:()FCAdditions ofDate:;
- (double)fc_timeIntervalUntilNow;
- (id)fc_adjustToRecentDate;
- (id)fc_dateByRoundingDownToNearestQuarterHour;
- (id)fc_dateOfEarliestGregorianCalendarDay;
- (id)fc_stringWithISO8601Format;
- (id)fc_stringWithYearAndMonthFormat;
- (uint64_t)fc_GregorianCalendarDaysSinceDate:()FCAdditions;
- (uint64_t)fc_dateBySubtractingTimeInterval:()FCAdditions;
- (uint64_t)fc_isSameDayAs:()FCAdditions;
- (uint64_t)isInFuture;
- (uint64_t)isToday;
- (unint64_t)fc_millisecondTimeIntervalSince1970;
- (unint64_t)fc_millisecondTimeIntervalSinceDate:()FCAdditions;
- (unint64_t)fc_millisecondTimeIntervalUntilNow;
@end

@implementation NSDate(FCAdditions)

- (unint64_t)fc_millisecondTimeIntervalUntilNow
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:a1];
  unint64_t v4 = (unint64_t)(fmax(v3, 0.0) * 1000.0);

  return v4;
}

- (double)fc_timeIntervalUntilNow
{
  [a1 timeIntervalSinceNow];
  return -v1;
}

- (BOOL)fc_isLaterThan:()FCAdditions withPrecision:
{
  id v6 = a3;
  [a1 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [v6 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (v8 <= v10) {
    return 0;
  }
  double v11 = 0.001;
  if (a4 != 1) {
    double v11 = 0.0;
  }
  if (a4 == 2) {
    double v11 = 1.0;
  }
  return vabdd_f64(v8, v10) >= v11;
}

+ (double)fc_timeIntervalOneDay
{
  return 86400.0;
}

+ (id)fc_laterDateAllowingNilWithDate:()FCAdditions andDate:
{
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  if (!v5)
  {
    id v8 = v6;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v5 laterDate:v6];
LABEL_5:
    double v9 = v8;
    goto LABEL_7;
  }
  double v9 = 0;
LABEL_7:

  return v9;
}

- (uint64_t)fc_dateBySubtractingTimeInterval:()FCAdditions
{
  return [a1 dateByAddingTimeInterval:-a3];
}

- (unint64_t)fc_millisecondTimeIntervalSince1970
{
  [a1 timeIntervalSince1970];
  return (unint64_t)(fmax(v1, 0.0) * 1000.0);
}

- (BOOL)fc_isLaterThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

+ (double)fc_timeIntervalOneHour
{
  return 3600.0;
}

+ (double)fc_timeIntervalOneWeek
{
  return 604800.0;
}

+ (id)fc_dateFromString:()FCAdditions possibleFormats:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "string != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "+[NSDate(FCAdditions) fc_dateFromString:possibleFormats:]";
    __int16 v26 = 2080;
    v27 = "NSDate+FCAdditions.m";
    __int16 v28 = 1024;
    int v29 = 56;
    __int16 v30 = 2114;
    v31 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "formats != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "+[NSDate(FCAdditions) fc_dateFromString:possibleFormats:]";
    __int16 v26 = 2080;
    v27 = "NSDate+FCAdditions.m";
    __int16 v28 = 1024;
    int v29 = 57;
    __int16 v30 = 2114;
    v31 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
LABEL_8:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1A6260FD0]();
      v14 = [MEMORY[0x1E4F28C10] dateFormatterWithFormat:v12 forReuse:0];
      v15 = [v14 dateFromString:v5];

      if (v15) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v15 = 0;
  }

  return v15;
}

+ (id)fc_dateFromStringWithISO8601Format:()FCAdditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"yyyy-MM-dd'T'HH:mm:ssZZ";
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  id v7 = objc_msgSend(a1, "fc_dateFromString:possibleFormats:", v5, v6, v9, v10);

  return v7;
}

+ (id)fc_dateFromStringWithHTTPHeaderFormat:()FCAdditions
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"EEE, dd MMM yyyy HH:mm:ss z";
  v9[1] = @"EEEE, dd-MMM-yy HH:mm:ss z";
  v9[2] = @"EEE MMM d HH:mm:ss yyyy";
  v9[3] = @"EEE MMM dd HH:mm:ss z yyyy";
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:4];
  id v7 = objc_msgSend(a1, "fc_dateFromString:possibleFormats:", v5, v6);

  return v7;
}

+ (uint64_t)fc_dateWithTimeIntervalBeforeNow:()FCAdditions
{
  return [a1 dateWithTimeIntervalSinceNow:-a3];
}

- (BOOL)fc_isEarlierThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)fc_isEarlierThanOrEqualTo:()FCAdditions
{
  return (unint64_t)(objc_msgSend(a1, "compare:") + 1) < 2;
}

- (BOOL)fc_isEarlierThan:()FCAdditions withPrecision:
{
  id v6 = a3;
  [a1 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [v6 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (v8 >= v10) {
    return 0;
  }
  double v11 = 0.001;
  if (a4 != 1) {
    double v11 = 0.0;
  }
  if (a4 == 2) {
    double v11 = 1.0;
  }
  return vabdd_f64(v8, v10) >= v11;
}

- (BOOL)fc_isLaterThanOrEqualTo:()FCAdditions
{
  return (unint64_t)objc_msgSend(a1, "compare:") < 2;
}

- (BOOL)fc_isWithinTimeInterval:()FCAdditions ofDate:
{
  objc_msgSend(a1, "timeIntervalSinceDate:");
  return fabs(v3) <= a2;
}

+ (uint64_t)fc_dateWithMillisecondTimeIntervalSince1970:()FCAdditions
{
  return [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)a3 / 1000.0];
}

- (unint64_t)fc_millisecondTimeIntervalSinceDate:()FCAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    double v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "date");
    *(_DWORD *)buf = 136315906;
    double v10 = "-[NSDate(FCAdditions) fc_millisecondTimeIntervalSinceDate:]";
    __int16 v11 = 2080;
    uint64_t v12 = "NSDate+FCAdditions.m";
    __int16 v13 = 1024;
    int v14 = 176;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [a1 timeIntervalSinceDate:v4];
  double v6 = v5;

  return (unint64_t)(fmax(v6, 0.0) * 1000.0);
}

- (id)fc_dateOfEarliestGregorianCalendarDay
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  double v3 = (void *)[v2 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];

  id v7 = 0;
  [v3 rangeOfUnit:16 startDate:&v7 interval:0 forDate:a1];
  id v5 = v7;

  return v5;
}

- (uint64_t)fc_GregorianCalendarDaysSinceDate:()FCAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "date");
    *(_DWORD *)buf = 136315906;
    __int16 v15 = "-[NSDate(FCAdditions) fc_GregorianCalendarDaysSinceDate:]";
    __int16 v16 = 2080;
    uint64_t v17 = "NSDate+FCAdditions.m";
    __int16 v18 = 1024;
    int v19 = 201;
    __int16 v20 = 2114;
    long long v21 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  double v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v6 setTimeZone:v7];

  double v8 = objc_msgSend(v4, "fc_dateOfEarliestGregorianCalendarDay");
  double v9 = objc_msgSend(a1, "fc_dateOfEarliestGregorianCalendarDay");
  double v10 = [v6 components:16 fromDate:v8 toDate:v9 options:0];
  uint64_t v11 = [v10 day];

  return v11;
}

- (uint64_t)isToday
{
  id v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 isDateInToday:a1];

  return v3;
}

- (uint64_t)isInFuture
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = objc_msgSend(a1, "fc_isLaterThan:", v2);

  return v3;
}

- (BOOL)fc_isWeekend
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1C3E0]];
  id v4 = [v3 components:524 fromDate:a1];

  BOOL v5 = [v4 weekday] == 1 || objc_msgSend(v4, "weekday") == 7;
  return v5;
}

- (uint64_t)fc_isSameDayAs:()FCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  double v6 = [v4 currentCalendar];
  id v7 = [v6 components:28 fromDate:a1];

  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = [v8 components:28 fromDate:v5];

  uint64_t v10 = [v7 isEqual:v9];
  return v10;
}

+ (id)fc_earlierDateAllowingNilWithDate:()FCAdditions andDate:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v8 = v6;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v5 earlierDate:v6];
LABEL_5:
    double v9 = v8;
    goto LABEL_7;
  }
  double v9 = 0;
LABEL_7:

  return v9;
}

+ (id)fc_dateRoundedToNearestMinuteForDate:()FCAdditions
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v5 components:124 fromDate:v4];

  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v8 = [v7 dateFromComponents:v6];

  return v8;
}

+ (id)fc_dateRoundedToNearestDayForDate:()FCAdditions
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v5 components:28 fromDate:v4];

  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v8 = [v7 dateFromComponents:v6];

  return v8;
}

- (id)fc_dateByRoundingDownToNearestQuarterHour
{
  id v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 components:124 fromDate:a1];

  objc_msgSend(v3, "setMinute:", (uint64_t)(floor((double)objc_msgSend(v3, "minute") / 15.0) * 15.0));
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [v4 dateFromComponents:v3];

  return v5;
}

- (id)fc_stringWithISO8601Format
{
  id v2 = [MEMORY[0x1E4F28C10] dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ssZZ" forReuse:0];
  uint64_t v3 = [v2 stringFromDate:a1];

  return v3;
}

- (id)fc_stringWithYearAndMonthFormat
{
  id v2 = objc_msgSend((id)objc_opt_class(), "_fr_sharedYearAndMonthDateFormatter");
  uint64_t v3 = [v2 stringFromDate:a1];

  return v3;
}

- (id)fc_adjustToRecentDate
{
  id v1 = a1;
  objc_msgSend(v1, "fc_timeIntervalUntilNow");
  if (v2 > 86400.0)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(double)((int)v2 % 86400)];

    id v1 = (id)v3;
  }
  return v1;
}

+ (id)_fr_sharedYearAndMonthDateFormatter
{
  if (_MergedGlobals_206 != -1) {
    dispatch_once(&_MergedGlobals_206, &__block_literal_global_152);
  }
  v0 = (void *)qword_1EB5D1A10;
  return v0;
}

@end