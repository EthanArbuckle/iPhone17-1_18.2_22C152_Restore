@interface NSDate(MTAdditions)
+ (id)dayOfWeekFromDate:()MTAdditions abbreviated:;
+ (id)mt_dateFormatterJustYear;
+ (id)mt_dateFormatterNoDayWithYear;
+ (id)mt_dateFormatterNoYear;
+ (id)mt_dateFormatterNoYearAbbrevMonth;
+ (id)mt_dateFormatterRelativeDay;
+ (id)mt_dateFormatterShortStyleWithYear;
+ (id)mt_dateFormatterWithYear;
+ (id)mt_lessVerboseDateFormatter;
+ (id)mt_verboseDateFormatter;
- (BOOL)inSameYearAs:()MTAdditions;
- (BOOL)isLessThanDaysOld:()MTAdditions;
- (BOOL)isSameDayOfWeekAs:()MTAdditions;
- (id)abbreviatedFriendlyDisplayString;
- (id)friendlyDisplayString;
- (id)lessVerboseDisplayString;
- (id)lessVerboseDisplayStringWithoutTime;
- (id)lessVerboseDisplayStringWithoutTimeAndCurrentYear;
- (id)microDateString;
- (id)microFriendlyDisplayString:()MTAdditions;
- (id)mt_dateWithDeltaDays:()MTAdditions;
- (id)nanoFriendlyDisplayString;
- (id)verboseDisplayString;
- (id)verboseDisplayStringWithoutTime;
- (id)verboseDisplayStringWithoutTimeAndCurrentYear;
- (id)yearString;
- (uint64_t)isLessThanWeekOld;
- (uint64_t)isThisYear;
- (uint64_t)microFriendlyDisplayString;
- (uint64_t)microUnabbreviatedFriendlyDisplayString;
- (uint64_t)timeString;
@end

@implementation NSDate(MTAdditions)

- (BOOL)inSameYearAs:()MTAdditions
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  v7 = [v6 components:4 fromDate:a1];
  v8 = [v6 components:4 fromDate:v5];

  uint64_t v9 = [v7 year];
  BOOL v10 = v9 == [v8 year];

  return v10;
}

- (id)microDateString
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoYearAbbrevMonth");
  v3 = [v2 stringFromDate:a1];

  return v3;
}

+ (id)mt_dateFormatterNoYearAbbrevMonth
{
  if (mt_dateFormatterNoYearAbbrevMonth_onceToken != -1) {
    dispatch_once(&mt_dateFormatterNoYearAbbrevMonth_onceToken, &__block_literal_global_49);
  }
  v0 = (void *)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth;
  return v0;
}

- (id)friendlyDisplayString
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 startOfDayForDate:a1];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 startOfDayForDate:v4];

  if ([v3 isEqualToDate:v5])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterRelativeDay");
    v7 = v6;
    v8 = v5;
  }
  else
  {
    uint64_t v9 = objc_msgSend(v5, "mt_dateWithDeltaDays:", -7);
    uint64_t v10 = [v3 compare:v9];

    if (v10 == 1)
    {
      v11 = [MEMORY[0x1E4F1C9C8] dayOfWeekFromDate:v3 abbreviated:0];
      goto LABEL_10;
    }
    if ([v3 isThisYear]) {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoYear");
    }
    else {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterWithYear");
    }
    v7 = v6;
    v8 = v3;
  }
  v11 = [v6 stringFromDate:v8];

LABEL_10:
  return v11;
}

- (id)yearString
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterJustYear");
  v3 = [v2 stringFromDate:a1];

  return v3;
}

- (id)abbreviatedFriendlyDisplayString
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 startOfDayForDate:a1];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 startOfDayForDate:v4];

  if ([v3 isEqualToDate:v5])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterRelativeDay");
    v7 = v6;
    v8 = v5;
  }
  else
  {
    uint64_t v9 = objc_msgSend(v5, "mt_dateWithDeltaDays:", -7);
    uint64_t v10 = [v3 compare:v9];

    if (v10 == 1)
    {
      v11 = [MEMORY[0x1E4F1C9C8] dayOfWeekFromDate:v3 abbreviated:0];
      goto LABEL_10;
    }
    if ([v3 isThisYear]) {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoYearAbbrevMonth");
    }
    else {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterWithYear");
    }
    v7 = v6;
    v8 = v3;
  }
  v11 = [v6 stringFromDate:v8];

