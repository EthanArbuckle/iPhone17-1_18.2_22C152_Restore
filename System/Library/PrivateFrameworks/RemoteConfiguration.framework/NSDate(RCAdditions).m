@interface NSDate(RCAdditions)
+ (id)_fr_sharedYearAndMonthDateFormatter;
+ (id)rc_dateFromString:()RCAdditions possibleFormats:;
+ (id)rc_dateFromStringWithHTTPHeaderFormat:()RCAdditions;
+ (id)rc_dateFromStringWithISO8601Format:()RCAdditions;
+ (id)rc_earlierDateAllowingNilWithDate:()RCAdditions andDate:;
+ (id)rc_laterDateAllowingNilWithDate:()RCAdditions andDate:;
+ (uint64_t)rc_dateWithMillisecondTimeIntervalSince1970:()RCAdditions;
- (BOOL)rc_isEarlierThan:()RCAdditions;
- (BOOL)rc_isEarlierThan:()RCAdditions withPrecision:;
- (BOOL)rc_isEarlierThanOrEqualTo:()RCAdditions;
- (BOOL)rc_isLaterThan:()RCAdditions;
- (BOOL)rc_isLaterThan:()RCAdditions withPrecision:;
- (BOOL)rc_isLaterThanOrEqualTo:()RCAdditions;
- (BOOL)rc_isWeekend;
- (BOOL)rc_isWithinTimeInterval:()RCAdditions ofDate:;
- (double)rc_timeIntervalUntilNow;
- (id)rc_dateOfEarliestGregorianCalendarDay;
- (id)rc_stringWithISO8601Format;
- (id)rc_stringWithYearAndMonthFormat;
- (uint64_t)isToday;
- (uint64_t)rc_GregorianCalendarDaysSinceDate:()RCAdditions;
- (uint64_t)rc_dateBySubtractingTimeInterval:()RCAdditions;
- (uint64_t)rc_isSameDayAs:()RCAdditions;
- (unint64_t)rc_millisecondTimeIntervalSince1970;
- (unint64_t)rc_millisecondTimeIntervalSinceDate:()RCAdditions;
@end

@implementation NSDate(RCAdditions)

- (double)rc_timeIntervalUntilNow
{
  [a1 timeIntervalSinceNow];
  return -v1;
}

+ (id)rc_dateFromString:()RCAdditions possibleFormats:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[NSDate(RCAdditions) rc_dateFromString:possibleFormats:]();
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSDate(RCAdditions) rc_dateFromString:possibleFormats:]();
  }
LABEL_6:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_8:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1A6261E80](v8);
      v14 = objc_msgSend(MEMORY[0x1E4F28C10], "dateFormatterWithFormat:forReuse:", v12, 0, (void)v17);
      v15 = [v14 dateFromString:v5];

      if (v15) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = v8;
        if (v8) {
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

+ (id)rc_dateFromStringWithISO8601Format:()RCAdditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"yyyy-MM-dd'T'HH:mm:ssZZ";
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  id v7 = objc_msgSend(a1, "rc_dateFromString:possibleFormats:", v5, v6, v9, v10);

  return v7;
}

+ (id)rc_dateFromStringWithHTTPHeaderFormat:()RCAdditions
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"EEE, dd MMM yyyy HH:mm:ss z";
  v9[1] = @"EEEE, dd-MMM-yy HH:mm:ss z";
  v9[2] = @"EEE MMM d HH:mm:ss yyyy";
  v9[3] = @"EEE MMM dd HH:mm:ss z yyyy";
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:4];
  id v7 = objc_msgSend(a1, "rc_dateFromString:possibleFormats:", v5, v6);

  return v7;
}

- (BOOL)rc_isEarlierThan:()RCAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)rc_isEarlierThanOrEqualTo:()RCAdditions
{
  return (unint64_t)(objc_msgSend(a1, "compare:") + 1) < 2;
}

- (BOOL)rc_isEarlierThan:()RCAdditions withPrecision:
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

