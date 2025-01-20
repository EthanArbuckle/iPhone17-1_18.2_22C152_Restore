@interface RCDateFormatter
+ (id)sharedDateFormatter;
- (NSLocale)locale;
- (RCDateFormatter)init;
- (id)_defaultDateFormatter;
- (id)_formattedDateStringFromDate:(id)a3 remainingTimeValid:(double *)a4;
- (id)_newFormattedDateStringFromDate:(id)a3 forUUID:(id)a4;
- (id)_thisWeekDateFormatter;
- (id)_todayDateFormatter;
- (id)_yesterdayDateFormatter;
- (id)dateFormatterForStyle:(int)a3;
- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4;
- (void)_setupLocale;
- (void)setLocale:(id)a3;
@end

@implementation RCDateFormatter

- (RCDateFormatter)init
{
  v7.receiver = self;
  v7.super_class = (Class)RCDateFormatter;
  v2 = [(RCDateFormatter *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_setupLocale" name:NSCurrentLocaleDidChangeNotification object:0];

    uint64_t v4 = objc_opt_new();
    dateItemCache = v2->_dateItemCache;
    v2->_dateItemCache = (NSMutableDictionary *)v4;
  }
  return v2;
}

- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_dateItemCache objectForKeyedSubscript:v7];
    if (v8
      && (+[NSDate date],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v9 timeIntervalSince1970],
          double v11 = v10,
          v9,
          [v8 expiration],
          v11 <= v12))
    {
      id v13 = [v8 formattedDate];
    }
    else
    {
      id v13 = [(RCDateFormatter *)self _newFormattedDateStringFromDate:v6 forUUID:v7];
    }
    v14 = v13;
  }
  else
  {
    v14 = [(RCDateFormatter *)self _formattedDateStringFromDate:v6 remainingTimeValid:0];
  }

  return v14;
}

- (id)_newFormattedDateStringFromDate:(id)a3 forUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  double v15 = 0.0;
  v9 = [(RCDateFormatter *)self _formattedDateStringFromDate:v7 remainingTimeValid:&v15];

  [v8 setFormattedDate:v9];
  double v10 = +[NSDate date];
  [v10 timeIntervalSince1970];
  double v12 = v11;

  [v8 setExpiration:v12 + v15];
  [(NSMutableDictionary *)self->_dateItemCache setObject:v8 forKeyedSubscript:v6];

  id v13 = [v8 formattedDate];

  return v13;
}

- (id)_formattedDateStringFromDate:(id)a3 remainingTimeValid:(double *)a4
{
  id v6 = a3;
  id v7 = +[NSCalendar currentCalendar];
  if ([v7 isDateInToday:v6])
  {
    v8 = [(RCDateFormatter *)self _todayDateFormatter];
    goto LABEL_7;
  }
  if ([v7 isDateInYesterday:v6])
  {
    v8 = [(RCDateFormatter *)self _yesterdayDateFormatter];
    goto LABEL_7;
  }
  v9 = +[NSDate date];
  double v10 = [v9 dateByAddingDays:-7];
  id v11 = [v7 compareDate:v6 toDate:v10 toUnitGranularity:16];

  if (v11 == (id)1)
  {
    v8 = [(RCDateFormatter *)self _thisWeekDateFormatter];
LABEL_7:
    double v12 = v8;
    id v13 = [v8 stringFromDate:v6];

    if (a4)
    {
      v14 = +[NSDate date];
      double v15 = [v14 dateByAddingDays:1];
      v16 = +[NSCalendar currentCalendar];
      v17 = [v16 startOfDayForDate:v15];

      [v17 timeIntervalSinceDate:v14];
      *(void *)a4 = v18;
    }
    goto LABEL_9;
  }
  v20 = [(RCDateFormatter *)self _defaultDateFormatter];
  id v13 = [v20 stringFromDate:v6];

  if (a4) {
    *a4 = 1.79769313e308;
  }
LABEL_9:

  return v13;
}

