@interface SSDateFormatManager
+ (BOOL)date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5;
+ (BOOL)hasRelativeFormatForDate:(id)a3;
+ (BOOL)isDate:(id)a3 withinTimeInterval:(double)a4 includePast:(BOOL)a5;
+ (BOOL)isDateWithinMonthsTime:(id)a3;
+ (BOOL)isDateWithinWeeksTime:(id)a3;
+ (id)allDayDateFormatter;
+ (id)allFormatters;
+ (id)calendar;
+ (id)dateCompletedStringFormat;
+ (id)dateCreatedStringFormat;
+ (id)dateDueStringFormat;
+ (id)dateFormatter;
+ (id)dateIntervalFormatter;
+ (id)dateLastCalledStringFormat;
+ (id)dateLastOpenedStringFormat;
+ (id)dateLastPlayedStringFormat;
+ (id)dateModifiedStringFormat;
+ (id)dyanmicStringFromDate:(id)a3;
+ (id)dynamicCompactStringFromDate:(id)a3;
+ (id)dynamicDateTimeStringsFromDate:(id)a3;
+ (id)dynamicMediumStringFromDate:(id)a3;
+ (id)dynamicStringFromDate:(id)a3 isCompact:(BOOL)a4;
+ (id)fullDateTimeStringsFromDate:(id)a3;
+ (id)icalConformingStringFromDate:(id)a3;
+ (id)mediumDayOfWeekDateTimeIntervalFormatter;
+ (id)nextUpcomingDateForDateComponents:(id)a3 fromDate:(id)a4;
+ (id)shortDateTimeFormatter;
+ (id)shortDateTimeStringFromDate:(id)a3 isAllDay:(BOOL)a4;
+ (id)shortDateTimeStringFromDate:(id)a3 isAllDay:(BOOL)a4 showAllDayString:(BOOL)a5;
+ (id)stringFromBirthdayComponents:(id)a3;
+ (id)stringFromTimeInterval:(double)a3;
+ (id)stringsFromDate:(id)a3 toDate:(id)a4 isAllDay:(BOOL)a5;
+ (id)tomorrow;
+ (void)initialize;
+ (void)overrideLocale:(id)a3;
+ (void)purgeMemory;
- (CNDateComponentsFormatter)birthdayDateComponentsFormatter;
- (NSDateComponentsFormatter)dateComponentsFormatter;
- (NSDateFormatter)dateFormatter;
- (NSDateFormatter)dayOfWeekFormatter;
- (NSDateFormatter)longRelativeDateFormatter;
- (NSDateFormatter)mediumRelativeDateFormatter;
- (NSDateFormatter)shortDateTimeFormatter;
- (NSDateFormatter)shortDayOfWeekFormatter;
- (NSDateFormatter)shortRelativeDateFormatter;
- (NSDateFormatter)shortTimeFormatter;
- (NSDateIntervalFormatter)allDayDateFormatter;
- (NSDateIntervalFormatter)dateIntervalFormatter;
- (NSDateIntervalFormatter)mediumDayOfWeekDateIntervalFormatter;
- (NSDateIntervalFormatter)mediumDayOfWeekDateTimeIntervalFormatter;
- (NSDateIntervalFormatter)shortDateIntervalFormatter;
- (NSDateIntervalFormatter)shortDateTimeIntervalFormatter;
- (NSLocale)overrideLocale;
- (SSDateFormatManager)init;
- (id)allFormatters;
- (id)calendar;
- (id)currentLocale;
- (void)purgeMemory;
- (void)setAllDayDateFormatter:(id)a3;
- (void)setBirthdayDateComponentsFormatter:(id)a3;
- (void)setDateComponentsFormatter:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDateIntervalFormatter:(id)a3;
- (void)setDayOfWeekFormatter:(id)a3;
- (void)setLongRelativeDateFormatter:(id)a3;
- (void)setMediumDayOfWeekDateIntervalFormatter:(id)a3;
- (void)setMediumDayOfWeekDateTimeIntervalFormatter:(id)a3;
- (void)setMediumRelativeDateFormatter:(id)a3;
- (void)setOverrideLocale:(id)a3;
- (void)setShortDateIntervalFormatter:(id)a3;
- (void)setShortDateTimeFormatter:(id)a3;
- (void)setShortDateTimeIntervalFormatter:(id)a3;
- (void)setShortDayOfWeekFormatter:(id)a3;
- (void)setShortRelativeDateFormatter:(id)a3;
- (void)setShortTimeFormatter:(id)a3;
@end

