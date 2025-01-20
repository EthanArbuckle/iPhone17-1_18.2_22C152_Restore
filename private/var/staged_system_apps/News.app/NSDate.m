@interface NSDate
+ (id)_fr_sharedDayOfWeekDateFormatter;
+ (id)_fr_sharedGregorianCalendar;
+ (id)_fr_sharedShortDateDateFormatter;
+ (id)_fr_sharedShortTimeDateFormatter;
+ (id)randomDateBeforeNow;
- (BOOL)isToday;
- (BOOL)isYesterday;
- (id)fr_gregorianLongDisplayString;
- (id)fr_gregorianLongDisplayStringPreferringToday;
- (id)fr_gregorianMediumDisplayString;
- (id)fr_gregorianMediumDisplayStringPreferringToday;
- (id)fr_gregorianShortDisplayString;
- (id)fr_gregorianShortDisplayStringPreferringToday;
- (id)fr_localDate;
- (id)fr_partOfDay;
- (id)stringWithFormat:(id)a3;
- (id)stringWithTopStoriesFormat;
@end

@implementation NSDate

- (BOOL)isToday
{
  v3 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v3 isDateInToday:self];

  return (char)self;
}

- (BOOL)isYesterday
{
  v3 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v3 isDateInYesterday:self];

  return (char)self;
}

+ (id)randomDateBeforeNow
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v3 = v2;
  FCRandom();
  double v5 = v3 * v4;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v5];
}

- (id)stringWithFormat:(id)a3
{
  double v4 = +[NSDateFormatter dateFormatterWithFormat:a3 forReuse:1];
  double v5 = [v4 stringFromDate:self];

  return v5;
}

- (id)stringWithTopStoriesFormat
{
  double v3 = [(NSDate *)self fr_partOfDay];
  id v4 = objc_alloc((Class)NSString);
  double v5 = +[NSDateFormatter dateFormatterWithFormat:@"EEEE '%@', MMMM d" forReuse:1];
  v6 = [v5 stringFromDate:self];
  id v7 = [v4 initWithFormat:v6, v3];

  return v7;
}

- (id)fr_partOfDay
{
  double v3 = +[NSCalendar currentCalendar];
  id v4 = (char *)[v3 component:32 fromDate:self];
  if ((unint64_t)v4 > 0xB)
  {
    if ((unint64_t)(v4 - 12) > 4)
    {
      unint64_t v8 = (unint64_t)(v4 - 17);
      double v5 = +[NSBundle mainBundle];
      v6 = v5;
      if (v8 > 3) {
        CFStringRef v7 = @"Night";
      }
      else {
        CFStringRef v7 = @"Evening";
      }
    }
    else
    {
      double v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Afternoon";
    }
  }
  else
  {
    double v5 = +[NSBundle mainBundle];
    v6 = v5;
    CFStringRef v7 = @"Morning";
  }
  v9 = [v5 localizedStringForKey:v7 value:&stru_1000CABC0 table:0];

  return v9;
}

- (id)fr_gregorianShortDisplayStringPreferringToday
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = sub_100018A70;
  v9 = sub_1000189C0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002CD88;
  v4[3] = &unk_1000C6268;
  v4[4] = &v5;
  [(NSDate *)self nss_gregorianDescriptionWithFlags:1 options:1 completion:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianMediumDisplayStringPreferringToday
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = sub_100018A70;
  v9 = sub_1000189C0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002CEA0;
  v4[3] = &unk_1000C6268;
  v4[4] = &v5;
  [(NSDate *)self nss_gregorianDescriptionWithFlags:2 options:1 completion:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianLongDisplayStringPreferringToday
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = sub_100018A70;
  v9 = sub_1000189C0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002CFBC;
  v4[3] = &unk_1000C6268;
  v4[4] = &v5;
  [(NSDate *)self nss_gregorianDescriptionWithFlags:4 options:1 completion:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianShortDisplayString
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = sub_100018A70;
  v9 = sub_1000189C0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D0D8;
  v4[3] = &unk_1000C6268;
  v4[4] = &v5;
  [(NSDate *)self nss_gregorianDescriptionWithFlags:1 options:0 completion:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianMediumDisplayString
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = sub_100018A70;
  v9 = sub_1000189C0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D1F0;
  v4[3] = &unk_1000C6268;
  v4[4] = &v5;
  [(NSDate *)self nss_gregorianDescriptionWithFlags:2 options:0 completion:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianLongDisplayString
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = sub_100018A70;
  v9 = sub_1000189C0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D30C;
  v4[3] = &unk_1000C6268;
  v4[4] = &v5;
  [(NSDate *)self nss_gregorianDescriptionWithFlags:4 options:0 completion:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_localDate
{
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  id v4 = +[NSTimeZone defaultTimeZone];
  [v3 setTimeZone:v4];

  [v3 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'"];
  id v5 = objc_alloc_init((Class)NSDateFormatter);
  v6 = +[NSTimeZone timeZoneWithName:@"UTC"];
  [v5 setTimeZone:v6];

  [v5 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'"];
  uint64_t v7 = [v3 stringFromDate:self];
  unint64_t v8 = [v5 dateFromString:v7];

  return v8;
}

+ (id)_fr_sharedGregorianCalendar
{
  if (qword_1000EDF40 != -1) {
    dispatch_once(&qword_1000EDF40, &stru_1000C6288);
  }
  id v2 = (void *)qword_1000EDF48;

  return v2;
}

+ (id)_fr_sharedDayOfWeekDateFormatter
{
  if (qword_1000EDF50 != -1) {
    dispatch_once(&qword_1000EDF50, &stru_1000C62A8);
  }
  id v2 = (void *)qword_1000EDF58;

  return v2;
}

+ (id)_fr_sharedShortTimeDateFormatter
{
  if (qword_1000EDF60 != -1) {
    dispatch_once(&qword_1000EDF60, &stru_1000C62C8);
  }
  id v2 = (void *)qword_1000EDF68;

  return v2;
}

+ (id)_fr_sharedShortDateDateFormatter
{
  if (qword_1000EDF70 != -1) {
    dispatch_once(&qword_1000EDF70, &stru_1000C62E8);
  }
  id v2 = (void *)qword_1000EDF78;

  return v2;
}

@end