- (id)_defaultDateFormatter
{
  defaultDateFormatter = self->__defaultDateFormatter;
  if (!defaultDateFormatter)
  {
    uint64_t v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__defaultDateFormatter;
    self->__defaultDateFormatter = v4;

    [(NSDateFormatter *)self->__defaultDateFormatter setTimeStyle:0];
    [(NSDateFormatter *)self->__defaultDateFormatter setDateStyle:2];
    [(NSDateFormatter *)self->__defaultDateFormatter setDoesRelativeDateFormatting:1];
    id v6 = +[NSLocale autoupdatingCurrentLocale];
    [(NSDateFormatter *)self->__defaultDateFormatter setLocale:v6];

    defaultDateFormatter = self->__defaultDateFormatter;
  }

  return defaultDateFormatter;
}

+ (id)sharedDateFormatter
{
  if (qword_10026A898 != -1) {
    dispatch_once(&qword_10026A898, &stru_100223548);
  }
  v2 = (void *)qword_10026A890;

  return v2;
}

- (void)_setupLocale
{
}

- (id)dateFormatterForStyle:(int)a3
{
  switch(a3)
  {
    case 0:
      v5 = [(RCDateFormatter *)self _todayDateFormatter];
      goto LABEL_9;
    case 1:
      v5 = [(RCDateFormatter *)self _yesterdayDateFormatter];
      goto LABEL_9;
    case 2:
      v5 = [(RCDateFormatter *)self _thisWeekDateFormatter];
      goto LABEL_9;
    case 3:
      v5 = [(RCDateFormatter *)self _defaultDateFormatter];
LABEL_9:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_todayDateFormatter
{
  todayDateFormatter = self->__todayDateFormatter;
  if (!todayDateFormatter)
  {
    uint64_t v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__todayDateFormatter;
    self->__todayDateFormatter = v4;

    [(NSDateFormatter *)self->__todayDateFormatter setTimeStyle:1];
    [(NSDateFormatter *)self->__todayDateFormatter setDateStyle:0];
    [(NSDateFormatter *)self->__todayDateFormatter setDoesRelativeDateFormatting:1];
    id v6 = +[NSLocale autoupdatingCurrentLocale];
    [(NSDateFormatter *)self->__todayDateFormatter setLocale:v6];

    todayDateFormatter = self->__todayDateFormatter;
  }

  return todayDateFormatter;
}

- (id)_yesterdayDateFormatter
{
  yesterdayDateFormatter = self->__yesterdayDateFormatter;
  if (!yesterdayDateFormatter)
  {
    uint64_t v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__yesterdayDateFormatter;
    self->__yesterdayDateFormatter = v4;

    [(NSDateFormatter *)self->__yesterdayDateFormatter setTimeStyle:0];
    [(NSDateFormatter *)self->__yesterdayDateFormatter setDateStyle:2];
    [(NSDateFormatter *)self->__yesterdayDateFormatter setDoesRelativeDateFormatting:1];
    id v6 = +[NSLocale autoupdatingCurrentLocale];
    [(NSDateFormatter *)self->__yesterdayDateFormatter setLocale:v6];

    yesterdayDateFormatter = self->__yesterdayDateFormatter;
  }

  return yesterdayDateFormatter;
}

- (id)_thisWeekDateFormatter
{
  thisWeekDateFormatter = self->__thisWeekDateFormatter;
  if (!thisWeekDateFormatter)
  {
    uint64_t v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__thisWeekDateFormatter;
    self->__thisWeekDateFormatter = v4;

    [(NSDateFormatter *)self->__thisWeekDateFormatter setTimeStyle:0];
    [(NSDateFormatter *)self->__thisWeekDateFormatter setDateFormat:@"EEEE"];
    [(NSDateFormatter *)self->__thisWeekDateFormatter setDoesRelativeDateFormatting:0];
    id v6 = +[NSLocale autoupdatingCurrentLocale];
    [(NSDateFormatter *)self->__thisWeekDateFormatter setLocale:v6];

    thisWeekDateFormatter = self->__thisWeekDateFormatter;
  }

  return thisWeekDateFormatter;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_dateItemCache, 0);
  objc_storeStrong((id *)&self->__defaultDateFormatter, 0);
  objc_storeStrong((id *)&self->__thisWeekDateFormatter, 0);
  objc_storeStrong((id *)&self->__yesterdayDateFormatter, 0);

  objc_storeStrong((id *)&self->__todayDateFormatter, 0);
}

@end