@implementation SSDateFormatManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _sharedDateFormatManager = objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
}

- (SSDateFormatManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSDateFormatManager;
  v2 = [(SSDateFormatManager *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_purgeMemory name:@"UIApplicationDidReceiveMemoryWarningNotification" object:0];
  }
  return v2;
}

+ (void)purgeMemory
{
}

- (void)purgeMemory
{
  birthdayDateComponentsFormatter = self->_birthdayDateComponentsFormatter;
  self->_birthdayDateComponentsFormatter = 0;

  dateComponentsFormatter = self->_dateComponentsFormatter;
  self->_dateComponentsFormatter = 0;

  shortRelativeDateFormatter = self->_shortRelativeDateFormatter;
  self->_shortRelativeDateFormatter = 0;

  mediumRelativeDateFormatter = self->_mediumRelativeDateFormatter;
  self->_mediumRelativeDateFormatter = 0;

  longRelativeDateFormatter = self->_longRelativeDateFormatter;
  self->_longRelativeDateFormatter = 0;

  dayOfWeekFormatter = self->_dayOfWeekFormatter;
  self->_dayOfWeekFormatter = 0;

  shortDayOfWeekFormatter = self->_shortDayOfWeekFormatter;
  self->_shortDayOfWeekFormatter = 0;

  shortDateTimeFormatter = self->_shortDateTimeFormatter;
  self->_shortDateTimeFormatter = 0;

  shortTimeFormatter = self->_shortTimeFormatter;
  self->_shortTimeFormatter = 0;

  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = 0;

  shortDateTimeIntervalFormatter = self->_shortDateTimeIntervalFormatter;
  self->_shortDateTimeIntervalFormatter = 0;

  mediumDayOfWeekDateTimeIntervalFormatter = self->_mediumDayOfWeekDateTimeIntervalFormatter;
  self->_mediumDayOfWeekDateTimeIntervalFormatter = 0;

  shortDateIntervalFormatter = self->_shortDateIntervalFormatter;
  self->_shortDateIntervalFormatter = 0;

  mediumDayOfWeekDateIntervalFormatter = self->_mediumDayOfWeekDateIntervalFormatter;
  self->_mediumDayOfWeekDateIntervalFormatter = 0;

  allDayDateFormatter = self->_allDayDateFormatter;
  self->_allDayDateFormatter = 0;

  dateIntervalFormatter = self->_dateIntervalFormatter;
  self->_dateIntervalFormatter = 0;
}

- (CNDateComponentsFormatter)birthdayDateComponentsFormatter
{
  p_birthdayDateComponentsFormatter = &self->_birthdayDateComponentsFormatter;
  v4 = self->_birthdayDateComponentsFormatter;
  if (!v4)
  {
    v4 = (CNDateComponentsFormatter *)objc_opt_new();
    objc_super v5 = [(SSDateFormatManager *)self currentLocale];
    [(CNDateComponentsFormatter *)v4 setLocale:v5];

    objc_storeStrong((id *)p_birthdayDateComponentsFormatter, v4);
  }
  return v4;
}

