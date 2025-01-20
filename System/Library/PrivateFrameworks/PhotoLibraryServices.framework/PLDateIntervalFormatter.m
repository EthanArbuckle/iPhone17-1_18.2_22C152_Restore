@interface PLDateIntervalFormatter
+ (id)_currentLocalDate;
+ (id)_dateFormatForDateFormatterType:(unint64_t)a3 displayYear:(BOOL)a4 displayLongMonth:(BOOL)a5;
+ (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5;
+ (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 showLongMonthFormatIfNeeded:(BOOL)a6;
- (BOOL)_yearIsNeededForDisplayingDate:(id)a3;
- (BOOL)alwaysShowYear;
- (NSCalendar)gmtCalendar;
- (NSDateIntervalFormatter)dateIntervalFormatter;
- (NSLocale)locale;
- (PLDateIntervalFormatter)init;
- (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5;
- (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 showLongMonthFormatIfNeeded:(BOOL)a6;
- (void)setAlwaysShowYear:(BOOL)a3;
- (void)setLocale:(id)a3;
@end

@implementation PLDateIntervalFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_gmtCalendar, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
}

- (void)setAlwaysShowYear:(BOOL)a3
{
  self->_alwaysShowYear = a3;
}

- (BOOL)alwaysShowYear
{
  return self->_alwaysShowYear;
}

- (void)setLocale:(id)a3
{
  v5 = (NSLocale *)a3;
  if (self->_locale != v5)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setLocale:v5];
  }
}

- (NSLocale)locale
{
  locale = self->_locale;
  if (locale)
  {
    v3 = locale;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  return v3;
}

- (NSCalendar)gmtCalendar
{
  gmtCalendar = self->_gmtCalendar;
  if (!gmtCalendar)
  {
    v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    v5 = self->_gmtCalendar;
    self->_gmtCalendar = v4;

    v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    [(NSCalendar *)self->_gmtCalendar setTimeZone:v6];

    gmtCalendar = self->_gmtCalendar;
  }
  return gmtCalendar;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    v4 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E4F28C20]);
    v5 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v4;

    v6 = [(PLDateIntervalFormatter *)self locale];
    [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setLocale:v6];

    v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setTimeZone:v7];

    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  return dateIntervalFormatter;
}

- (BOOL)_yearIsNeededForDisplayingDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _currentLocalDate];
  v6 = [(PLDateIntervalFormatter *)self gmtCalendar];
  uint64_t v7 = [v6 compareDate:v5 toDate:v4 toUnitGranularity:4];

  return v7 != 0;
}

- (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 showLongMonthFormatIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  v13 = 0;
  if (v10 && a5)
  {
    if (v11) {
      v14 = v11;
    }
    else {
      v14 = v10;
    }
    id v15 = v14;
    BOOL v16 = [(PLDateIntervalFormatter *)self alwaysShowYear]
       || [(PLDateIntervalFormatter *)self _yearIsNeededForDisplayingDate:v15];
    v17 = [(id)objc_opt_class() _dateFormatForDateFormatterType:a5 displayYear:v16 displayLongMonth:v6];
    v18 = [(PLDateIntervalFormatter *)self dateIntervalFormatter];
    [v18 setDateTemplate:v17];

    v19 = [(PLDateIntervalFormatter *)self dateIntervalFormatter];
    v13 = [v19 stringFromDate:v10 toDate:v15];
  }
  return v13;
}

- (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5
{
  return [(PLDateIntervalFormatter *)self stringFromStartDate:a3 endDate:a4 type:a5 showLongMonthFormatIfNeeded:0];
}

- (PLDateIntervalFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLDateIntervalFormatter;
  result = [(PLDateIntervalFormatter *)&v3 init];
  if (result) {
    result->_alwaysShowYear = 1;
  }
  return result;
}

+ (id)_currentLocalDate
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  objc_super v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  double v4 = (double)[v3 secondsFromGMTForDate:v2];

  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];

  return v5;
}

+ (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 showLongMonthFormatIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(PLDateIntervalFormatter);
  v12 = [(PLDateIntervalFormatter *)v11 stringFromStartDate:v10 endDate:v9 type:a5 showLongMonthFormatIfNeeded:v6];

  return v12;
}

+ (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5
{
  return (id)[a1 stringFromStartDate:a3 endDate:a4 type:a5 showLongMonthFormatIfNeeded:0];
}

+ (id)_dateFormatForDateFormatterType:(unint64_t)a3 displayYear:(BOOL)a4 displayLongMonth:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1uLL:
      uint64_t v7 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@%@", a4, a5, @"MMM", @"d"];
      goto LABEL_9;
    case 2uLL:
      if (a5) {
        id v9 = @"MMMM";
      }
      else {
        id v9 = @"MMM";
      }
      uint64_t v7 = [MEMORY[0x1E4F28E78] stringWithString:v9];
      goto LABEL_9;
    case 3uLL:
      uint64_t v7 = [MEMORY[0x1E4F28E78] string];
LABEL_9:
      id v10 = (void *)v7;
      int v8 = 1;
      if (!v7) {
        goto LABEL_18;
      }
      goto LABEL_21;
    case 4uLL:
      id v11 = @"MMM";
      if (a5) {
        id v11 = @"MMMM";
      }
      [MEMORY[0x1E4F28E78] stringWithFormat:@"%@%@", v11, @"d"];
      goto LABEL_17;
    case 5uLL:
      v12 = (void *)MEMORY[0x1E4F28E78];
      v13 = @"d";
      goto LABEL_16;
    case 6uLL:
      v12 = (void *)MEMORY[0x1E4F28E78];
      v13 = @"MMMM";
LABEL_16:
      [v12 stringWithFormat:@"%@", v13, v16];
      id v10 = LABEL_17:;
      int v8 = 0;
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_21;
    default:
      int v8 = 1;
LABEL_18:
      v14 = PLMomentsGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v18 = a3;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Couldn't find dateFormat for type %lu", buf, 0xCu);
      }

      id v10 = 0;
LABEL_21:
      if (v8 && v5) {
        [v10 appendString:@"y"];
      }
      return v10;
  }
}

@end