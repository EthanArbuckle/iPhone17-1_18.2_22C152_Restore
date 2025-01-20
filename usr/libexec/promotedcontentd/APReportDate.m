@interface APReportDate
- (APReportDate)initWithDate:(id)a3;
- (BOOL)lastYearLeap;
- (NSCalendar)gregorianCalendar;
- (NSDate)date;
- (NSDateFormatter)dateFormatter;
- (NSString)reportDayString;
- (id)_addDays:(int64_t)a3 toDate:(id)a4;
- (id)currentDateMinusDays:(unint64_t)a3;
- (int64_t)_dayOfYearForDate:(id)a3;
- (int64_t)monthDayInteger;
- (int64_t)numberOfDaysSinceDate:(id)a3;
- (int64_t)reportDayMinus:(unint64_t)a3;
- (int64_t)reportEndDay;
- (int64_t)weekStartDay;
@end

@implementation APReportDate

- (APReportDate)initWithDate:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APReportDate;
  v6 = [(APReportDate *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v8 = (NSCalendar *)[objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSGregorianCalendar];
    gregorianCalendar = v7->_gregorianCalendar;
    v7->_gregorianCalendar = v8;

    v10 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v10;

    v12 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)v7->_dateFormatter setLocale:v12];

    v13 = v7->_dateFormatter;
    v14 = +[NSTimeZone timeZoneWithName:@"UTC"];
    [(NSDateFormatter *)v13 setTimeZone:v14];

    [(NSDateFormatter *)v7->_dateFormatter setDateFormat:@"MMdd"];
    [(NSDateFormatter *)v7->_dateFormatter setCalendar:v7->_gregorianCalendar];
  }

  return v7;
}

- (int64_t)monthDayInteger
{
  v3 = [(APReportDate *)self date];
  int64_t v4 = [(APReportDate *)self _dayOfYearForDate:v3];

  return v4;
}

- (int64_t)reportEndDay
{
  v3 = [(APReportDate *)self date];
  int64_t v4 = [(APReportDate *)self _addDays:-1 toDate:v3];

  int64_t v5 = [(APReportDate *)self _dayOfYearForDate:v4];
  return v5;
}

- (int64_t)weekStartDay
{
  v3 = [(APReportDate *)self date];
  int64_t v4 = [(APReportDate *)self _addDays:-8 toDate:v3];

  int64_t v5 = [(APReportDate *)self _dayOfYearForDate:v4];
  return v5;
}

- (BOOL)lastYearLeap
{
  v3 = [(APReportDate *)self gregorianCalendar];
  int64_t v4 = [(APReportDate *)self date];
  int64_t v5 = (char *)[v3 component:4 fromDate:v4] - 1;

  return __ROR8__(0x8F5C28F5C28F5C29 * (void)v5 + 0x51EB851EB851EB8, 2) >= 0x28F5C28F5C28F5DuLL
      && (v5 & 3) == 0
      || __ROR8__(0x8F5C28F5C28F5C29 * (void)v5 + 0x51EB851EB851EB0, 4) < 0xA3D70A3D70A3D7uLL;
}

- (NSString)reportDayString
{
  v2 = +[NSNumber numberWithInteger:[(APReportDate *)self reportEndDay]];
  v3 = [v2 stringValue];

  if ([v3 length] == (id)3)
  {
    id v4 = +[NSString stringWithFormat:@"0%@", v3];
  }
  else
  {
    id v4 = v3;
  }
  int64_t v5 = v4;

  return (NSString *)v5;
}

- (int64_t)reportDayMinus:(unint64_t)a3
{
  unint64_t v4 = ~a3;
  int64_t v5 = [(APReportDate *)self date];
  v6 = [(APReportDate *)self _addDays:v4 toDate:v5];

  int64_t v7 = [(APReportDate *)self _dayOfYearForDate:v6];
  return v7;
}

- (int64_t)numberOfDaysSinceDate:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(APReportDate *)self gregorianCalendar];
  id v13 = 0;
  [v5 rangeOfUnit:16 startDate:&v13 interval:0 forDate:v4];

  id v6 = v13;
  id v12 = 0;
  int64_t v7 = [(APReportDate *)self date];
  [v5 rangeOfUnit:16 startDate:&v12 interval:0 forDate:v7];
  id v8 = v12;

  v9 = [v5 components:16 fromDate:v6 toDate:v8 options:0];

  id v10 = [v9 day];
  return (int64_t)v10;
}

- (id)currentDateMinusDays:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setDay:-(uint64_t)a3];
  id v6 = [(APReportDate *)self gregorianCalendar];
  int64_t v7 = [(APReportDate *)self date];
  id v8 = [v6 dateByAddingComponents:v5 toDate:v7 options:0];

  return v8;
}

- (int64_t)_dayOfYearForDate:(id)a3
{
  id v4 = a3;
  id v5 = [(APReportDate *)self dateFormatter];
  id v6 = [v5 stringFromDate:v4];

  id v7 = [v6 integerValue];
  return (int64_t)v7;
}

- (id)_addDays:(int64_t)a3 toDate:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSDateComponents);
  [v7 setDay:a3];
  id v8 = [(APReportDate *)self gregorianCalendar];
  v9 = [v8 dateByAddingComponents:v7 toDate:v6 options:0];

  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end