- (NSDateComponentsFormatter)dateComponentsFormatter
{
  p_dateComponentsFormatter = &self->_dateComponentsFormatter;
  v3 = self->_dateComponentsFormatter;
  if (!v3)
  {
    v3 = (NSDateComponentsFormatter *)objc_opt_new();
    [(NSDateComponentsFormatter *)v3 setZeroFormattingBehavior:0];
    [(NSDateComponentsFormatter *)v3 setUnitsStyle:0];
    objc_storeStrong((id *)p_dateComponentsFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)shortRelativeDateFormatter
{
  p_shortRelativeDateFormatter = &self->_shortRelativeDateFormatter;
  v3 = self->_shortRelativeDateFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v3 setFormattingContext:1];
    [(NSDateFormatter *)v3 setDateStyle:1];
    [(NSDateFormatter *)v3 setTimeStyle:0];
    [(NSDateFormatter *)v3 setDoesRelativeDateFormatting:1];
    objc_storeStrong((id *)p_shortRelativeDateFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)mediumRelativeDateFormatter
{
  p_mediumRelativeDateFormatter = &self->_mediumRelativeDateFormatter;
  v3 = self->_mediumRelativeDateFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v3 setFormattingContext:1];
    [(NSDateFormatter *)v3 setDateStyle:2];
    [(NSDateFormatter *)v3 setTimeStyle:0];
    [(NSDateFormatter *)v3 setDoesRelativeDateFormatting:1];
    objc_storeStrong((id *)p_mediumRelativeDateFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)longRelativeDateFormatter
{
  p_longRelativeDateFormatter = &self->_longRelativeDateFormatter;
  v3 = self->_longRelativeDateFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v3 setFormattingContext:1];
    [(NSDateFormatter *)v3 setDateStyle:4];
    [(NSDateFormatter *)v3 setTimeStyle:0];
    [(NSDateFormatter *)v3 setDoesRelativeDateFormatting:1];
    objc_storeStrong((id *)p_longRelativeDateFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)dayOfWeekFormatter
{
  p_dayOfWeekFormatter = &self->_dayOfWeekFormatter;
  v4 = self->_dayOfWeekFormatter;
  if (!v4)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    objc_super v5 = (void *)MEMORY[0x1E4F28C10];
    v6 = [(SSDateFormatManager *)self currentLocale];
    v7 = [v5 dateFormatFromTemplate:@"EEEE" options:0 locale:v6];
    [(NSDateFormatter *)v4 setDateFormat:v7];

    objc_storeStrong((id *)p_dayOfWeekFormatter, v4);
  }
  return v4;
}

- (NSDateFormatter)shortDayOfWeekFormatter
{
  p_shortDayOfWeekFormatter = &self->_shortDayOfWeekFormatter;
  v4 = self->_shortDayOfWeekFormatter;
  if (!v4)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    objc_super v5 = (void *)MEMORY[0x1E4F28C10];
    v6 = [(SSDateFormatManager *)self currentLocale];
    v7 = [v5 dateFormatFromTemplate:@"E" options:0 locale:v6];
    [(NSDateFormatter *)v4 setDateFormat:v7];

    objc_storeStrong((id *)p_shortDayOfWeekFormatter, v4);
  }
  return v4;
}