LABEL_10:
  return v11;
}

- (uint64_t)microFriendlyDisplayString
{
  return [a1 microFriendlyDisplayString:1];
}

- (uint64_t)microUnabbreviatedFriendlyDisplayString
{
  return [a1 microFriendlyDisplayString:0];
}

- (id)microFriendlyDisplayString:()MTAdditions
{
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 startOfDayForDate:a1];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [v5 startOfDayForDate:v7];

  if ([v6 isEqualToDate:v8])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterRelativeDay");
    uint64_t v10 = v9;
    v11 = v8;
  }
  else
  {
    v12 = objc_msgSend(v8, "mt_dateWithDeltaDays:", -7);
    uint64_t v13 = [v6 compare:v12];

    if (v13 == 1)
    {
      v14 = [MEMORY[0x1E4F1C9C8] dayOfWeekFromDate:v6 abbreviated:a3];
      goto LABEL_10;
    }
    if ([v6 isThisYear]) {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoYearAbbrevMonth");
    }
    else {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoDayWithYear");
    }
    uint64_t v10 = v9;
    v11 = v6;
  }
  v14 = [v9 stringFromDate:v11];

LABEL_10:
  return v14;
}

- (id)nanoFriendlyDisplayString
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 startOfDayForDate:a1];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 startOfDayForDate:v4];

  if ([v3 isEqualToDate:v5])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterRelativeDay");
    v7 = v6;
    v8 = v5;
  }
  else
  {
    uint64_t v9 = objc_msgSend(v5, "mt_dateWithDeltaDays:", -7);
    uint64_t v10 = [v3 compare:v9];

    if (v10 == 1)
    {
      v11 = [MEMORY[0x1E4F1C9C8] dayOfWeekFromDate:v3 abbreviated:1];
      goto LABEL_10;
    }
    if ([v3 isThisYear]) {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoYearAbbrevMonth");
    }
    else {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterShortStyleWithYear");
    }
    v7 = v6;
    v8 = v3;
  }
  v11 = [v6 stringFromDate:v8];

LABEL_10:
  return v11;
}

+ (id)dayOfWeekFromDate:()MTAdditions abbreviated:
{
  id v5 = a3;
  if (a4)
  {
    if (dayOfWeekFromDate_abbreviated__onceToken != -1) {
      dispatch_once(&dayOfWeekFromDate_abbreviated__onceToken, &__block_literal_global_10);
    }
    v6 = &dayOfWeekFromDate_abbreviated__formatterAbbrev;
  }
  else
  {
    if (dayOfWeekFromDate_abbreviated__onceToken_5 != -1) {
      dispatch_once(&dayOfWeekFromDate_abbreviated__onceToken_5, &__block_literal_global_7);
    }
    v6 = &dayOfWeekFromDate_abbreviated__formatterVerbose;
  }
  id v7 = (id)*v6;
  v8 = [v7 stringFromDate:v5];

  return v8;
}

- (id)verboseDisplayString
{
  v2 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
  v3 = [v2 localizedStringForKey:@"DATE_AT_TIME" value:&stru_1F03A51F0 table:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_verboseDateFormatter");
  id v5 = [v4 stringFromDate:a1];

  v6 = [a1 timeString];
  id v7 = [NSString stringWithValidatedFormat:v3, @"%@ %@", 0, v5, v6 validFormatSpecifiers error];

  return v7;
}

- (id)lessVerboseDisplayString
{
  v2 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
  v3 = [v2 localizedStringForKey:@"DATE_AT_TIME" value:&stru_1F03A51F0 table:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_lessVerboseDateFormatter");
  id v5 = [v4 stringFromDate:a1];

  v6 = [a1 timeString];
  id v7 = [NSString stringWithValidatedFormat:v3, @"%@ %@", 0, v5, v6 validFormatSpecifiers error];

  return v7;
}

- (id)verboseDisplayStringWithoutTime
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_verboseDateFormatter");
  v3 = [v2 stringFromDate:a1];

  return v3;
}

- (id)lessVerboseDisplayStringWithoutTime
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_lessVerboseDateFormatter");
  v3 = [v2 stringFromDate:a1];

  return v3;
}