- (BOOL)rc_isLaterThan:()RCAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)rc_isLaterThanOrEqualTo:()RCAdditions
{
  return (unint64_t)objc_msgSend(a1, "compare:") < 2;
}

- (BOOL)rc_isLaterThan:()RCAdditions withPrecision:
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

- (BOOL)rc_isWithinTimeInterval:()RCAdditions ofDate:
{
  objc_msgSend(a1, "timeIntervalSinceDate:");
  return fabs(v3) <= a2;
}

- (uint64_t)rc_dateBySubtractingTimeInterval:()RCAdditions
{
  return [a1 dateByAddingTimeInterval:-a3];
}

+ (uint64_t)rc_dateWithMillisecondTimeIntervalSince1970:()RCAdditions
{
  return [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)a3 / 1000.0];
}

- (unint64_t)rc_millisecondTimeIntervalSince1970
{
  [a1 timeIntervalSince1970];
  return (unint64_t)(fmax(v1, 0.0) * 1000.0);
}

- (unint64_t)rc_millisecondTimeIntervalSinceDate:()RCAdditions
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSDate(RCAdditions) rc_millisecondTimeIntervalSinceDate:]();
  }
  [a1 timeIntervalSinceDate:v4];
  unint64_t v6 = (unint64_t)(fmax(v5, 0.0) * 1000.0);

  return v6;
}

- (id)rc_dateOfEarliestGregorianCalendarDay
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

- (uint64_t)rc_GregorianCalendarDaysSinceDate:()RCAdditions
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSDate(RCAdditions) rc_GregorianCalendarDaysSinceDate:]();
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  unint64_t v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v6 setTimeZone:v7];

  double v8 = objc_msgSend(v4, "rc_dateOfEarliestGregorianCalendarDay");
  double v9 = objc_msgSend(a1, "rc_dateOfEarliestGregorianCalendarDay");
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

- (BOOL)rc_isWeekend
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1C3E0]];
  id v4 = [v3 components:524 fromDate:a1];

  BOOL v5 = [v4 weekday] == 1 || objc_msgSend(v4, "weekday") == 7;
  return v5;
}

- (uint64_t)rc_isSameDayAs:()RCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  unint64_t v6 = [v4 currentCalendar];
  id v7 = [v6 components:28 fromDate:a1];

  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = [v8 components:28 fromDate:v5];

  uint64_t v10 = [v7 isEqual:v9];
  return v10;
}

+ (id)rc_earlierDateAllowingNilWithDate:()RCAdditions andDate:
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

+ (id)rc_laterDateAllowingNilWithDate:()RCAdditions andDate:
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
    id v8 = [v5 laterDate:v6];
LABEL_5:
    double v9 = v8;
    goto LABEL_7;
  }
  double v9 = 0;
LABEL_7:

  return v9;
}

- (id)rc_stringWithISO8601Format
{
  id v2 = [MEMORY[0x1E4F28C10] dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ssZZ" forReuse:0];
  uint64_t v3 = [v2 stringFromDate:a1];

  return v3;
}

- (id)rc_stringWithYearAndMonthFormat
{
  id v2 = objc_msgSend((id)objc_opt_class(), "_fr_sharedYearAndMonthDateFormatter");
  uint64_t v3 = [v2 stringFromDate:a1];

  return v3;
}

+ (id)_fr_sharedYearAndMonthDateFormatter
{
  if (_fr_sharedYearAndMonthDateFormatter_once != -1) {
    dispatch_once(&_fr_sharedYearAndMonthDateFormatter_once, &__block_literal_global);
  }
  v0 = (void *)_fr_sharedYearAndMonthDateFormatter_sharedDateFormatter;

  return v0;
}

+ (void)rc_dateFromString:()RCAdditions possibleFormats:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"formats != nil", v6, 2u);
}

+ (void)rc_dateFromString:()RCAdditions possibleFormats:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"string != nil", v6, 2u);
}

- (void)rc_millisecondTimeIntervalSinceDate:()RCAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

- (void)rc_GregorianCalendarDaysSinceDate:()RCAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

@end