- (NSDateFormatter)shortDateTimeFormatter
{
  p_shortDateTimeFormatter = &self->_shortDateTimeFormatter;
  v3 = self->_shortDateTimeFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v3 setFormattingContext:1];
    [(NSDateFormatter *)v3 setDateStyle:1];
    [(NSDateFormatter *)v3 setTimeStyle:1];
    [(NSDateFormatter *)v3 setDoesRelativeDateFormatting:1];
    objc_storeStrong((id *)p_shortDateTimeFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)shortTimeFormatter
{
  p_shortTimeFormatter = &self->_shortTimeFormatter;
  v3 = self->_shortTimeFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v3 setFormattingContext:1];
    [(NSDateFormatter *)v3 setDateStyle:0];
    [(NSDateFormatter *)v3 setTimeStyle:1];
    objc_storeStrong((id *)p_shortTimeFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)dateFormatter
{
  p_dateFormatter = &self->_dateFormatter;
  v4 = self->_dateFormatter;
  if (!v4)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    objc_super v5 = [@"EMMMdyyyy" stringByAppendingString:@"jmma"];
    [(NSDateFormatter *)v4 setFormattingContext:1];
    v6 = (void *)MEMORY[0x1E4F28C10];
    v7 = [(SSDateFormatManager *)self currentLocale];
    v8 = [v6 dateFormatFromTemplate:v5 options:0 locale:v7];
    [(NSDateFormatter *)v4 setDateFormat:v8];

    objc_storeStrong((id *)p_dateFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)shortDateTimeIntervalFormatter
{
  p_shortDateTimeIntervalFormatter = &self->_shortDateTimeIntervalFormatter;
  v3 = self->_shortDateTimeIntervalFormatter;
  if (!v3)
  {
    v3 = (NSDateIntervalFormatter *)objc_opt_new();
    [(NSDateIntervalFormatter *)v3 setDateStyle:1];
    [(NSDateIntervalFormatter *)v3 setTimeStyle:1];
    objc_storeStrong((id *)p_shortDateTimeIntervalFormatter, v3);
  }
  return v3;
}

- (NSDateIntervalFormatter)mediumDayOfWeekDateTimeIntervalFormatter
{
  v11[3] = *MEMORY[0x1E4F143B8];
  p_mediumDayOfWeekDateTimeIntervalFormatter = &self->_mediumDayOfWeekDateTimeIntervalFormatter;
  v4 = self->_mediumDayOfWeekDateTimeIntervalFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    v11[0] = @"E";
    v11[1] = @"MMMd";
    v11[2] = @"jma";
    objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    v6 = [v5 componentsJoinedByString:&stru_1F1824018];

    v7 = (void *)MEMORY[0x1E4F28C10];
    v8 = [(SSDateFormatManager *)self currentLocale];
    v9 = [v7 dateFormatFromTemplate:v6 options:0 locale:v8];
    [(NSDateIntervalFormatter *)v4 setDateTemplate:v9];

    objc_storeStrong((id *)p_mediumDayOfWeekDateTimeIntervalFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)shortDateIntervalFormatter
{
  p_shortDateIntervalFormatter = &self->_shortDateIntervalFormatter;
  v3 = self->_shortDateIntervalFormatter;
  if (!v3)
  {
    v3 = (NSDateIntervalFormatter *)objc_opt_new();
    [(NSDateIntervalFormatter *)v3 setDateStyle:1];
    [(NSDateIntervalFormatter *)v3 setTimeStyle:0];
    objc_storeStrong((id *)p_shortDateIntervalFormatter, v3);
  }
  return v3;
}

- (NSDateIntervalFormatter)mediumDayOfWeekDateIntervalFormatter
{
  v11[2] = *MEMORY[0x1E4F143B8];
  p_mediumDayOfWeekDateIntervalFormatter = &self->_mediumDayOfWeekDateIntervalFormatter;
  v4 = self->_mediumDayOfWeekDateIntervalFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    v11[0] = @"E";
    v11[1] = @"MMMd";
    objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v6 = [v5 componentsJoinedByString:&stru_1F1824018];

    v7 = (void *)MEMORY[0x1E4F28C10];
    v8 = [(SSDateFormatManager *)self currentLocale];
    v9 = [v7 dateFormatFromTemplate:v6 options:0 locale:v8];
    [(NSDateIntervalFormatter *)v4 setDateTemplate:v9];

    objc_storeStrong((id *)p_mediumDayOfWeekDateIntervalFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)allDayDateFormatter
{
  p_allDayDateFormatter = &self->_allDayDateFormatter;
  v4 = self->_allDayDateFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    objc_super v5 = (void *)MEMORY[0x1E4F28C10];
    v6 = [(SSDateFormatManager *)self currentLocale];
    v7 = [v5 dateFormatFromTemplate:@"EMMMdyyyy" options:0 locale:v6];
    [(NSDateIntervalFormatter *)v4 setDateTemplate:v7];

    objc_storeStrong((id *)p_allDayDateFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  p_dateIntervalFormatter = &self->_dateIntervalFormatter;
  v4 = self->_dateIntervalFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    objc_super v5 = [@"EMMMdyyyy" stringByAppendingString:@"jmma"];
    v6 = (void *)MEMORY[0x1E4F28C10];
    v7 = [(SSDateFormatManager *)self currentLocale];
    v8 = [v6 dateFormatFromTemplate:v5 options:0 locale:v7];
    [(NSDateIntervalFormatter *)v4 setDateTemplate:v8];

    objc_storeStrong((id *)p_dateIntervalFormatter, v4);
  }
  return v4;
}

+ (id)allFormatters
{
  return (id)[(id)_sharedDateFormatManager allFormatters];
}

- (id)allFormatters
{
  v21[16] = *MEMORY[0x1E4F143B8];
  v20 = [(SSDateFormatManager *)self birthdayDateComponentsFormatter];
  v21[0] = v20;
  v19 = [(SSDateFormatManager *)self dateComponentsFormatter];
  v21[1] = v19;
  v18 = [(SSDateFormatManager *)self shortRelativeDateFormatter];
  v21[2] = v18;
  v17 = [(SSDateFormatManager *)self mediumRelativeDateFormatter];
  v21[3] = v17;
  v16 = [(SSDateFormatManager *)self longRelativeDateFormatter];
  v21[4] = v16;
  v15 = [(SSDateFormatManager *)self dayOfWeekFormatter];
  v21[5] = v15;
  v3 = [(SSDateFormatManager *)self shortDayOfWeekFormatter];
  v21[6] = v3;
  v4 = [(SSDateFormatManager *)self shortDateTimeFormatter];
  v21[7] = v4;
  objc_super v5 = [(SSDateFormatManager *)self shortTimeFormatter];
  v21[8] = v5;
  v6 = [(SSDateFormatManager *)self dateFormatter];
  v21[9] = v6;
  v7 = [(SSDateFormatManager *)self shortDateTimeIntervalFormatter];
  v21[10] = v7;
  v8 = [(SSDateFormatManager *)self mediumDayOfWeekDateTimeIntervalFormatter];
  v21[11] = v8;
  v9 = [(SSDateFormatManager *)self shortDateIntervalFormatter];
  v21[12] = v9;
  v10 = [(SSDateFormatManager *)self mediumDayOfWeekDateIntervalFormatter];
  v21[13] = v10;
  v11 = [(SSDateFormatManager *)self allDayDateFormatter];
  v21[14] = v11;
  v12 = [(SSDateFormatManager *)self dateIntervalFormatter];
  v21[15] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:16];

  return v14;
}

- (id)currentLocale
{
  v2 = [(SSDateFormatManager *)self overrideLocale];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  objc_super v5 = v4;

  return v5;
}

+ (id)calendar
{
  return (id)[(id)_sharedDateFormatManager calendar];
}

- (id)calendar
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [(SSDateFormatManager *)self currentLocale];
  [v3 setLocale:v4];

  return v3;
}

+ (id)tomorrow
{
  v3 = objc_opt_new();
  [v3 setDay:1];
  id v4 = [a1 calendar];
  objc_super v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [v4 dateByAddingComponents:v3 toDate:v5 options:0];

  return v6;
}

+ (BOOL)date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [v7 compare:a4] != -1 && objc_msgSend(v7, "compare:", v8) != 1;

  return v9;
}