- (id)verboseDisplayStringWithoutTimeAndCurrentYear
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 startOfDayForDate:a1];
  if ([v3 isThisYear]) {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoYear");
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_verboseDateFormatter");
  }
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

- (id)lessVerboseDisplayStringWithoutTimeAndCurrentYear
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 startOfDayForDate:a1];
  if ([v3 isThisYear]) {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_dateFormatterNoYear");
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mt_lessVerboseDateFormatter");
  }
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

- (uint64_t)timeString
{
  if (timeString_onceToken[0] != -1) {
    dispatch_once(timeString_onceToken, &__block_literal_global_23_0);
  }
  v2 = (void *)timeString_fmt;
  return [v2 stringFromDate:a1];
}

- (uint64_t)isThisYear
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [a1 inSameYearAs:v2];

  return v3;
}

- (BOOL)isSameDayOfWeekAs:()MTAdditions
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 component:512 fromDate:a1];
  uint64_t v8 = [v6 component:512 fromDate:v5];

  return v7 == v8;
}

+ (id)mt_dateFormatterRelativeDay
{
  if (mt_dateFormatterRelativeDay_onceToken[0] != -1) {
    dispatch_once(mt_dateFormatterRelativeDay_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay;
  return v0;
}

+ (id)mt_dateFormatterWithYear
{
  if (mt_dateFormatterWithYear_onceToken[0] != -1) {
    dispatch_once(mt_dateFormatterWithYear_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)mt_dateFormatterWithYear__s__dateFormatterWithYear;
  return v0;
}

+ (id)mt_dateFormatterJustYear
{
  if (mt_dateFormatterJustYear_onceToken != -1) {
    dispatch_once(&mt_dateFormatterJustYear_onceToken, &__block_literal_global_32);
  }
  v0 = (void *)mt_dateFormatterJustYear_justYearFormatter;
  return v0;
}

+ (id)mt_dateFormatterNoDayWithYear
{
  if (mt_dateFormatterNoDayWithYear_onceToken != -1) {
    dispatch_once(&mt_dateFormatterNoDayWithYear_onceToken, &__block_literal_global_37);
  }
  v0 = (void *)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear;
  return v0;
}

+ (id)mt_dateFormatterShortStyleWithYear
{
  if (mt_dateFormatterShortStyleWithYear_onceToken != -1) {
    dispatch_once(&mt_dateFormatterShortStyleWithYear_onceToken, &__block_literal_global_42);
  }
  v0 = (void *)mt_dateFormatterShortStyleWithYear_dateFormatter;
  return v0;
}

+ (id)mt_dateFormatterNoYear
{
  if (mt_dateFormatterNoYear_onceToken != -1) {
    dispatch_once(&mt_dateFormatterNoYear_onceToken, &__block_literal_global_44);
  }
  v0 = (void *)mt_dateFormatterNoYear__s__dateFormatterNoYear;
  return v0;
}

+ (id)mt_verboseDateFormatter
{
  if (mt_verboseDateFormatter_onceToken != -1) {
    dispatch_once(&mt_verboseDateFormatter_onceToken, &__block_literal_global_54);
  }
  v0 = (void *)mt_verboseDateFormatter__s__dateFormatterWithYear;
  return v0;
}

+ (id)mt_lessVerboseDateFormatter
{
  if (mt_lessVerboseDateFormatter_onceToken[0] != -1) {
    dispatch_once(mt_lessVerboseDateFormatter_onceToken, &__block_literal_global_59);
  }
  v0 = (void *)mt_lessVerboseDateFormatter__s__dateFormatterWithYear;
  return v0;
}

- (BOOL)isLessThanDaysOld:()MTAdditions
{
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 startOfDayForDate:a1];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v5 startOfDayForDate:v7];

  uint64_t v9 = objc_msgSend(v8, "mt_dateWithDeltaDays:", -a3);
  BOOL v10 = [v6 compare:v9] == 1;

  return v10;
}

- (uint64_t)isLessThanWeekOld
{
  return [a1 isLessThanDaysOld:7];
}

- (id)mt_dateWithDeltaDays:()MTAdditions
{
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:a3];
  uint64_t v7 = [v5 dateByAddingComponents:v6 toDate:a1 options:0];

  return v7;
}

@end