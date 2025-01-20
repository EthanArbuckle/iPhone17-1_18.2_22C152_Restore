@interface NSDate
- (BOOL)isAfter:(id)a3;
- (BOOL)isBefore:(id)a3;
- (BOOL)isEarlierThan:(id)a3;
- (id)yearDayOfYearHourMinute;
- (id)yearDayOfYearHourMinuteSecond;
@end

@implementation NSDate

- (id)yearDayOfYearHourMinute
{
  if (qword_100289B78 != -1) {
    dispatch_once(&qword_100289B78, &stru_1002365A0);
  }
  v3 = (void *)qword_100289B70;

  return [v3 stringFromDate:self];
}

- (id)yearDayOfYearHourMinuteSecond
{
  if (qword_100289B88 != -1) {
    dispatch_once(&qword_100289B88, &stru_1002365C0);
  }
  v3 = (void *)qword_100289B80;

  return [v3 stringFromDate:self];
}

- (BOOL)isBefore:(id)a3
{
  return [(NSDate *)self compare:a3] == NSOrderedAscending;
}

- (BOOL)isAfter:(id)a3
{
  return (id)[(NSDate *)self compare:a3] == (id)1;
}

- (BOOL)isEarlierThan:(id)a3
{
  return [(NSDate *)self compare:a3] == NSOrderedAscending;
}

@end