+ (BOOL)isDate:(id)a3 withinTimeInterval:(double)a4 includePast:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  BOOL v5 = a5;
  [a3 timeIntervalSinceNow];
  double v8 = fabs(v7);
  if (v5) {
    double v7 = v8;
  }
  return v7 <= a4 && v7 >= 0.0;
}

+ (BOOL)isDateWithinWeeksTime:(id)a3
{
  return [a1 isDate:a3 withinTimeInterval:1 includePast:604800.0];
}

+ (BOOL)isDateWithinMonthsTime:(id)a3
{
  return [a1 isDate:a3 withinTimeInterval:1 includePast:2592000.0];
}

+ (BOOL)hasRelativeFormatForDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)_sharedDateFormatManager calendar];
    if ([v4 isDateInYesterday:v3] & 1) != 0 || (objc_msgSend(v4, "isDateInToday:", v3)) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 isDateInTomorrow:v3];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)shortDateTimeStringFromDate:(id)a3 isAllDay:(BOOL)a4
{
  return (id)[a1 shortDateTimeStringFromDate:a3 isAllDay:a4 showAllDayString:1];
}

+ (id)shortDateTimeStringFromDate:(id)a3 isAllDay:(BOOL)a4 showAllDayString:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if (v6)
  {
    if (v5)
    {
      double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v9 = [v8 localizedStringForKey:@"ALL_DAY_SHORT_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    }
    else
    {
      BOOL v9 = @"%@";
    }
    v11 = NSString;
    v12 = [(id)_sharedDateFormatManager shortRelativeDateFormatter];
    v13 = [v12 stringFromDate:v7];
    v10 = [v11 localizedStringWithValidatedFormat:v9, @"%@", 0, v13 validFormatSpecifiers error];
  }
  else
  {
    BOOL v9 = [(id)_sharedDateFormatManager shortDateTimeFormatter];
    v10 = [(__CFString *)v9 stringFromDate:v7];
  }

  return v10;
}

+ (id)dynamicCompactStringFromDate:(id)a3
{
  return (id)[a1 dynamicStringFromDate:a3 isCompact:1];
}

+ (id)dynamicMediumStringFromDate:(id)a3
{
  return (id)[a1 dynamicStringFromDate:a3 isCompact:0];
}

+ (id)dynamicStringFromDate:(id)a3 isCompact:(BOOL)a4
{
  id v6 = a3;
  if (!v6)
  {
    BOOL v9 = &stru_1F1824018;
    goto LABEL_13;
  }
  id v7 = (id)_sharedDateFormatManager;
  double v8 = v7;
  if (a4) {
    [v7 shortRelativeDateFormatter];
  }
  else {
  v10 = [v7 mediumRelativeDateFormatter];
  }
  BOOL v9 = [v10 stringFromDate:v6];

  v11 = [(id)_sharedDateFormatManager calendar];
  int v12 = [v11 isDateInToday:v6];

  if (v12)
  {
    v13 = [v8 shortTimeFormatter];
  }
  else
  {
    if (([a1 hasRelativeFormatForDate:v6] & 1) != 0
      || ![a1 isDateWithinWeeksTime:v6])
    {
      goto LABEL_12;
    }
    v13 = [v8 dayOfWeekFormatter];
  }
  id v14 = v13;
  uint64_t v15 = [v13 stringFromDate:v6];

  BOOL v9 = (__CFString *)v15;
LABEL_12:

LABEL_13:
  return v9;
}

+ (id)dyanmicStringFromDate:(id)a3
{
  id v4 = a3;
  id v5 = (id)_sharedDateFormatManager;
  id v6 = [v5 shortRelativeDateFormatter];
  id v7 = [v6 stringFromDate:v4];

  if (([a1 hasRelativeFormatForDate:v4] & 1) == 0
    && [a1 isDateWithinMonthsTime:v4])
  {
    double v8 = [v5 mediumDayOfWeekDateIntervalFormatter];
    uint64_t v9 = [v8 stringFromDate:v4 toDate:v4];

    id v7 = (void *)v9;
  }

  return v7;
}

+ (id)dynamicDateTimeStringsFromDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)_sharedDateFormatManager;
  id v6 = [(id)_sharedDateFormatManager shortRelativeDateFormatter];
  id v7 = [v6 stringFromDate:v4];

  if (([a1 hasRelativeFormatForDate:v4] & 1) == 0
    && [a1 isDateWithinMonthsTime:v4])
  {
    double v8 = [v5 mediumDayOfWeekDateIntervalFormatter];
    uint64_t v9 = [v8 stringFromDate:v4 toDate:v4];

    id v7 = (void *)v9;
  }
  v10 = [v5 shortTimeFormatter];
  v11 = [v10 stringFromDate:v4];

  if (v7 && v11)
  {
    v18 = v7;
    v19 = v11;
    int v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = &v18;
    uint64_t v14 = 2;
LABEL_9:
    uint64_t v15 = objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v17, v18, v19, v20);
    goto LABEL_10;
  }
  if (v7)
  {
    v17 = v7;
    int v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = &v17;
    uint64_t v14 = 1;
    goto LABEL_9;
  }
  uint64_t v15 = 0;
LABEL_10:

  return v15;
}

+ (id)fullDateTimeStringsFromDate:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = (id)_sharedDateFormatManager;
  id v5 = a3;
  id v6 = [v4 longRelativeDateFormatter];
  id v7 = [v6 stringFromDate:v5];

  double v8 = [v4 shortTimeFormatter];
  uint64_t v9 = [v8 stringFromDate:v5];

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v13[0] = v7;
    v13[1] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }

  return v11;
}

+ (id)stringsFromDate:(id)a3 toDate:(id)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a3)
  {
    id v9 = (id)_sharedDateFormatManager;
    id v10 = a3;
    if ([a1 isDateWithinMonthsTime:v10]
      && (!v8 || [a1 isDateWithinMonthsTime:v8]))
    {
      if (v5) {
        [v9 mediumDayOfWeekDateIntervalFormatter];
      }
      else {
        [v9 mediumDayOfWeekDateTimeIntervalFormatter];
      }
    }
    else if (v5)
    {
      [v9 shortDateIntervalFormatter];
    }
    else
    {
      [v9 shortDateTimeIntervalFormatter];
    v11 = };
    v13 = v11;
    if (v8) {
      id v14 = v8;
    }
    else {
      id v14 = v10;
    }
    uint64_t v15 = [v11 stringFromDate:v10 toDate:v14];

    if (v5)
    {
      v20[0] = v15;
      v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"ALL_DAY" value:&stru_1F1824018 table:@"SpotlightServices"];
      v20[1] = v17;
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    }
    else
    {
      v19 = v15;
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

+ (id)stringFromBirthdayComponents:(id)a3
{
  id v3 = (void *)_sharedDateFormatManager;
  id v4 = a3;
  BOOL v5 = [v3 birthdayDateComponentsFormatter];
  id v6 = [v5 stringFromDateComponents:v4];

  return v6;
}

+ (id)icalConformingStringFromDate:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:v6];

  [v5 setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
  id v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v5 setTimeZone:v7];

  id v8 = [v5 stringFromDate:v4];

  return v8;
}

+ (id)stringFromTimeInterval:(double)a3
{
  id v4 = [(id)_sharedDateFormatManager dateComponentsFormatter];
  id v5 = v4;
  double v6 = round(a3);
  if (v6 < 3600.0) {
    uint64_t v7 = 192;
  }
  else {
    uint64_t v7 = 224;
  }
  [v4 setAllowedUnits:v7];
  id v8 = [v5 stringFromTimeInterval:v6];

  return v8;
}

+ (id)dateFormatter
{
  return (id)[(id)_sharedDateFormatManager dateFormatter];
}

+ (id)shortDateTimeFormatter
{
  return (id)[(id)_sharedDateFormatManager shortDateTimeFormatter];
}

+ (id)allDayDateFormatter
{
  return (id)[(id)_sharedDateFormatManager allDayDateFormatter];
}

+ (id)dateIntervalFormatter
{
  return (id)[(id)_sharedDateFormatManager dateIntervalFormatter];
}

+ (id)dateModifiedStringFormat
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DATE_MODIFIED_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];

  return v3;
}

+ (id)dateDueStringFormat
{
  if (SSSnippetModernizationEnabled())
  {
    v2 = @"%@";
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v2 = [v3 localizedStringForKey:@"DATE_DUE_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
  }
  return v2;
}

+ (id)dateLastOpenedStringFormat
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DATE_LAST_OPENED_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];

  return v3;
}

+ (id)dateLastPlayedStringFormat
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DATE_LAST_PLAYED_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];

  return v3;
}

+ (id)dateLastCalledStringFormat
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DATE_LAST_CALLED_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];

  return v3;
}

+ (id)dateCreatedStringFormat
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DATE_CREATED_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];

  return v3;
}

+ (id)dateCompletedStringFormat
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DATE_COMPLETED_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];

  return v3;
}

+ (id)nextUpcomingDateForDateComponents:(id)a3 fromDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 calendar];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v8, "setMonth:", objc_msgSend(v6, "month"));
  objc_msgSend(v8, "setLeapMonth:", objc_msgSend(v6, "isLeapMonth"));
  uint64_t v9 = [v6 day];

  [v8 setDay:v9];
  [v8 setHour:12];
  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v11 = [v10 nextDateAfterDate:v5 matchingHour:0 minute:0 second:0 options:6];

  int v12 = [v7 nextDateAfterDate:v11 matchingComponents:v8 options:256];

  return v12;
}

+ (void)overrideLocale:(id)a3
{
  [(id)_sharedDateFormatManager setOverrideLocale:a3];
  id v3 = (void *)_sharedDateFormatManager;
  [v3 purgeMemory];
}

+ (id)mediumDayOfWeekDateTimeIntervalFormatter
{
  return (id)[(id)_sharedDateFormatManager mediumDayOfWeekDateTimeIntervalFormatter];
}

- (NSLocale)overrideLocale
{
  return (NSLocale *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOverrideLocale:(id)a3
{
}

- (void)setBirthdayDateComponentsFormatter:(id)a3
{
}

- (void)setDateComponentsFormatter:(id)a3
{
}

- (void)setShortRelativeDateFormatter:(id)a3
{
}

- (void)setMediumRelativeDateFormatter:(id)a3
{
}

- (void)setLongRelativeDateFormatter:(id)a3
{
}

- (void)setDayOfWeekFormatter:(id)a3
{
}

- (void)setShortDayOfWeekFormatter:(id)a3
{
}

- (void)setShortDateTimeFormatter:(id)a3
{
}

- (void)setShortTimeFormatter:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void)setShortDateTimeIntervalFormatter:(id)a3
{
}

- (void)setMediumDayOfWeekDateTimeIntervalFormatter:(id)a3
{
}

- (void)setShortDateIntervalFormatter:(id)a3
{
}

- (void)setMediumDayOfWeekDateIntervalFormatter:(id)a3
{
}

- (void)setAllDayDateFormatter:(id)a3
{
}

- (void)setDateIntervalFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_allDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_mediumDayOfWeekDateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_mediumDayOfWeekDateTimeIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateTimeIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_shortTimeFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_shortDayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_longRelativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_mediumRelativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_shortRelativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_birthdayDateComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_overrideLocale, 0);
}

@end